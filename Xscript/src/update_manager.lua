local M = {}

function updateLog(...)
	logcatWithLevel(2, ...)
	logfileWithLevel(2, ...)
end

function _updateOnSkipBtnClick(skipVer)
	ui.dismiss("_update_layout")
	xutil.writeToFile(xscript.scriptDir() .. ".skip_version", tostring(skipVer))
end

local function isSkipVersion(newVer)
	return newVer == xutil.readFileAll(xscript.scriptDir() .. ".skip_version")
end

local function reboot(scriptPath)
	if not xscript.isLocalMode() then
		os.execute("am startservice -n " .. app.getSelf() .. "/com.surcumference.xscript.PlayerService --es CMD_STOP " .. scriptPath .. ";sleep 2; am startservice -n " .. app.getSelf() .. "/com.surcumference.xscript.PlayerService --es CMD_START " .. scriptPath .. "" )
	end	
	os.exit() 
end

function _updateDownloadFile(downloadUrlBase, size)
    local downloadUrl = security.base64dec(downloadUrlBase)
	updateLog("开始下载新版本", downloadUrl)
	toast("开始下载新版本")
	local content = net.get(downloadUrl)
	if (false--[[content:len() ~= size]]) then
		updateLog("长度校验失败:", content:len(), "正确长度:", size)
		toast("更新失败, 文件校验出错")
		os.exit()
		return
	end
	local scriptPath = xscript.scriptPath():gsub("%.lua$", ".xpk")
	xutil.writeToFile(scriptPath, content)
	toast("更新成功")
	sleep(2000)
	reboot(scriptPath)
end

local function updateUi(ver, log, downloadUrl, size, forceUpdate)
    ui.newLayoutEmpty("_update_layout")
    ui.addTextView("_update_title",  "发现新版本:" .. ver)
    ui.newRow("_update_row_1")
    ui.addTextView("_update_log", log)
    ui.newRow("_update_row_2")
    if not forceUpdate then
        ui.addButton("_update_btn_skip", "跳过", 80, 40)
        ui.setOnClick("_update_btn_skip", "_updateOnSkipBtnClick(\"" .. ver.. "\")")
    end
    ui.addButton("_update_btn_download", "下载", 80, 40)
    ui.setOnClick("_update_btn_download", "_updateDownloadFile(\"" .. security.base64enc(downloadUrl) .. "\"," .. size .. ")")
    ui.show("_update_layout")
end


local function compareVersion(oldVer, newVer)
    oldVer = tonumber(tostring(oldVer))
    newVer = tonumber(tostring(newVer))
    if oldVer == nil then
        return false
    end
    if newVer == nil then
        return false
    end
    return newVer > oldVer
end

function M.checkUpdate(url)
    local myVersion = XPK_VERSION
	if(myVersion==nil)then
		return false
	end
    thread.start(function()
			if (url == nil) then
				updateLog("请指定更新url")
				return
			end
            local content = net.get(url)
			if content == nil then
				return
			end
			local data = xutil.split(content, "|")
			if #data ~= 5 then
				return
			end
            local ver = string.trim(tostring(data[1]))
            local log = string.trim(tostring(data[2]))
            local downloadUrl = string.trim(tostring(data[3]))
			local size = tonumber(string.trim(tostring(data[4]))) or 0
            local forceUpdate = string.trim(tostring(data[5])) == "force"
			if not forceUpdate then
				if (isSkipVersion(ver)) then
					updateLog("跳过版本:", ver)
					return
				end
			end
            if compareVersion(myVersion, ver) then
                updateLog("发现新版本", ver)
                thread.runOnMainThread(updateUi, ver, log, downloadUrl, size, forceUpdate)
            end
    end)
end
return M

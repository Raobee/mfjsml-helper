--导入函数库，附件与插件以及定义全局变量请在publicvars.lua中定义
require("publicvars")
--**************************************
updateManager.checkUpdate("http://"..link.."/xscript/update.cfg")

--获取设备分辨率
--dpX,dpY=systeminfo.displaySize()
dpX,dpY=systeminfo.deviceSize()  
if(dpX<dpY)then
	isPhone=true
else 
	isPhone=false
end
logcat(dpX..dpY..tostring(isPhone)) --显示设备分辨率，目前仅支持1280*720
if((isPhone==true)and(systeminfo.rotation()==0))then
	toast("检测到当前系统为竖屏方向，即将在3S后自动关闭\n请启动游戏后横屏状态启动本脚本",3000)
	sleep(3000)
	xscript.stop() 
end
if((dpX~=1280)or(dpY~=720)) then
    --toast("当前仅支持1280*720分辨率，您的分辨率不支持")
    --exit()
end


--**************************************


--调试用测试函数，程序进入主菜单前会先进入此部分，若不需要请留空
function test(...)

 




		--xscript.stop() 	

end




-- 脚本入口
function main()
    IsLogin=false
    choose=nil
    bar.cleanMsg() --清空控制条
    bar.position(0, 15)  --将控制条移动至0,60

    --[[
    require("LoginUI") --显示登录界面
    if(IsLogin~=true)
    then
    toast("未登录或登录失败！")
    xscript.stop()
    end
    if(app.getFront()~='com.netease.index.bili') then
    app.switch('com.netease.index.bili') --切换至游戏界面
    end

    ]]--

    test()


    vars={}
    isBegin=false
    uiShowing=true
    if(isPhone)then
		ui.newLayoutEmpty("test")
		ui.setFullScreen("test")  
	else 
		ui.newLayoutEmpty("test",800,560,1)
	end
	
    ui.setTitleText("test", "测试")
    --[[ui.addButton("testR","点击进入主页面")
    ui.addButton("testE","点击关闭脚本")
    ui.setGravity("testE", ui.RIGHT)
    ui.setOnClick("testR", "ui.setWebView(\"testweb\",\"http://"..link.."/Xscript/txy/login.php\",760,450)")
    ui.setOnClick("testE", "xscript.stop()")]]--
    --ui.newRow("testRow1")
    if(isPhone)then
		ui.addWebView("testweb","http://"..link.."/Xscript/txy/login.php?"..math.random(),600,430) 
	else 
		ui.addWebView("testweb","http://"..link.."/Xscript/txy/login.php?"..math.random(),760,430)
	end
	--[[
    --ui.addWebView("testweb","http://"..link.."/Xscript/txy/login.php?"..math.random(),760,430)
	ui.addWebView("testweb","http://"..link.."/Xscript/txy/login.php?"..math.random(),600,500)]]
	
    ui.setGravity("testweb", ui.CENTER)
    ui.setEventHandler("testweb", function(id, type, ...)
        local args = {...}
        logcat(unpack(args))
        if(args[1]=='exit') then
            toast("停止运行")
            xscript.stop()
        end
        if(args[1]=='loginerror') then
            toast("登录失败！")
        end
        if(args[1]=='login') then
            ID=args[2]
            LoginTime=args[3]
            toast("已登录！\nID为"..ID.."\n登录时间："..LoginTime)
            --ui.setOnClick("testR", "ui.setWebView(\"testweb\",\"http://"..link.."/Xscript/txy/main.php\",760,380)")
        end
        if(args[1]=='logind') then
            ID=args[2]
            toast("已登录！\nID为"..ID.."\n登录时间："..LoginTime)
            --ui.setWebView("testweb","http://"..link.."/Xscript/txy/main.php",760,390)
            --ui.setOnClick("testR", "ui.setWebView(\"testweb\",\"http://"..link.."/Xscript/txy/main.php\",760,380)")
            ui.refresh()
        end
        if(args[1]=='logout') then
            ID=''
            LoginTime=''
            toast("已退出登录")
            --ui.setWebView("testweb","http://"..link.."/Xscript/txy/login.php",760,390)
            ui.setOnClick("testR", "ui.setWebView(\"testweb\",\"http://"..link.."/Xscript/txy/login.php\",760,380)")
        end
        if(args[1]=='switchtogame') then
            app.switch('com.netease.index.bili') --切换至游戏界面
        end
        if(args[1]=='startfunc') then
            ui.dismiss("test")
            isBegin=true
            fun=args[2]
            vars=args
        end


        --ui.dismiss("test")
    end)
    setTrigger.onUiDismiss("test", "uiShowing=false")
    --ui.setFullScreen("test")
    ui.show("test")
    while (uiShowing==true) do
        sleep(100)
    end
    if(isBegin~=true)then
        toast("未设置好界面参数，强制退出")
        xscript.stop()
    end



    temp=net.get("http://"..link.."/Xscript/fundef.js")
    traceprint(temp)
    fundef=json.decode(temp)
	
	thread.start(judgeYanZhengMa)  
	
    require(fundef[fun])

	




    --[[
    require("MenuUI")  --显示功能菜单
    if(choose==nil)
    then
    toast("未选择功能！")
    xscript.stop()
    end
    --ChooseFunction(choose) --根据选择功能执行
    require(choose)
    ]]--
end

main() --> 调用main函数, 请保持最后一行

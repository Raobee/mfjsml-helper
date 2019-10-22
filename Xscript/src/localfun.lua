libcurl=require("com.xplugin.libcurl") --curl库实现网络通讯
libpic=require("com.xplugin.libpic") --pic库实现部分图片功能
libjni=require("com_helper_mfjsml_jni") --C/C++支持库，实现部分lua难以做到高级功能
astarNetwork=require("com.astar.network") --astar网络插件，支持http,https,get,post,header


--图像识别函数 --传入图像原始数据，无需编码，返回值为百度OCR引擎的JSON格式
function OCR(image)
	image=Base64En(image)
	OCRToken=net.get("http://"..link.."/OCRToken.php")
	local astarNetworkResult = astarNetwork.post {
		type = "form-data",
		url = "https://aip.baidubce.com/rest/2.0/ocr/v1/general_basic?access_token="..OCRToken,
		data = {
			{key = "image", value = a},
		},
		timeout = 30,
	}
	if(astarNetworkResult.isSuccess)then
		return astarNetworkResult.body
	else 
		return false
	end
end


--识别验证码并自动点击系统
function YanZhengMa()
    if(isYanZhengMa.Main)then
		traceprint("检测到验证码，开始识别")
        --MainPause.Pause=true
		local astarVerifycode = require("com.astar.verifycode") {
            platform = "LianZhong",
            username = "qq1458096930",
            password = "ZHOUHONGKAI1458?",
            timeout = 20
        }
        -- 识别屏幕指定区域
        -- 参数x1 y1 x2 y2:    [必填][string] 屏幕坐标范围
        -- 参数type:           [必填][string] 验证码类型
        -- 返回成功
        -- 返回值isSuccess:    [boolean] 识别是否成功(true)
        -- 返回值id:           [string]  验证码id
        -- 返回值code:         [string]  验证码内容
        -- 返回失败
        -- 返回值isSuccess:    [boolean] 识别是否成功(false)
        -- 返回值message:      [string]  出错原因
		verifyCodeResult = astarVerifycode.decodeImage {
        x1 = 320, y1 = 105, x2 = 960, y2 =565,
        type = 1304
        }
		--[[
        verifyCodeResult={
            isSuccess=true,
            id=33427627899,
            message="操作成功",
            code="225,156|201,124|335,86|372,159"
        }]]
        if(verifyCodeResult.isSuccess)then
		traceprint("result.isSuccess", tostring(verifyCodeResult.isSuccess), "\n",
            "code", verifyCodeResult.code, "\n",
            "id", verifyCodeResult.id, "\n",
            "message", verifyCodeResult.message, "\n")
		else 
			traceprint("false",
			"id", verifyCodeResult.id, "\n")
		end
        if(verifyCodeResult.isSuccess)then
            xys=xutil.split(verifyCodeResult.code, "|")
            times=table.maxn(xys)
            for i=1,times do
                local intXY=xutil.split(xys[i], ",")
                local intX=tonumber(intXY[1])+320
                local intY=tonumber(intXY[2])+105
                traceprint("touch ",i,intX,intY)
                touch.click(intX,intY,1)
                sleep(5000)
            end
            sleep(3000)
			if(isYanZhengMa.Main)then
				traceprint("识别有误，ID为"..verifyCodeResult.id)
				local reportErrorResult = astarVerifycode.reportError {id = verifyCodeResult.id}
				YanZhengMa()
			end
        end
		traceprint("识别完成")
		return true
    end
	return false
end

--
function judgeYanZhengMa()
	while (true) do
		if(CmpColorXs({{x=142,y=45,c=0x000000,r=0,g=0,b=0},{x=192,y=60,c=0x000000,r=0,g=0,b=0},{x=241,y=59,c=0x000000,r=0,g=0,b=0},{x=430,y=540,c=0xF7F9FA,r=247,g=249,b=250}},1)==1)or(CmpColorXs({{x=132,y=41,c=0x000000,r=0,g=0,b=0},{x=179,y=54,c=0x000000,r=0,g=0,b=0},{x=219,y=54,c=0x000000,r=0,g=0,b=0},{x=500,y=390,c=0xF7F9FA,r=247,g=249,b=250}},1)==1)then
			isYanZhengMa.Main=true
		else 
			isYanZhengMa.Main=false
		end
		sleep(2000)
	end
end

--日志   [作者：绢旗最爱]
function traceprint(...)
	if(xutil.isFileExists("sdcard/com.helper.mfjsml/log")==false)then
		os.execute("mkdir /sdcard/com.helper.mfjsml")
		os.execute("mkdir /sdcard/com.helper.mfjsml/log")
	end
	arg={...}
	logcat(unpack(arg))
	if(arg[1]~=nil)then
		str=""
		for i=1,table.maxn(arg) do
			str=str..tostring(arg[i]).."  "
		end
		xutil.appendToFile("/sdcard/com.helper.mfjsml/log/"..scriptstarttime..".log", os.date("%Y%m%d%H%M%S",net.time()).." :"..str.."\n")
	else
		xutil.appendToFile("/sdcard/com.helper.mfjsml/log/"..scriptstarttime..".log", os.date("%Y%m%d%H%M%S",net.time()).." :\n")
	end
	return true
end

--截图   [作者：绢旗最爱]
function CapScreen(...)
	local arg={...}
	if(arg[1]~=nil)then
		dir=arg[1]
	else
		dir="sdcard/com.helper.mfjsml/capScreen/"..os.date("%Y%m%d%H%M%S",net.time())..".png"
	end
	if(xutil.isFileExists("sdcard/com.helper.mfjsml/capScreen")==false)then
		os.execute("mkdir /sdcard/com.helper.mfjsml")
		os.execute("mkdir /sdcard/com.helper.mfjsml/capScreen")
	end
	if(arg[2]==nil)then
		x1=0
		y1=0
		x2,y2=systeminfo.displaySize()
	else 
		x1=arg[2]
		y1=arg[3]
		x2=arg[4]
		y2=arg[5]
	end
	screencap(dir,x1,y1,x2,y2) 
end


--找图（语法兼容按键精灵FindPic）  [作者：绢旗最爱]
--x1,y1,x2,y2搜索范围左上与右下坐标；pic_name图片名称，将图片放置在assets目录下png目录；delta_color,dir实际不起作用；isim相似度；注意！返回的是找到图像的中心坐标x,y，若未找到返回-1
--实例： intX,intY=FindPic(100,100,300,300,"a.png",1,1,0.8)
function FindPic(ix1,iy1,ix2,iy2,pic_name,delta_color,dir,isim)
	libpic=require("com.xplugin.libpic") --pic库实现部分图片功能
	if((ix2<=ix1)or(iy2<=iy1))
	then
		ix1=0
		iy1=0
		ix2,iy2=systeminfo.displaySize()
	end
	PicisFound,Picindex, intX,intY= libpic.finder({
    paths = {xscript.scriptDir().."png/"..pic_name,},
    x1 = ix1, y1 = iy1, x2 = ix2, y2 = iy2, -- 查找范围, 这行删掉等于全屏查找
    sim = isim, --相似度 0.00-1.00, 1为100%相似
    accuracy = 2, --搜索精度, 默认2, 经验值应该小于6, 越大速度越快, 但可能会找不到, 可以根据实际测试情况给予调整
    scale = { x =  1, y = 1 }, --类似setscale功能, 这行删掉表示, 遵守setscale函数数值, 否则则使用指定的值, 会忽略setscale的设置, 原理为缩放待查找样本
    thread = true -- 是否启用多线程查找, 默认启用状态, 注意开启多线程查找意味消耗cpu 会更多
})
	if(PicisFound)
	then
		return ix1+intX,iy1+intY
	else
		return -1,-1
	end
end

--多点比色（语法兼容XscriptIDE图色工具）  [作者：绢旗最爱]
--使用说明：使用XscriptIDE图色工具时将多组颜色全部选中后，选择导出table，并将其保存成变量
--实例：aa={   {x=151, y=43, c=0x1AAEE5, r=26, g=174, b=229},   {x=260, y=48, c=0x1AAEE5, r=26, g=174, b=229},   {x=515, y=59, c=0x1AAEE5, r=26, g=174, b=229},   {x=617, y=17, c=0x1AAEE5, r=26, g=174, b=229}}
--tbl——保存的table型变量；sim——对比精度
function CmpColorXs(tbl,sim)
	strnum=(tbl and #tbl) or 0
	arr={}
	str=nil
	for i=1 , strnum do
		arr[i]=tbl[i]["x"].."|"..tbl[i]["y"].."|"..bit.tohex(tbl[i]["b"],-2)..bit.tohex(tbl[i]["g"],-2)..bit.tohex(tbl[i]["r"],-2)
	end
	str=table.concat(arr, ",", 1, strnum)  
	return CmpColorEx(str,sim)
end

--多点比色（语法沿用按键精灵CmpColorEx）  [作者：绢旗最爱]
--使用说明：与按键精灵CmpColorEx用法完全一样，str为颜色描述，以“,”分割多组颜色，颜色描述为X|Y|BGR，sim为相似度
--实例：CmpColorEx("933|174|FFFFFF", 1)
function CmpColorEx(str,sim)
	str1=xutil.split(str,",")
	strnum=(str1 and #str1) or 0
	t=0
	arrx={}
	arry={}
	arrc={}
	arrb={}
	for i=1 , strnum do
		t=i
		temp=xutil.split(str1[i],"|")
		table.insert(arrx,tonumber(temp[1]))
		table.insert(arry,tonumber(temp[2]))
		table.insert(arrc,temp[3])
		arrb[i]=cmpcolor(getcolor(arrx[i],arry[i]),argbtoint(255,tonumber(string.sub(arrc[i],5,6),16),tonumber(string.sub(arrc[i],3,4),16),tonumber(string.sub(arrc[i],1,2),16)),100*sim)
		if(arrb[i]~=true)
		then
			t=t-1
			break
		end
	end
	if(t<strnum)
	then
		return 0
	else 
		return 1
	end
end

--移除游戏界面通知    [作者：绢旗最爱]
function RemoveNoti()
    YanZhengMa()
	i=15
	while(i>0) do
        touch.click(630,565,1)
        sleep(150)
		i=i-1
    end
end

--选择函数库并执行    [作者：绢旗最爱]
function ChooseFunction(fun)
	func=urlEncode(Base64En(fun))
	net.curl("http://"..link.."/Xscript/getlua.php?ID="..ID.."&PASSWORD="..PASSWORD.."&LoginTime="..LoginTime.."&name="..func.."&type=lua","-o",xscript.scriptDir()..fun..".lua")
	xutil.writeToFile("tmplua.lua", CXor(xutil.readFileAll(xscript.scriptDir()..fun..".lua"),XorKey,xutil.getFileLength(xscript.scriptDir()..fun..".lua"),#XorKey))
	logcat("导入执行“"..fun.."”函数库")
	require("tmplua")
	--str2fun(fun)
	os.remove("templua.lua")
	os.remove("tmplua.lua")
end

--根据函数名字符串执行函数    [作者：绢旗最爱]
function str2fun(str,...)
	local fun =_G[str];
	if fun then
		fun(...);
	else
		logcat("启动函数"..str.."失败")
		return false
	end
end

--Base64加密Encoding  [作者：小玮]
function Base64En(data)
	local key='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
	return ((data:gsub('.', function(x) 
		local r,key='',x:byte()
		for i=8,1,-1 do r=r..(key%2^i-key%2^(i-1)>0 and '1' or '0') end
		return r;
	end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
		if (#x < 6) then return '' end
		local c=0
		for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
		return key:sub(c+1,c+1)
	end)..({ '', '==', '=' })[#data%3+1])
end

--Base64解密Decoding  [作者：小玮]
function Base64De(data)
	local key='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
	data = string.gsub(data, '[^'..key..'=]', '')
	return (data:gsub('.', function(x)
		if (x == '=') then return '' end
		local r,f='',(key:find(x)-1)
		for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
		return r;
	end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
		if (#x ~= 8) then return '' end
		local c=0
		for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
		return string.char(c)
	end))
end

--URL编码
function urlEncode(s)
     s = string.gsub(s, "([^%w%.%- ])", function(c) return string.format("%%%02X", string.byte(c)) end)
    return string.gsub(s, " ", "+")
end

--URL解码
function urlDecode(s)
    s = string.gsub(s, '%%(%x%x)', function(h) return string.char(tonumber(h, 16)) end)
    return s
end

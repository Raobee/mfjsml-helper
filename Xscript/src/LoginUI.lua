
function loginbut(typ)
    if(typ==1)
    then
        ui.updateResult("LoginUI")
        ID=ui.getResult("LoginUIINPUT1")
        PASSWORD=ui.getResult("LoginUIINPUT2")
        DeviceID=string.upper(string.sub(security.md5(systeminfo.imei().."xiatiao"..systeminfo.wifimac()..systeminfo.udid()..systeminfo.hardware()),3,10))
        xget=net.get("http://"..link.."/Xscript/login.php?ID="..ID.."&PASSWORD="..PASSWORD.."&DeviceID="..DeviceID)
        --toast(xget)
        if(string.sub(xget, 1, 4)=="True")
        then
            FinalTime=string.sub(xget, 5, 14)
            Scripttype=string.sub(xget, 15, 15)
            LoginTime=string.sub(xget, 16, 29)
            XorKey=string.sub(xget,30,33)
			logcat(xget)
			IsLogin=true
            toast("登录成功！")
            ui.dismiss("LoginUI")
        else 
			IsLogin=false
			toast("登录失败")
		end
    end
    if(typ==2)
    then
        ui.updateResult()  
		ui.saveProfile()
		toast("保存成功！")
    end
end

--以下为登录界面布局
ui.newLayout("LoginUI", 600, 600)
ui.setTitleText("LoginUI", "登录界面")
ui.addTextView("LoginUITEXT1", "账号:")
ui.addEditText("LoginUIINPUT1", "", 150)
ui.addTextView("LoginUITEXT2", "密码:")
ui.addEditText("LoginUIINPUT2", "", 150)
ui.newRow("LoginUIROW1")
ui.addButton("LoginUIBUT1","点击登录",100,40)
ui.addButton("LoginUIBUT2","点击保存账号密码",150,40)
ui.setOnClick("LoginUIBUT1","loginbut(1)")
ui.setOnClick("LoginUIBUT2","loginbut(2)")
ui.loadProfile()

ui.show("LoginUI")


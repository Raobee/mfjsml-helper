
--以下为主菜单界面布局
menu=xutil.split(net.get("http://"..link.."/Xscript/menu.php?ID="..ID), "|")
temp=net.get("http://"..link.."/Xscript/fundef.js")
fundef=json.decode(temp)
ui.newLayout("MenuUI", 450, 450)
ui.setTitleText("MenuUI", "主菜单")
ui.addTextView("MenuUITEXT1", "账号："..ID.."\n\t截止日期："..string.sub(FinalTime,1,4).."年"..string.sub(FinalTime,5,6).."月"..string.sub(FinalTime,7,8).."日")
ui.newRow("MenuUIROW1")
ui.addTextView("MenuUITEXT1", "选择功能\t")
ui.addSpinner("MenuUISP1", menu, 1, ui.WRAP_CONTENT, ui.WRAP_CONTENT)  

ui.show("MenuUI")
ui.updateResult()
choose=fundef[ui.getResult("MenuUISP1")]
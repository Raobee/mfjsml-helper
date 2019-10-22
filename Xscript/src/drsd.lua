
--drsd.lua  作者：绢旗最爱

--状态码：石巨人选图界面sjrxt 确认进入界面qrjr 加载游戏jzyx 游戏中attacking 成功success 主界面 main

--RoomID=nil

function createroom()
    ui.newLayout("createroom")
    ui.setTitleText("createroom", "创建房间")
    ui.addButton("createroomR","点击刷新页面")
    ui.setOnClick("createroomR", "ui.setWebView(\"createroomweb\",\"http://"..link.."/Xscript/room.php?type=create&ID="..ID.."\")")
    ui.addWebView("createroomweb","http://"..link.."/Xscript/room.php?type=create&ID="..ID)
    ui.setEventHandler("createroomweb", function(id, type, ...)
        local args = {...}
        RoomID=args[1]
        logcat(args[1])
        ui.dismiss("createroom")
    end)
    ui.show("createroom")
    if(RoomID==nil)then
        sleep("1000")
        ui.show("createroom")
    end
    logcat("RoomID:"..RoomID)
    toast("您创建的房间ID为"..RoomID)
end

function joinroom()
    ui.newLayout("joinroom")
    ui.setTitleText("joinroom", "加入房间")
    ui.addButton("joinroomR","点击刷新页面")
    ui.setOnClick("joinroomR", "ui.setWebView(\"joinroomweb\",\"http://"..link.."/Xscript/room.php?type=search&ID="..ID.."\")")
    ui.addWebView("joinroomweb","http://"..link.."/Xscript/room.php?type=search&ID="..ID)
    ui.setEventHandler("joinroomweb", function(id, type, ...)
        local args = {...}
        RoomID=args[1]
        ui.dismiss("joinroom")
    end)
    ui.show("joinroom")
    if(RoomID==nil)then
        toast("加入房间失败！！")
        sleep("1000")
        ui.show("joinroom")
    end
    logcat("RoomID:"..RoomID)
    toast("您加入的房间ID为"..RoomID)
end

function webselect(item)
    data,nnn=net.get("http://"..link.."/Xscript/room.php?type=select&ID="..ID.."&RoomID="..RoomID.."&item="..item)
    return data
end

function webchange(item,detail)
    data,nnn=net.get("http://"..link.."/Xscript/room.php?type=change&ID="..ID.."&RoomID="..RoomID.."&item="..item.."&detail="..urlEncode(detail))
    return data
end



function Psjrsdanna()
    webchange("stateP1","main")
    while (webselect("stateP2")~="main") do
        toast("等待队员中",1000)
        sleep(1000)
    end
    sleep(1000)
    touch.click(1030,485,1) --点击对话按钮1/2
    touch.click(1030,485,1) --点击对话按钮2/2
    sleep(2500)
    touch.click(970,290,1) --点击“进入适格者上达计划”1/2
    touch.click(970,290,1) --点击“进入适格者上达计划”2/2
    sleep(5000)
    --此处要换为找图防止错位
    --touch.click(128,230,1) --切换至石巨人
    webchange("stateP1","sjrxt")
    sleep(3000)
    --
    while (webselect("stateP2")~="sjrxt")do
        toast("等待队员加入中",1000)
        sleep(1000)
    end
    touch.click(1050,600) --点击“挑战”1/3次
    touch.click(1050,600) --点击“挑战”2/3次
    touch.click(1050,600) --点击“挑战”3/3次
    sleep(5000)
    webchange("stateP1","qrjr")
    while (webselect("stateP2")~="qrjr")do
        toast("等待队员加入中",1000)
        sleep(1000)
    end
    touch.click(1050,600) --点击“确认进入”1/2次
    touch.click(1050,600) --点击“确认进入”2/2次
    webchange("stateP1","jzyx")
    sleep(3000)
    while (CheckPause()==0) do
        sleep(500)
        toast("等待进入中",500)
    end
    sleep(3500)
    touch.click(600,625) --点击视角重置1/2次
    touch.click(600,625) --点击视角重置2/2次
    sleep(300)
    touch.click(1130,397) --点击闪避按钮
    sleep(300)
    touch.click(700,630) --点击锁定按钮
    webchange("stateP1","attacking")
    looptimes=100
    endflag=false
    --A并检测技能
    --同时检测是否结束
    while (endflag==false) do
        looptimes=looptimes-1
        if(looptimes<=0) then
            logcat("限制循环次数已到，退出上达副本")
            --exitannasjrsd
            --Exit Sub
        end
        for i=1,10 do
            touch.click(1060,535,1)
            sleep(300)
            touch.click(1060,535,1)
            sleep(300)
            touch.click(1060,535,1)
            sleep(300)

            touch.click(1241,511,1)
            sleep(500)
            touch.click(1241,511,1)
            sleep(500)
            --检测安娜2技能并释放(同时)
            if(CmpColorXs({{x=939, y=618, c=0xF4F4DB, r=244, g=244, b=219},{x=944, y=590, c=0xE7D68C, r=231, g=214, b=140},{x=964, y=585, c=0x160E00, r=22, g=14, b=0},{x=969, y=644, c=0x9E4412, r=158, g=68, b=18}},0.9) == 1) then
                touch.click(960,615)
                sleep(200)
            end
            touch.click(1241,511,1)
            sleep(500)

        end
		touch.click(1130,397,1) --闪避
		
		
        --同时检测是否结束
        --检测结算界面
        --双重检测
        if CmpColorEx("1179|635|FFFFFF,1144|610|4861ED,1220|629|4861ED",1) == 1 then
            webchange("stateP1","success")
            while(webselect("stateP2")~="success") do
                toast("等待队员确认中",1000)
                sleep(1000)
            end
            touch.click(1174,635)
            sleep(2300)
            touch.click(1174,635)
            sleep(1000)
            touch.click(1174,635)
            sleep(300)
            touch.click(1174,635)
            sleep(2000)
            touch.click(1174,635)
            while (CheckMode()==0)or(CheckPhone()==0) do
                sleep(500)
                toast("等待退出中",500)
            end
            webchange("stateP1","main")
            break
        end
    end

end

function Nsjrsdanna()
    webchange("stateP2","main")
    while (webselect("stateP1")~="main") do
        toast("等待队长中",1000)
        sleep(1000)
    end
    sleep(1000)
    touch.click(1030,485,1) --点击对话按钮1/2
    touch.click(1030,485,1) --点击对话按钮2/2
    sleep(2500)
    touch.click(970,290,1) --点击“进入适格者上达计划”1/2
    touch.click(970,290,1) --点击“进入适格者上达计划”2/2
    sleep(5000)
    --[[
    --此处要换为找图防止错位
    touch.click(128,230,1) --切换至石巨人]]
    webchange("stateP2","sjrxt")
    sleep(3000)
    --
    while (webselect("stateP1")~="sjrxt")do
        toast("等待队长加入中",1000)
        sleep(1000)
    end
    --[[
    touch.click(1050,600) --点击“挑战”1/3次
    touch.click(1050,600) --点击“挑战”2/3次
    touch.click(1050,600) --点击“挑战”3/3次]]
    sleep(5000)
    webchange("stateP2","qrjr")
    while (webselect("stateP1")~="qrjr")do
        toast("等待队长启动中",1000)
        sleep(1000)
    end
    touch.click(1050,600) --点击“确认进入”1/2次
    touch.click(1050,600) --点击“确认进入”2/2次
    webchange("stateP2","jzyx")
    sleep(3000)
    while (CheckPause()==0) do
        sleep(500)
        toast("等待进入中",500)
    end
    sleep(3500)
    touch.click(600,625) --点击视角重置1/2次
    touch.click(600,625) --点击视角重置2/2次
    sleep(300)
    touch.click(1134,392) --点击闪避按钮
    sleep(300)
    touch.down(183,478) --按下左前方方向前进
    sleep(1000)
    touch.up()
    touch.click(1134,392) --点击闪避按钮
    touch.down(183,478) --按下左前方方向前进
    sleep(1100)
    touch.up()
    touch.click(1134,392) --点击闪避按钮
    touch.down(183,478) --按下左前方方向前进
    sleep(2200)
    touch.up()
    touch.down(136,493) --按下左前方方向前进
    sleep(3200)
    touch.up()
    webchange("stateP2","attacking")
    looptimes=100
    endflag=false
    for i=1,2 do
        touch.click(1083,513)
        sleep(200)
        touch.click(1219,537)
        sleep(500)
        touch.click(1219,537)
        touch.click(1219,537)
    end
    --A并检测技能
    --同时检测是否结束
    while (endflag==false) do
        looptimes=looptimes-1
        if(looptimes<=0) then
            logcat("限制循环次数已到，退出上达副本")
            --exitannasjrsd
            --Exit Sub
        end
        touch.click(1083, 513)
        sleep(200)
        touch.click(1083, 513)
        sleep(400)
        touch.click(1219, 537)
        sleep(500)
        touch.click(1219, 537)
        --A
        --检测1技能并释放(同时)
        if(CmpColorEx("936|469|B617A0,975|482|C41F8A,940|488|E26ACE",0.9) == 1) then
            touch.click(944,472)
            sleep(200)
        end
        --同时检测是否结束
        --检测结算界面
        --双重检测
        if CmpColorEx("1179|635|FFFFFF,1144|610|4861ED,1220|629|4861ED",1) == 1 then
            webchange("stateP2","success")
            while(webselect("stateP1")~="success") do
                toast("等待队长确认中",1000)
                sleep(1000)
            end
            touch.click(1174,635)
            sleep(2300)
            touch.click(1174,635)
            sleep(1000)
            touch.click(1174,635)
            sleep(300)
            touch.click(1174,635)
            sleep(2000)
            touch.click(1174,635)
            while (CheckMode()==0)or(CheckPhone()==0) do
                sleep(500)
                toast("等待退出中",500)
            end
            webchange("stateP2","main")
            break
        end
    end

end






ui.newLayout("multisd",600)
ui.setTitleText("multisd","多人上达设置")
ui.addTextView("multisdTEXT1","选择上达地图")
ui.addSpinner("multisdSpinner1",{"石巨人"--[[,"十字路口","泳衣","公园","机器人"]]},1)
--ui.newRow("multisdRow1")
ui.addTextView("multisdTEXT1","\t\t\t选择房间模式")
ui.addSpinner("multisdSpinner2",{"创建房间","加入房间"},1)
ui.show("multisd")
ui.updateResult("multisd")
multisd=ui.getData("multisd")
logcat("选择地图："..multisd["multisdSpinner1"].."\t模式："..multisd["multisdSpinner2"])
if(multisd["multisdSpinner2"]=="创建房间")then
    createroom()
    while (true)do
        if(multisd["multisdSpinner1"]=="石巨人")then
            Psjrsdanna()
        end
    end
end
if(multisd["multisdSpinner2"]=="加入房间")then
    joinroom()
    while (true)do
        if(multisd["multisdSpinner1"]=="石巨人")then
            Nsjrsdanna()
        end
    end
end


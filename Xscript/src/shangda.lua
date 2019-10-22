
require("checkstate")
require("attack")

tget={0,0,0,0,0} --记录掉落写真数量

function judgeGet()
    temp=CheckGet()
    if(temp~=0)then
        tget[temp]=tget[temp]+1
    end
    traceprint(unpack(tget))
end

function choosemap(map,hard)
    mapnamelist=json.decode("{\"防御十字路口\":\"fyszlk\",\"突袭休闲公园\":\"txxxgy\",\"泳衣大作战\":\"yydzz\",\"石巨人入侵\":\"sjrrq\",\"暴动的机器人\":\"bddjqr\"}")
    mapname="sdmap_"..mapnamelist[map]..".png"

    intX,intY=-1,-1
    while(true)do
        intX, intY=FindPic(511, 78, 898, 130, mapname, "000000", 0, 0.85)
        if(intX>0)then
            break
        end
        touch.click(125,235,1)
        sleep(800)
    end
    if(hard=="普通")then
        sleep(1000)
        return true
    end
    if(hard=="困难")then
        sleep(1500)
        touch.click(1125,550,1) --点击困难
        return true
    end

end

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


function exitsd()
    touch.click(1240,45,1)
    sleep(2000)
    touch.click(1240,45,1)
    sleep(4000)
    touch.click(150,360,1)
    sleep(2000)
    touch.click(150,360,1)
    sleep(4000)
    touch.click(1070,500,1) --确认
    while (CheckMode()==0)or(CheckPhone()==0) do
        touch.click(1070,500,1)
        sleep(1000)
        touch.click(1200,670)
        sleep(2000)
        toast("等待退出中",1950)
    end
end



function Ssd(chara,map,hard)
    --*******************************单人上达通用
    toast("单人上达\n地图:"..map..";角色:"..chara..";难度:"..hard)
    traceprint("单人上达\n地图:"..map..";角色:"..chara..";难度:"..hard)
    sleep(1000)
    while(CmpColorXs({{x=954,y=592,c=0xE3B925,r=227,g=185,b=37},{x=964,y=631,c=0xE3B925,r=227,g=185,b=37}},1)~=1)do
        touch.click(1030,485,1) --点击对话按钮1/2
        touch.click(1030,485,1) --点击对话按钮2/2
        sleep(2500)
        touch.click(970,290,1) --点击“进入适格者上达计划”1/2
        touch.click(970,290,1) --点击“进入适格者上达计划”2/2
        sleep(5000)
    end
    choosemap(map,hard) --选择地图
    sleep(1000)
    touch.click(1050,600) --点击“挑战”1/3次
    touch.click(1050,600) --点击“挑战”2/3次
    touch.click(1050,600) --点击“挑战”3/3次
    sleep(5000)
    touch.click(1050,600) --点击“确认进入”1/2次
    touch.click(1050,600) --点击“确认进入”2/2次
    sleep(3000)
    while (CheckPause()==0) do
        sleep(500)
        toast("等待进入中",500)
    end
    --*******************************单人上达通用





    if(map=="石巨人入侵")and(hard=="普通")then
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
                exitsd()
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
            if CmpColorEx("1179|635|FFFFFF,1144|610|4861ED,1220|629|4861ED",1) == 1 then
                touch.click(1200,670)
                sleep(2300)
                touch.click(1200,670)
                sleep(1000)
                touch.click(1200,670)
                sleep(300)
                touch.click(1200,670)
                sleep(2000)
                touch.click(1200,670)
                while (CheckMode()==0)or(CheckPhone()==0) do
                    touch.click(1070,500,1)
                    sleep(100)
                    touch.click(1200,670)
                    sleep(1000)
                    toast("等待退出中",950)
                end
                break
            end
        end
    end


    if(map=="暴动的机器人")and(hard=="困难")then


        if(othervars==nil)then
            walktime=3700
        else
            walktime=othervars["walktime"]
        end
        logcat(walktime)


        sleep(5000)
        touch.click(600,625) --点击视角重置1/2次
        touch.click(600,625) --点击视角重置2/2次
        sleep(500)
        touch.down(201,478,1)
        sleep(walktime)--sleep(3500)
        touch.up(1)
        touch.click(1235,560,1) --B
        sleep(4000)
        for i=1,5 do
            touch.click(1235,560,1) --B
            sleep(1000)
        end



        touch.down(200,478,1)
        sleep(1000)
        touch.up(1)



        touch.click(700,630,1) --镜头锁定



        overtime=300

        startsec=os.clock()


        while(true)do
            touch.down(110,608,1)
            sleep(1000)
            touch.up(1)
            sleep(500)
            for i=1,8 do

                touch.click(1070,572,1) --A
                sleep(100)
                touch.click(1235,560,1) --B
                sleep(500)
                touch.click(1070,572,1) --A
                sleep(100)
                touch.click(1235,560,1) --B
                sleep(500)
                touch.click(1070,572,1) --A
                sleep(100)
                touch.click(1235,560,1) --B
                sleep(300)
                touch.click(1235,560,1) --B
                sleep(100)
                touch.click(1235,560,1) --B
                sleep(100)
                touch.click(960,615,1) --B2
                if(CheckLock()==0)then
                    touch.swipe(720,360,900,360,600)
                end
                if (CheckEnd()==1) then
                    CapScreen("/sdcard/com.helper.mfjsml/capScreen/sd_"..os.date("%Y_%m_%d_%H_%M_%S",net.time())..".png",1060,150,1269,243)
                    touch.click(1200,670)
                    sleep(5000)
                    judgeGet()
                    touch.click(1200,670)
                    sleep(1000)
                    touch.click(1200,670)
                    sleep(300)
                    touch.click(1200,670)
                    sleep(2000)
                    touch.click(1200,670)
                    while (CheckMode()==0)or(CheckPhone()==0) do
                        touch.click(1070,500,1)
                        sleep(1000)
                        touch.click(1200,670)
                        sleep(2000)
                        toast("等待退出中",1950)
                    end
                    RemoveNoti()
                    return true
                end

            end



            --检测运行时间
            if((os.difftime(os.clock()-startsec))>=overtime)then
                toast("脚本运行超时，退出此次运行")
                traceprint("脚本运行超时，退出此次运行",startsec,os.clock())
                exitsd()
                toast("已退出此次上达")
                RemoveNoti()
                return true
            end

        end



    end



    if(map=="防御十字路口")and(hard=="困难")then


        if(othervars==nil)then
            walktime=3700
        else
            walktime=othervars["walktime"]
        end
        logcat(walktime)


		sleep(2000)
        touch.click(600,625) --点击视角重置1/2次
        touch.click(600,625) --点击视角重置2/2次
        sleep(300)
        touch.down(132,499,1)
        sleep(3000)
        touch.up(1)
		
        --touch.click(700,630,1) --镜头锁定



        overtime=300

        startsec=os.clock()



        while(true)do
            touch.down(110,608,1)
            sleep(1000)
            touch.up(1)
            sleep(500)
            for i=1,8 do

                touch.click(1070,572,1) --A
                sleep(100)
                touch.click(1235,560,1) --B
                sleep(500)
                touch.click(1070,572,1) --A
                sleep(100)
                touch.click(1235,560,1) --B
                sleep(500)
                touch.click(1070,572,1) --A
                sleep(100)
                touch.click(1235,560,1) --B
                sleep(300)
                touch.click(1235,560,1) --B
                sleep(100)
                touch.click(1235,560,1) --B
                sleep(100)
                touch.click(960,615,1) --B2
                if(CheckLock()==0)then
                    --touch.swipe(720,360,900,360,600)
                end
                if (CheckEnd()==1) then
                    CapScreen("/sdcard/com.helper.mfjsml/capScreen/sd_"..os.date("%Y_%m_%d_%H_%M_%S",net.time())..".png",1060,150,1269,243)
                    touch.click(1200,670)
                    sleep(5000)
                    judgeGet()
                    touch.click(1200,670)
                    sleep(1000)
                    touch.click(1200,670)
                    sleep(300)
                    touch.click(1200,670)
                    sleep(2000)
                    touch.click(1200,670)
                    while (CheckMode()==0)or(CheckPhone()==0) do
                        touch.click(1070,500,1)
                        sleep(1000)
                        touch.click(1200,670)
                        sleep(2000)
                        toast("等待退出中",1950)
                    end
                    RemoveNoti()
                    return true
                end

            end



            --检测运行时间
            if((os.difftime(os.clock()-startsec))>=overtime)then
                toast("脚本运行超时，退出此次运行")
                traceprint("脚本运行超时，退出此次运行",startsec,os.clock())
                exitsd()
                toast("已退出此次上达")
                RemoveNoti()
                return true
            end

        end



    end




    if(map=="泳衣大作战")and(hard=="困难")then
        --泳衣主动***********************************************
        sleep(3000)
        touch.click(600,625) --点击视角重置1/2次
        touch.click(600,625) --点击视角重置2/2次
        sleep(300)
        touch.click(1130,397) --点击闪避按钮
        sleep(300)
        --touch.click(700,630) --点击锁定按钮
        sleep(500)
        startsec=os.clock()    --记录起始时间


        touch.down(189,475,1)
        sleep(750)
        touch.up(1)
        touch.click(1235,560,1) --B
        sleep(3000)
        touch.click(1235,560,1) --B
        touch.click(700,630) --点击锁定按钮

        while(true)do
            touch.down(110,608,1)
            sleep(1000)
            touch.up(1)
            sleep(500)
            for i=1,8 do
                touch.click(1070,572,1) --A
                sleep(100)
                touch.click(1235,560,1) --B
                sleep(500)
                touch.click(1070,572,1) --A
                sleep(100)
                touch.click(1235,560,1) --B
                sleep(500)
                touch.click(1070,572,1) --A
                sleep(100)
                touch.click(1235,560,1) --B
                sleep(300)
                touch.click(1235,560,1) --B
                sleep(100)
                touch.click(1235,560,1) --B
                sleep(100)
                if(math.mod(i,2)==0)then
                    touch.click(1130,397) --闪避
                    sleep(200)
                end
                touch.click(960,615,1) --B2
                while(CheckLock()==0)do
                    touch.swipe(720,360,900,360,600)
                    touch.click(700,630,1)
                    sleep(500)
                    if(CheckEnd()==1)then
                        break
                    end
                end
                if (CheckEnd()==1) then
                    CapScreen("/sdcard/com.helper.mfjsml/capScreen/sd_"..os.date("%Y_%m_%d_%H_%M_%S",net.time())..".png",1060,150,1269,243)
                    touch.click(1200,670)
                    sleep(5000)
                    judgeGet()
                    touch.click(1200,670)
                    sleep(1000)
                    touch.click(1200,670)
                    sleep(300)
                    touch.click(1200,670)
                    sleep(2000)
                    touch.click(1200,670)
                    while (CheckMode()==0)or(CheckPhone()==0) do
                        touch.click(1070,500,1)
                        sleep(100)
                        touch.click(1200,670)
                        sleep(1000)
                        toast("等待退出中",950)
                    end
                    RemoveNoti()
                    return true
                end

            end



            --检测运行时间
            if((os.difftime(os.clock()-startsec))>=overtime)then
                toast("脚本运行超时，退出此次运行")
                traceprint("脚本运行超时，退出此次运行",startsec,os.clock())
                exitsd()
                toast("已退出此次上达")
                RemoveNoti()
                return true
            end

        end


    end


end

function Psd(chara,map,hard)

    traceprint("上达主动")
    webchange("stateP1","main")
    while (webselect("stateP2")~="main") do
        toast("等待队员中",1000)
        sleep(1000)
    end
    while(CmpColorXs({{x=954,y=592,c=0xE3B925,r=227,g=185,b=37},{x=964,y=631,c=0xE3B925,r=227,g=185,b=37}},1)~=1)do
        touch.click(1030,485,1) --点击对话按钮1/2
        touch.click(1030,485,1) --点击对话按钮2/2
        sleep(2500)
        touch.click(970,290,1) --点击“进入适格者上达计划”1/2
        touch.click(970,290,1) --点击“进入适格者上达计划”2/2
        sleep(5000)
    end
    webchange("stateP1","xzdt")
    --选择地图与难度函数
    choosemap(map,hard)
    sleep(1500)
    --
    while (webselect("stateP2")~="xzdt")do
        toast("等待队员加入中",1000)
        sleep(1000)
    end
    sleep(1500)
    touch.click(1050,600) --点击“挑战”1/3次
    touch.click(1050,600) --点击“挑战”2/3次
    touch.click(1050,600) --点击“挑战”3/3次
    webchange("stateP1","qrjr")
    sleep(5000)
    touch.click(1050,600) --点击“确认进入”1/2次
    touch.click(1050,600) --点击“确认进入”2/2次
    webchange("stateP1","jzyx")
    sleep(2000)
    while (CheckPause()==0) do
        sleep(500)
        toast("等待进入中",500)
    end
    toast("已进入",500)
    webchange("stateP1","ingame")
    while (webselect("stateP2")~="ingame")do
        toast("等待队员加入中",500)
        sleep(500)
    end
	sleep(1000)

    if(map=="泳衣大作战")then
        --泳衣主动***********************************************
        sleep(2000)
        touch.click(600,625) --点击视角重置1/2次
        touch.click(600,625) --点击视角重置2/2次
        sleep(300)
        touch.click(1130,397) --点击闪避按钮
        sleep(300)
        touch.click(700,630) --点击锁定按钮
        sleep(500)
        startsec=os.clock()    --记录起始时间
        while (true) do
            attack(chara)
            if((CheckLock()==0)and(CheckEnd()==0))then
                sleep(1000)
                touch.click(700,630) --点击锁定按钮
                while((CheckLock()==0)and(CheckEnd()==0)) do
                    temp=nil
                    for i=1,30 do
                        temp=i
                        sleep(50)
                        touch.swipe(720,360,900,360)
                        sleep(100)
                        touch.click(700,630) --点击锁定按钮
                        sleep(1000)
                        if(CheckLock()==1)or(CheckEnd()==1)then
                            break
                        end
                    end

                    if(i==30)then
                        sleep(500)
                        touch.click(600,625) --点击视角重置
                        sleep(300)
                        touch.down(189,654,1) --后退
                        sleep(500)
                        touch.up(1)
                        touch.click(600,625) --点击视角重置
                        for i=1,3 do
                            touch.click(1130,397) --闪避
                            sleep(500)
                        end
                    end
                    if((os.difftime(os.clock()-startsec))>=overtime)then
                        toast("脚本运行超时，退出此次运行")
                        traceprint("脚本运行超时，退出此次运行",startsec,os.clock())
                        webchange("stateP1","overtime")
                        exitsd()
                        while (webselect("stateP2")~="overtime")do
                            sleep(2000)
                            toast("等待队员退出中",2000)
                        end
                        webchange("stateP1","main")
                        while (webselect("stateP2")~="main")do
                            sleep(2000)
                            toast("等待队员退出中",2000)
                        end
                        toast("已退出此次上达")
                        return nil
                    end
                end

            end
            --同时检测是否结束
            --检测结算界面
            if (CheckEnd()==1) then
                webchange("stateP1","success")

                CapScreen("/sdcard/com.helper.mfjsml/capScreen/sd_"..os.date("%Y_%m_%d_%H_%M_%S",net.time())..".png",897,51,1231,558)

                while(webselect("stateP2")~="success") do
                    toast("等待队员确认中",1000)
                    sleep(1000)
                end
                touch.click(1200,670)
                sleep(2300)
                judgeGet()
                touch.click(1200,670)
                sleep(1000)
                touch.click(1200,670)
                sleep(300)
                touch.click(1200,670)
                sleep(2000)
                touch.click(1200,670)
                while (CheckMode()==0)or(CheckPhone()==0) do
                    sleep(500)
                    toast("等待退出中",500)
                end
                webchange("stateP1","main")
                break
            end
            --检测运行时间
            if((os.difftime(os.clock()-startsec))>=overtime)then
                toast("脚本运行超时，退出此次运行")
                traceprint("脚本运行超时，退出此次运行",startsec,os.clock())
                webchange("stateP1","overtime")
                exitsd()
                while (webselect("stateP2")~="overtime")do
                    sleep(2000)
                    toast("等待队员退出中",2000)
                end
                webchange("stateP1","main")
                while (webselect("stateP2")~="main")do
                    sleep(2000)
                    toast("等待队员退出中",2000)
                end
                toast("已退出此次上达")
                return nil
            end



        end
        --泳衣主动***********************************************
    end

    if(map=="石巨人入侵")then


        touch.click(600,625) --点击视角重置1/2次
        touch.click(600,625) --点击视角重置2/2次
        touch.click(1130,397,1)
        sleep(300)
        touch.click(1130,397,1)
        sleep(300)
        touch.down(178,478,1)
        --touch.down(189,478,1)
        sleep(5500)
        touch.up(1)

        touch.click(700,630,1) --点击锁定按钮
        sleep(500)
        startsec=os.clock()    --记录起始时间

        while(true)do
            attack(chara)
            if(CmpColorXs({{x=642,y=42,c=0xFFFFFF,r=255,g=255,b=255},{x=684,y=47,c=0xFFFFFE,r=255,g=255,b=254},{x=707,y=44,c=0xFEFEFD,r=254,g=254,b=253}},0.9)==1)and(CheckLock()==1)then
                touch.click(700,630,1) --取消镜头锁定
                sleep(150)
                touch.swipe(640,360,900,360)
                touch.click(700,630,1) --重新镜头锁定
            end
            while((CheckLock()==0)and(CheckEnd()==0)) do
                temp=nil
                for i=1,30 do
                    temp=i
                    sleep(50)
                    touch.swipe(720,360,900,360)
                    sleep(100)
                    touch.click(700,630) --点击锁定按钮
                    sleep(1000)
                    if(CheckLock()==1)or(CheckEnd()==1)then
                        break
                    end
                end

                if(i==30)then
                    sleep(500)
                    touch.click(600,625) --点击视角重置
                    sleep(300)
                    touch.down(189,654,1) --后退
                    sleep(500)
                    touch.up(1)
                    touch.click(600,625) --点击视角重置
                    for i=1,3 do
                        touch.click(1130,397) --闪避
                        sleep(500)
                    end
                end

                if(CmpColorXs({{x=642,y=42,c=0xFFFFFF,r=255,g=255,b=255},{x=684,y=47,c=0xFFFFFE,r=255,g=255,b=254},{x=707,y=44,c=0xFEFEFD,r=254,g=254,b=253}},0.9)==1)and(CheckLock()==1)then
                    touch.click(700,630,1) --取消镜头锁定
                    sleep(150)
                    touch.swipe(640,360,900,360)
                    touch.click(700,630,1) --重新镜头锁定
                end

                if((os.difftime(os.clock()-startsec))>=overtime)then
                    toast("脚本运行超时，退出此次运行")
                    traceprint("脚本运行超时，退出此次运行",startsec,os.clock())
                    webchange("stateP1","overtime")
                    exitsd()
                    webchange("stateP1","main")
                    while (webselect("stateP2")~="main")do
                        sleep(2000)
                        toast("等待队员退出中",2000)
                    end
                    toast("已退出此次上达")
                    return nil
                end
            end

            if (CheckEnd()==1) then
                webchange("stateP1","success")

                CapScreen("/sdcard/com.helper.mfjsml/capScreen/sd_"..os.date("%Y_%m_%d_%H_%M_%S",net.time())..".png",897,51,1231,558)

                while(webselect("stateP2")~="success") do
                    toast("等待队员确认中",1000)
                    sleep(1000)
                end
                touch.click(1200,670)
                sleep(2300)
                judgeGet()
                touch.click(1200,670)
                sleep(1000)
                touch.click(1200,670)
                sleep(300)
                touch.click(1200,670)
                sleep(2000)
                touch.click(1200,670)
                while (CheckMode()==0)or(CheckPhone()==0) do
                    sleep(500)
                    toast("等待退出中",500)
                end
                webchange("stateP1","main")
                break
            end
            --检测运行时间
            if((os.difftime(os.clock()-startsec))>=overtime)then
                toast("脚本运行超时，退出此次运行")
                traceprint("脚本运行超时，退出此次运行",startsec,os.clock())
                exitsd()
                webchange("stateP1","main")
                while (webselect("stateP2")~="main")do
                    sleep(2000)
                    toast("等待队员退出中",2000)
                end
                toast("已退出此次上达")
                return nil
            end




        end




    end





end

function Nsd(chara,map,hard)

    traceprint("上达被动")
    webchange("stateP2","main")
    while (webselect("stateP1")~="main") do
        toast("等待队长中",1000)
        sleep(1000)
    end

    while (true)do
        toast("等待队长操作中",290)
        sleep(300)
        if(CmpColorXs({{x=104,y=477,c=0x2A6ED4,r=42,g=110,b=212},{x=957,y=482,c=0xED6247,r=237,g=98,b=71}},0.9)==1)then
            sleep(1500)
            touch.click(1070,500,1) --确认
            touch.click(1070,500,1) --确认
            break
        end
    end
    sleep(500)
    webchange("stateP2","xzdt")
    while (webselect("stateP1")~="qrjr")do
        toast("等待队长开始",1000)
        sleep(1000)
    end
    sleep(3000)
    touch.click(1050,600) --点击“确认进入”1/2次
    touch.click(1050,600) --点击“确认进入”2/2次
    webchange("stateP2","jzyx")
    sleep(2000)
    while (CheckPause()==0) do
        sleep(500)
        toast("等待进入中",500)
    end
    toast("已进入",500)
    webchange("stateP2","ingame")
    while (webselect("stateP1")~="ingame")do
        toast("等待队长加入中",500)
        sleep(500)
    end
	sleep(1000)

    if(map=="泳衣大作战")then
        --泳衣被动***********************************************
        sleep(2000)
        touch.click(600,625) --点击视角重置1/2次
        touch.click(600,625) --点击视角重置2/2次
        sleep(300)
        touch.click(1130,397) --点击闪避按钮
        sleep(300)
        touch.click(700,630) --点击锁定按钮
        sleep(500)
        startsec=os.clock()    --记录起始时间
        while (true) do

            attack(chara)
            if((CheckLock()==0)and(CheckEnd()==0))then
                sleep(1000)
                touch.click(700,630) --点击锁定按钮
                while((CheckLock()==0)and(CheckEnd()==0)) do
                    temp=nil
                    for i=1,30 do
                        temp=i
                        sleep(50)
                        touch.swipe(720,360,900,360)
                        sleep(100)
                        touch.click(700,630) --点击锁定按钮
                        sleep(1000)
                        if(CheckLock()==1)or(CheckEnd()==1)then
                            break
                        end
                    end

                    if(temp==30)then
                        sleep(500)
                        touch.click(600,625) --点击视角重置
                        sleep(300)
                        touch.down(189,654,1) --后退
                        sleep(500)
                        touch.up(1)
                        touch.click(600,625) --点击视角重置
                        for i=1,3 do
                            touch.click(1130,397) --闪避
                            sleep(500)
                        end
                    end

                    if((os.difftime(os.clock()-startsec))>=overtime)then
                        toast("脚本运行超时，退出此次运行")
                        traceprint("脚本运行超时，退出此次运行",startsec,os.clock())
                        webchange("stateP2","overtime")
                        exitsd()
                        while (webselect("stateP1")~="overtime")do
                            sleep(2000)
                            toast("等待队长退出中",2000)
                        end
                        webchange("stateP2","main")
                        while (webselect("stateP1")~="main")do
                            sleep(2000)
                            toast("等待队长退出中",2000)
                        end
                        toast("已退出此次上达")
                        return nil
                    end
                end

            end
            --同时检测是否结束
            --检测结算界面
            --双重检测
            if (CheckEnd()==1) then
                webchange("stateP2","success")

                CapScreen("/sdcard/com.helper.mfjsml/capScreen/sd_"..os.date("%Y_%m_%d_%H_%M_%S",net.time())..".png",797,151,1184,292)

                while(webselect("stateP1")~="success") do
                    toast("等待队长确认中",1000)
                    sleep(1000)
                end
                touch.click(1200,670)
                sleep(2300)
                judgeGet()
                touch.click(1200,670)
                sleep(1000)
                touch.click(1200,670)
                sleep(300)
                touch.click(1200,670)
                sleep(2000)
                touch.click(1200,670)
                while (CheckMode()==0)or(CheckPhone()==0) do
                    sleep(500)
                    toast("等待退出中",500)
                end
                webchange("stateP2","main")
                return nil
            end
            --检测运行时间
            if((os.difftime(os.clock()-startsec))>=overtime)then
                toast("脚本运行超时，退出此次运行")
                traceprint("脚本运行超时，退出此次运行",startsec,os.clock())
                webchange("stateP2","overtime")
                exitsd()
                webchange("stateP2","main")
                while (webselect("stateP1")~="main")do
                    sleep(2000)
                    toast("等待队长退出中",2000)
                end
                toast("已退出此次上达")
                return nil
            end

        end
        --泳衣被动***********************************************
    end


    --石巨人被动
    if(map=="石巨人入侵")then


        touch.click(600,625) --点击视角重置1/2次
        touch.click(600,625) --点击视角重置2/2次
        touch.click(1130,397,1)
        sleep(300)
        touch.click(1130,397,1)
        sleep(300)
        touch.down(178,478,1)
        --touch.down(189,478,1)
        sleep(5500)
        touch.up(1)

        touch.click(700,630,1) --点击锁定按钮
        sleep(500)
        startsec=os.clock()    --记录起始时间

        while(true)do
            attack(chara)
            if(CmpColorXs({{x=642,y=42,c=0xFFFFFF,r=255,g=255,b=255},{x=684,y=47,c=0xFFFFFE,r=255,g=255,b=254},{x=707,y=44,c=0xFEFEFD,r=254,g=254,b=253}},0.9)==1)and(CheckLock()==1)then
                touch.click(700,630,1) --取消镜头锁定
                sleep(150)
                touch.swipe(640,360,900,360)
                touch.click(700,630,1) --重新镜头锁定
            end
            while((CheckLock()==0)and(CheckEnd()==0)) do
                temp=nil
                for i=1,30 do
                    temp=i
                    sleep(50)
                    touch.swipe(720,360,900,360)
                    sleep(100)
                    touch.click(700,630) --点击锁定按钮
                    sleep(1000)
                    if(CheckLock()==1)or(CheckEnd()==1)then
                        break
                    end
                end

                if(i==30)then
                    sleep(500)
                    touch.click(600,625) --点击视角重置
                    sleep(300)
                    touch.down(189,654,1) --后退
                    sleep(500)
                    touch.up(1)
                    touch.click(600,625) --点击视角重置
                    for i=1,3 do
                        touch.click(1130,397) --闪避
                        sleep(500)
                    end
                end

                if(CmpColorXs({{x=642,y=42,c=0xFFFFFF,r=255,g=255,b=255},{x=684,y=47,c=0xFFFFFE,r=255,g=255,b=254},{x=707,y=44,c=0xFEFEFD,r=254,g=254,b=253}},0.9)==1)and(CheckLock()==1)then
                    touch.click(700,630,1) --取消镜头锁定
                    sleep(150)
                    touch.swipe(640,360,900,360)
                    touch.click(700,630,1) --重新镜头锁定
                end

                if((os.difftime(os.clock()-startsec))>=overtime)then
                    toast("脚本运行超时，退出此次运行")
                    traceprint("脚本运行超时，退出此次运行",startsec,os.clock())
                    webchange("stateP2","overtime")
                    exitsd()
                    --[[while (webselect("stateP1")~="overtime")do
                    sleep(2000)
                    toast("等待队长退出中",2000)
                    end]]
                    webchange("stateP12","main")
                    while (webselect("stateP1")~="main")do
                        sleep(2000)
                        toast("等待队长退出中",2000)
                    end
                    toast("已退出此次上达")
                    return nil
                end
            end

            if (CheckEnd()==1) then
                webchange("stateP2","success")

                CapScreen("/sdcard/com.helper.mfjsml/capScreen/sd_"..os.date("%Y_%m_%d_%H_%M_%S",net.time())..".png",897,51,1231,558)

                while(webselect("stateP1")~="success") do
                    toast("等待队长确认中",1000)
                    sleep(1000)
                end
                touch.click(1200,670)
                sleep(2300)
                judgeGet()
                touch.click(1200,670)
                sleep(1000)
                touch.click(1200,670)
                sleep(300)
                touch.click(1200,670)
                sleep(2000)
                touch.click(1200,670)
                while (CheckMode()==0)or(CheckPhone()==0) do
                    sleep(500)
                    toast("等待退出中",500)
                end
                webchange("stateP2","main")
                break
            end
            --检测运行时间
            if((os.difftime(os.clock()-startsec))>=overtime)then
                toast("脚本运行超时，退出此次运行")
                traceprint("脚本运行超时，退出此次运行",startsec,os.clock())
                exitsd()
                --[[while (webselect("stateP2")~="overtime")do
                sleep(2000)
                toast("等待队员退出中",2000)
                end]]
                webchange("stateP2","main")
                while (webselect("stateP1")~="main")do
                    sleep(2000)
                    toast("等待队长退出中",2000)
                end
                toast("已退出此次上达")
                return nil
            end
        end

    end




end



--单人普通安娜石巨人上达
function annasjrsd()







end






















--待获取数据
hard=vars[3]
map=vars[4]
chara=vars[5]
ftyp=vars[6]
othervars=json.decode(vars[7])




--[[
--chara="食蜂操祈"
map="泳衣大作战"
hard="easy"
ui.newLayout("temp")
ui.addEditText("temp1","ID")
ui.addSpinner("temp2",{"单人","主动","被动"},1)
ui.addSpinner("temp3",{"欧莉安娜","食蜂操祈"},1)
ui.addSpinner("temp4",{"简单","困难"},2)
ui.show("temp")
ui.refresh()
temp=ui.getData("temp")
ID=temp["temp1"]
ftyp=temp["temp2"]
chara=temp["temp3"]
hard=temp["temp4"]
--]]


overtime=200







if(ftyp=="主动")then
    createroom()
end
if(ftyp=="被动")then
    joinroom()
end



if(ftyp=="单人")then
    while(true)do
        Ssd(chara,map,hard)
    end
end
if(ftyp=="主动")then

    while(true)do
        Psd(chara,map,hard)
    end

end
if(ftyp=="被动")then
    while(true)do
        Nsd(chara,map,hard)
    end
end







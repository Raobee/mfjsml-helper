
--地排.lua    [作者：绢旗最爱,禁止通行]

function ynsdp()

    while(true) do
        --防止拉入队伍
        if(CmpColorEx("568|492|D46E2A,1158|487|4762ED,322|480|D46E2A",0.9)==1) then
            touch.click(495, 498,1)
            logcat("自动拒绝组队")
            toast("自动拒绝组队")
            sleep(800)
        end
        --防止卡在结算界面
        if(CmpColorEx("1172|636|FFFFFF,1199|667|4861ED,1146|650|4861ED",0.9)==1) then
            touch.click(1179, 640 ,1)
            sleep(600)
            touch.click(1179, 640 ,1)
            sleep(400)
        end
        --参加战斗按钮
        if(CmpColorEx("1173|602|4762ED,1162|588|4762ED,1171|640|4762ED",0.9) == 1) then
            touch.click(1007, 604 ,1)
            sleep(500)
        end
        --等待进入 检测取消及确认按钮
        if(CmpColorEx("303|480|D46E2A,1158|478|4762ED,428|644|000000",0.9) == 1) then
            touch.click(1023,492 ,1)
            sleep(500)
            touch.click(1023,492 ,1)
        end
        sleep(100)
        if(CmpColorEx("1085|506|CE6259,1227|535|4850DD,1105|541|CE6259",0.9) == 1) then
            break
        end
    end
    sleep(2100)
    touch.down(208,480,1)
    sleep(800)
    touch.up(1)
    touch.click(1083,512,1)
    sleep(200)
    touch.click(1083,512,1)
    sleep(240)
    touch.click(1083,512,1)
    touch.click(1133,390,1)
    while(true) do
        if(CmpColorEx("1224|30|3948D8,1214|38|DCDAD9,1240|38|444BE4", 0.9) == 1) then
            break
        end
        for i=1,3 do
            touch.click(1083, 512,1)
            sleep(250)
        end
        --一技能
        if(CmpColorEx("967|488|DB62CB,959|458|B74490",0.8) == 1) then
            touch.click(939,469,1)
            sleep(400)
        end
        for i=1,3 do
            touch.click(1083, 512,1)
            sleep(250)
        end
        --等待
        --一技能
        if(CmpColorEx("967|488|DB62CB,959|458|B74490",0.8) == 1) then
            touch.click(1083,512,1)
            touch.click(939,469,1)
            sleep(400)
        end
        --等待结束
        if(CmpColorEx("1172|636|FFFFFF,1199|667|4861ED,1146|650|4861ED",0.9) == 1) then
            sleep(100)
            touch.click(1179,640,1)
            sleep(360)
            touch.click(1179,640,1)
            break
        end
        if(CmpColorEx("1224|30|3948D8,1214|38|DCDAD9,1240|38|444BE4", 0.9) == 1) then
            break
        end
        for i=1,3 do
            touch.click(1083, 512,1)
            sleep(250)
        end
        --一技能
        if(CmpColorEx("967|488|BF3391,959|458|B72B86",0.8) == 1) then
            touch.click(939,469,1)
            sleep(400)
        end
        for i=1,3 do
            touch.click(1083, 512,1)
            sleep(250)
        end
        --等待
        --一技能
        if(CmpColorEx("967|488|DB62CB,959|458|B74490",0.8) == 1) then
            touch.click(1083,512,1)
            touch.click(939,469,1)
            sleep(400)
        end
        --等待结束
        if(CmpColorEx("1172|636|FFFFFF,1199|667|4861ED,1146|650|4861ED",0.9) == 1) then
            sleep(100)
            touch.click(1179,640,1)
            sleep(360)
            touch.click(1179,640,1)
            break
        end

        --切换左边

        sleep(600)
        touch.down(140,490,1)
        sleep(800)
        touch.up(1)
        touch.click(1133,390,1)
        sleep(120)
        exitflag=false
        for i=1,4 do
            if(CmpColorEx("1224|30|3948D8,1214|38|DCDAD9,1240|38|444BE4", 0.9) == 1) then
                exitflag=true
                break
            end
            for j=1,3 do
                touch.click(1083,512,1)
                sleep(300)
            end
            touch.click(1133,390,1)
            --一技能
            if(CmpColorEx("967|488|DB62CB,959|458|B74490",0.8) == 1) then
                touch.click(1083,512,1)
                sleep(400)
                touch.click(939,469,1)
            end
            for j=1,3 do
                touch.click(1083,512,1)
                sleep(300)
            end
            --等待
            --一技能
            if(CmpColorEx("967|488|DB62CB,959|458|B74490",0.8) == 1) then
                touch.click(1083,512,1)
                sleep(400)
                touch.click(939,469,1)
            end
            if(CmpColorEx("1172|636|FFFFFF,1199|667|4861ED,1146|650|4861ED",0.9) == 1) then
                sleep(100)
                touch.click(1179,640,1)
                sleep(360)
                touch.click(1179,640,1)
                exitflag=true
                break
            end
        end
        if(exitflag) then
            break
        end

        --切换右边
        sleep(600)
        touch.down(240,490,1)
        sleep(800)
        touch.up(1)
        touch.click(1133,390)
        sleep(200)
        --A接连招
        for i=1,3 do
            touch.click(1083,512,1)
            sleep(300)
        end
        touch.click(1133,390,1)
        sleep(450)
        if(CmpColorEx("967|488|DB62CB,959|458|B74490",0.8) == 1) then
            touch.click(939,469,1)
            sleep(180)
        end
    end
    while(true) do
        --防卡死
        if(CmpColorEx("1224|30|3948D8,1214|38|DCDAD9,1240|38|444BE4", 0.9) == 1) then
            break
        end
        sleep(100)
        if(CmpColorEx("1172|636|FFFFFF,1199|667|4861ED,1146|650|4861ED",1) == 1) then
            touch.click(1179,640,1)
            sleep(400)
            break
        end
        sleep(400)
        --防止拉入队伍
        if(CmpColorEx("568|492|D46E2A,1158|487|4762ED,322|480|D46E2A",0.9)==1) then
            touch.click(495, 498,1)
            logcat("自动拒绝组队")
            toast("自动拒绝组队")
            sleep(800)
        end

    end

end


function pgdp()
    while(true) do
        --防止拉入队伍
        if(CmpColorEx("568|492|D46E2A,1158|487|4762ED,322|480|D46E2A",0.9)==1) then
            touch.click(495, 498,1)
            logcat("自动拒绝组队")
            toast("自动拒绝组队")
            sleep(800)
        end
        --防止卡在结算界面
        if(CmpColorEx("1172|636|FFFFFF,1199|667|4861ED,1146|650|4861ED",0.9)==1) then
            touch.click(1179, 640 ,1)
            sleep(600)
            touch.click(1179, 640 ,1)
            sleep(400)
        end
        --参加战斗按钮
        if(CmpColorEx("1173|602|4762ED,1162|588|4762ED,1171|640|4762ED",0.9) == 1) then
            touch.click(1007, 604 ,1)
            sleep(500)
        end
        --等待进入 检测取消及确认按钮
        if(CmpColorEx("303|480|D46E2A,1158|478|4762ED,428|644|000000",0.9) == 1) then
            touch.click(1023,492 ,1)
            sleep(500)
            touch.click(1023,492 ,1)
        end
        sleep(100)
        if(CmpColorEx("1085|506|CE6259,1227|535|4850DD,1105|541|CE6259",0.9) == 1) then
            break
        end
    end
    sleep(3000)
    if(CmpColorEx("1133|394|4B55E4,1096|513|CE6259",0.9) == 1) then
        touch.click(1134,394)
        sleep(300)
    end
    exitflag=false
    while (true) do
        if(CmpColorEx("1224|30|3948D8,1214|38|DCDAD9,1240|38|444BE4", 0.9) == 1) then
            break
        end
        touch.down(1083,512,1)
        sleep(100)
        touch.up(1)
        sleep(100)
        touch.click(1083,512,1)
        sleep(100)
        touch.click(1083,512,1)
        sleep(100)
        touch.down(1222,543,1)
        sleep(400)
        touch.up(1)
        sleep(280)
        if(CmpColorEx("959|442|9A162F,922|462|310F00,950|484|EE396A",0.9) == 1) then
            touch.click(939,469,1)
            sleep(1000)
        end
        touch.click(1134,394,1)
        sleep(400)
        touch.click(1083,512,1)
        sleep(400)
        --等待
        --一技能
        if(CmpColorEx("967|488|DB62CB,959|458|B74490",0.8) == 1) then
            touch.click(939,469,1)
            sleep(400)
        end
        if(CmpColorEx("1172|636|FFFFFF,1199|667|4861ED,1146|650|4861ED",0.9) == 1) then
            sleep(100)
            touch.click(1179,640,1)
            sleep(360)
            touch.click(1179,640,1)
            break
        end
    end
    while (true) do
        --防止拉入队伍
        if(CmpColorEx("568|492|D46E2A,1158|487|4762ED,322|480|D46E2A",0.9) == 1) then
            touch.click(495,498,1)
            logcat("自动拒绝队伍")
            toast("自动拒绝队伍")
            sleep(800)
        end
        --防卡死
        if(CmpColorEx("1224|30|3948D8,1214|38|DCDAD9,1240|38|444BE4", 0.9) == 1) then
            break
        end
        sleep(100)
        if(CmpColorEx("1172|636|FFFFFF,1199|667|4861ED,1146|650|4861ED",1) == 1) then
            touch.click(1179,640,1)
            break
        end
        sleep(400)
    end
end


function dfdp()
    while (true) do
        --参加战斗按钮
        if(CmpColorEx("1173|602|4762ED,1162|588|4762ED,1171|640|4762ED",0.9) == 1) then
            touch.click(1007,604,1)
            sleep(500)
        end
        --防止拉入队伍
        if(CmpColorEx("568|492|D46E2A,1158|487|4762ED,322|480|D46E2A",0.9) ==1) then
            touch.click(495,498,1)
            logcat("自动拒绝队伍")
            toast("自动拒绝队伍")
            sleep(800)
        end
        --防止卡死在结算界面
        if(CmpColorEx("1172|636|FFFFFF,1199|667|4861ED,1146|650|4861ED",0.9) ==1) then
            touch.click(1179,640,1)
            sleep(600)
            touch.click(1179,640,1)
            sleep(400)
        end
        --等待进入   检测取消以及确认按钮
        if(CmpColorEx("303|480|D46E2A,1158|478|4762ED,428|644|000000",0.9) ==1) then
            touch.click(1023,492,1)
            sleep(500)
            touch.click(1023,492,1)
        end
        sleep(100)
        if(CmpColorEx("1085|506|CE6259,1227|535|4850DD,1105|541|CE6259",0.9) == 1) then
            break
        end
    end
	sleep(2400)
	touch.down(208,480,1)
	sleep(1800)
	touch.up(1)
	sleep(3000)
	while (true) do
		sleep(200)
		if(CmpColorEx("1172|636|FFFFFF,1199|667|4861ED,1146|650|4861ED",0.9) == 1) then
			sleep(100)
			touch.click(1179,640,1)
			sleep(360)
			touch.click(1179,640,1)
			break
		end
	end
	while (true) do
		if(CmpColorEx("568|492|D46E2A,1158|487|4762ED,322|480|D46E2A",0.9) == 1) then
            touch.click(495,498,1)
            logcat("自动拒绝队伍")
            toast("自动拒绝队伍")
            sleep(800)
		end
        if(CmpColorEx("1224|30|3948D8,1214|38|DCDAD9,1240|38|444BE4", 0.9) == 1) then
            break
        end
		sleep(100)
		if(CmpColorEx("1172|636|FFFFFF,1199|667|4861ED,1146|650|4861ED",1) == 1) then		
			touch.click(1179,640,1)
			sleep(100)
			break
		end
		sleep(200)
	end
end

--以下为地排UI

ui.newLayout("dipaiUI", 600, 600)
ui.setTitleText("dipaiUI", "地排设置界面")
ui.addTextView("dipaiUITEXT1","请换好要参加地排的角色并打开地排界面后启动")
ui.newRow("dipaiUI", ui.WRAP_CONTENT, ui.WRAP_CONTENT)
ui.addTextView("dipaiUITEXT2","请选择参加角色")
ui.addSpinner("dipaiUISpinner1",{"雅妮丝","炮改","掉分（全角色）"},1)
ui.newRow("dipaiUI", ui.WRAP_CONTENT, ui.WRAP_CONTENT)
ui.addTextView("dipaiUITEXT3","请输入设定次数，-10代表不限次数")
ui.addEditText("dipaiUITEXT4","-10")
ui.show("dipaiUI")
ui.updateResult("paozaoUI")
dpUI=ui.getData("paozaoUI")
chara=dpUI.dipaiUISpinner1
settimes=tonumber(dpUI.dipaiUITEXT4)
bar.cleanMsg()
bar.showMsg("角色："..chara.."\n余次："..settimes)
while(settimes~=0) do
    if(chara=="雅妮丝") then
        ynsdp()
    end
    if(chara=="炮改") then
        pgdp()
    end
    if(chara=="掉分（全角色）") then
        dfdp()
    end


    settimes=settimes-1
    bar.cleanMsg()
    bar.showMsg("当前模式：地排\n设定角色："..chara.."\n剩余次数："..settimes)
    logcat("设定剩余"..tostring(settimes).."次")
    toast("设定剩余"..tostring(settimes).."次")
end


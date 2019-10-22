
--require("checkstate")

--[[
while(true)do


logcat(((CmpColorXs({{x=941,y=198,c=0xFFFFFF,r=255,g=255,b=255},{x=941,y=188,c=0xFFFFFF,r=255,g=255,b=255},{x=941,y=179,c=0xFFFFFF,r=255,g=255,b=255},{x=951,y=188,c=0xFFFFFF,r=255,g=255,b=255},{x=933,y=188,c=0xFFFFFF,r=255,g=255,b=255}},1)==0))and(CheckMode()~=0)and(CmpColorXs({{x=622,y=419,c=0xFFFFFF,r=255,g=255,b=255},{x=642,y=420,c=0xFFFFFF,r=255,g=255,b=255},{x=660,y=418,c=0xFFFFFF,r=255,g=255,b=255}},1)==0))

pcall(CheckMove())

sleep(1000)


end
]]--



function Leavehome()
    RemoveNoti()
    sleep(500)
    touch.down(99,565,1)
    sleep(5000)
    intX=(-1)
    intX,intY=FindPic(947,466,1028,527,"zt_zdqr.png","000000",0,0.8)
    while(intX<0)do
        sleep(500)
        intX,intY=FindPic(947,466,1028,527,"zt_zdqr.png","000000",0,0.8)
    end
    sleep(500)
    touch.up(1)
    touch.click(intX,intY)
    sleep(3000)
    while(CheckMode()==0)do
        sleep(1000)
        toast("等待离开家中",900)
    end
    toast("已离开家")
    traceprint("已离开家")
    sleep(500)
    RemoveNoti()
end



function antihome()
    YanZhengMa()
	if((CheckPhone()==1)and(CheckMode()==0))then
        traceprint("已传送回家，开始重返")
        toast("已传送回家，开始重返")
        sleep(1500)
        Leavehome()
        sleep(500)
        for i=1,5 do
            touch.click(1200,80,1)
            sleep(500)
        end
		sleep(3000)
        touch.click(465,520,1)
        sleep(2000)
        touch.click(465,520,1)
        sleep(2000)
        touch.click(900,230,1)
        sleep(2000)
        touch.swipe(390,360,390,110,500)
        sleep(3000)
        touch.click(540,355,1)
        sleep(5000)
		

        tpend=false
        while (true) do
            toast("传送中",250)
            sleep(250)
            toast("传送中.",250)
            sleep(250)
            toast("传送中..",250)
            sleep(250)
            toast("传送中...",250)
            sleep(250)
            tpend=false
            if(((CmpColorXs({{x=941,y=198,c=0xFFFFFF,r=255,g=255,b=255},{x=941,y=188,c=0xFFFFFF,r=255,g=255,b=255},{x=941,y=179,c=0xFFFFFF,r=255,g=255,b=255},{x=951,y=188,c=0xFFFFFF,r=255,g=255,b=255},{x=933,y=188,c=0xFFFFFF,r=255,g=255,b=255}},1)==0))and(CheckMode()~=0)and(CmpColorXs({{x=622,y=419,c=0xFFFFFF,r=255,g=255,b=255},{x=642,y=420,c=0xFFFFFF,r=255,g=255,b=255},{x=660,y=418,c=0xFFFFFF,r=255,g=255,b=255}},1)==0))then
                sleep(5000)
                if(((CmpColorXs({{x=941,y=198,c=0xFFFFFF,r=255,g=255,b=255},{x=941,y=188,c=0xFFFFFF,r=255,g=255,b=255},{x=941,y=179,c=0xFFFFFF,r=255,g=255,b=255},{x=951,y=188,c=0xFFFFFF,r=255,g=255,b=255},{x=933,y=188,c=0xFFFFFF,r=255,g=255,b=255}},1)==0))and(CheckMode()~=0)and(CmpColorXs({{x=622,y=419,c=0xFFFFFF,r=255,g=255,b=255},{x=642,y=420,c=0xFFFFFF,r=255,g=255,b=255},{x=660,y=418,c=0xFFFFFF,r=255,g=255,b=255}},1)==0))then
                    tpend=true
                end
            end
            if(tpend==true)then
                break
            end
        end
		
		
		traceprint("已到达隐藏通道")
		toast("已到达隐藏通道")
        sleep(3000)
        if(CheckTeamBar()==1)then
            touch.click(70,170) --展开任务组队栏
        end
        for i=1,5 do
            touch.click(255,180,1)
            sleep(200)
        end
        sleep(3000)
        for i=1,3 do
            touch.click(870,600,1)
            sleep(200)
        end
        sleep(3000)
        intX=(-1)
        intX,intY=FindPic(944,559,1021,623,"zt_zdqr.png","000000",0,0.8)
        while(intX<0)do
            sleep(500)
            intX,intY=FindPic(944,559,1021,623,"zt_zdqr.png","000000",0,0.8)
        end
        sleep(1000)
        while(intX>=0)do
            touch.click(intX,intY,1)
            sleep(500)
            intX,intY=FindPic(944,559,1021,623,"zt_zdqr.png","000000",0,0.8)
        end
        sleep(2000)
        while((CheckMode()==0)and(CheckPhone()==0))do
            toast("等待刷新地图中",900)
            sleep(1000)
        end
        toast("已刷新")
        return true

    end
end





function annayctd()

    --[[
    if((CheckPhone()==1)and(CheckMode()==0))then
    traceprint("已传送回家，开始重返")
    toast("已传送回家，开始重返")
    Leavehome()
    for i=1,5 do
    touch.click(1200,80,1)
    sleep(500)
    end
    sleep(5000)
    touch.click(800,515,1)
    sleep(3000)
    ime.inputText("少年院", 50)
    sleep(500)
    touch.click(1165,35,1)
    sleep(1500)
    touch.click(1040,190,1)
    sleep(3000)
    while (true) do
    toast("传送中",250)
    sleep(250)
    toast("传送中.",250)
    sleep(250)
    toast("传送中..",250)
    sleep(250)
    toast("传送中...",250)
    sleep(250)
    tpend=false
    if((CmpColorXs({{x=941,y=198,c=0xFFFFFF,r=255,g=255,b=255},{x=941,y=188,c=0xFFFFFF,r=255,g=255,b=255},{x=941,y=179,c=0xFFFFFF,r=255,g=255,b=255},{x=951,y=188,c=0xFFFFFF,r=255,g=255,b=255},{x=933,y=188,c=0xFFFFFF,r=255,g=255,b=255}},1)==0)and(CheckMode()~=0)and(CmpColorXs({{x=622,y=419,c=0xFFFFFF,r=255,g=255,b=255},{x=642,y=420,c=0xFFFFFF,r=255,g=255,b=255},{x=660,y=418,c=0xFFFFFF,r=255,g=255,b=255}},1)==0))then
    sleep(5000)
    if((CmpColorXs({{x=941,y=198,c=0xFFFFFF,r=255,g=255,b=255},{x=941,y=188,c=0xFFFFFF,r=255,g=255,b=255},{x=941,y=179,c=0xFFFFFF,r=255,g=255,b=255},{x=951,y=188,c=0xFFFFFF,r=255,g=255,b=255},{x=933,y=188,c=0xFFFFFF,r=255,g=255,b=255}},1)==0)and(CheckMode()~=0)and(CmpColorXs({{x=622,y=419,c=0xFFFFFF,r=255,g=255,b=255},{x=642,y=420,c=0xFFFFFF,r=255,g=255,b=255},{x=660,y=418,c=0xFFFFFF,r=255,g=255,b=255}},1)==0))then
    tpend=true
    end
    end
    if(tpend==true)then
    break
    end
    if(CheckTeamBar()==1)then
    touch.click(70,170) --展开任务组队栏
    end
    for i=1,5 do
    touch.click(255,180,1)
    sleep(200)
    end
    sleep(3000)
    for i=1,3 do
    touch.click(870,600,1)
    sleep(200)
    end
    sleep(3000)
    intX=(-1)
    intX,intY=FindPic(944,559,1021,623,"zt_zdqr.png","000000",0,0.8)
    while(intX<0)do
    sleep(500)
    intX,intY=FindPic(944,559,1021,623,"zt_zdqr.png","000000",0,0.8)
    end
    sleep(1000)
    while(intX>=0)do
    touch.click(intX,intY,1)
    sleep(500)
    intX,intY=FindPic(944,559,1021,623,"zt_zdqr.png","000000",0,0.8)
    end
    sleep(2000)
    while((CheckMode()==0)and(CheckPhone()==0))do
    toast("等待刷新地图中",900)
    sleep(1000)
    end
    toast("已刷新")
    break

    end
    end
    ]]--
	YanZhengMa()
	
    antihome()
	
	YanZhengMa()
	
    traceprint("隐藏通道")
    for i=1,50 do --防止战斗模式不对
        YanZhengMa()
		if(CheckMode()==2)then
			break
		end
		touch.click(1225,190,1)
        sleep(800)
    end
    if(CheckTeamBar()==1)then
        touch.click(70,170) --展开任务组队栏
    end
	sleep(500)
    touch.click(590,630,1) --镜头重置
    touch.click(590,630,1) --镜头重置
    sleep(300)
    touch.click(1130,397,1) --闪避
    sleep(300)
    touch.click(1130,397,1) --闪避
    sleep(300)
    touch.down(189,475,1)
    sleep(3000)
    touch.up(1)
    touch.click(1130,397,1) --闪避
    sleep(300)
    touch.down(189,475,1)
    --sleep(800)


    sleep(1300)
    touch.up(1)
    touch.click(1130,397,1) --闪避
    sleep(300)
    touch.down(189,475,1)
    --sleep(1000)
    sleep(3000)
    touch.up(1)
    sleep(300)

    -------------------------转身---------
    touch.down(189,654,1)
    sleep(300)
    touch.up(1)
    touch.down(189,654,1)
    sleep(500)
    touch.up(1)
    sleep(50)
    touch.click(590,630,1) --镜头重置
    -------------------------转身---------

    sleep(300)
    for i=1,7 do
        touch.click(1241,511,1) --B
        sleep(200)
        touch.click(1241,511,1) --B
        sleep(200)
        touch.click(1060,535,1) --A
        sleep(200)
        touch.click(1060,535,1) --A
        sleep(200)
        touch.click(1060,535,1) --A
        sleep(200)
        if(CheckDrop()==2)then  --掉落检测
            traceprint("钩子掉落")
            touch.click(640,515,1)
            --CapScreen(nil,608,486,672,522) --截图方便核对
            touch.click(640,515,1)
            sleep(2000)
        else
            if(CheckDrop()==1)then
                traceprint("普通掉落")
                touch.click(640,515,1)
                --CapScreen(nil,608,486,672,522) --截图方便核对
                touch.click(640,515,1)
                sleep(2000)
            end
        end
        touch.click(1060,535,1) --A
        sleep(200)
        --[[
        touch.click(1060,535,1) --A
        sleep(300)
        ]]--
        touch.click(1241,511,1) --B
        sleep(200)
        touch.click(1241,511,1) --B
        sleep(200)
        touch.click(1241,511,1) --B
        if(CheckDrop()==2)then  --掉落检测
            traceprint("钩子掉落")
            touch.click(640,515,1)
            --CapScreen(nil,608,486,672,522) --截图方便核对
            touch.click(640,515,1)
            sleep(2000)
        else
            if(CheckDrop()==1)then
                traceprint("普通掉落")
                touch.click(640,515,1)
                --CapScreen(nil,608,486,672,522) --截图方便核对
                touch.click(640,515,1)
                sleep(2000)
            end
        end
    end
    sleep(1500)  --刷新前检测防止最后掉落不捡
    if(CheckDrop()==2)then  --掉落检测
        traceprint("钩子掉落")
        touch.click(640,515,1)
        --CapScreen(nil,608,486,672,522) --截图方便核对
        touch.click(640,515,1)
        sleep(2000)
    else
        if(CheckDrop()==1)then
            traceprint("普通掉落")
            touch.click(640,515,1)
            --CapScreen(nil,608,486,672,522) --截图方便核对
            touch.click(640,515,1)
            sleep(2000)
        end
    end
    if(CheckTeamBar()==1)then
        touch.click(70,170) --展开任务组队栏
    end
    for i=1,5 do
        touch.click(255,180,1)
        sleep(200)
    end
    sleep(3000)
    for i=1,3 do
        touch.click(870,600,1)
        sleep(200)
    end
    sleep(3000)
    intX=(-1)
    intX,intY=FindPic(944,559,1021,623,"zt_zdqr.png","000000",0,0.8)
	for i=1,100 do
        sleep(500)
		if(YanZhengMa()==true) then
			break
		end
        intX,intY=FindPic(944,559,1021,623,"zt_zdqr.png","000000",0,0.8)
		if(intX>=0)then
			break
		end
    end
    sleep(1000)
    while(intX>=0)do
        touch.click(intX,intY,1)
        sleep(500)
        intX,intY=FindPic(944,559,1021,623,"zt_zdqr.png","000000",0,0.8)
    end
    sleep(3000)
    while((CheckMode()==0)and(CheckPhone()==0))do
        sleep(1000)
        toast("等待刷新地图中",900)



        antihome()


    end
    toast("已刷新")

end


sleep(1000)
while (true)do




    for t0=1,100 do
        annayctd()
		YanZhengMa()
    end

    --antitp()

end

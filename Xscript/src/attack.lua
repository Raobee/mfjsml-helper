--[[
不会误触坐标：
A
1070,572
B
1235,560
S
1130,397
B1
900,470
B2
960,615
B3
840,610
视角
590,630
镜头
700,630
END
1200,670
]]--


function attack(chara)

    if(chara=="欧莉安娜")then
        for i=1,2 do


                touch.click(1070,572,1) --A
                sleep(100)
                touch.click(1235,560,1) --B
                sleep(500)
                touch.click(1070,572,1) --A
                sleep(100)
                touch.click(1235,560,1) --B
                sleep(500)
				touch.click(1235,560,1) --B
                sleep(100)
				
                touch.click(1070,572,1) --A
                sleep(100)
                touch.click(1235,560,1) --B
                sleep(300)
                touch.click(1235,560,1) --B
                sleep(100)
                touch.click(1235,560,1) --B
                sleep(100)
                touch.click(960,615,1) --B2

            --[[
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
            touch.click(1241,511,1)
            sleep(500)
            touch.click(1130,397,1) --闪避
            ]]--


        end
        if(CmpColorXs({{x=939, y=618, c=0xF4F4DB, r=244, g=244, b=219},{x=944, y=590, c=0xE7D68C, r=231, g=214, b=140},{x=964, y=585, c=0x160E00, r=22, g=14, b=0},{x=969, y=644, c=0x9E4412, r=158, g=68, b=18}},0.9) == 1) then
            sleep(150)
            touch.click(960,615)
            sleep(200)
        end
        touch.click(1130,397,1) --闪避
        sleep(300)
    end

    if(chara=="食蜂操祈")then
        for i=1,5 do
            touch.click(1060,535,1) --A
            sleep(150)
            touch.click(1060,535,1) --A
            sleep(150)
            touch.click(1060,535,1) --A
            sleep(150)
            touch.click(1060,535,1) --A
            sleep(150)
            touch.click(1060,535,1) --A
            sleep(100)
            touch.click(840,610) --B1
            sleep(100)


        end


        if(CmpColorXs({{x=23,y=391,c=0x2F4860,r=47,g=72,b=96},{x=29,y=397,c=0x2F4860,r=47,g=72,b=96},{x=35,y=404,c=0x2F4860,r=47,g=72,b=96}},1)==1)then
            touch.down(189,654,2)
            sleep(500)
            touch.down(1130,397,1)--闪避
			sleep(50)
			touch.up(1)
            sleep(500)
            touch.up(2)
        else
            touch.click(1130,397,1) --闪避
			touch.click(1130,397,1) --闪避
        end

    end
end




--泡澡.lua    [作者：绢旗最爱]

charamale={"奥雷欧斯","滨面仕上","滨面仕上圣诞","海原光贵","后方之水","警备机器人","警备员","蒙面混混","冥土追魂","上条当麻","史提尔","土御门元春","亚特鲁","一方通行","一方通行改","一方通行黑翼","右方之火","垣根帝督"}
charafemale={"白井黑子","风斩冰华","芙兰达","芙兰达圣诞","婚后光子","结标淡希","绢旗最爱","绢旗最爱圣诞","铃科百合子","麦野沈利","麦野沈利圣诞","米夏","鸣护艾丽莎","木山春生","欧莉安娜","莎特奥拉","神裂火织","食蜂操祈","食蜂操祈兔女郎","五和","雪泉","雅绯","雅妮丝","茵蒂克丝","茵蒂克丝偶像","幼年白井黑子","御坂美琴","御坂美琴警长","御坂美琴Lv5.1","御坂妹妹","御坂妹妹水枪版","真宫寺樱"}
chaCHN2ENG=json.decode("{\"奥雷欧斯\":\"alos\",\"滨面仕上\":\"bmss\",\"滨面仕上圣诞\":\"bmsssd\",\"海原光贵\":\"hygg\",\"后方之水\":\"hfzs\",\"警备机器人\":\"jbjqr\",\"警备员\":\"jby\",\"蒙面混混\":\"mmhh\",\"冥土追魂\":\"mtzh\",\"上条当麻\":\"stdm\",\"史提尔\":\"ste\",\"土御门元春\":\"tymyc\",\"亚特鲁\":\"ytl\",\"一方通行\":\"yftx\",\"一方通行改\":\"yftxg\",\"一方通行黑翼\":\"yftxhy\",\"右方之火\":\"yfzh\",\"垣根帝督\":\"ygdd\",\"白井黑子\":\"bjhz\",\"风斩冰华\":\"fzbh\",\"芙兰达\":\"fld\",\"芙兰达圣诞\":\"fldsd\",\"婚后光子\":\"hhgz\",\"结标淡希\":\"jbdx\",\"绢旗最爱\":\"jqza\",\"绢旗最爱圣诞\":\"jqzasd\",\"铃科百合子\":\"lkbhz\",\"麦野沈利\":\"mysl\",\"麦野沈利圣诞\":\"myslsd\",\"米夏\":\"mx\",\"鸣护艾丽莎\":\"mhals\",\"木山春生\":\"mscs\",\"欧莉安娜\":\"olan\",\"莎特奥拉\":\"stal\",\"神裂火织\":\"slhz\",\"食蜂操祈\":\"sfcq\",\"食蜂操祈兔女郎\":\"sfcqtnl\",\"五和\":\"wh\",\"雪泉\":\"xq\",\"雅绯\":\"yf\",\"雅妮丝\":\"yns\",\"茵蒂克丝\":\"ydks\",\"茵蒂克丝偶像\":\"ydksox\",\"幼年白井黑子\":\"ynbjhz\",\"御坂美琴\":\"ybmq\",\"御坂美琴警长\":\"ybmqjz\",\"御坂美琴Lv5.1\":\"ybmqLv5.1\",\"御坂妹妹\":\"ybmm\",\"御坂妹妹水枪版\":\"ybmmsqb\",\"真宫寺樱\":\"zgsy\"}")

function pz(sex,chara,typ)
	RemoveNoti()
	touch.click(1080,555,1) --互动按钮
    sleep(3000)
	if(sex=="男") then
		touch.click(1100, 360,1)
		sleep(50)
		touch.click(1100, 360,1)
	end
	if(sex=="女") then
		touch.click(1100, 430,1)
		sleep(50)
		touch.click(1100, 430,1)
	end
	sleep(5000)
	intX=-1
	while(intX<0)do
		intX,intY=FindPic(944,556,1173,626,"zt_zdqr.png","000000",0,0.8)
		sleep(100)
	end
	logcat(intX,intY)
	touch.click(intX,intY,1)
	sleep(3000)
    touch.click(1080,555,1) --互动按钮
    sleep(3500)
    touch.click(1100,360,1) --泡澡按钮
    sleep(50)
    touch.click(1100,360,1) --泡澡按钮
    sleep(5000)
    touch.click(925,330,1) --入浴剂按钮
    sleep(1500)
	if(typ=="无机盐经验") then
		touch.click(1040, 230,1)
	end
	if(typ=="碳酸生命") then
		touch.click(1200, 230,1)
	end
	if(typ=="清凉攻击") then
		touch.click(1040, 370,1)
	end
	if(typ=="护肤防御") then
		touch.click(1200, 370,1)
	end
	if(typ=="酵素经验加成") then
		touch.click(1040, 510,1)
	end
	if(typ=="生药移速") then
		touch.click(1200, 510,1)
	end
	sleep(1500)
	touch.click(800,460,1)
	sleep(2000)
	touch.click(925, 200,1)
	sleep(1500)
	i=0
	t=0
	while(t<=15) do
		i=0
		while(i<=10) do
			sleep(50)
			intX, intY=FindPic(960, 160, 1100, 700, "zt_"..chaCHN2ENG[chara]..".png", "000000", 0, 1-i/30)
			logcat("1"..i)
			if(intX>0) then
				touch.click(intX+100,intY+20,1)
				logcat("2"..i)
				sleep(1500)
				break
			end
			i=i+1
		end
		if(i<10) then
			logcat("3"..i)
			break
		end
		logcat("4"..i)
		touch.swipe(1100, 600, 1100, 450,300)
        sleep(2000)
		t=t+1
	end
	if(t>=15) then
		logcat("未找到指定角色，已退出")
		toast("未找到指定角色，已退出")
		touch.click(1235,40,1) --退出按钮
		sleep(2000)
		intX=-1
		while(intX<0)do
			intX,intY=FindPic(944,556,1173,626,"zt_zdqr.png","000000",0,0.8)
			sleep(100)
		end
	logcat(intX,intY)
	touch.click(intX,intY,1)
		exit()
	end
	touch.click(100,600) --入场
	sleep(15000)
	touch.down((189+87*math.sin(315*3.14/180)),(565-87*math.cos(315*3.14/180)),1)
	sleep(3500)
	touch.up(1,1,1)
	sleep(500)
	touch.click(1080,520) --坐下
	Time=net.time()  
	while(math.mod(Time,900)>=20) do
		sleep(4000)
        if(CmpColorEx("1222|645|ECECEC,1229|641|ECECEC",0.8) == 1) then
            while(CmpColorEx("18|186|FFFFFF,57|182|FFFFFF,116|185|FFFFFF",0.8) ==1) do
                touch.click(890,620,1) --捡肥皂按钮
                sleep(300)
                Time=net.time()  
                if (math.mod(Time,900)>840) then 
                    break
                end
            end
        end
        if (CmpColorEx("1222|645|ECECEC,1229|641|ECECEC",0.8)~=1) then
            sleep(5000)
            if ((CmpColorEx("1222|645|ECECEC,1229|641|ECECEC",0.8)~=1)and(CheckPhone()==1) ) then 
                logcat("flagexit")
                break
            end
        end
        Time=net.time()  
		
	end
	

	
end

function paozaobut(typ)
	if(typ==1) then
		ui.updateResult()  
		ui.saveProfile()
		toast("保存成功！")
	end
	if(typ==2) then
		ui.loadProfile()
		toast("加载成功！")
	end
	
end


--[[
--以下为泡澡界面布局
ui.newLayout("paozaoUI", 600, 600)
ui.setTitleText("paozaoUI", "泡澡设置界面")
ui.addTextView("paozaoUITEXT1", "泡澡设置界面")
ui.newRow("paozaoUI", ui.WRAP_CONTENT, ui.WRAP_CONTENT)  
ui.addTextView("paozaoUITEXT2", "配置文件")
ui.addButton("paozaoUIBUT1","保存设置",100,40)
ui.addButton("paozaoUIBUT2","加载已保存设置",100,40)
ui.setOnClick("paozaoUIBUT1","paozaobut(1)")
ui.setOnClick("paozaoUIBUT2","paozaobut(2)")
ui.newRow("paozaoUI", ui.WRAP_CONTENT, ui.WRAP_CONTENT)  
ui.addTextView("paozaoUITEXT3", "选择角色性别")
ui.addRadioGroup("paozaoUIsex", {"男","女"}, 2, ui.WRAP_CONTENT, ui.WRAP_CONTENT) 
ui.newRow("paozaoUI", ui.WRAP_CONTENT, ui.WRAP_CONTENT)  
ui.addTextView("paozaoUITEXT4", "选择角色")
ui.addSpinner("paozaoUIspinner1", charamale, 1, ui.WRAP_CONTENT, ui.WRAP_CONTENT) 
ui.addSpinner("paozaoUIspinner2", charafemale, 1, ui.WRAP_CONTENT, ui.WRAP_CONTENT)  
ui.addTextView("paozaoUITEXT5","选择入浴剂")
ui.addSpinner("paozaoUIspinner3", {"无机盐经验","碳酸生命","清凉攻击","护肤防御","酵素经验加成","生药移速"}, 1, ui.WRAP_CONTENT, ui.WRAP_CONTENT)  
ui.newRow("paozaoUI", ui.WRAP_CONTENT, ui.WRAP_CONTENT)  
ui.addTextView("paozaoUITEXT6","输入泡澡次数")
ui.addEditText("paozaoUITEXT7","1",100,30)
ui.show("paozaoUI")
ui.updateResult("paozaoUI")
pzUI=ui.getData("paozaoUI")  
sex=pzUI.paozaoUIsex
if(sex=="男") then
choosechara=pzUI.paozaoUIspinner1
end
if(sex=="女") then
choosechara=pzUI.paozaoUIspinner2
end
ryj=pzUI.paozaoUIspinner3
settimes=pzUI.paozaoUITEXT7
]]--

sex=vars[3]
choosechara=vars[4]
ryj=vars[5]
settimes=vars[6]
logcat(sex)
logcat(choosechara)
logcat(ryj)
logcat(settimes)
logcat(chaCHN2ENG[choosechara])

while (settimes>0)or(settimes<=-10) do
	pz(sex,choosechara,ryj)
    settimes=settimes-1
    toast("已退出\n设定剩余"..settimes.."次")
	logcat("已退出\n设定剩余"..settimes.."次")
	sleep(10000) --延迟五秒防止过早开始下一轮
end




--Checkstate.lua 检查状态库

--CheckPhone 无参数，如检测到手机图标返回1，若未检测到返回0
function CheckPhone()
	tmp1,tmp2=FindPic(1191, 331, 1264, 435, "Phone.png", "000000", 0, 0.7, intX, intY)
	if(tmp1>=0) then
		return 1
	else
		return 0
	end
end

--CheckMode 无参数，检测右侧战斗状态，未检测到返回0，智能返回1，战斗返回2，和平返回3
function CheckMode()
	tmp1,tmp2=FindPic(1197, 167, 1259, 214, "state_auto.png", "000000", 0, 0.8, intX, intY)
	if(tmp1>=0) then
		return 1
	else 
		tmp1,tmp2=FindPic(1197, 167, 1259, 214, "state_fight.png", "000000", 0, 0.8, intX, intY)
		if(tmp1>=0) then
			return 2
		else 
			tmp1,tmp2=FindPic(1197, 167, 1259, 214, "state_peace.png", "000000", 0, 0.8, intX, intY)
			if(tmp1>=0) then
				return 3
			else 
				return 0
			end
		end
	end
end

--CheckMove 无参数，检测”正在移动中“的提示，实际为检测其中剩余距离的“米”字，在移动返回1，否则返回0
function CheckMove()
	return CmpColorEx("933|174|FFFFFF,941|174|FFFFFF,941|165|FFFFFF", 1)
end

--CheckPause 无参数，检测关卡中右上方暂停按钮，有返回1，无返回0
function CheckPause()
	return CmpColorEx("1235|44|D16F65,1235|48|D16F65,1242|50|D06A61,1242|45|D06A61",0.9)
end

--CheckLock 无参数，检测镜头锁定颜色，未锁定返回0，有锁定返回1
function CheckLock()
	return CmpColorXs({{x=661,y=627,c=0xE7D476,r=231,g=212,b=118},{x=662,y=616,c=0xE2CB58,r=226,g=203,b=88},{x=717,y=620,c=0xD7B731,r=215,g=183,b=49}},0.9)
end

--CheckEnd 无参数，检测副本结束按钮，有返回1，无返回0
function CheckEnd()
	return CmpColorEx("1179|635|FFFFFF,1144|610|4861ED,1220|629|4861ED",1)
end

--CheckDrop 无参数，检测地上掉落物，有拾取器返回2，有拾取返回1，无返回0
function CheckDrop()
	atemp=0
	if(CmpColorXs({{x=641,y=538,c=0xFBF9F1,r=251,g=249,b=241},{x=623,y=537,c=0xFCFBEF,r=252,g=251,b=239},{x=658,y=537,c=0xF9F9DF,r=249,g=249,b=223}}, 0.95)==1)then
		atemp=2
	end
	if(CmpColorXs({{x=625,y=515,c=0xFBF9F1,r=251,g=249,b=241},{x=643,y=510,c=0xFCF9F2,r=252,g=249,b=242},{x=644,y=523,c=0xFBF9F1,r=251,g=249,b=241},{x=655,y=507,c=0xFEF9F1,r=254,g=249,b=241}}, 0.95)==1)then
		atemp=1
	end
	return atemp
end

--CheckTeamBar 无参数，检测任务组队栏是否收起，有返回1，无返回0
function CheckTeamBar()
	return CmpColorXs({{x=68,y=164,c=0x5962CE,r=89,g=98,b=206},{x=67,y=174,c=0x5962CE,r=89,g=98,b=206},{x=76,y=169,c=0x5962CE,r=89,g=98,b=206}},1)
end

--CheckGet 无参数，检测过关后掉落物品质，检测失败返回0，白返回1，绿返回2，蓝返回3，紫返回4，金返回5
function CheckGet() 
	atemp=0
	if(CmpColorXs({{x=993,y=535,c=0xF67EEF,r=178,g=174,b=178}},0.9)==1)then 
		atemp=1
	else
		if(CmpColorXs({{x=993,y=535,c=0xF67EEF,r=99,g=205,b=176}},0.9)==1)then
			atemp=2
		else
			if(CmpColorXs({{x=993,y=535,c=0xF67EEF,r=94,g=155,b=212}},0.9)==1)then
				atemp=3
			else
				if(CmpColorXs({{x=993,y=535,c=0xF67EEF,r=246,g=126,b=239}},0.9)==1)then
					atemp=4
				else
					if(CmpColorXs({{x=993,y=535,c=0xF67EEF,r=205,g=192,b=85}},0.9)==1)then
						atemp=5
					else
						atemp=0
					end
				end
			end
		end
	end
	return atemp
end
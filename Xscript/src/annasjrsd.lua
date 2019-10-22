
--安娜石巨人上达.lua    [作者：绢旗最爱]











    settimes=-10

--[[
	toast("设定"..settimes.."次")
	logcat("设定"..settimes.."次")--]]
	
	
	while (settimes>0)or(settimes<=-10) do
		annasjrsd()
        settimes=settimes-1
        toast("已退出\n设定剩余"..settimes.."次")
		logcat("已退出\n设定剩余"..settimes.."次")
    end
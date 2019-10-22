
--publicvars.lua 统一定义全局变量


libcurl=require("com.xplugin.libcurl") --curl库实现网络通讯
libpic=require("com.xplugin.libpic") --pic库实现部分图片功能
libjni=require("com_helper_mfjsml_jni") --C/C++支持库，实现部分lua难以做到高级功能
liblf=require("localfun") --本地主要函数库
libcst=require("checkstate") --检查状态函数库


updateManager = require("update_manager") --检测更新插件

--定义全局变量
link=Einfo("1") --从加密库中获取服务器链接
scriptstarttime=os.date("%Y%m%d%H%M%S",net.time())  --脚本启动时间
isYanZhengMa=thread.newGlobalVar("isYanZhengMa")
isYanZhengMa.Main=false
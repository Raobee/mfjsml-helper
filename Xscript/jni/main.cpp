
#include <xscript.h>
#include <string.h>
#include <stdlib.h>







/*
关于encryptinfo序号代表内容
1.服务器IP
*/

static int encryptinfo(lua_State* L)
{
	const char* infoname = luaL_checkstring(L, 1);
	const char* info=(char*)malloc((256)*(sizeof(char)));
	switch (infoname[0])
	{
		case '1':info="132.232.28.134";break;
		
	}
	lua_pushstring(L, info);
	return 1;
}

static int CXorencrypt(lua_State* L)
{
    const char* source = luaL_checkstring(L, 1);
	const char* pass = luaL_checkstring(L, 2);
	int source_length = luaL_checkint(L, 3);
    int pass_length = luaL_checkint(L, 4);
    char* tmp_str = (char*)malloc((source_length + 1) * sizeof(char));
    memset(tmp_str, 0, source_length + 1);
    for(int i = 0; i < source_length; ++i)
    {
        tmp_str[i] = source[i]^pass[i%pass_length];
        if(tmp_str[i] == 0)              // 要考虑到XOR等于0的情况，如果等于0，就相当
        {                                // 于字符串就提前结束了， 这是不可以的。
            tmp_str[i] = source[i];      // 因此tmp_str[i]等于0的时候，保持原文不变
        }
    }
    tmp_str[source_length] = 0;
	lua_pushstring(L, tmp_str);
    return 1;
}

extern "C" int luaopen_com_helper_mfjsml_jni(lua_State* L) {
	lua_register(L, "CXor", &CXorencrypt);
	lua_register(L, "Einfo", &encryptinfo);
    return 1;
}

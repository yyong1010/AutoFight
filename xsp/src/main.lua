--[[
源代码声明：

作者对于代码中除Badboy开源库和CHLINXXOO提供的开发框架以外保有知识产权。
因使用该示例所产生的损失和纠纷，作者不负有任何责任。
请在分发和传播该代码时保留该声明。

--作者：yyong
--联系方式：QQ：13632124
]]--

function main()
  print("hello")
  require "util"--加载工具
  require "SettingACheck"--加载全局设置
  init("0", 1)--初始化触摸操控脚本
  start,setting = showUI("ui.json")--显示UI并获取设置
  
  
  if start == 0 or setting["BasicFunction"] == "" then
    printFunction("取消执行")
    lua_exit()--取消则退出
  end
  
  if start == 1 then
    printFunction("start over:"..setting["WakenFunction"])
    printFunction("WakenType:"..setting["WakenType"])
    printFunction("YuhunFunction:"..setting["YuhunFunction"])
    printFunction("JieJieFunction:"..setting["JieJieFunction"])
    printFunction("DiscoverFunction:"..setting["DiscoverFunction"])
    require "Init"--参数初始化
    require "fight"
    require "juexing"
    require "yuhun"
    require "jiejietupo"
    require "discover"
    require "seal"
    s(2000)
    
    
    if setting["WakenFunction"] == "0" then
      juexingdefault()      
			s(15*1000)
    end
    
    if setting["YuhunFunction"] == "0" then
      yuhundefault()
			s(15*1000)
    end
    
    if setting["JieJieFunction"] == "0" then
      jiejiedefault()
			s(15*1000)
    end
    
    if setting["DiscoverFunction"] == "0" then
      discover()
			s(15*1000)
    end
    
    if setting["SealFunction"] == "0" then
      sealDefault()
			s(15*1000)
		end
  end
end

-- lua异常捕捉
function error(msg)
  local errorMsg = "[Lua error]"..msg
  printFunction(errorMsg)    
end

--退出时隐藏HUD
function beforeUserExit()
  hideHUD(runing)
  hideHUD(troopsDonated)
end

xpcall(main, error)
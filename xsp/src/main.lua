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
  if (_OS == 1) then --安卓
    start,setting = showUI("ui.json")--显示UI并获取设置
  	_orientation = setting["orientation"] == "0" and 2 or 1
  	init("0", _orientation)--初始化触摸操控脚本
  else  --iOS
    init("0", 1)--初始化触摸操控脚本
    start,setting = showUI("ui.json")--显示UI并获取设置
  end

  if start == 0 then
    printFunction("取消执行")
    lua_exit()--取消则退出
  end

  if start == 1 then
    require "Init"--参数初始化
    require "fight"
    require "juexing"
    require "yuhun"
    require "jiejietupo"
    require "discover"
    require "seal"
    require "seal2"
    require "shiju"
    require "teamWork"
    require "groupjiejie"
    require "test"
    require "screen"
    require "teamdiscoverpara"
    printTable(setting)
    ss(2*1000)

    --test()
    --changeSS()
    --voidRed(1202,1402)
    --swipRight(349,918,1150)
    --tap(833,805)
    --checkinvite()

    if setting["AutoDayWork"] == "0" then
      setting["WakenFunction"] = "0"
      setting["YuhunFunction"] = "0"
      setting["JieJieFunction"] = "0"
      setting["DiscoverFunction"] = "0"
      setting["SealFunction"] = 1
      setting["ShijuFunction"] = 1
      setting["wakenTimes"] = 3
      setting["isWakenSolo"] = 1
      setting["yuhunTimes"]	=	3
      setting["isYuhunSolo"] = 1
      setting["discoverTimes"] = 3
      setting["onlyExp"] = 1
      setting["jiejieTimes"] = 3
      setting["groupJieJie"] = 1
    end

    if setting["waitFriendInvite"] == "0" then
			_waitSecs = tonumber(setting["waitSecs"]) < 0 and 31536000 or tonumber(setting["waitSecs"])
      jointeamWork()
      lua_exit()
    end

    --组队探索队员
    if setting["teamDiscover"] == "0" and string.find(setting["teamDiscoverRole"], "1", 1) then
      _waitSecs = tonumber(setting["waitSecs"]) < 0 and 31536000 or tonumber(setting["waitSecs"])
      jointeamDiscover()
      lua_exit()
    end

    --组队探索队长
    if setting["teamDiscover"] == "0" and string.find(setting["teamDiscoverRole"], "0", 1) then
      discover()
      lua_exit()
    end

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

    if setting["groupJieJie"] == "0" then
      groupjiejiedefault()
      s(15*1000)
    end

    if setting["SealFunction"] == "0" then
      sealDefault()
      s(15*1000)
    end

    if setting["ShijuFunction"] == "0" then
      shijuDefault()
      s(15*1000)
    end

    if setting["AutoLockSreen"] == "0" then
      flag = appIsRunning("com.netease.onmyoji");
      if flag == 1 then
        closeApp("com.netease.onmyoji")
      end
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
end

--xpcall(main, error)
pcall(main, error)

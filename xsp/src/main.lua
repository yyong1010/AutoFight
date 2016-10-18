--[[
源代码开放声明：

		本代码示例仅供叉叉助手脚本开发学习使用，上架脚本不得直接复制本示例中的代码。
		作者对于代码中除Badboy开源库和CHLINXXOO提供的开发框架以外保有知识产权。
		因使用该示例所产生的损失和纠纷，作者不负有任何责任。
		请在分发和传播该代码时保留该声明。
		
		--作者：伊莉丝
		--联系方式：QQ：785550927
]]--

function main()
	print("hello")
  require "util"--加载工具
  require "SettingACheck"--加载全局设置
  init("0", _orientation)--初始化触摸操控脚本
  start,setting = showUI("ui.json")--显示UI并获取设置
	

  if start == 0 or setting["BasicFunction"] == "" then
    printFunction("取消执行")
    lua_exit()--取消则退出
  end
  
  if start == 1 then
		printFunction("start over")
    require "Init"--参数初始化
    --require "Production"--加载生产方法
    --require "FindMsg"--加载寻找消息的方法
    --require "Collection"--加载收集的方法
		require "juexing"
		
		
		if string.find(setting["BasicFunction"], "0", 1) then
			juexingdefault()
			--selectWakenType()
		end
   
		
		--[[
    if setting["Limit"] == "0" then
      Max = 5
    elseif setting["Limit"] == "1" then
      Max = 6
    elseif setting["Limit"] == "2" then
      Max = 8
    end
    
    if string.find(setting["BasicFunction"], "0", 1) or string.find(setting["BasicFunction"], "2", 1) then
      availableCheck()
    end
    
    if string.find(setting["BasicFunction"], "2", 1) then--当选择了制造方法时执行
      Barbarian = tonumber(setting["Barbarian"])
      Archer = tonumber(setting["Archer"])
      Giant = tonumber(setting["Giant"])
      Goblin = tonumber(setting["Goblin"])
      WallBreaker = tonumber(setting["WallBreaker"])
      Balloon = tonumber(setting["Balloon"])
      Wizard = tonumber(setting["Wizard"])
      Healer = tonumber(setting["Healer"])
      Dragon = tonumber(setting["Dragon"])
      PEKKA = tonumber(setting["PEKKA"])
      Minion = tonumber(setting["Minion"])
      HogRider = tonumber(setting["HogRider"])
      Valkyrie = tonumber(setting["Valkyrie"])
      Golem = tonumber(setting["Golem"])
      Witch = tonumber(setting["Witch"])
      LavaHound = tonumber(setting["LavaHound"])
      LightningSpell = tonumber(setting["LightningSpell"])
      HealingSpell = tonumber(setting["HealingSpell"])
      RageSpell = tonumber(setting["RageSpell"])
      JumpSpell = tonumber(setting["JumpSpell"])
      FreezeSpell = tonumber(setting["FreezeSpell"])
      PosionSpell = tonumber(setting["PosionSpell"])
      EarthquakeSpell = tonumber(setting["EarthquakeSpell"])
      HasteSpell = tonumber(setting["HasteSpell"])
      s()
      producting()--进行生产
    end
    
    while string.find(setting["BasicFunction"], "0", 1) do
      require "Donate" --加载增援的方法
      HaveMsg = true
      while (HaveMsg) do
        FindDonateMsg()--寻找增援信息
        if (HaveMsg) then
          donateDefault()--默认增援方式，胖子，法师，弓箭，毒药
        end
        tap(1740,120)
        while (true) do	
          local xMW, yMW = findImageInRegionFuzzy("MsgWindow_InfoIcon.png", 90, 625, 100, 690, 170, 0xffffff)
          if xMW == -1 and yMW == -1 then
            break
          else
            tap(765,470)--关闭信息窗口
          end
        end
        ss()
        --已完成的制造模块，包括无需求跳过，每生产一次换一个营(基础分工实现，特殊情况单独处理)
        producting()--进行行一次生产
      end
      newMsg()--等待新消息
    end
    
    local count = 1
    
    while not string.find(setting["BasicFunction"], "0", 1) and string.find(setting["BasicFunction"], "1", 1) do
      --循环计数，每5min执行一次收集
      if count == 1 then
        collect()
      end
      if count >= (tonumber(setting["Interval"])/2) then
        count = 1
      end
      count = count + 1
      --检查是否有新消息
      s(2000)--降低频率
      tap(765,470);tap(1740,120)--保持在线并维持默认状态
    end
		]]--
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
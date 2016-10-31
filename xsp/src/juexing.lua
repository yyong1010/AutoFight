function juexingdefault()
  
  local fighttimes = 0
  local wakenTimes = setting["wakenTimes"]
  
  local xPS, yPS = findImageInRegionFuzzy("juexing.png", 90, 80, 970, 210, 1048, 0xffffff)--可以捐毒药法术
  --local xES, yES = findImageInRegionFuzzy("D_EarthquakeSpell.png", 90, 780, 550, 1200, 850, 0xffffff)--可以捐地震法术
  --local xHS, yHS = findImageInRegionFuzzy("D_HasteSpell.png", 90, 780, 550, 1200, 850, 0xffffff)--可以急速药法术
  printFunction("x:"..xPS.."y:"..yPS)
  if xPS ~= -1 and yPS ~= -1 then
    tap(xPS,yPS+25)--点击觉醒
    printFunction("--点击觉醒")
    s(5*1000)
    
    selectWakenType()
    
    tap(976,809)--点击组队
    printFunction("--点击组队")
    s(5*1000)
    tap(1580,906)--点击创建队伍
    printFunction("--点击创建队伍")
    s(2*1000)
    
    tap(1313,850)--点击创建
    printFunction("--点击创建")
    s(1000)
    
    while(fighttimes < tonumber(wakenTimes)) do
			showHUD(runing,"working on waken "..fighttimes,16,"0xffffffff","0x4c000000",0,1300,38,200,50)
      checkTeamReady()--检查队伍是否到齐
      tap(1449,914)-- 开始战斗
      printFunction("--点击开始战斗")
      ss()
      checkFightisOver()--检查战斗是否结束
			fighttimes = fighttimes + 1
			if fighttimes < tonumber(wakenTimes) then
				askagain(1)
      else
				askagain(0)
			end 
    end    
  end 
end

function selectWakenType()
  local wakenType = setting["WakenType"]
  if wakenType == "0" then		
    tap(42,532)
    printFunction("--火觉醒")   
  elseif wakenType =="1" then
    printFunction("--风觉醒")
  elseif wakenType =="2" then
    tap(1874,534)
    printFunction("--水觉醒")
  elseif wakenType =="3" then
      tap(1874,534)
    ss(1000)
    tap(1874,534)
    printFunction("--雷觉醒")
  end
  ss(1000)
  tap(849,482)--点击觉醒类型
  printFunction("--点击觉醒类型")
  ss(2*1000)
end



function juexingdefault()
  local runAble = true
  local TeamReady, WdonateAble, AdonateAble = false, true, true
  local fighttimes = 1
  
  showHUD(runing,"working on waken",16,"0xffffffff","0x4c000000",0,1300,38,200,50)
  
  local xPS, yPS = findImageInRegionFuzzy("juexing.png", 90, 80, 970, 210, 1048, 0xffffff)--可以捐毒药法术
  --local xES, yES = findImageInRegionFuzzy("D_EarthquakeSpell.png", 90, 780, 550, 1200, 850, 0xffffff)--可以捐地震法术
  --local xHS, yHS = findImageInRegionFuzzy("D_HasteSpell.png", 90, 780, 550, 1200, 850, 0xffffff)--可以急速药法术
  printFunction("x:"..xPS.."y:"..yPS)
  if xPS ~= -1 and yPS ~= -1 then
    tap(xPS,yPS+25)--点击觉醒
    printFunction("--点击觉醒")
    s(1000)
    tap(849,482)--点击觉醒类型
    printFunction("--点击觉醒类型")
    s(2*1000)
    tap(976,809)--点击组队
    printFunction("--点击组队")
    s(2*1000)
    tap(1580,906)--点击创建队伍
    printFunction("--点击创建队伍")
    s(2*1000)
    tap(1313,850)--点击创建
    printFunction("--点击创建")
    s(1000)
    checkTeamReady()--检查队伍是否到齐
    
    tap(1449,914)-- 开始战斗
    printFunction("--点击开始战斗")
    ss()
    
    checkFightisOver()--检查战斗是否结束
    
    askagain()
    
    while(fighttimes < 10) do
      checkTeamReady()--检查队伍是否到齐
      tap(1449,914)-- 开始战斗
      printFunction("--点击开始战斗")
      ss()
      checkFightisOver()--检查战斗是否结束
      askagain()
      fighttimes = fighttimes + 1
    end
    
  end
  
  
  
  
end


function checkTeamReady()
  while(not TeamReady) do
    printFunction("等待队伍进入...")
    local xUp, yUp = findColorInRegionFuzzy(0xcec6bd, 100, 1293, 432, 1361, 482)
    if xUp ~= -1 and yUp~= -1 then
      printFunction("队伍齐了")
      TeamReady = true
      ss()
    end
    ss()
  end
end


function checkFightisOver()
  while(not fightisover) do
    local xUp, yUp = findImageInRegionFuzzy("readytofight.png", 90, 1650, 900, 1900, 1100, 0xffffff)
    if xUp ~= -1 and yUp~= -1 then
      tap(1741,824) --点击准备
      printFunction("--点击准备")
    end
    s(1000)
    local xFs, yFs = findImageInRegionFuzzy("fightsuccess.png", 90, 1100, 200, 1400, 350, 0xffffff)
    if xFs ~= -1 and yFs~= -1 then
      tap(948,556) --点击屏幕
      printFunction("--点击屏幕看经验")
      ss(2*1000)
      tap(948,556) --点击屏幕
      printFunction("--点击屏幕点福娃")
      ss(5*1000)
      tap(948,556) --点击屏幕
      printFunction("--点击屏幕收奖励")
      ss(2*1000)
      fightisover = true
    end
  end
end

function askagain()
  local xAg, yAg = findImageInRegionFuzzy("askagain.png", 90, 1020, 600, 1200, 680, 0xffffff)
  if xAg ~= -1 and yAg~= -1 then
    tap(1741,824) --点击再邀请
    printFunction("--点击再邀请")
  end
end

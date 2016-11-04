function yuhundefault()
  showHUDx("开始执行御魂")
  local fighttimes = 0
  local aTimes = setting["yuhunTimes"]
  local isSolo = setting["isYuhunSolo"]
  printFunction(">>>>isSolo:"..isSolo)

  local createisOK = createYuhun()

  while(fighttimes < tonumber(aTimes) and createisOK) do
    if isSolo ~= "0" then
      teamReady = checkTeamReady()--检查队伍是否到齐
      if teamReady then
        tap(1449,914)-- 开始战斗
        printFunction("--点击开始战斗")
        showHUDx("开始御魂次数 "..tostring(fighttimes+1))
        ss()
        checkFightisOver()--检查战斗是否结束
        fighttimes = fighttimes + 1
        if fighttimes < tonumber(aTimes) then
          askagain(1)
        else
          askagain(0)
        end
      else
        showHUDx("重新进入御魂")
        createisOK = createYuhun()
      end
    else
      showHUDx("单人进入")
      tap(1440,810)--点击挑战
      ss(2*1000)
      printFunction("--开始单人战斗")
      showHUDx("开始御魂次数 "..tostring(fighttimes+1))
      ss()
      checkFightisOver()--检查战斗是否结束
      ss(18*1000)
      fighttimes = fighttimes + 1
    end
  end

  showHUDx("结束执行御魂")
end

function createYuhun()
  local createisOK = false
  local xPS, yPS = findImageInRegionFuzzy("yuhun.png", 90, 240, 980, 370, 1025, 0xffffff)
  local isSolo = setting["isYuhunSolo"]
  printFunction("x:"..xPS.."y:"..yPS)
  if xPS ~= -1 and yPS ~= -1 then
    tap(xPS,yPS+25)--点击觉醒
    printFunction("--点击御魂")
    s(5*1000)
    if isSolo ~= "0" then
      showHUD(runing,"创建组队，如果卡住请手动点击，脚本会自动继续运行",18,"0xffffffff","0x4c000000",0,760,1020,400,50)
      tap(976,809)--点击组队
      printFunction("--点击组队")
      s(2*1000)
      tap(1580,906)--点击创建队伍
      printFunction("--点击创建队伍")
      s(2*1000)
      tap(1313,850)--点击创建
      printFunction("--点击创建")
      s(1000)
    end
    createisOK = true
  else
    showHUDx("请在探索界面执行脚本")
    ss(5*1000)
  end

  return createisOK
end

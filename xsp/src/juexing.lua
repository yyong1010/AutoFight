function juexingdefault()
  showHUDx("开始执行觉醒")
  local fighttimes = 0
  local wakenTimes = setting["wakenTimes"]
  local isSolo = setting["isWakenSolo"]
  local teamReady = false
  printFunction(">>>>isSolo:"..isSolo)

  local createisOK = createWaken()

  while(fighttimes < tonumber(wakenTimes) and createisOK) do
    if isSolo ~= "0" then
      teamReady = checkTeamReady()--检查队伍是否到齐
      if teamReady then
        tap(1449,914)-- 开始战斗
        printFunction("--点击开始战斗")
        showHUDx("开始觉醒次数 "..tostring(fighttimes+1))
        ss()
        checkFightisOver()--检查战斗是否结束
        fighttimes = fighttimes + 1
        if fighttimes < tonumber(wakenTimes) then
          askagain(1)
        else
          askagain(0)
        end
      else
        showHUDx("重新进入觉醒")
        createisOK = createWaken()
      end
    else
      showHUDx("单人进入")
      tap(1440,810)--点击挑战
      ss(2*1000)
      printFunction("--开始单人战斗")
      showHUDx("开始觉醒次数 "..tostring(fighttimes+1))
      ss()
      checkFightisOver()--检查战斗是否结束
      ss(18*1000)
      fighttimes = fighttimes + 1
    end
  end

  showHUDx("结束执行觉醒")
end

function selectWakenType()
  local wakenType = setting["WakenType"]
  if wakenType == "0" then
    tap(42,532)
    printFunction("--火觉醒")
    showHUDx("选择火觉醒")
  elseif wakenType =="1" then
    printFunction("--风觉醒")
    showHUDx("选择风觉醒")
  elseif wakenType =="2" then
    tap(1874,534)
    printFunction("--水觉醒")
    showHUDx("选择水觉醒")
  elseif wakenType =="3" then
    tap(1874,534)
    ss(1000)
    tap(1874,534)
    printFunction("--雷觉醒")
    showHUDx("选择雷觉醒")
  end
  ss(1000)
  tap(849,482)--点击觉醒类型
  printFunction("--点击觉醒类型")
  ss(2*1000)
end

function createWaken()
  local createisOK = false
  local xPS, yPS = findImageInRegionFuzzy("juexing.png", 90, 80, 970, 210, 1048, 0xffffff)
  local isSolo = setting["isWakenSolo"]
  printFunction("x:"..xPS.."y:"..yPS)
  if xPS ~= -1 and yPS ~= -1 then
    tap(xPS,yPS+25)--点击觉醒
    printFunction("--点击觉醒")
    s(5*1000)

    selectWakenType()
    if isSolo ~= "0" then
      showHUD(runing,"创建组队，如果卡住请手动点击，脚本会自动继续运行",18,"0xffffffff","0x4c000000",0,760,1020,400,50)
      tapR(976,809)--点击组队
      printFunction("--点击组队")
      waitRandomSS(25,45)
      tapR(1580,906)--点击创建队伍
      printFunction("--点击创建队伍")
      waitRandomSS(45,65)

      tapR(1313,850)--点击创建
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



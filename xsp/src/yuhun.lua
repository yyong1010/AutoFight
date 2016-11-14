function yuhundefault()
  showHUDx("开始执行御魂")
  local fighttimes = 0
  local aTimes = setting["yuhunTimes"]
  local isSolo = setting["isYuhunSolo"]

  local createisOK = createYuhun()

  while(fighttimes < tonumber(aTimes) and createisOK) do
    if isSolo ~= "0" then
      teamReady = checkTeamReady()--检查队伍是否到齐
      if teamReady then
        tapR(1449,914)-- 开始战斗
        printFunction("--点击开始战斗")
        showHUDx("开始御魂次数 "..tostring(fighttimes+1))
        ss()
        if checkFightisOver() > 0 then--检查战斗是否结束
					fighttimes = fighttimes + 1
				end 
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
      tapR(1440,810)--点击挑战
      ss(2*1000)
      printFunction("--开始单人战斗")
      showHUDx("开始御魂次数 "..tostring(fighttimes+1))
      ss()
      if checkFightisOver() > 0 then--检查战斗是否结束
				fighttimes = fighttimes + 1
			end
			ss(18*1000)      
    end
  end

  showHUDx("结束执行御魂")
end

function createYuhun()
  local createisOK = false
  local xPS, yPS = findMultiColorInRegionFuzzy(0xf8f3e0,"-1|4|0xf8f3df,16|0|0xf3eedc,26|6|0xf8f3e0",90,240, 980, 370, 1025)
  local isSolo = setting["isYuhunSolo"]
  printFunction("x:"..xPS.."y:"..yPS)
  if xPS ~= -1 and yPS ~= -1 then
    tap(xPS,yPS+25)--点击觉醒
    printFunction("--点击御魂")
    s(5*1000)
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

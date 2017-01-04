function juexingdefault()
  showHUDx("开始执行觉醒")
  local fighttimes = 0
  local wakenTimes = setting["wakenTimes"]
  local isSolo = setting["isWakenSolo"]
  local isJoinTeam = setting["isJoinTeam"]
  local teamReady = false
  local isHaveAnswer = 0
  printFunction(">>>>isSolo:"..isSolo)

  local createisOK = createWaken()

  while(fighttimes < tonumber(wakenTimes) and createisOK) do
    checkinvite()
    if isSolo ~= "0" then
      if isJoinTeam ~= "0" then --队长进入
        teamReady = checkTeamReady()--检查队伍是否到齐
        if teamReady then
          tap(1449,914)-- 开始战斗
          printFunction("--点击开始战斗")
          showHUDx("开始觉醒次数 "..tostring(fighttimes+1))
          ss()
          if checkFightisOver() > 0  then--检查战斗是否结束
  					fighttimes = fighttimes + 1
  				end
          if fighttimes < tonumber(wakenTimes) then
            askagain(1)
          else
            askagain(0)
          end
        else
          showHUDx("重新进入觉醒")
          createisOK = createWaken()
        end
      else --队员进入
				showHUDx("开始觉醒次数 "..tostring(fighttimes+1))
        if findTeamWork(isHaveAnswer) == 2 then
          fighttimes = fighttimes + 1
        end

        if fighttimes < tonumber(wakenTimes) then
          isHaveAnswer = answeragain(1)
          if isHaveAnswer == 0 then
            showHUDx("重新进入觉醒")
            createisOK = createWaken()
          end
        else
          isHaveAnswer = answeragain(0)
        end
      end
    else
      showHUDx("单人进入")
      tapR(1431,725)--点击挑战
      ss(2*1000)
      printFunction("--开始单人战斗")
      showHUDx("开始觉醒次数 "..tostring(fighttimes+1))
      ss()
      if checkIsSoloClick() then
  			if checkFightisOver() > 0 then--检查战斗是否结束
          fighttimes = fighttimes + 1
  			end
  			ss(18*1000)
      end
    end
  end

  showHUDx("结束执行觉醒")
end

function selectWakenType()
  checkinvite()
  local wakenType = setting["WakenType"]
  if wakenType == "0" then
    tap(407,550)
    printFunction("--火觉醒")
    showHUDx("选择火觉醒")
  elseif wakenType =="1" then
    tap(807,550)
    printFunction("--风觉醒")
    showHUDx("选择风觉醒")
  elseif wakenType =="2" then
    tap(1207,550)
    printFunction("--水觉醒")
    showHUDx("选择水觉醒")
  elseif wakenType =="3" then
    tap(1607,550)
    printFunction("--雷觉醒")
    showHUDx("选择雷觉醒")
  end
  ss(2*1000)
end

function createWaken()
  checkinvite()
  local createisOK = false
  local xPS, yPS =  findMultiColorInRegionFuzzy(0x403bd9,"11|0|0x5496e8,21|0|0x4476df,12|2|0x45a0e2",90,80, 970, 210, 1048);
  local isSolo = setting["isWakenSolo"]
  local isJoinTeam = setting["isJoinTeam"]
  printFunction("x:"..xPS.."y:"..yPS)
  if xPS ~= -1 and yPS ~= -1 then
    tap(xPS,yPS+25)--点击觉醒
    printFunction("--点击觉醒")
    s(5*1000)

    selectWakenType()
    if isSolo ~= "0" then
      showHUD(runing,"创建组队，如果卡住请手动点击，脚本会自动继续运行",18,"0xffffffff","0x4c000000",0,760,1020,400,50)
      creatTeamPanel(isJoinTeam)
    end

    createisOK = true
  else
    showHUDx("请在探索界面执行脚本")
    local xS3, yS3 = findColorInRegionFuzzy(0xf4b25f, 90, 1316,837, 1317,838) --组队按钮颜色
    printFunction("xS3:"..xS3.."yS3:"..yS3)
    if (xS3 ~= -1 and yS3 ~= -1) then
      creatTeamPanel(isJoinTeam)
      createisOK = true
    end
  end

  return createisOK
end



function findTeamWork()
  local i = 0
  local isFound = 0 --0没找到，1战斗失败，2战斗成功
  local wtimes = 45 --设置等待次数
  local xS1, yS1,xS2, yS2,xS, yS
  local isCaptainOK = false
	local isClick = false
  local refleshTimes = setting["RefleshTimes"] or 300
  while (isFound < 1) do

    checkinvite()
		isClick = false
    printFunction("--寻找组队:")

    xS, yS = findMultiColorInRegionFuzzy(0xe5c472,"3|0|0x724928,7|0|0x6a4120,5|3|0x5f3115", 90,1590,312,1597,315) --新的组队颜色

    if xS ~= -1 and yS ~= -1 then
      printFunction("--找到可组队伍>>>>:")
      tap(xS,yS)  --点击组队
      s(refleshTimes)
			isClick = true
    end


    local xUp, yUp = findColorInRegionFuzzy(0xdd6951, 90, 463, 873, 465, 876)-- 离开队伍的颜色
    if xUp ~= -1 and xUp ~= -1 then
      i = 0
      while (isFound < 1 and i < wtimes) do
        printFunction("等待战斗开始.."..i)
        local xUq, yUq  = findMultiColorInRegionFuzzy(0x534e77,"6|0|0x4b4770,6|10|0x5a567f,-1|10|0x5f5a7b", 90,1890,935,1905,950)--战斗页面右边的紫色叶子颜色

        if xUq ~= -1 and xUq ~= -1 then
          --showHUDx("进入战斗")
          printFunction("--Team进入战斗>>>>:")
          if checkFightisOver() > 0 then
            isFound = 2
            ss(2*1000)
            break
          else
            isFound = 1
            ss(2*1000)
            break
          end
        end

        local xS1, yS1 = findColorInRegionFuzzy(0xf4b25f, 90, 1448,913, 1450,915) --组队按钮颜色

        if (xS1 ~= -1 and yS1 ~= -1) then
          if not isCaptainOK then
            printFunction("变成队长，离开组队")
            tap(456,895)
            ss(1500)
            local xw1, yw1 = findColorInRegionFuzzy(0xf4b25f, 90, 1126,613, 1127,614) --组队按钮颜色
            if xw1 ~= -1 and yw1 ~= -1 then
              tap(1127,614)
              waitRandomSS(25,45)
              break
            end
          else
            printFunction("变成队长，直接开始")
            teamReady = checkTeamReady()--检查队伍是否到齐
            if teamReady then
              tap(1449,914)-- 开始战斗
              printFunction("--点击开始战斗")
              if checkFightisOver() > 0 then
                isFound = 2
              else
                isFound = 1
              end
            end
            ss()
            break
          end
        end

        ss()
        i = i + 1
      end

      if i == wtimes then
        tap(456,895)
        --showHUDx("超时离开组队，重新进入")
        printFunction("超时离开组队")
        ss(1500)
        tap(1138,647)
        waitRandomSS(25,45)
      end
      --break
    end


    --直接进入战斗
    local xUq, yUq  = findMultiColorInRegionFuzzy(0x534e77,"6|0|0x4b4770,6|10|0x5a567f,-1|10|0x5f5a7b", 90,1890,935,1905,950)--战斗页面右边的紫色叶子颜色
    if xUq ~= -1 and xUq ~= -1 then
      --showHUDx("进入战斗")
      printFunction("-->>>>>直接Team进入战斗>>>>:")
      if checkFightisOver() > 0 then
        isFound = 2
        ss(2*1000)
        break
      else
        isFound = 1
        ss(2*1000)
        break
      end
    end



    local xSR, ySR = findMultiColorInRegionFuzzy(0xf4b25f,"4|0|0xf4b25f,4|3|0xf4b25f,0|3|0xf4b25f",90,1142,912,1146,915)
    if (xSR ~= -1 and ySR ~= -1) and (not isClick) then
      tap(xSR, ySR)
      printFunction("--点击刷新")
      --waitRandomSS(4,6)
      s(refleshTimes)
    end
  end
  printFunction("返回战斗结果:"..isFound)
  return isFound
end

function creatTeamPanel(isJoinTeam)
  local isDone = false

  while (not isDone) do
    checkinvite()
    local xUp, yUp = findColorInRegionFuzzy(0xdd6951, 90, 463, 873, 465, 876)-- 离开队伍的颜色
    if  xUp ~= -1 and xUp ~= -1 then
      isDone = true
      printFunction("--离开创建")
      break
    end

    if isJoinTeam == "0" then --组队进入
        local xw2, yw2 = findColorInRegionFuzzy(0xf4b25f, 90, 1566,915, 1567,916) --组队按钮颜色
        if (xw2 ~= -1 and yw2 ~= -1) then
          isDone = true
          break
        end
      end

    local xS1, yS1 = findColorInRegionFuzzy(0xf4b25f, 90, 960,717, 963,718) --组队按钮颜色
    if (xS1 ~= -1 and yS1 ~= -1) then
      tapR(xS1,yS1)--点击组队
      printFunction("--点击组队")
      ss(2*1000)
    end

    local xS2, yS2 = findColorInRegionFuzzy(0xf4b25f, 90, 1566,915, 1567,916) --组队按钮颜色
    if (xS2 ~= -1 and yS2 ~= -1) and (isJoinTeam ~= "0") then
      tapR(xS2,yS2)--点击创建队伍
      printFunction("--点击创建队伍")
      ss(2*1000)
    end

    local xS3, yS3 = findColorInRegionFuzzy(0xf4b25f, 90, 1316,837, 1317,838) --组队按钮颜色
    if (xS3 ~= -1 and yS3 ~= -1) and (isJoinTeam ~= "0") then
      tapR(1313,850)--点击创建
      printFunction("--点击创建")
      ss(2*1000)
    end
  end
end

function checkIsSoloClick()
  checkinvite()
  local i = 0
  local isClick = false
  while (i < 10) do
    local x, y =  findColorInRegionFuzzy(0xf4b25f, 90, 1495,801, 1499,801) --组队按钮颜色
    if x == -1 then
      printFunction("找不到啦")
      isClick = true
      break
    end
    ss(1000)
    i = i + 1
  end
  printFunction("检查是否有点到"..tostring(isClick))
  return isClick
end

function jointeamWork()
	while (answeragain(1)==1) do
		showHUDx("开始战斗")
		findTeamWork()
	end
  showHUDx("结束加入队伍")
  printFunction("--结束加入队伍")
end



function findSeal(v)
  local i = 0
  local isFound = 0 --0没找到，1战斗失败，2战斗成功
  local wtimes = 45 --设置等待次数
  local xS1, yS1,xS2, yS2,xS, yS
  local isCaptainOK = true
  local isClick = false
  local refleshTimes = setting["RefleshTimes"] or 300

  if _fsw == 720 and v~= "all" then
    v = v.."720"
  end
  while (isFound < 1) do

    checkinvite()
    isClick = false

    printFunction("--寻找封印:"..v)


    --for y=280,736,152 do
    --xS, yS = findImageInRegionFuzzy(v..".png",  80, 798, y, 885, y+50, 0xffffff)fggfgh
    if v ~= "all" then
      xS, yS = findImageInRegionFuzzy(v..".png",  80, 798, 280, 885, 610, 0xffffff)
      --xS,yS  = 1,302
      if xS ~= -1 and yS ~= -1 then
        printFunction("--找到封印>>>>:"..v)
        --tap(1581,yS+25)  --点击组队
				tap(xS+783,yS+25)  --点击组队
        s(refleshTimes)
        isClick = true
      end
    else
      xS, yS = findMultiColorInRegionFuzzy(0xe5c472,"3|0|0x724928,7|0|0x6a4120,5|3|0x5f3115", 90,1590,312,1597,315) --新的组队颜色

      if xS ~= -1 and yS ~= -1 then
        printFunction("--找到可组队伍>>>>:")
        tap(xS,yS)  --点击组队
      end
    end
    --end


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
            teamReady = checkTeamReady(-1)--检查队伍是否到齐
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

    if  (not isClick) then
      local xSR, ySR = findMultiColorInRegionFuzzy(0xf4b25f,"4|0|0xf4b25f,4|3|0xf4b25f,0|3|0xf4b25f",90,1142,912,1146,915)
      if (xSR ~= -1 and ySR ~= -1) then
        tap(xSR, ySR)
        printFunction("--点击刷新")
        s(refleshTimes)
      end
    end

  end
  printFunction("返回战斗结果:"..isFound)
  return isFound
end

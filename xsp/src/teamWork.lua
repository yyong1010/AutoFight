function findTeamWork(isanswer)
  local i =  1
  local isJoin = 0

  while (isJoin < 1) do

    if isanswer == 1 then
      printFunction("--直接等待战斗:")
      isJoin = teamWorkFight()
      break
    else
      printFunction("--寻找组队:")

      isJoin = doTeamWork()

      if isJoin < 1 then
        tapR(1258,891)
        printFunction("--点击刷新")
        waitRandomSS(4,12)
      end
    end

  end
  printFunction("返回战斗结果:"..isJoin)
  return isJoin
end


function doTeamWork()
  local isFound = 0 --0没找到，1战斗失败，2战斗成功
  local xS, yS = findColorInRegionFuzzy(0xf4b25f, 100, 1491, 302, 1493, 305) --组队按钮颜色

  if xS ~= -1 and yS ~= -1 then
    printFunction("--找到可组队伍>>>>:")
    tapR(xS,yS)  --点击组队
    ss()
    --local xtS, ytS = findImageInRegionFuzzy("teamTitle.png", 90, 910, 70, 1000, 100, 0xffffff)
    --local xtBS, ytBS = findImageInRegionFuzzy("BteamTitle.png", 90, 910, 70, 1000, 100, 0xffffff)
    isFound = teamWorkFight()
  end

  return isFound
end

function teamWorkFight()
  local isFound = 0 --0没找到，1战斗失败，2战斗成功
	local wtimes = 45 --设置等待次数
  local i,j = 0,0
  while(j < 6) do
		--printFunction("》》》》jjjjjjjjjjjjjjjjjj:"..j)
    local xUp, yUp = findColorInRegionFuzzy(0xdd6951, 100, 463, 873, 465, 876)-- 离开队伍的颜色
    if xUp ~= -1 and xUp ~= -1 then
      while (isFound < 1 and i < wtimes) do
        printFunction("等待战斗开始.."..i)
        local xUq, yUq  = findMultiColorInRegionFuzzy(0x534e77,"6|0|0x4b4770,6|10|0x5a567f,-1|10|0x5f5a7b", 95,1890,935,1905,950)--战斗页面右边的紫色叶子颜色

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

				local xS1, yS1 = findColorInRegionFuzzy(0xf4b25f, 100, 1448,913, 1450,915) --组队按钮颜色
				local xS2, yS2 = findColorInRegionFuzzy(0xb1a9a1, 100, 1448,913, 1450,915) --组队按钮灰色颜色

				if (xS1 ~= -1 and yS1 ~= -1) or (xS2 ~= -1 and yS2 ~= -1) then
					printFunction("变成队长，离开组队")
          tap(456,895)
					ss(1500)
          local xw1, yw1 = findColorInRegionFuzzy(0xf4b25f, 100, 1126,613, 1127,614) --组队按钮颜色
          if xw1 ~= -1 and yw1 ~= -1 then
  					tap(1127,614)
  					waitRandomSS(25,45)
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
			break
    end

    if isFound == 0 then
      --直接进入战斗
      local xUq, yUq  = findMultiColorInRegionFuzzy(0x534e77,"6|0|0x4b4770,6|10|0x5a567f,-1|10|0x5f5a7b", 95,1890,935,1905,950)--战斗页面右边的紫色叶子颜色

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
    end

		s()
		j = j + 1
  end
  return isFound
end

function creatTeamPanel(isJoinTeam)
  local isDone = false

  while (not isDone) do
    local xS1, yS1 = findColorInRegionFuzzy(0xf4b25f, 100, 962,781, 963,782) --组队按钮颜色
    if (xS1 ~= -1 and yS1 ~= -1) then
      tapR(976,809)--点击组队
      printFunction("--点击组队")
      waitRandomSS(25,45)
      if isJoinTeam == "0" then --组队进入
        local xw2, yw2 = findColorInRegionFuzzy(0xf4b25f, 100, 1593,874, 1594,875) --组队按钮颜色
        if (xw2 ~= -1 and yw2 ~= -1) then
          tap(438,173)  --点击收缩菜单
          printFunction("--点击收缩菜单")
          waitRandomSS(25,45)
          isDone = true
          break
        end
      end
    end

    local xS2, yS2 = findColorInRegionFuzzy(0xf4b25f, 100, 1593,874, 1594,875) --组队按钮颜色
    if (xS2 ~= -1 and yS2 ~= -1) then
      tapR(1580,906)--点击创建队伍
      printFunction("--点击创建队伍")
      waitRandomSS(45,65)
    end

    local xS3, yS3 = findColorInRegionFuzzy(0xf4b25f, 100, 1316,837, 1317,838) --组队按钮颜色
    if (xS3 ~= -1 and yS3 ~= -1) then
      tapR(1313,850)--点击创建
      printFunction("--点击创建")
      s(2000)
      local xUp, yUp = findColorInRegionFuzzy(0xdd6951, 100, 463, 873, 465, 876)-- 离开队伍的颜色
      if  xUp ~= -1 and xUp ~= -1 then
        isDone = true
        break
      end
    end
  end
end


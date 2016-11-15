function checkTeamReady()
	local teamReady = false
  local twoisOK = setting["twoisOK"]
  local waitTimes = 0
  local wT = waitRandom(12,15)
  local wTs = waitRandom(18,23)

  while(not teamReady) do
    printFunction("等待队伍进入..."..waitTimes)
		showHUDx("等待队伍进入...")
    local xUp, yUp = findColorInRegionFuzzy(0xcec6bd, 100, 1293, 432, 1361, 482)
    local xNd, yNd = findColorInRegionFuzzy(0xcec6bd, 100, 1137, 797, 1149, 790)

    if twoisOK == "0" and waitTimes > wT then
      if (xUp ~= -1 and yUp~= -1) or (xNd ~= -1 and yNd~= -1) then
        printFunction("队伍齐了")
        teamReady = true
        ss()
        break
      end
    end

    if (xUp ~= -1 and yUp~= -1) and (xNd ~= -1 and yNd~= -1) then
      printFunction("队伍齐了")
      teamReady = true
      ss()
      break
    end

    if waitTimes > wTs then
      teamReady = false
      tap(456,895)
      showHUDx("超时离开组队，重新进入")
      printFunction("离开组队")
      waitRandomSS(20,45)
      tap(1138,647)
      waitRandomSS(45,75)
      break
    end

    ss(1000)
    waitTimes = waitTimes + 1
  end
  return teamReady
end


function checkFightisOver()
	local fightisover = -1  --0失败，1成功
  while(fightisover < 0) do	
    --local xUp, yUp = findMultiColorInRegionFuzzy(0xddb276,"14|0|0xddb276,25|6|0xdfb77b,34|8|0xdfb67a",90,1650, 900, 1900, 1100)
		local xUp, yUp = findMultiColorInRegionFuzzy(0xe3be82,"19|0|0xdaae71,37|4|0xdfb67a,42|-27|0x534841,19|-14|0xa18b6b",90,1650, 900, 1900, 1100);
    if xUp ~= -1 and yUp~= -1 then
      tap(1741,824) --点击准备
      printFunction("--点击准备")
    end
    s(1000)
    local xFs, yFs = findMultiColorInRegionFuzzy(0x8e1a11,"16|-5|0xcdbeaa,28|0|0xcebfab,44|0|0x851e14",90, 655, 240, 770, 310)
    if xFs ~= -1 and yFs~= -1 then
      tap(948,556) --点击屏幕
      printFunction("--点击屏幕看经验")
      waitRandomSS(19,25)
      tap(948,556) --点击屏幕
      printFunction("--点击屏幕点福娃")
      waitRandomSS(50,75)
      tap(948,656) --点击屏幕
      printFunction("--点击屏幕收奖励")
      waitRandomSS(19,25)
      fightisover = 1
			break
    end
		local xFl, yFl = findMultiColorInRegionFuzzy(0xb19d86,"-2|6|0xb39f88,5|5|0xb6a38c,16|0|0x514a5b,14|13|0xb8a690,6|20|0x5b5265,10|18|0x584f62",90,630, 220, 730, 280)
    if xFl ~= -1 and yFl ~= -1 then
      tap(948,556) --点击屏幕
      printFunction("--点击屏幕")
      ss(2*1000)
      fightisover = 0
    end
  end
	return fightisover
end

function askagain(isa)
  local xAg, yAg = findMultiColorInRegionFuzzy(0xf4b25f,"3|9|0xf4b25f,5|7|0xf4b25f,2|13|0xf4b25f",90,1020, 600, 1200, 680)
  if xAg ~= -1 and yAg~= -1 then
		if isa == 1  then
			tap(1109,639) --点击再邀请
			printFunction("--点击再邀请")
		else
			tap(764,639) --点击取消邀请
			printFunction("--点击取消邀请")
		end
  end
end

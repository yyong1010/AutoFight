function checkTeamReady()
	local teamReady = false
  while(not teamReady) do
    printFunction("等待队伍进入...")
    local xUp, yUp = findColorInRegionFuzzy(0xcec6bd, 100, 1293, 432, 1361, 482)
    if xUp ~= -1 and yUp~= -1 then
      printFunction("队伍齐了")
      teamReady = true
      ss()
    end
    ss()
  end
end


function checkFightisOver()
	local fightisover = false
  while(not fightisover) do
    local xUp, yUp = findImageInRegionFuzzy("readytofight.png", 90, 1650, 900, 1900, 1100, 0xffffff)
    if xUp ~= -1 and yUp~= -1 then
      tap(1741,824) --点击准备
      printFunction("--点击准备")
    end
    s(1000)
    local xFs, yFs = findImageInRegionFuzzy("fightsuccess.png", 90, 655, 240, 770, 310, 0xffffff)
    if xFs ~= -1 and yFs~= -1 then
      tap(948,556) --点击屏幕
      printFunction("--点击屏幕看经验")
      ss(2*1000)
      tap(948,556) --点击屏幕
      printFunction("--点击屏幕点福娃")
      ss(5*1000)
      tap(948,656) --点击屏幕
      printFunction("--点击屏幕收奖励")
      ss(2*1000)
      fightisover = true
			break
    end
		local xFl, yFl = findImageInRegionFuzzy("fightfail.png", 90, 630, 220, 730, 280, 0xffffff)
    if xFl ~= -1 and yFl ~= -1 then
      tap(948,556) --点击屏幕
      printFunction("--点击屏幕")
      ss(2*1000)
      fightisover = true
    end
  end
end

function askagain(isa)
  local xAg, yAg = findImageInRegionFuzzy("askagain.png", 90, 1020, 600, 1200, 680, 0xffffff)
  if xAg ~= -1 and yAg~= -1 then
		if isa == 1  then
			tap(1109,639) --点击再邀请
			printFunction("--点击再邀请")
		else
			tap(764,639) --点击再邀请
			printFunction("--点击取消邀请")
		end
  end
end

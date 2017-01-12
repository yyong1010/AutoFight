function checkTeamReady(sptime)
  local teamReady = false
  local twoisOK = setting["twoisOK"]
  local waitTimes = 1
  local wT = sptime or 5  --组队等待时间
  local wTs = _waitSecs  --超时时间

  while(not teamReady) do
    --checkinvite()
    printFunction("等待队伍进入..."..waitTimes)
    showHUDx("等待队伍进入...")
    local xUp, yUp = findColorInRegionFuzzy(0xcec6bd, 95, 1293, 432, 1361, 482)
    local xNd, yNd = findColorInRegionFuzzy(0xcec6bd, 95, 1137, 797, 1149, 790)

    --local xUp, yUp,xNd, yNd = -1,-1,-1,-1

    if twoisOK == "0" and waitTimes > wT then
      if (xUp ~= -1 and yUp~= -1) or (xNd ~= -1 and yNd~= -1) then
        checkinvite()
        printFunction("队伍齐了")
        teamReady = true
        ss()
        break
      end
    end

    if (xUp ~= -1 and yUp~= -1) and (xNd ~= -1 and yNd~= -1) then
      checkinvite()
      printFunction("队伍齐了")
      teamReady = true
      ss()
      break
    end

    if waitTimes > wTs then
      checkinvite()
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


function checkFightisOver(canchangeSS)
  local fightisover = -1  --0失败，1成功
  local autoChangeSS = setting["autoChangeSS"]
  local isReady = false
  while(fightisover < 0) do
    checkinvite()
    if autoChangeSS == "0" and canchangeSS and (not isReady) then
      ss(5*1000)
      changeSS()
    end
    --local xUp, yUp = findMultiColorInRegionFuzzy(0xddb276,"14|0|0xddb276,25|6|0xdfb77b,34|8|0xdfb67a",90,1650, 900, 1900, 1100)
    local xUp, yUp = findMultiColorInRegionFuzzy(0xe3be82,"19|0|0xdaae71,37|4|0xdfb67a,42|-27|0x534841,19|-14|0xa18b6b",90,1650, 900, 1900, 1100);
    if xUp ~= -1 and yUp~= -1 then
      tap(1741,824) --点击准备
      printFunction("--点击准备")
      --showHUDx("开始战斗")
      isReady = true
    end
    s(1000)
    local xFs, yFs = findMultiColorInRegionFuzzy(0x8e1a11,"16|-5|0xcdbeaa,28|0|0xcebfab,44|0|0x851e14",90, 655, 240, 770, 310)
    if xFs ~= -1 and yFs~= -1 then
			--[[
      tap(948,556) --点击屏幕
      printFunction("--点击屏幕看经验")
      waitRandomSS(19,25)
      tap(948,556) --点击屏幕
      printFunction("--点击屏幕点福娃")
      waitRandomSS(50,75)
      tap(948,656) --点击屏幕
      printFunction("--点击屏幕收奖励")
      waitRandomSS(19,25)
			]]
			_Do(fightpara)
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

function answeragain(isa)
  local i = 0
  local isHaveAnswer = 0 --0无邀请，1有邀请
  showHUDx("等待再邀请信息")
  printFunction("--等待再邀请信息")
  while (i < _waitSecs) do

    --findMultiColorInRegionFuzzy(0xf4b25f,"6|0|0xf4b25f,6|6|0xf4b25f,0|6|0xf4b25f", 95, 1125, 612, 1135, 625)
     local xAg, yAg = findMultiColorInRegionFuzzy(0xdf6d5c,"0|9|0xda6f5e,71|1|0xdccbbb,72|7|0xe9d8c8,141|12|0x5eb967,140|20|0x56b15e", 95,63,374,206,394)

    if xAg ~= -1 and yAg~= -1 then
      isHaveAnswer = 1
      if isa == 1  then
        tap(205,394) --点击再邀请
        printFunction("--点击接受邀请")
        ss(3*1000)
        checkinvite()
        --checkinvite() --执行两次，因为邀请对话框不会消失
        local xUp, yUp = findMultiColorInRegionFuzzy(0xd5c4a2,"4|0|0xd5c4a2,10|0|0xd5c4a2,20|0|0xd5c4a2", 95,1818, 32, 1838, 32)--御魂的颜色，判断是否还在主界面
        if xUp ~= -1 and xUp ~= -1 then
          printFunction("--队伍不存在了")
          isHaveAnswer = 0
        end
        break
      else
        tap(63,374) --点击取消邀请
        printFunction("--点击我很忙")
        break
      end
    end
    ss(1000)
    i = i + 1
  end

  return isHaveAnswer
end


function changeSS()
  local swiptimes = tonumber(setting["swiptimes"]) or 5
  local isnomax,x1,y1,x2,y2,x3,y3,x4,y4 = checkmax()
  local i = 0
  printFunction(">>>>找满级式神")
  while (not isnomax and i < 10) do
    printFunction(">>>>开始换式神"..i)
    if (x1 ~= -1 and y1 ~= -1) or (x2 ~= -1 and y2 ~= -1) then
      tap(788,892)--点区域
      ss(3*1000)
      --local x9,y9 = findMultiColorInRegionFuzzy(0xeb601b,"4|0|0xf26f31,19|0|0xe1502a,21|0|0xe75c1e", 90,472,1026,496,1026)--第二张牌的星级颜色
      --local x10,y10 = findMultiColorInRegionFuzzy(0xc316ef,"4|0|0xbb35e4,22|0|0xc316ef,24|0|0xc51cef", 90,472,1026,496,1026)
			--local x9,y9= findMultiColorInRegionFuzzy(0x413127,"-7|39|0xffffff,30|52|0xf2f1f1,26|94|0x2e1f18,-5|142|0x3e2f28,-19|194|0xffffff", 90,92,784,129,978)
			--local x10,y10 = findMultiColorInRegionFuzzy(0x4d3c26,"16|17|0x44311b,9|40|0x9d9d9d,21|61|0xdcdcdc,42|61|0x433222", 90,88,780,130,841)
      local x10,y10 = findMultiColorInRegionFuzzy(0x2d1c0d,"20|11|0x573e2e,-43|55|0x2d1d14,21|96|0x463524,65|101|0x322219", 90,40,771,148,872)
      if x10 ~= -1 then
        printFunction(">>>>进入主战区域x10:"..x10)
        selectRare()
        for i=1,swiptimes do
          swipRight(349,918,1150)
          ss()
        end
        if x1 ~= -1 then
          printFunction(">>>>换右战式神")
          voidRed(802,1002)
					ss(1000)
					if setting["teamDiscover"] == "0" and string.find(setting["teamDiscoverRole"], "0", 1) then
          swip(902,915,487,380)--换后排右战式神
					else
					swip(902,915,300,342) --换右战式神
					end
					ss(3*1000)
        end
        if x2 ~= -1 then
          printFunction(">>>>换左战式神")
          voidRed(1202,1402)
					ss(1000)
					if setting["teamDiscover"] == "0" and string.find(setting["teamDiscoverRole"], "0", 1) then
						swip(1302,915,1284,357)--换后排左战式神
					else
						swip(1302,915,1600,342) --换左战式神
					end
          ss(3*1000)
        end
				local xe,ye= findMultiColorInRegionFuzzy(0x2d1c0d,"20|11|0x573e2e,-43|55|0x2d1d14,21|96|0x463524,65|101|0x322219", 90,40,771,148,872)
        printFunction("xe:"..xe)
				if (xe ~= -1) then
					tap(53,48)
					ss(2*1000)
				end
      end
    end

    if (x3 ~= -1 and y3 ~= -1) or (x4 ~= -1 and y4 ~= -1) then
      tap(728,379) --点区域
      ss(3*1000)
      --local x9,y9 = findMultiColorInRegionFuzzy(0xeb601b,"4|0|0xf26f31,19|0|0xe1502a,21|0|0xe75c1e",90,472,1026,496,1026)--第二张牌的星级颜色
      --local x10,y10 = findMultiColorInRegionFuzzy(0xc316ef,"4|0|0xbb35e4,22|0|0xc316ef,24|0|0xc51cef", 90,472,1026,496,1026)
      --local x9,y9= findMultiColorInRegionFuzzy(0x413127,"-7|39|0xffffff,30|52|0xf2f1f1,26|94|0x2e1f18", 90,92,784,129,978)
			--local x10,y10 = findMultiColorInRegionFuzzy(0x4d3c26,"16|17|0x44311b,9|40|0x9d9d9d,21|61|0xdcdcdc,42|61|0x433222", 90,88,780,130,841)
      local x10,y10 = findMultiColorInRegionFuzzy(0x2d1c0d,"20|11|0x573e2e,-43|55|0x2d1d14,21|96|0x463524,65|101|0x322219", 90,40,771,148,872)
      if x10 ~= -1 then
        printFunction(">>>>进入观战区域x10:"..x10)

        selectRare()
        for i=1,swiptimes-1 do
          swipRight(349,918,1150)
          ss()
        end
        if x3 ~= -1 then
          printFunction(">>>>换左观式神")
          voidRed(802,1002)
					ss(1000)
          swip(902,915,583,377) --换左观式神
          ss(1000)
        end
        if x4 ~= -1 then
          printFunction(">>>>换右观式神")
          voidRed(1202,1402)
					ss(1000)
          swip(1302,915,1180,377) --换右观式神
          ss(1000)
        end
				local xe,ye= findMultiColorInRegionFuzzy(0x2d1c0d,"20|11|0x573e2e,-43|55|0x2d1d14,21|96|0x463524,65|101|0x322219", 90,40,771,148,872)
        printFunction("xe:"..xe)
				if (xe ~= -1) then
					tap(53,48)
					ss(2*1000)
				end
      end
    end

    isnomax,x1,y1,x2,y2,x3,y3,x4,y4 = checkmax()
		i = i + 1
  end
end

function swipRight(xp, yp, distance)
  local x = xp or waitRandom(_fsh/5-50,_fsh/5+50)
  local y = yp or waitRandom(_fsw/2-20,_fsw/2+20)
  local dis = distance or waitRandom(_fsh/7,_fsh/7+150)
  printFunction(x..","..y..","..dis)
  swip(x+dis,y,x,y)
  s()
end

function swipLeft(xp, yp, distance)
  local x = xp or waitRandom(_fsh/3-50,_fsh/3+50)
  local y = yp or waitRandom(_fsw/2-20,_fsw/2+20)
  local dis = distance or waitRandom(_fsh/3.2,_fsh/3.2+150)
  printFunction(x..","..y..","..dis)
  swip(x,y,x+dis,y)
  s()
end

function swipBottom(xp, yp, distance)
  local x = xp
  local y = yp
  local dis = distance or waitRandom(_fsw/3.2,_fsw/3.2+150)
  printFunction(x..","..y..","..dis)
  swip(x,y,x,y-dis)
  waitRandomSS(20,35)
end

function swipTop(xp, yp, distance)
  local x = xp
  local y = yp
  local dis = distance or waitRandom(_fsw/3.2,_fsw/3.2+150)
  printFunction(x..","..y..","..dis)
  swip(x,y,x,y+dis)
  waitRandomSS(20,35)
end


function voidRed(lx,rx,direction)
  local d = direction or 1 --默认1向左，0向右
  local xr, yr = findMultiColorInRegionFuzzy(0x21181a,"0|6|0xd2c5c3,0|17|0xd25148,6|17|0xe35d4e,10|17|0xe25a4c",90,lx,909,rx,926)
	local xb, yb = findMultiColorInRegionFuzzy(0x4772c5,"21|7|0x8bb0e3,24|41|0x3d3836,54|25|0x81b1d7", 90,lx,879,rx,920)
	local xbk, ybk = findMultiColorInRegionFuzzy(0xffffff,"49|-2|0x292625,25|16|0xefc6b2,23|39|0x252525,18|57|0xbc9550", 90,lx,877,rx,936)
  printFunction(">>>>检测是否有红达摩")
  while(xr ~= -1 or xb ~= -1 or xbk ~= -1) do
    if (d > 0) then
      printFunction(">>>>检测到红达摩，向左划")
      swipLeft(349,918,400)
    else
      printFunction(">>>>检测到红达摩，向左划")
      swipRight(349,918,400)
    end
    ss()
    xr, yr = findMultiColorInRegionFuzzy(0x21181a,"0|6|0xd2c5c3,0|17|0xd25148,6|17|0xe35d4e,10|17|0xe25a4c",90,lx,909,rx,926)
		xb, yb = findMultiColorInRegionFuzzy(0x4772c5,"21|7|0x8bb0e3,24|41|0x3d3836,54|25|0x81b1d7", 90,lx,879,rx,920)
		xbk, ybk = findMultiColorInRegionFuzzy(0xffffff,"49|-2|0x292625,25|16|0xefc6b2,23|39|0x252525,18|57|0xbc9550", 90,lx,877,rx,936)
  end
  printFunction(">>>>检测红达摩结束")
end

function checkmax()
	local x9,y9= findMultiColorInRegionFuzzy(0x2d1c0d,"20|11|0x573e2e,-43|55|0x2d1d14,21|96|0x463524,65|101|0x322219", 90,40,771,148,872)
  printFunction("x9:"..x9)
	if (x9 ~= -1) then
		tap(53,48)
		ss(2*1000)
	end

	local x1,y1, x2,y2

	if setting["teamDiscover"] == "0" and string.find(setting["teamDiscoverRole"], "0", 1) then--组队探索队长区域
		x1,y1 = findMultiColorInRegionFuzzy(0xe5a11d,"4|0|0xeea418,4|3|0xfab01d,0|3|0xf7b31c", 90,780,780,960,971)--右战
		x2,y2 = findMultiColorInRegionFuzzy(0xe5a11d,"4|0|0xeea418,4|3|0xfab01d,0|3|0xf7b31c", 90,0,420,120,613)--左战
	else
		x1,y1 = findMultiColorInRegionFuzzy(0xe5a11d,"4|0|0xeea418,4|3|0xfab01d,0|3|0xf7b31c", 90,1050,500,1175,690)--右战
		x2,y2 = findMultiColorInRegionFuzzy(0xe5a11d,"4|0|0xeea418,4|3|0xfab01d,0|3|0xf7b31c", 90,390,310,515,450)--左战
	end

  local x3,y3 = findMultiColorInRegionFuzzy(0xe5a11d,"4|0|0xeea418,4|3|0xfab01d,0|3|0xf7b31c", 90,435,222,510,300)--左观
  local x4,y4 = findMultiColorInRegionFuzzy(0xe5a11d,"4|0|0xeea418,4|3|0xfab01d,0|3|0xf7b31c", 90,585,180,650,308)--右观
  local isnomax = (x1 == -1 and y1 == -1) and (x2 == -1 and y2 == -1) and (x3 == -1 and y3 == -1) and (x4 == -1 and y4 == -1)
  printFunction( x1..":"..y1..","..x2..":"..y2..","..x3..":"..y3..","..x4..":"..y4)
  printFunction("检测是否已经换完:"..tostring(isnomax))
  return isnomax,x1,y1,x2,y2,x3,y3,x4,y4
end

function checkinvite()
  if  _isVIP then
    local x, y = findMultiColorInRegionFuzzy(0xb39279,"0|19|0xa18067,14|19|0xa18067,14|3|0xb39279", 95, 1006,299,1020,318) --名字栏背景色
    if (x ~= -1 and y ~= -1) then
      tap(1279,631)--确认
      showHUD(taskstatus,"注意！有接收到协作任务",24,"0xffff0000","0xee000000",0,760,970,400,50)
      ss()
    end
    --x, y = findMultiColorInRegionFuzzy(0xdd6951,"10|0|0xdd6951,146|0|0xf4b25f,151|0|0xf4b25f", 95,875,642,1026,642)
    --if (x ~= -1 and y ~= -1) then
    --  tap(x,y)
    --  ss()
    --end
    x, y = findMultiColorInRegionFuzzy(0xd8c8b7,"0|24|0xd2cac2,0|66|0xf4b25f", 95,1030,626,1030,692)
    if (x ~= -1 and y ~= -1) then
      if  (setting["autoBuyJuice"] == "0") and (_buyJuiceTimes < tonumber(setting["buyJuicetimes"])) then
        tap(1035,704)
        _buyJuiceTimes = _buyJuiceTimes + 1
        printFunction("购买体力次数".._buyJuiceTimes)
        ss(5*1000)
        tap(998,752)
        ss(5*1000)
      else
        tap(1397,286)
        printFunction("不够买体力了")
        ss()
        lua_exit()
      end
    end
  end
end

function checkGetGiftisOver()
  while true do
    local x, y = findMultiColorInRegionFuzzy(0xde901c,"41|9|0xe0af2c,66|-26|0xd33644,98|-7|0xc9b497,86|25|0x2e557e,103|81|0xbb471a,81|92|0x111110", 95, 0, 0, 1919, 1079)
    if x ~= -1 then
      tap(1127,896)
      ss()
    else
      break
    end
  end
end

function selectRare()
  rareLevel = setting["rareLevel"]
  if rareLevel == "0" then
      printFunction("选择N")
        tap(89,830)
        ss()
        tap(100,476)
        ss()
  else
    printFunction("选择R")
        tap(89,830)
        ss()
        tap(273,533)
        ss()
  end
end


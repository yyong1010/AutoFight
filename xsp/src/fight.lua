function checkTeamReady(sptime)
  local teamReady = false
  local twoisOK = setting["twoisOK"]
  local waitTimes = 0
  local wT = sptime or waitRandom(12,15)   --组队等待时间
  local wTs = waitRandom(18,23)  --超时时间

  while(not teamReady) do
    checkinvite()
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

function answeragain(isa)
  local i = 0
  local isHaveAnswer = 0 --0无邀请，1有邀请
  showHUDx("等待再邀请信息")
  while (i < 30) do

    local xAg, yAg  = findMultiColorInRegionFuzzy(0xf4b25f,"6|0|0xf4b25f,6|6|0xf4b25f,0|6|0xf4b25f", 95, 1125, 612, 1135, 625)

    if xAg ~= -1 and yAg~= -1 then
      isHaveAnswer = 1
      if isa == 1  then
        tap(1124,641) --点击再邀请
        printFunction("--点击接受邀请")
        ss(3*1000)
        checkinvite()
        checkinvite() --执行两次，因为邀请对话框不会消失
        local xUp, yUp = findMultiColorInRegionFuzzy(0xd5c4a2,"4|0|0xd5c4a2,10|0|0xd5c4a2,20|0|0xd5c4a2", 95,1818, 32, 1838, 32)--御魂的颜色，判断是否还在主界面
        if xUp ~= -1 and xUp ~= -1 then
          printFunction("--队伍不存在了")
          isHaveAnswer = 0
        end
        break
      else
        tap(786,639) --点击取消邀请
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
  printFunction(">>>>开始换式神"..i)
  while (not isnomax) do
    printFunction(">>>>开始换式神"..i)
    if (x1 ~= -1 and y1 ~= -1) or (x2 ~= -1 and y2 ~= -1) then
      tap(788,892)--点区域
      ss(3*1000)
      local x9,y9 = findMultiColorInRegionFuzzy(0xeb601b,"4|0|0xf26f31,19|0|0xe1502a,21|0|0xe75c1e", 90,472,1026,496,1026)--第二张牌的星级颜色
      local x10,y10 = findMultiColorInRegionFuzzy(0xc316ef,"4|0|0xbb35e4,22|0|0xc316ef,24|0|0xc51cef", 90,472,1026,496,1026)
      if x9 ~= -1 or x10 ~= -1 then
        printFunction(">>>>进入主战区域x9:"..x9..",y9:"..y9)

        for i=1,swiptimes do
          swipRight(349,918,1150)
          ss()
        end
        if x1 ~= -1 then
          printFunction(">>>>换右战式神")
          voidRed(802,1002)
          swip(902,915,300,342) --换右战式神
          ss(3*1000)
        end
        if x2 ~= -1 then
          printFunction(">>>>换左战式神")
          voidRed(1202,1402)
          swip(1302,915,1600,342) --换左战式神
          ss(3*1000)
        end
        tap(57,65)--返回
        ss(3*1000)
      end
    end

    if (x3 ~= -1 and y3 ~= -1) or (x4 ~= -1 and y4 ~= -1) then
      tap(728,379) --点区域
      ss(3*1000)
      local x9,y9 = findMultiColorInRegionFuzzy(0xeb601b,"4|0|0xf26f31,19|0|0xe1502a,21|0|0xe75c1e",90,472,1026,496,1026)--第二张牌的星级颜色
      local x10,y10 = findMultiColorInRegionFuzzy(0xc316ef,"4|0|0xbb35e4,22|0|0xc316ef,24|0|0xc51cef", 90,472,1026,496,1026)
      if x9 ~= -1 or x10 ~=-1 then
        printFunction(">>>>进入观战区域x9:"..x9..",y9:"..y9)

        for i=1,swiptimes-1 do
          swipRight(349,918,1150)
          ss()
        end
        if x3 ~= -1 then
          printFunction(">>>>换左观式神")
          voidRed(802,1002)
          swip(902,915,583,377) --换左观式神
          ss(3*1000)
        end
        if x4 ~= -1 then
          printFunction(">>>>换右观式神")
          voidRed(1202,1402)
          swip(1302,915,1180,377) --换右观式神
          ss(3*1000)
        end
        tap(57,65)--返回
        ss(3*1000)
      end
    end

    isnomax,x1,y1,x2,y2,x3,y3,x4,y4 = checkmax()
  end
end

function swipRight(xp, yp, distance)
  local x = xp or waitRandom(_fsh/3-50,_fsh/3+50)
  local y = yp or waitRandom(_fsw/2-20,_fsw/2+20)
  local dis = distance or waitRandom(_fsh/3.2,_fsh/3.2+150)
  printFunction(x..","..y..","..dis)
  swip(x+dis,y,x,y)
  waitRandomSS(20,35)
end

function swipLeft(xp, yp, distance)
  local x = xp or waitRandom(_fsh/3-50,_fsh/3+50)
  local y = yp or waitRandom(_fsw/2-20,_fsw/2+20)
  local dis = distance or waitRandom(_fsh/3.2,_fsh/3.2+150)
  printFunction(x..","..y..","..dis)
  swip(x,y,x+dis,y)
  waitRandomSS(20,35)
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
  local x, y = findMultiColorInRegionFuzzy(0x21181a,"0|6|0xd2c5c3,0|17|0xd25148,6|17|0xe35d4e,10|17|0xe25a4c",90,lx,909,rx,926)
  printFunction(">>>>检测是否有红达摩")
  while(x ~= -1) do
    if (d > 0) then
      printFunction(">>>>检测到红达摩，向左划")
      swipLeft(349,918,400)
    else
      printFunction(">>>>检测到红达摩，向左划")
      swipRight(349,918,400)
    end
    ss()
    x, y = findMultiColorInRegionFuzzy(0x21181a,"0|6|0xd2c5c3,0|17|0xd25148,6|17|0xe35d4e,10|17|0xe25a4c",90,lx,909,rx,926)
  end
  printFunction(">>>>检测红达摩结束")
end

function checkmax()
  local x1,y1 = findMultiColorInRegionFuzzy(0xe5a11d,"4|0|0xeea418,4|3|0xfab01d,0|3|0xf7b31c", 90,1100,570,1145,650)--右战
  local x2,y2 = findMultiColorInRegionFuzzy(0xe5a11d,"4|0|0xeea418,4|3|0xfab01d,0|3|0xf7b31c", 90,400,340,460,450)--左战
  local x3,y3 = findMultiColorInRegionFuzzy(0xe5a11d,"4|0|0xeea418,4|3|0xfab01d,0|3|0xf7b31c", 90,435,222,490,300)--左观
  local x4,y4 = findMultiColorInRegionFuzzy(0xe5a11d,"4|0|0xeea418,4|3|0xfab01d,0|3|0xf7b31c", 90,596,189,650,260)--右观
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
    x, y = findMultiColorInRegionFuzzy(0xdd6951,"10|0|0xdd6951,146|0|0xf4b25f,151|0|0xf4b25f", 95,875,642,1026,642)
    if (x ~= -1 and y ~= -1) then
      tap(x,y)
      ss()
    end
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


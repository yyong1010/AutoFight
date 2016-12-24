function groupjiejiedefault()
  showHUDx("开始执行阴阳寮结界突破")
  local fighttimes = 0
  local aTimes = setting["jiejieTimes"]
  local bl= {0,0,0}
  local t = {0,0,0}

  --local xPS, yPS = findImageInRegionFuzzy("jiejie.png", 90, 550, 970, 690, 1048, 0xffffff)
  --local xQs, yQs = findImageInRegionFuzzy("jiejietitle.png", 50, 890, 60, 1000, 100, 0xffffff)
  checkinvite()
  local xPS, yPS = findMultiColorInRegionFuzzy(0xf2ecda,"12|2|0xe5e0ce,12|11|0x4e87ea,1|10|0xf8f3e0", 90,615,980,630,995)
  local xQs, yQs = findMultiColorInRegionFuzzy(0x5d4c3c,"4|1|0x5b4a3a,13|1|0x877f72,26|6|0xf8f3e0,6|6|0x625141", 90,902,70,930,78)

  printFunction("x:"..xPS.."y:"..yPS.."x1:"..xQs.."y:"..yQs)
  if (xPS ~= -1 and yPS ~= -1) or (xQs ~= -1 and yQs ~= -1) then
    if (xPS ~= -1 and yPS ~= -1) then
      tap(xPS,yPS+25)--点击结界突破
      printFunction("--点击结界突破")
      s(5*1000)
      tap(1849,517)
      printFunction("--点击阴阳寮")
      s(2*1000)
    end

    local isAllDone = bl[1]==2 and bl[2] == 2 and bl[3] == 2

    while(not isAllDone) do
      checkisBack()
      checkinvite()
      tt1 = bl[1] == 2 and "阴阳寮1:完成" or "阴阳寮1等待:".. os.difftime(os.time(),t[1])
      tt2 = bl[2] == 2 and " 阴阳寮2:完成" or " 阴阳寮2等待:".. os.difftime(os.time(),t[2])
      tt3 = bl[3] == 2 and " 阴阳寮3:完成" or " 阴阳寮3等待:".. os.difftime(os.time(),t[3])
      showHUD(runing,tt1..tt2..tt3,18,"0xffffffff","0x4c000000",0,760,1020,400,50)
      for i=1,3 do
        if (bl[i] ~= 2 and os.difftime(os.time(),t[i]) > 599) then
          printFunction("选取阴阳寮"..i..",等待时间"..os.difftime(os.time(),t[i]))
          tap(600,300*i)
          ss()
          bl[i] = fightGroupjiejie()
					t[i]= os.time()
        end
      end

      isAllDone = bl[1]==2 and bl[2] == 2 and bl[3] == 2
    end
    printFunction("已经全部打完，点击退出")
    ss(5*1000)
    tap(1772,96)

  else
    showHUDx("请在探索界面执行脚本")
    ss(5*1000)
  end
  showHUDx("结束执行阴阳寮结界突破")
end

function fightGroupjiejie()
  local isDone = 0 --0失败 1成功 2结束
  local isClick = false
  local astimes = 0
  local stimes = 0
  local isReversal = false
  checkinvite()

  local xUp, yUp = findMultiColorInRegionFuzzy(0x6c645b,"15|0|0x6c645b,33|0|0x6c645b", 95,1078,672,1111,672)

  if xUp ~= -1 and yUp ~= -1 then
    printFunction("已剩四个，不打了")
    isDone = 2
    return isDone
  end

  while true do
    if (isReversal) then
      break
    end
    stimes = stimes + 1
    printFunction("划屏次数"..stimes)
    swipBottom(1316,823,360)
    --local xUq, yUq = findMultiColorInRegionFuzzy(0xd8c8b7,"15|0|0xd8c8b7,33|0|0xd8c8b7", 95,1078,265,1111,265) --寻找第一个
    local xUq, yUq = findMultiColorInRegionFuzzy(0x9e8d75,"0|4|0x9e8d75,0|10|0x9e8d75", 95,1209,223,1209,308)
    printFunction("x"..xUq..",y"..yUq)
    if xUq == -1 and yUq == -1 then
      swipTop(1316,400,180)
      isReversal = true
    end

  end

  while (not isClick and astimes < stimes*2) do

    --local xUq, yUq = findMultiColorInRegionFuzzy(0xd8c8b7,"15|0|0xd8c8b7,33|0|0xd8c8b7", 95,1078,265,1111,265) --寻找第一个
    local xUq, yUq = findMultiColorInRegionFuzzy(0x9e8d75,"0|4|0x9e8d75,0|10|0x9e8d75", 95,1209,223,1209,308)
    if xUq ~= -1 and yUq ~= -1 then
      tap(xUq-100,yUq)
      ss()
      local xs ,ys = findColorInRegionFuzzy(0xf4b25f, 95, xUq-100,yUq, xUq-60,yUq+330) --组队按钮颜色
      if xs ~= -1 and ys ~= -1 then
        isClick = true
        printFunction("找到结界:"..xs..":"..ys)
				showHUDx("开始结界突破战斗")
        --tap(xUp, yUp) -- 选取
        s(1000)
        tap(xs, ys) -- 开始战斗
        isDone = checkFightisOver()--检查战斗是否结束
        checkisBack()--检查界面是否已回到可选界面
        --checkisFuWa()--检查福娃
        ss(2*1000)
        break
      end
    else
      printFunction("没找到结界，向上滑一点")
      swipTop(1316,400,180)
      ss()
      astimes = astimes + 1
    end
  end
  if (astimes == stimes*2) then
    isDone = 2
  end
  return isDone
end


function discover()
  showHUDx("开始执行探索")
  local fighttimes = 0
  local aTimes = setting["discoverTimes"]
  local specailChapter = 1
	showHUD(runing,"请在选定章节内界面或探索界面执行脚本",18,"0xffffffff","0x4c000000",0,760,1020,400,50)
	ss(5*1000)
  while(fighttimes < tonumber(aTimes)) do
    showHUDx("开始探索次数 "..tostring(fighttimes+1))
    local xLS, yLS = findImageInRegionFuzzy("indiscover.png", 90, 1600, 950, 1690, 1000, 0xffffff)
    if xLS ~= -1 and yLS ~= -1 then
      specailChapter = selectSpecailChapter()
      discoverDetail()
    else
			if fighttimes > 0 then
        waitRandomSS(45,65)
        selectChapter(specailChapter)
			else
        selectDefaultChapter()
			end
    end

    s(5*1000)
    local xLS, yLS = findImageInRegionFuzzy("indiscover.png", 90, 1600, 950, 1690, 1000, 0xffffff)
    if xLS ~= -1 and yLS ~= -1 then
      tap(68,100)
      printFunction("--点击退出")
      ss(2*1000)
      tap(1161,607)
      ss(5*1000)
    end
    fighttimes = fighttimes + 1
  end
  showHUDx("结束执行探索")
end


function discoverDetail()
  local i,j = 0,0
  local bossIsKO = false
	local onlyExp = setting["onlyExp"]
  --local rtimes,ltimes = waitRandom(3,5),waitRandom(3,5)
  while(i < 5 and not bossIsKO) do
    swipRight()
    printFunction("--向右划"..i)
    i = i + 1
		if onlyExp == "0" then
			checkExpModels()
		else
			bossIsKO = swap()
		end
  end


  while(j < 5 and not bossIsKO) do
    swipLeft()
    printFunction("--向左划"..j)
    j = j + 1
		if onlyExp == "0" then
			checkExpModels()
		else
			bossIsKO = swap()
		end
  end

end

function checkGift()
  for x=650,1250,25 do
    local xB, yB = findImageInRegionFuzzy("gift.png", 80, x, 432, x+200, 863, 0)
    if xB~= -1 and yB ~=-1 then
      tap(xB,yB)
      printFunction("--点击礼物")
      ss(5*1000)
      tap(998,752)
      ss(5*1000)
    end
  end
end

function swap()
	printFunction("--全打模式")
  local bossIsKO = false
  for x=200,1400,200 do
    keepScreen(true)
    --local xPS, yPS = findImageInRegionFuzzy("exp2.png", 80, y, 540, y+96, 892, 0xffffff)
    --if xPS ~= -1 and yPS ~= -1 then
    --  printFunction("i:"..i.."x:"..xPS.."y:"..yPS)
    --local xS, yS = findImageInRegionFuzzy("tofight2.png", 90, xPS-250, yPS-220, xPS+150, yPS-120, 0xffffff)
    local xS, yS = findImageInRegionFuzzy("tofight2.png", 70, x, 300, x+320, 950, 0xffffff)
    keepScreen(false)
    if xS~= -1 and yS ~=-1 then
      tap(xS,yS)
      printFunction("--点击战斗".."x:"..xS.."y:"..yS)
      ss(5*1000)
      checkFightisOver()
      ss(5*1000)
    end
    -- end
    keepScreen(true)
    local xB, yB = findImageInRegionFuzzy("bossfight.png", 70, 753, 187, 1270, 600, 0xffffff)
    keepScreen(false)
    if xB~= -1 and yB ~=-1 then
      tap(xB,yB)
      printFunction("--点击BOSS战斗".."x:"..xB.."y:"..yB)
      ss(5*1000)
      checkFightisOver()
      ss(10*1000)
      checkGift()
      ss(5*1000)
      bossIsKO = true
      break
    end

    --x,y = findMultiColorInRegionFuzzy(0x2d1c08,"-5|-10|0xe4ceab,-8|1|0xe0cf9e,8|-2|0xae9c78,0|9|0xe2d09c,1|22|0xfca911",90,y, 540, y+48, 892);
    --printFunction("x:"..x.."y:"..y)
    --keepScreen(false)
  end
  return bossIsKO
end

function checkExpModels()
	printFunction("--只打经验怪")
  for x=200,1400,200 do
    keepScreen(true)
		local xS, yS = findImageInRegionFuzzy("tofight2.png", 70, x, 300, x+320, 950, 0xffffff)
    keepScreen(false)
    if xS~= -1 and yS ~=-1 then
			keepScreen(true)
			local xPS1, yPS1 = findImageInRegionFuzzy("exp1.png", 70, xS-200, yS, x+200, yS+250, 0x000000)
			local xPS2, yPS2 = findImageInRegionFuzzy("exp2.png", 70, xS-200, yS, x+200, yS+250, 0x000000)
			local xPS3, yPS3 = findImageInRegionFuzzy("exp3.png", 70, xS-200, yS, x+200, yS+250, 0x000000)
			local xPS4, yPS4 = findImageInRegionFuzzy("exp4.png", 70, xS-200, yS, x+200, yS+250, 0x000000)
			local xPS5, yPS5 = findImageInRegionFuzzy("exp5.png", 70, xS-200, yS, x+200, yS+250, 0x000000)
			local xPS6, yPS6 = findImageInRegionFuzzy("exp6.png", 70, xS-200, yS, x+200, yS+250, 0x000000)
      local xPS7, yPS7 = findImageInRegionFuzzy("exp7.png", 70, xS-200, yS, x+200, yS+250, 0x000000)
      local xPS8, yPS8 = findImageInRegionFuzzy("exp8.png", 70, xS-200, yS, x+200, yS+250, 0x000000)
			keepScreen(false)
			if (xPS1 ~= -1 and yPS1 ~= -1) or (xPS2 ~= -1 and yPS2 ~= -1) or (xPS3 ~= -1 and yPS3 ~= -1) or (xPS4 ~= -1 and yPS4 ~= -1) or (xPS5 ~= -1 and yPS5 ~= -1) or (xPS6 ~= -1 and yPS6 ~= -1) then
				tap(xS,yS)
				printFunction("--点击战斗".."x:"..xS.."y:"..yS)
        --local f = assert(io.open("[public]test.txt", "a"))
        --f:write(xPS1..":"..yPS1..","..xPS2..":"..yPS2..","..xPS3..":"..yPS3..","..xPS4..":"..yPS4..","..xPS5..":"..yPS5..","..xPS6..":"..yPS6..","..xPS7..":"..yPS7..","..xPS8..":"..yPS8)
        --f:flush()
        --f:close()
        printFunction(xPS1..":"..yPS1..","..xPS2..":"..yPS2..","..xPS3..":"..yPS3..","..xPS4..":"..yPS4..","..xPS5..":"..yPS5..","..xPS6..":"..yPS6..","..xPS7..":"..yPS7..","..xPS8..":"..yPS8)
				ss(5*1000)
				checkFightisOver()
				ss(5*1000)
			end
    end
  end

end


function selectChapter(cnum)
  local chapterTbl ={{860,504},{734,470},{635,488},{737,476}}
  local x1 = chapterTbl[cnum][1]
  local y1 = chapterTbl[cnum][2]
  tap(x1,y1)  --选取章节
  printFunction("--点击当前章节"..cnum..x1..y1)
  showHUDx("选取当前章节")
  waitRandomSS(35,55)
  local xPS, yPS = findImageInRegionFuzzy("discover.png", 90, 1360, 760, 1480, 820, 0xffffff)
  if xPS ~= -1 and yPS ~= -1 then
    tapR(xPS,yPS)
    printFunction("--点击探索")
    s(5*1000)
    discoverDetail()
  else
    printFunction("--没有找到当前章节，重新选取默认")
    showHUDx("没有找到当前章节，重新选取默认")
    waitRandomSS(40,65)
    selectDefaultChapter()
  end
end

function selectDefaultChapter()
  tap(1755,835) --选取最后一章
  printFunction("--点击最后一章")
  showHUDx("默认选取右边最后章节")
  waitRandomSS(30,55)
  local xPS, yPS = findImageInRegionFuzzy("discover.png", 90, 1360, 760, 1480, 820, 0xffffff)
  if xPS ~= -1 and yPS ~= -1 then
    tap(xPS,yPS)
    printFunction("--点击探索")
    s(5*1000)
    discoverDetail()
  end
end

function selectSpecailChapter()
  local cnum = 1
  local x12, y12 = findColorInRegionFuzzy(0x1a1537, 95, 178, 178, 182, 182)
  local x13, y13 = findColorInRegionFuzzy(0x011020, 95, 178, 178, 182, 182)
  local x14, y14 = findColorInRegionFuzzy(0x570f0d, 95, 178, 178, 182, 182)
  if x12 ~= -1 and y12 ~= -1 then
    cnum = 2
  end

  if x13 ~= -1 and y13 ~= -1 then
    cnum = 3
  end

  if x14 ~= -1 and y14 ~= -1 then
    cnum = 4
  end
  return cnum
end


function swipRight()
  local xp, yp, dis = waitRandom(350,390), waitRandom(700,850),waitRandom(400,600)
  swip(xp+dis,yp,xp,yp)
  waitRandomSS(20,35)
end

function swipLeft()
  local xp, yp, dis = waitRandom(350,390), waitRandom(700,850),waitRandom(400,600)
  swip(xp,yp,xp+dis,yp)
  waitRandomSS(20,35)
end

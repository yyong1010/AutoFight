function discover()
  showHUDx("开始执行探索")
  local fighttimes = 0
  local aTimes = setting["discoverTimes"]
  local specailChapter = 1
  showHUD(runing,"请在选定章节内界面或探索界面执行脚本",18,"0xffffffff","0x4c000000",0,760,1020,400,50)
  ss()
  while(fighttimes < tonumber(aTimes)) do
    checkinvite()
    showHUDx("开始探索次数 "..tostring(fighttimes+1))
    local xLS, yLS = findMultiColorInRegionFuzzy(0x43331a,"1|1|0x43331b,6|6|0x3c2e1f,7|7|0x3d2e1e", 95, 1445, 934, 1455, 945) --出战式神的颜色
    if xLS ~= -1 and yLS ~= -1 then
      specailChapter = selectSpecailChapter() --特定章节
      discoverDetail()
    else
      if fighttimes > 0 then
        waitRandomSS(45,65)
        selectChapter(specailChapter)
      else
        selectDefaultChapter()
      end
    end

    ss(2*1000)
    local xLS, yLS =  findMultiColorInRegionFuzzy(0x43331a,"1|1|0x43331b,6|6|0x3c2e1f,7|7|0x3d2e1e", 95, 1445, 934, 1455, 945) --出战式神的颜色
    if xLS ~= -1 and yLS ~= -1 then
      tap(68,100)
      printFunction("--点击退出")
      ss(2*1000)
      local xBS, yBS = findMultiColorInRegionFuzzy(0xf4b25f,"4|0|0xf4b25f", 95, 1220, 600, 1224, 600)
      if xBS ~= -1 and yBS ~= -1 then
        printFunction("--点击退出:"..xBS..":"..yBS)
        tap(xBS,yBS)
        ss(5*1000)
      end
    end
    checkisBox()
    fighttimes = fighttimes + 1
  end
  showHUDx("结束执行探索")
end


function discoverDetail()
  local i,j = 0,0
  local bossIsKO = false
  local onlyExp = setting["onlyExp"]
  local disSwipTimes = tonumber(setting["disSwipTimes"]) or 5
  while(i < disSwipTimes and not bossIsKO) do
    checkinvite()
    swipRight(nil,nil,300)
    printFunction("--向右划"..i)
    i = i + 1
    if onlyExp == "0" then
      bossIsKO = checkExpModels()
    else
      bossIsKO = swap()
    end
  end


  while(j < disSwipTimes and not bossIsKO) do
    checkinvite()
    swipLeft(nil,nil,300)
    printFunction("--向左划"..j)
    j = j + 1
    if onlyExp == "0" then
      bossIsKO = checkExpModels()
    else
      bossIsKO = swap()
    end
  end

  checkisBackField()
end

function checkGift()
  for x=600,1250,25 do
    --local xB, yB = findImageInRegionFuzzy("gift.png", 80, x, 432, x+200, 863, 0)
    local xB, yB = findMultiColorInRegionFuzzy(0xfff4d3,"16|10|0x783015,35|20|0xfff4d3,35|4|0xfff4d3,-1|18|0xfff5d3",95, x, 432, x+200, 863)
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
  local isHaveFight = true
  local bossIsKO = false
  local i = 1
  while (isHaveFight) do
    checkinvite()
    printFunction("--搜索次数"..i)
    isHaveFight = false
    --for x=200,1400,200 do
    keepScreen(true)
    local xS, yS = findMultiColorInRegionFuzzy(0x414a7b,"16|3|0xd5d5f6,12|10|0xfcfdfe,5|11|0xf0f0fe", 95,  0, 150, 1900, 950)
    keepScreen(false)
    if xS~= -1 and yS ~=-1 then
      tap(xS,yS)
      printFunction("--点击战斗".."x:"..xS.."y:"..yS)
      ss(5*1000)
      if checkIsClick() then
        checkFightisOver(true)
        checkisBackField()
        isHaveFight = true
      end
    end
    -- end
    keepScreen(true)
    --local xB, yB = findImageInRegionFuzzy("bossfight.png", 70, 753, 150, 1270, 600, 0xffffff)
    --local xB, yB =findMultiColorInRegionFuzzy(0x4a588a,"-5|9|0xebc374,5|8|0xd91212,-11|-7|0x2f1e16", 90,753, 150, 1270, 600)
    local xB, yB =findMultiColorInRegionFuzzy(0xddbb66,"0|7|0xa62a2a,15|7|0xf5dcd4,15|-2|0x452c4d", 90,753, 150, 1270, 600)
    keepScreen(false)
    if xB~= -1 and yB ~=-1 then
      tap(xB,yB)
      printFunction("--点击BOSS战斗".."x:"..xB.."y:"..yB)
      ss(5*1000)
      if checkIsClick() then
        local fightstatus = checkFightisOver(true)
        checkisBackField()
        --ss(10*1000)
        --checkGift()
        --ss(5*1000)
        if fightstatus > 0 then
          bossIsKO = true
          break
        end
      end
    end

    --x,y = findMultiColorInRegionFuzzy(0x2d1c08,"-5|-10|0xe4ceab,-8|1|0xe0cf9e,8|-2|0xae9c78,0|9|0xe2d09c,1|22|0xfca911",90,y, 540, y+48, 892);
    --printFunction("x:"..x.."y:"..y)
    --keepScreen(false)
    --end
    i = i + 1
  end
  return bossIsKO
end

function checkExpModels()
  printFunction("--只打经验怪")
  local isHaveFight = true
  local bossIsKO = false
  local i = 1
  while (isHaveFight) do
    checkinvite()
    printFunction("--搜索次数"..i)
    isHaveFight = false
    --for x=1700,1900,100 do
    keepScreen(true)
    --local xS, yS = findImageInRegionFuzzy("tofight2.png", 70, x, 300, x+320, 950, 0xffffff)
    local xS, yS = findMultiColorInRegionFuzzy(0x414a7b,"16|3|0xd5d5f6,12|10|0xfcfdfe,5|11|0xf0f0fe", 95,  0, 150, 1900, 950)
    keepScreen(false)
    if xS~= -1 and yS ~=-1 then
      printFunction("有找到 "..xS..":"..yS)
      keepScreen(true)
      local xPS1, yPS1 = findMultiColorInRegionFuzzy(0x3e7d86,"6|1|0x2e6575,5|7|0x8b8a8a,5|12|0x7a1313,2|14|0x9b2121,8|14|0x851f1e",90,xS-250, yS, xS+250, yS+550)
      --local xPS1, yPS1 = findImageInRegionFuzzy("exp1.png", 70, xS-200, yS, x+200, yS+250, 0x000000)
      local xPS2, yPS2 = findMultiColorInRegionFuzzy(0x5e8e8e,"3|-2|0x2e5974,3|2|0xb87565,2|5|0x7a1f16,-1|5|0x7c635e",90,xS-250, yS, xS+250, yS+550)
      keepScreen(false)
      printFunction("找点 "..xPS1..":"..yPS1..","..xPS2..":"..yPS2)
      if (xPS1 ~= -1 and yPS1 ~= -1) or (xPS2 ~= -1 and yPS2 ~= -1)then
        tap(xS,yS)
        printFunction("--点击战斗".."x:"..xS.."y:"..yS)
        ss(5*1000)
        if checkIsClick() then
          checkFightisOver(true)
          checkisBackField()
          isHaveFight = true
        end
      end
    end
    keepScreen(true)
    --local xB, yB = findImageInRegionFuzzy("bossfight.png", 70, 753, 150, 1270, 600, 0xffffff)
    --local xB, yB =findMultiColorInRegionFuzzy(0x4a588a,"-5|9|0xebc374,5|8|0xd91212,-11|-7|0x2f1e16", 90,753, 150, 1270, 600)
    local xB, yB =findMultiColorInRegionFuzzy(0xddbb66,"0|7|0xa62a2a,15|7|0xf5dcd4,15|-2|0x452c4d", 90,753, 150, 1270, 600)
    keepScreen(false)
    if xB~= -1 and yB ~=-1 then
      tap(xB,yB)
      printFunction("--点击BOSS战斗".."x:"..xB.."y:"..yB)
      ss(5*1000)
      if checkIsClick() then
        local fightstatus = checkFightisOver(true)
        checkisBackField()
        --ss(10*1000)
        --checkGift()
        --ss(5*1000)
        if fightstatus > 0 then
          bossIsKO = true
          break
        end
      end
    end
    --end
    i = i + 1
  end
  return bossIsKO
end


function selectChapter(cnum)
  checkinvite()
  local chapterTbl ={{860,504},{734,470},{635,488},{737,476}}
  local x1 = chapterTbl[cnum][1]
  local y1 = chapterTbl[cnum][2]
  tap(x1,y1)  --选取章节
  printFunction("--点击当前章节"..cnum..x1..y1)
  showHUDx("选取当前章节")
  waitRandomSS(35,55)
  checkinvite()
  --local xPS, yPS = findImageInRegionFuzzy("discover.png", 90, 1360, 760, 1480, 820, 0xffffff)
  local xPS, yPS =findMultiColorInRegionFuzzy(0xf4b25f,"8|-2|0xf4b25f,3|4|0xf4b25f,-2|3|0xf4b25f", 95,1425,765,1435,775)
  if xPS ~= -1 and yPS ~= -1 then
    tapR(xPS,yPS)
    printFunction("--点击探索")
    checkisBackField()
    discoverDetail()
  else
    printFunction("--没有找到当前章节，重新选取默认")
    showHUDx("没有找到当前章节，重新选取默认")
    waitRandomSS(40,65)
    selectDefaultChapter()
  end
end

function selectDefaultChapter()
  checkinvite()
  tap(1755,835) --选取最后一章
  printFunction("--点击最后一章")
  showHUDx("默认选取右边最后章节")
  waitRandomSS(30,55)
  checkinvite()
  --local xPS, yPS = findImageInRegionFuzzy("discover.png", 90, 1360, 760, 1480, 820, 0xffffff)
  local xPS, yPS =findMultiColorInRegionFuzzy(0xf4b25f,"8|-2|0xf4b25f,3|4|0xf4b25f,-2|3|0xf4b25f", 95,1425,765,1435,775)
  if xPS ~= -1 and yPS ~= -1 then
    tap(xPS,yPS)
    printFunction("--点击探索")
    checkisBackField()
    discoverDetail()
  end
end

function selectSpecailChapter()
  checkinvite()
  local cnum = 1
  local x12, y12 = findMultiColorInRegionFuzzy(0x2a336d,"13|4|0x202252,24|3|0x1b1639,12|9|0x1c1c42", 95,114,155,140,170)
  local x13, y13 = findMultiColorInRegionFuzzy(0x001a2b,"5|0|0x0e3a4e,10|0|0x236d86,7|3|0x236c85", 95,114,155,140,170)
  local x14, y14 = findMultiColorInRegionFuzzy(0x640d0a,"6|0|0x610a08,27|0|0x190d0c,23|18|0x3b2012", 95,225,210,256,231)
  if x12 ~= -1 and y12 ~= -1 then
    cnum = 2
  end

  if x13 ~= -1 and y13 ~= -1 then
    cnum = 3
  end

  if x14 ~= -1 and y14 ~= -1 then
    cnum = 4
  end
  printFunction("返回特定章节："..cnum)
  return cnum
end

function checkIsClick()
  checkinvite()
  local i = 0
  local isClick = false
  while (i < 10) do
    local x, y =  findMultiColorInRegionFuzzy(0x43331a,"1|1|0x43331b,6|6|0x3c2e1f,7|7|0x3d2e1e", 95, 1445, 934, 1455, 945) --出战式神的颜色
    if x == -1 then
      printFunction("找不到啦")
      isClick = true
      break
    end
    ss(500)
    i = i + 1
  end
  printFunction("检查是否有点到"..tostring(isClick))
  return isClick
end

function checkisBackField()
  checkinvite()
  printFunction("检查是否回探索界面")
  while true do
    local xLS, yLS =  findMultiColorInRegionFuzzy(0x43331a,"1|1|0x43331b,6|6|0x3c2e1f,7|7|0x3d2e1e", 95, 1445, 934, 1455, 945) --出战式神的颜色
    if xLS ~= -1 and yLS ~= -1 then
      printFunction("已经回探索界面")
      break
    end
  end
end

function checkisBox()
  if setting["checkBox"] == "0" then
    checkinvite()
    printFunction("检查是否有箱子")
    local i = 1
    local disX,disY = 0,0
    while i < 5 do
      local xLS, yLS = findMultiColorInRegionFuzzy(0x4f282a,"0|7|0xd8531c,10|8|0xdbaa45,10|22|0xb63819,26|22|0x4d0405,29|11|0x925b18", 90, 418, 187, 1477, 861)
      if xLS ~= -1 and yLS ~= -1 then
        printFunction("找到箱子")
        tap(xLS,yLS)
        disX = _fsh/2 - xLS
        disY = _fsw/2 - yLS
        checkisFuWa()
        tap(_fsh/2 + disX,_fsw/2 + disY)
        printFunction("disX:"..disX..",disY:"..disY)
        break
      end
      ss(1000)
      i = i + 1
    end
  end
end




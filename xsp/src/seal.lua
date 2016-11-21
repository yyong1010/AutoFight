function sealDefault()
  showHUDx("开始执行妖气封印")
  local fighttimes = 0
  local aTimes = setting["sealTimes"]
  local sealType = {}
  sealType = parseSealType(setting["sealType"])
  local fightresult = 0
	local createisOK = true

  showHUD(runing,"请在厅院(卷轴打开)或组队界面执行脚本",18,"0xffffffff","0x4c000000",0,760,1020,400,50)
  ss(5*1000)

  while(fighttimes < tonumber(aTimes) and createisOK) do
    showHUDx("正在执行妖气封印次数 "..tostring(fighttimes+1))
		createisOK = false
    fightresult = 0

    --local xLS, yLS = findImageInRegionFuzzy("team.png", 80, 300, 930, 430, 980, 0xffffff)
    local xLS, yLS = findColorInRegionFuzzy(0xe8e0cf, 100, 354, 909, 356, 911)  --庭院组队颜色
    --local xTS, yTS = findImageInRegionFuzzy("teamTitle.png", 80, 910, 70, 1000, 100, 0xffffff)
		local xTS, yTS = findMultiColorInRegionFuzzy(0xe7d6ce,"8|1|0xc39094,9|-8|0x6c3740,0|-8|0xc25f70", 95,1754,99,1765,110)
    if xTS ~=-1 and yTS ~= -1 then
			createisOK = true
      --local xBS, yBS = findImageInRegionFuzzy("dBottom.png", 90, 870, 150, 920, 210, 0xffffff)
			local xBS, yBS = findMultiColorInRegionFuzzy(0x23160c,"8|0|0x7b7262,8|4|0x645b4b,1|4|0x897e67", 95,890,170,901,176)
      if xBS ~=-1 and yBS ~= -1 then
        s(1000)
        selectSeal()
        ss()
        fightresult = findSeal(sealType)
      else
        tap(438,173)  --点击收缩菜单
        printFunction("--点击收缩菜单")
        s(1000)
        selectSeal()
        ss()
        fightresult = findSeal(sealType)
      end
    end

    if xLS ~= -1 and yLS ~= -1 then
			createisOK = true
      tapR(xLS,yLS)  --点击组队
      printFunction("--点击组队")
      ss(5*1000)
      selectSeal()
      ss()
      fightresult = findSeal(sealType)
    end
    if fightresult == 2 then
      fighttimes = fighttimes + 1
    end
  end
  showHUDx("结束执行妖气封印")
end


function findSeal(mName)
  local i =  1
  local isJoin = 0  --0没找到，1战斗失败，2战斗成功
  while (isJoin < 1) do
    for k,v in ipairs(mName) do

      printFunction("--寻找封印:"..v)
      isJoin = doSeal(v)

      if isJoin < 1 then
        tapR(1258,891)
        printFunction("--点击刷新")
        waitRandomSS(4,12)
			else
				printFunction("--退出刷新")
				break
      end
    end
  end
  printFunction("返回战斗结果:"..isJoin)
  return isJoin
end


function doSeal(mName)
  local isFound = 0
	if _fsw == 720 then
		mName = mName.."720"
	end
  for y=302,658,178 do
    local xS, yS = findImageInRegionFuzzy(mName..".png",  80, 480, y-25, 580, y+25, 0xffffff)

    if xS ~= -1 and yS ~= -1 then
      printFunction("--找到封印>>>>:"..mName)
      tapR(1513,yS)  --点击组队
      ss()
      --local xtS, ytS = findImageInRegionFuzzy("teamTitle.png", 90, 910, 70, 1000, 100, 0xffffff)
      --local xtBS, ytBS = findImageInRegionFuzzy("BteamTitle.png", 90, 910, 70, 1000, 100, 0xffffff)
      --[[
      local xUp, yUp = findColorInRegionFuzzy(0xdd6951, 100, 463, 873, 465, 876)
      --if (xtS == -1 and ytS == -1) and (xtBS == -1 and ytBS == -1) then
      if xUp ~= -1 and xUp ~= -1 then
        printFunction("--进入战斗>>>>:"..mName)
        checkFightisOver()
        isFound = true
        ss(5*1000)
        break
      end
      ]]
      isFound = teamWorkFight()
    end
  end
  return isFound
end

function selectSeal()
  local sealFound = setting["sealFound"]
  if sealFound == "1" then
    swipBottom()  --向下拉
    printFunction("--向下拉")
		tap(415,422)  --点击妖气封印
    printFunction("--点击妖气封印")
    ss(2*1000)
    
  else
    swipTop()  --向上拉
    printFunction("--向上拉")
    ss(1000)
    tap(370,272)
    printFunction("--点击全部")
    ss(2*1000)
  end

  tap(438,173)  --点击收缩菜单
  printFunction("--点击收缩菜单")
end

function parseSealType(st)
  local sst = {}

  if string.find(setting["sealType"], "0", 1) then
    sst[#sst+1] = "black"
  end
  if string.find(setting["sealType"], "1", 1) then
    sst[#sst+1] = "bird"
  end
  if string.find(setting["sealType"], "2", 1) then
    sst[#sst+1] = "jiaotu"
  end
	if string.find(setting["sealType"], "3", 1) then
    sst[#sst+1] = "sea"
  end
  return sst
end

function swipBottom()
  local xp, yp = 400, 682
  swip(xp,yp,xp,yp-300)
  ss(2*1000)
end

function swipTop()
  local xp, yp = 400, 382
  swip(xp,yp,xp,yp+300)
  ss(2*1000)
end

function ocrSeal()

	dict = createOcrDict("dm_soft.txt")
	result = ocrText(dict, 319, 426, 411, 462,{"0x272420-0x555555"},90,0,0)
	--printTable(result)
	printFunction(result)

end


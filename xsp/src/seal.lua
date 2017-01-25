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
    checkinvite()
    showHUDx("正在执行妖气封印次数 "..tostring(fighttimes+1))
		createisOK = false
    fightresult = 0


    --local xLS, yLS = findMultiColorInRegionFuzzy(0xcbc7b6,"5|0|0x9360a4,5|3|0xa27cb3,0|3|0xc8c4b3", 90,402,956,407,959) --庭院组队颜色
		local xLS, yLS = findMultiColorInRegionFuzzy(0xe3e3e3,"22|25|0xe2e2e2,43|32|0x733aa1,39|20|0xa16ec3",90,375,933,418,965) --庭院组队颜色(节日)
    --local xTS, yTS = findImageInRegionFuzzy("teamTitle.png", 80, 910, 70, 1000, 100, 0xffffff)
		local xTS, yTS = findMultiColorInRegionFuzzy(0xcc5e74,"7|0|0xffd9d9,7|5|0xe6d5d5,0|5|0xe8d7cf", 90,1791,181,1798,186)--组队界面右上角大叉颜色
    if xTS ~=-1 and yTS ~= -1 then
      printFunction("-->>>>已经在组队界面")
			createisOK = true

      selectSeal()
      ss()
      fightresult = findSeal(sealType)

    end

    if xLS ~= -1 and yLS ~= -1 then
      printFunction("-->>>>在庭院界面")
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
    ss(5*1000)
    printFunction("-->>>>循环结束")
  end
  showHUDx("结束执行妖气封印")
end


function selectSeal()
  checkinvite()
  local sealFound = setting["sealFound"]
  if sealFound == "1" then
    swipBottom(400,682,300)  --向下拉
    printFunction("--向下拉")
    ss()
    checkinvite()
		--tap(374,581)  --点击妖气封印
		tap(374,465)
    printFunction("--点击妖气封印")
    ss(2*1000)
  else
    swipTop(400,382,300)  --向上拉
    printFunction("--向上拉")
    ss(1000)
    checkinvite()
    tap(377,222)
    printFunction("--点击全部")
    ss(2*1000)
  end

end

function parseSealType(st)
  local sst
  if string.find(setting["sealType"], "0", 1) then
    sst = "all"
  end
  if string.find(setting["sealType"], "1", 1) then
    sst = "black"
  end
  if string.find(setting["sealType"], "2", 1) then
    sst = "jiaotu"
  end
	if string.find(setting["sealType"], "3", 1) then
    sst = "sea"
  end

  return sst
end


function ocrSeal()

	dict = createOcrDict("dm_soft.txt")
	result = ocrText(dict, 319, 426, 411, 462,{"0x272420-0x555555"},90,0,0)
	--printTable(result)
	printFunction(result)

end


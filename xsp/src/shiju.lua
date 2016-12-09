function shijuDefault()
  local fighttimes = 0
	local fightresult = 0
  local createisOK = true

  showHUD(runing,"请在厅院(卷轴打开)或组队界面执行脚本",18,"0xffffffff","0x4c000000",0,760,1020,400,50)
  ss(5*1000)

  while(fighttimes < 1  and createisOK) do
    checkinvite()
    showHUDx("正在执行石距")
    createisOK = false

    --local xLS, yLS = findImageInRegionFuzzy("team.png", 80, 300, 930, 430, 980, 0xffffff)
    local xLS, yLS = findColorInRegionFuzzy(0xe8e0cf, 100, 354, 909, 356, 911) --庭院组队颜色
    local xTS, yTS = findMultiColorInRegionFuzzy(0xcc5e74,"7|0|0xffd9d9,7|5|0xe6d5d5,0|5|0xe8d7cf", 90,1791,181,1798,186)--组队界面右上角大叉颜色
    if xTS ~=-1 and yTS ~= -1 then
      printFunction("-->>>>已经在组队界面")
      createisOK = true
        selectShiju()
				ss()
        fightresult = findTeamWork()

    end

    if xLS ~= -1 and yLS ~= -1 then
       createisOK = true
      tapR(xLS,yLS)  --点击组队
      printFunction("--点击组队")
      ss(5*1000)
      selectShiju()
      ss()
      fightresult = findTeamWork()
    end
    if fightresult == 2 then
      fighttimes = fighttimes + 1
    end
  end
  showHUDx("结束执行石距")
end


function selectShiju()
  swipBottom(400,682,300)  --向下拉
  printFunction("--向下拉")
  checkinvite()

  tapR(371,688)  --点击石距
  printFunction("--点击石距")
  ss(2*1000)
end


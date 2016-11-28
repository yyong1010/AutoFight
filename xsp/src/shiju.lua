function shijuDefault()
  local fighttimes = 0
	local fightresult = 0

  showHUD(runing,"请在厅院(卷轴打开)或组队界面执行脚本",18,"0xffffffff","0x4c000000",0,760,1020,400,50)
  ss(5*1000)

  while(fighttimes < 1) do
    showHUDx("正在执行石距")

    --local xLS, yLS = findImageInRegionFuzzy("team.png", 80, 300, 930, 430, 980, 0xffffff)
    local xLS, yLS = findColorInRegionFuzzy(0xe8e0cf, 100, 354, 909, 356, 911) --庭院组队颜色
    local xTS, yTS = findMultiColorInRegionFuzzy(0xe7d6ce,"8|1|0xc39094,9|-8|0x6c3740,0|-8|0xc25f70", 95,1754,99,1765,110)
    if xTS ~=-1 and yTS ~= -1 then
      local xBS, yBS = findMultiColorInRegionFuzzy(0x23160c,"8|0|0x7b7262,8|4|0x645b4b,1|4|0x897e67", 95,890,170,901,176)
      if xBS ~=-1 and yBS ~= -1 then
        s(1000)
        selectShiju()
				ss()
        fightresult = findShiju()
      else
        tap(438,173)  --点击收缩菜单
        printFunction("--点击收缩菜单")
        s(1000)
        selectShiju()
        ss()
        fightresult = findShiju()
      end
    end

    if xLS ~= -1 and yLS ~= -1 then
      tapR(xLS,yLS)  --点击组队
      printFunction("--点击组队")
      ss(5*1000)
      selectShiju()
      ss()
      fightresult = findShiju()
    end
    if fightresult == 2 then
      fighttimes = fighttimes + 1
    end
  end
  showHUDx("结束执行石距")
end

--[[
function findShiju()
  local i =  1
  local isJoin = 0
  while (isJoin < 1) do

    printFunction("--寻找石距:")
    isJoin = doTeamWork()

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
]]


function doShiju()
  local isFound = false

  local xS, yS = findColorInRegionFuzzy(0xf4b25f, 100, 1491, 302, 1493, 305) --第一个组队按钮

  if xS ~= -1 and yS ~= -1 then
    printFunction("--找到石距>>>>:")
    tapR(xS,yS)  --点击组队
    s(1500)
    --local xtS, ytS = findImageInRegionFuzzy("teamTitle.png", 90, 910, 70, 1000, 100, 0xffffff)
    --local xtBS, ytBS = findImageInRegionFuzzy("BteamTitle.png", 90, 910, 70, 1000, 100, 0xffffff)
    local xUp, yUp = findColorInRegionFuzzy(0xdd6951, 100, 463, 873, 465, 876)
    --if (xtS == -1 and ytS == -1) and (xtBS == -1 and ytBS == -1) then
    if xUp ~= -1 and xUp ~= -1 then
      printFunction("--进入战斗>>>>:")
      if checkFightisOver() > 0 then
        isFound = true
      end
      ss(5*1000)
    end
  end

  return isFound
end

function selectShiju()
  swipBottom()  --向下拉
  printFunction("--向下拉")

  tapR(384,521)  --点击石距
  printFunction("--点击石距")
  ss(2*1000)

  tap(438,173)  --点击收缩菜单
  printFunction("--点击收缩菜单")
end


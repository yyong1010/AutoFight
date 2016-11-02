function jiejiedefault()
  showHUDx("开始执行结界突破")
  local fighttimes = 0
  local aTimes = setting["jiejieTimes"]

  local xPS, yPS = findImageInRegionFuzzy("jiejie.png", 90, 550, 970, 690, 1048, 0xffffff)
  local xQs, yQs = findImageInRegionFuzzy("jiejietitle.png", 50, 890, 60, 1000, 100, 0xffffff)

  printFunction("x:"..xPS.."y:"..yPS)
  if (xPS ~= -1 and yPS ~= -1) or (xQs ~= -1 and yQs ~= -1) then
    if (xPS ~= -1 and yPS ~= -1) then
      tap(xPS,yPS+25)--点击觉醒
      printFunction("--点击结界突破")
      s(5*1000)
    end

    while(fighttimes < tonumber(aTimes)) do
      showHUDx("开始突破结界次数 "..tostring(fighttimes+1))
      local xJs, yJs = 572, 253
      local ax, ay = 492, 180
      local colorjiejie = 0xa4937b
      --循环第一行
      for i=1,3 do
        printFunction("循环第一行"..i)
				showHUDx("开始突破结界次数 "..tostring(fighttimes+1)..":1行"..i)
        fightjiejie(xJs,yJs,colorjiejie)
        xJs = xJs + ax
      end

      --循环第二行
      xJs = 572
      yJs = yJs + ay
      for i=1,3 do
        printFunction("循环第二行"..i)
				showHUDx("开始突破结界次数 "..tostring(fighttimes+1)..":2行"..i)
        fightjiejie(xJs,yJs,colorjiejie)
        xJs = xJs + ax
      end

      --循环第三行
      xJs = 572
      yJs = yJs + ay
      for i=1,3 do
        printFunction("循环第三行"..i)
				showHUDx("开始突破结界次数 "..tostring(fighttimes+1)..":3行"..i)
        fightjiejie(xJs,yJs,colorjiejie)
        xJs = xJs + ax
      end

      fighttimes = fighttimes + 1
    end

		ss(5*1000)
		tap(1772,96)
		printFunction("点击退出")
  else
    showHUDx("请在探索界面执行脚本")
    ss(5*1000)
	end
  showHUDx("结束执行结界突破")
end


function fightjiejie(xa,ya,colorjiejie)
  local xUp, yUp = findColorInRegionFuzzy(colorjiejie, 100, xa-5, ya-5, xa+5, ya+5)
  local xUq, yUq = findImageInRegionFuzzy("jiejiejiangpai.png", 60, xa-15, ya-15, xa+15, ya+15, 0xffffff)

  if (xUp ~= -1 and yUp~= -1)then
    tap(xUp, yUp) -- 选取
    s(1000)
    tap(xUp, yUp+116) -- 开始战斗
    checkFightisOver()--检查战斗是否结束
    checkisBack()--检查界面是否已回到可选界面
    checkisFuWa()--检查福娃
    s(1000)
  end
  if (xUq ~= -1 and yUq~= -1) then
    tap(xUq, yUq) -- 选取
    s(1000)
    tap(xUq, yUq+116) -- 开始战斗
    checkFightisOver()--检查战斗是否结束
    checkisBack()--检查界面是否已回到可选界面
    checkisFuWa()--检查福娃
    s(1000)
  end
end

function checkisFuWa()
  local i = 1
  while(i < 10) do
    local xFs, yFs = findImageInRegionFuzzy("fuwa.png", 90, 890, 610, 1020, 670, 0xffffff)
    if xFs ~= -1 and yFs~= -1 then
      tap(948,556) --点击屏幕
      printFunction("--点击屏幕点福娃")
      ss(5*1000)
      tap(948,556) --点击屏幕
      printFunction("--点击屏幕收奖励")
      ss(5*1000)
      break
    end
    i = i +1
  end
end

function checkisBack()
  local i = 1
  while(i < 10) do
    local xFs, yFs = findImageInRegionFuzzy("jiejietitle.png", 50, 890, 60, 1000, 100, 0xffffff)
    if xFs ~= -1 and yFs~= -1 then
      printFunction("--返回选取界面")
      break
    end
    ss(2*1000)
    i = i +1
  end
  printFunction("--超时返回选取界面")
end

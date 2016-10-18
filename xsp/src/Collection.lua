function collect()
	--多点色找矿，以有矿的图标为准	
	tap(765,470);tap(1740,120)
	s()
	while (true) do 
		zoomout()--缩放准备
		s()
		local xZOF, yZOF = findImageInRegionFuzzy("ZoomOutFinish.png", 90, 1200, 120, 1600, 500, 0xffffff)
		if xZOF ~= -1 and yZOF ~= -1 then
			break
		end
	end
	ss()
	showHUD(runing,"收集进行中...",16,"0xffffffff","0x4c000000",0,1300,38,200,50)
	for i=1,tonumber(setting["CycleIndex"]) do
		local xMine, yMine = findMultiColorInRegionFuzzy2(0x000000, {{x=-3, y=31, color=0x000000},{x=5, y=0, color=0x000000},{x=10, y=0, color=0x000000},{x=15, y=0, color=0x000000}},100, 400, 120, 1600, 1079)
		if xMine ~= -1 and yMine ~= -1 then
			tap(xMine+5, yMine+50)
		end
	end
end
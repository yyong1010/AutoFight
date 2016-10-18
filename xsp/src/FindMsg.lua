function newMsg()
	local count = 1
	while (true) do	
		--循环计数，每5min执行一次收集
		if count == 1 and string.find(setting["BasicFunction"], "1", 1) then
			collect()
		end
		
		if count >= (tonumber(setting["Interval"])/2) then
			count = 1
		end
		count = count + 1
		--检查是否有新消息
		s(2000)--降低频率
		tap(765,470);tap(1740,120)--保持在线并维持默认状态
		showHUD(runing,"等待新消息",16,"0xffffffff","0x4c000000",0,1300,38,200,50)
		local xN, yN = findColorInRegionFuzzy(0xf00810, 100, 45, 380, 75, 400)
		if xN ~= -1 and yN ~= -1 then
			HaveMsg = true
			break
		end
	end
end

function FindDonateMsg()--寻找新的增援消息
	tap(42,475)--打开信息栏
	showHUD(runing,"寻找新的增援消息中...",16,"0xffffffff","0x4c000000",0,1300,38,200,50)
	s()
	
	local FindMsg = false
	
	local xUp, yUp = findColorInRegionFuzzy(0xb0d401, 100, 675, 345, 680, 355)--找到向上按钮
	if xUp ~= -1 and yUp ~= -1 then
		tap(xUp+5,yUp)--点按向上按钮
		ss()
	end
	
	local xD, yD = findColorInRegionFuzzy(0x60af10, 100, 280, 300, 370, 1079)--找到增援按钮
	if xD ~= -1 and yD ~= -1 then
		local xWarText1, yWarText1 = findImageInRegionFuzzy("WarText1.png", 90, 0, yD-280, 728, yD, 0xffffff)--圆体版
		local xWarText2, yWarText2 = findImageInRegionFuzzy("WarText2.png", 90, 0, yD-280, 728, yD, 0xffffff)--黑体版
		if ((xWarText1 ~= -1 and yWarText1 ~= -1) or (xWarText2 ~= -1 and yWarText2 ~= -1)) and setting["Filter"] == "0" then
			--看到部落战字样，则什么也不做，寻找下一个
		else
			FindMsg = true
			tap(xD+50,yD)--点按增援按钮
			s()
		end
	end

	if not FindMsg then--如果已找到增援按钮则不再向下寻找
		local xDown, yDown = findColorInRegionFuzzy(0xb0d503, 100, 690, 1030, 700, 1050)--找到向下按钮
		if xDown ~= -1 and yDown ~= -1 then
			tap(xDown+5,yDown)
			ss()
		end

		local xD, yD = findColorInRegionFuzzy(0x60af10, 100, 280, 300, 370, 1079)--找到增援按钮
		if xD ~= -1 and yD ~= -1 then
			local xWarText1, yWarText1 = findImageInRegionFuzzy("WarText1.png", 85, 0, yD-280, 728, yD, 0xffffff)--圆体版
			local xWarText2, yWarText2 = findImageInRegionFuzzy("WarText2.png", 85, 0, yD-280, 728, yD, 0xffffff)--黑体版
			if ((xWarText1 ~= -1 and yWarText1 ~= -1) or (xWarText2 ~= -1 and yWarText2 ~= -1)) and setting["Filter"] == "0" then
				--看到部落战字样，则什么也不做，寻找下一个
			else
				FindMsg = true
				tap(xD+50,yD)--点按增援按钮
				s()
			end
		else
			HaveMsg = false
		end
	end
	
	if eDSF > 3 then
		HaveMsg = false
		eDSF = 0
	end
end
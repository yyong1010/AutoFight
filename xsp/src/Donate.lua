function donateDefault()
	local donateAble = true
	local GdonateAble, WdonateAble, AdonateAble = true, true, true
	
	while (donateAble) do
		showHUD(runing,"正在给予增援",16,"0xffffffff","0x4c000000",0,1300,38,200,50)
		
		local xPS, yPS = findImageInRegionFuzzy("D_PosionSpell.png", 90, 780, 550, 1200, 850, 0xffffff)--可以捐毒药法术
		local xES, yES = findImageInRegionFuzzy("D_EarthquakeSpell.png", 90, 780, 550, 1200, 850, 0xffffff)--可以捐地震法术
		local xHS, yHS = findImageInRegionFuzzy("D_HasteSpell.png", 90, 780, 550, 1200, 850, 0xffffff)--可以急速药法术
		if xHS ~= -1 and yHS ~= -1 and DSFable and string.find(setting["DrakSpell"], "2", 1) then
			tap(xHS,yHS+25)--捐一个急速
			HasteSpell = HasteSpell + 1 
			s()
		elseif xPS ~= -1 and yPS ~= -1 and DSFable and string.find(setting["DrakSpell"], "0", 1) then
			tap(xPS,yPS+25)--捐一个毒药
			PosionSpell = PosionSpell + 1 
			s()
		elseif xES ~= -1 and yES ~= -1 and DSFable and string.find(setting["DrakSpell"], "1", 1) then
			tap(xES,yES+25)--捐一个地震
			EarthquakeSpell = EarthquakeSpell + 1 
			s()
		else
			eDSF = eDSF + 1 --黑法术不可捐错误计数
		end
		
		if (Giant + Wizard + Archer < Max ) and (GdonateAble or WdonateAble or AdonateAble) then
			local xG, yG = findImageInRegionFuzzy("D_Giant.png", 65, 765, 70, 1755, 875, 0xffffff)--可以捐胖子
			if xG ~= -1 and yG ~= -1 and string.find(setting["DonateTroops"], "1", 1) then
				tap(xG+25,yG+25)--捐一个胖子
				Giant = Giant + 1 
				ss()
			else
				GdonateAble = false
			end
			
			local xW, yW = findImageInRegionFuzzy("D_Wizard.png", 65, 765, 70, 1755, 875, 0xffffff)--可以捐法师
			if xW ~= -1 and yW ~= -1 and string.find(setting["DonateTroops"], "2", 1)then
				tap(xW+25,yW+25)--捐一个法师
				Wizard = Wizard + 1
				ss()
			else
				WdonateAble = false
			end
			
			local xA, yA = findImageInRegionFuzzy("D_Archer.png", 65, 765, 70, 1755, 875, 0xffffff)--可以捐弓箭
			if xA ~= -1 and yA ~= -1 and string.find(setting["DonateTroops"], "0", 1) then
				tap(xA+25,yA+25)--捐一个弓箭
				Archer = Archer + 1
				ss()
			else
				AdonateAble = false
			end
			
		else
			donateAble = false
		end
		
		ss()
	end
	
	showHUD(runing,"已完成一次增援\n将补充生产",16,"0xffffffff","0x4c000000",0,1300,38,200,50)
	troopsDonatedCount = troopsDonatedCount + Giant*5 + Wizard*4 + Archer*1 + PosionSpell*5 + EarthquakeSpell*5 + HasteSpell*5
	showHUD(troopsDonated,"捐兵单位："..troopsDonatedCount,16,"0xffffffff","0x4c000000",0,1300,93,200,50)
end
function sealDefault()
  
  local fighttimes = 0
  local aTimes = setting["sealTimes"]
  local sealType = {}
  sealType = parseSealType(setting["sealType"])
  
  while(fighttimes < tonumber(aTimes)) do
    showHUD(runing,"working on sealTimes  "..fighttimes,16,"0xffffffff","0x4c000000",0,1300,38,200,50)
    
    local xLS, yLS = findImageInRegionFuzzy("team.png", 80, 300, 930, 430, 980, 0xffffff)
    local xTS, yTS = findImageInRegionFuzzy("teamTitle.png", 80, 910, 70, 1000, 100, 0xffffff)
    if xTS ~=-1 and yTS ~= -1 then
      local xBS, yBS = findImageInRegionFuzzy("dBottom.png", 90, 870, 150, 920, 210, 0xffffff)
      if xBS ~=-1 and yBS ~= -1 then
        s(1000)
        selectSeal()
      else 
        tap(438,173)  --点击收缩菜单
        printFunction("--点击收缩菜单")
        s(1000)
        selectSeal()
				ss()
				findSeal(sealType)		
      end
    end 
    
    if xLS ~= -1 and yLS ~= -1 then
      tap(xLS,yLS)  --点击组队
      printFunction("--点击组队")
      ss(5*1000)
      selectSeal()
			ss()
			findSeal(sealType)		
    end
        
		fighttimes = fighttimes + 1
  end
end


function findSeal(mName)
  local i =  1
  local isJoin = false	
  while (not isJoin) do
    for k,v in ipairs(mName) do 
			if not isJoin then 
				printFunction("--寻找封印:"..v)
				isJoin = doSeal(v)
			end
			if not isJoin then
		  tap(1258,891)
		  printFunction("--点击刷新")
      s(500)
			end 
		end
	end
end  


function doSeal(mName)
	local isFound = false
	for y=302,658,178 do
    local xS, yS = findImageInRegionFuzzy(mName..".png",  80, 480, y-25, 580, y+25, 0xffffff)
    if xS ~= -1 and yS ~= -1 then
			printFunction("--找到封印>>>>:"..mName)
      tap(1513,yS)  --点击组队   
     	s(500)
	    local xtS, ytS = findImageInRegionFuzzy("teamTitle.png", 90, 910, 70, 1000, 100, 0xffffff)
			local xtBS, ytBS = findImageInRegionFuzzy("BteamTitle.png", 90, 910, 70, 1000, 100, 0xffffff)
			if (xtS == -1 and ytS == -1) and (xtBS == -1 and ytBS == -1) then
				printFunction("--进入战斗>>>>:"..mName)
				checkFightisOver()
				ss(5*1000)
				isFound = true
				break
			end           
		end
	end	
	return isFound
end

function selectSeal()
  swipBottom()  --向下拉 
  printFunction("--向下拉")
  
  local xPS, yPS = findImageInRegionFuzzy("seal.png", 80, 350, 500, 460, 560, 0xffffff)
  if xLS ~= -1 and yLS ~= -1 then
    tap(xPS,yPS)  --点击妖气封印
    printFunction("--点击妖气封印")
    ss(2*1000)
  end
  
  tap(438,173)  --点击收缩菜单
  printFunction("--点击收缩菜单")
end

function parseSealType(st)
  local sst = {}
  
  if string.find(setting["sealType"], "0", 1) then
    sst[1] = "black"
  end
  if string.find(setting["sealType"], "1", 1) then
    sst[2] = "bird"
  end	
  return sst
end



function swipRight()
  local xp, yp = 382, 770
  swip(xp+500,yp,xp,yp)
  ss(2*1000)
end 

function swipLeft()
  local xp, yp = 382, 770
  swip(xp,yp,xp+500,yp)
  ss(2*1000)
end

function swipBottom()
  local xp, yp = 400, 682
  swip(xp,yp,xp,yp-300)
  ss(2*1000)
end

function test()
  local v = parserSeal("jiaotu")
  local x1,y1 = parserSealCoordinate(798, 280)
  local x2,y2 = parserSealCoordinate(885, 610)
  xS, yS = findImageInRegionFuzzy(v..".png",  70, x1,y1,x2,y2, 0)
  printFunction(v,xS,yS)
  xS, yS = findImageInRegionFuzzy(v..".png",  70, 798, 280,885, 610, 0)
  printFunction(v,xS,yS)



  v = parserSeal("black")

  xS, yS = findImageInRegionFuzzy(v..".png",  70, x1,y1,x2,y2, 0)
  printFunction(v,xS,yS)
  xS, yS = findImageInRegionFuzzy(v..".png",  70, 798, 280,885, 610, 0)
  printFunction(v,xS,yS)



  v = parserSeal("sea")

  xS, yS = findImageInRegionFuzzy(v..".png",  70, x1,y1,x2,y2, 0)
  printFunction(v,xS,yS)
  xS, yS = findImageInRegionFuzzy(v..".png",  70, 798, 280,885, 610, 0)
  printFunction(v,xS,yS)

end





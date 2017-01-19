
function test()
  local v = parserSeal("jiaotu")
  local x1,y1 = parserSealCoordinate(788, 250)
  local x2,y2 = parserSealCoordinate(985, 680)
  xS, yS = findImageInRegionFuzzy(v..".png",  60, x1,y1,x2,y2, 0)
  printFunction(v,xS,yS)
  xS, yS = findImageInRegionFuzzy(v..".png",  60, 788, 250,985, 680, 0)
  printFunction(v,xS,yS)



  v = parserSeal("black")

  xS, yS = findImageInRegionFuzzy(v..".png",  60, x1,y1,x2,y2, 0)
  printFunction(v,xS,yS)

  xS, yS = findImageInRegionFuzzy(v..".png",  60, 788, 250,985, 680, 0)

  printFunction(v,xS,yS)



  v = parserSeal("sea")

  xS, yS = findImageInRegionFuzzy(v..".png",  60, x1,y1,x2,y2, 0)
  printFunction(v,xS,yS)
  xS, yS = findImageInRegionFuzzy(v..".png",  60, 788, 250,985, 680, 0)
  printFunction(v,xS,yS)



end





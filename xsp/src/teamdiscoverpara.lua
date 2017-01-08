teamDisAsktb = {Name = "组队探索队长",
  {Name = "1选好友界面",
    Color = {
  {415,183,0x483726},
  {1163,172,0xc1a98f},
  {1196,195,0xab421a},
  {755,839,0xdd6951},
  {1163,842,0xf4b25f},
},
    Run = (function()
      tap(790,209)
      ss()
      tap(757,310)
      ss()
      tap(1163,843)
      ss(10*1000)
 end)
},

  {Name = "2进入界面",
    Color = {
  {62,97,0xedf5fd},
  {89,97,0x2c347f},
  {1720,34,0xd5c4a2},
  {1825,51,0xd5c4a2},
  {1508,976,0x2d211a},
  {1598,946,0x1e181c},
  {1618,988,0xf7f2df},
  {1647,1003,0x1e181c},
},
    Run = (function()
return true
 end)
},
sleep = 1000,
csim = 90

}


teamDisAnswertb = {Name = "组队探索队员",
{Name = "1探索主页面",
  Color = {
  {72,90,0xebf3fb},
  {109,89,0x314a7b},
  {863,37,0x371f0e},
  {1156,39,0x361e0d},
  {1444,32,0x381f0f},
  {1725,36,0xd6c5a3},
  {1820,33,0xd5c4a2},
  {1648,150,0x8c5a29},
  {65,993,0x272729},
},
  Run = (function()
    answeragain(1)
 end)
},

{Name = "7标准战斗场景",
  Color = {
  {64,37,0xd5c4a2},
  {163,33,0xd5c4a2},
  {270,37,0xd5c4a2},
  {1897,941,0x5a537d},
  {1908,982,0x464262},
  {1898,1012,0x3f3f60},
},
  Run = (function()
    checkFightisOver(true)
 end)
},

  {Name = "2进入界面",
    Color = {
  {62,97,0xedf5fd},
  {89,97,0x2c347f},
  {1720,34,0xd5c4a2},
  {1825,51,0xd5c4a2},
  {1508,976,0x2d211a},
  {1598,946,0x1e181c},
  {1618,988,0xf7f2df},
  {1647,1003,0x1e181c},
},
    Run = (function()
  local x, y = findMultiColorInRegionFuzzy(0xcc3c44,"16|4|0x402f1e,8|35|0xf9f9f0,5|55|0x534332", 90,59,685,75,740)
  printFunction("x:"..x.."y:"..y)
  if (x == -1) then
      tap(68,100)
      printFunction("--点击退出")
      ss(2*1000)
      local xBS, yBS = findMultiColorInRegionFuzzy(0xf4b25f,"4|0|0xf4b25f", 95, 1220, 600, 1224, 600)
      if xBS ~= -1 and yBS ~= -1 then
        printFunction("--点击退出:"..xBS..":"..yBS)
        tap(xBS,yBS)
        ss(5*1000)
      end
  end
 end)
},
sleep = 1000,
csim = 90

}


fightpara = {Name = "战斗结果检查",

{Name = "7战斗胜利",
  Color = {
    {715,245,0x7f1910},
    {683,297,0x991c12},
    {721,278,0xccbda8},
    {763,295,0x931b11},
    {897,314,0xc2ad73},
    {1134,261,0xd1b986},
    {1370,265,0xdcc798},
    {1482,353,0x8a673f},
  },
  Run = (function()
  tap(1127,896)
end)
},

{Name = "7战斗胜利福娃",
  Color = {
    {872,395,0xa12b26},
    {794,594,0x673113},
    {827,616,0x834825},
    {921,729,0x470f0f},
    {1063,725,0x350305},
  },
  Run = (function()
  tap(1127,896)
end)
},

{Name = "7战斗胜利奖励",
  Color = {
    {856,683,0xd88016},
    {955,663,0xd53745},
    {991,676,0xcbb69a},
    {1116,738,0xd19118},
    {1014,776,0xba441a},
    {956,823,0x000000},
    {995,913,0x6e280b},
    {1060,899,0x7f0d0e},
  },
  Run = (function()
  checkGetGiftisOver()
  return true
end)
},
sleep = 1000,
csim = 90
}

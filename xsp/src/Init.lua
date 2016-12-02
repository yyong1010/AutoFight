--HUD显示参数
runing = createHUD()			--用于显示当前状态


if not _isVIP then
    printFunction(">>>>当前运行版本为免费版")
    showHUD(runing,"当前运行版本为免费版,欢迎选购VIP版获得更多功能",18,"0xffffffff","0x4c000000",0,760,1020,400,50)
    setting["AutoDayWork"] = 1
    setting["AutoLockSreen"] = 1
    setting["onlyExp"] = 1
    setting["isJoinTeam"] = 1
    setting["autoChangeSS"] = 1
    setting["swiptimes"] = 1
else
    printFunction(">>>>当前运行版本为VIP版")
    showHUD(runing,"当前运行版本为VIP版,谢谢支持！",18,"0xffffffff","0x4c000000",0,760,1020,400,50)
end

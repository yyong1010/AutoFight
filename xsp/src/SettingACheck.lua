_isVIP = true

_isDebug = true

_fsw, _fsh = getScreenSize()
_sw = _fsh - 1
_sh = _fsw - 1


s()

printFunction("Global Value:")
--printFunction("_orientation:".._orientation, "_fsw:".._fsw, "_fsh:".._fsh, "_sw:".._sw, "_sh:".._sh)

local supportSize = (_fsw == 1080 and _fsh == 1920) or (_fsw == 720 and _fsh == 1280)--检测是否支持该分辨率
if(_fsw == 720)then
	setScreenScale(1080,1920,0)
end
if not supportSize then
  s()
  choiceIfRun = dialogRet("当前分辨率".."宽:".._fsw..",高:".._fsh.."无法正常妖气封印，其余功能可正常运行\n请使用1920*1080分辨率完美运行本脚本", "停止运行", "继续运行", "", 0)
  if choiceIfRun == 0 then
    lua_exit();
  end
  if choiceIfRun == 1 then
    setScreenScale(1080,1920,0)
  end
end



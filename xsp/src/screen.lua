screen = {
  is_colors = function (colortb,vsim)
    local vxp,vyp = colortb[1][1],colortb[1][2]
    local compara = {}
    for k,v in pairs(colortb)  do
      xdis = v[1] - vxp
      ydis = v[2] - vyp
      --vxp,vyp = v[1],v[2]
      --printFunction(">>>>"..v[3])
      compara[#compara + 1] = {x=xdis,y=ydis,color=v[3]}
    end

    --printTable(compara)

    xf,yf = findMultiColorInRegionFuzzy2(colortb[1][3],compara, vsim, 0,0,1919,1079)
    --xf, yy = findMultiColorInRegionFuzzy2(0x181F85, {{x=29, y=1, color=0x00BBFE},{x=103,y=-4,color=0x0B6BBE},{x=65,y=9,color=0x150972}}, 100, 0, 0,639, 959)
    if (xf ~= -1 and yf ~=-1) then
     return true
    end


  end,
  keep = function ()
      keepScreen(true)
  end,
  unkeep = function ()
      keepScreen(false)
  end

}

function _Do(_tab)
  -- 判断是否传入的是正确内容
  local check_table
  check_table = function(t)
    if type(t) ~= 'table' then error('传入非table内容',3) end
    if #t == 0 then error('传入table无数据',3) end
    if not (type(t.csim) == 'number' or type(t.csim) == 'nil') then error('相似度数值不正确',3) end

    if not (
      (
        type(t.Repeat) == 'table' and
        type(t.Repeat.n) == 'number' and
        type(t.Repeat.Run) == 'function'
        ) or
        type(t.Repeat) == 'nil'
        ) then
        error('重复检测参数不正确',3)
      end

      if not (
        (
          type(t.timeout) == 'table' and
          type(t.timeout.n) == 'number' and
          type(t.timeout.Run) == 'function'
          ) or
          type(t.timeout) == 'nil'
          ) then
          error('超时参数不正确',3)
        end

        for n, v in ipairs(t) do
          if not (
            type(v.Color) == 'table' and
            type(v.Run) == 'function' and
            (type(v.csim) == 'number' or type(v.csim) == 'nil') and
            (type(v.layer) == 'table' or type(v.layer) == 'nil')
            ) then
            error(
              string.format(
                "传入table第%d项不正确",
                n
              ),
              3
            )
          else
            for _n, _v in ipairs(v.Color) do
              if not (
                type(_v[1]) == 'number' and
                type(_v[2]) == 'number' and
                type(_v[3]) == 'number'
                ) then
                error(
                  string.format(
                    "传入table第%d项内点色第%d项不正确",
                    n,
                    _n
                  ),
                  3
                )
              end
            end
            if type(v.layer) == 'table' then
              check_table(v.layer)
            end
          end
        end
      end
      check_table(_tab)
      if _G.DoName then table.insert(DoName,_tab.Name) else _G.DoName = {_tab.Name} end
			printFunction("_tab.Name".._tab.Name)
      local _now = os.time()
      local _break = false
      local _Repeat = false
      for _key,_value in ipairs(_tab) do _value.RepeatTime = os.time() end
      if _tab.Begin then _tab.Begin() end
      while true do
        local _States = {}
        --寻找满足状态的项
        screen.keep()
        for _key,_value in ipairs(_tab) do
          if screen.is_colors(_value.Color, _value.csim or _tab.csim) then
            table.insert(_States,_key)
            if _tab.Repeat then
              if os.time() - _value.RepeatTime >= _tab.Repeat.n then
                _value.RepeatTime = os.time()
                if not _value.NoRepeat then _Repeat = true;printFunction(_value.Name..' 重复') end
              end
            end
          else
            _value.RepeatTime = os.time()
          end
        end
        screen.unkeep()
				
        --超时判断
        if #_States == 0 then
          if _tab.timeout then
            if os.time() - _now >= _tab.timeout.n then
              printFunction('超时')
              local _Back = _tab.timeout.Run()
              if _Back then return end
              if _tab.timeout.layer then _Do(_tab.timeout.layer) end
              _now = os.time()
            end
          end
        else
          --执行满足状态的项
          for _key,_value in ipairs(_States) do
            local _Handle = _tab[_value]
            printFunction(_Handle.Name)
            if _Handle.Run then if _Handle.Run() then _break = true end end
            if _Handle.layer then _Do(_Handle.layer) end
            _now = os.time()
          end
          if _break then
            printFunction("停止")
            break
          end
          if _Repeat then if _tab.Repeat.Run() then return end
          _Repeat=false
        end
      end

      ss(_tab.sleep or 500)
    end
    if _tab.End then _tab.End() end
    if type(_G.DoName) == 'table' then
      if #(_G.DoName) > 0 then
        table.remove(_G.DoName,#DoName)
      end
    end
  end


testtb ={{ Name = '庭院-展开卷轴',
  Color ={
	{96,86,0x2e437b},
	{848,48,0x311910},
	{1106,42,0xed6729},
	{1160,42,0x361d0d},
},
  Run = (function()
  tap(305,987)
end),
},sleep = 1000,
csim = 75}




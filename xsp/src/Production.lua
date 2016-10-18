function producting()
  if (Barbarian + Archer + Giant + WallBreaker + Balloon + Wizard + Healer + Dragon + PEKKA +Minion + HogRider + Valkyrie + Golem + Witch + LavaHound +LightningSpell + HealingSpell + RageSpell + JumpSpell + FreezeSpell +PosionSpell + EarthquakeSpell + HasteSpell > 0) then	
    while (true) do
      tap(83,785)--打开生产队列
      ss()
      local color = getColor(360, 925)
      if color == 0xe8e8e0 then
        break			
      else
        tap(1740,120);tap(765,470)--没恢复默认，再来一次
      end
    end
    showHUD(runing,"生产中...",16,"0xffffffff","0x4c000000",0,1300,38,200,50)
    
    if (Barbarian + Archer + Giant + WallBreaker + Balloon + Wizard + Healer + Dragon + PEKKA > 0) and (B1able or B2able or B3able or B4able) then
      
      --分工到每个营
      if B1able and B2able and B3able and B4able then--1,2,3,4可用
        
        local Barbarian4 = math.floor(Barbarian/4)
        if Barbarian%4 == 0 then
          B1Barbarian, B2Barbarian, B3Barbarian, B4Barbarian = Barbarian4, Barbarian4, Barbarian4, Barbarian4
        elseif Barbarian%4 == 1 then
          B1Barbarian, B2Barbarian, B3Barbarian, B4Barbarian = Barbarian4 + 1, Barbarian4, Barbarian4, Barbarian4
        elseif Barbarian%4 == 2 then
          B1Barbarian, B2Barbarian, B3Barbarian, B4Barbarian = Barbarian4 + 1, Barbarian4 + 1, Barbarian4, Barbarian4
        elseif Barbarian%4 == 3 then
          B1Barbarian, B2Barbarian, B3Barbarian, B4Barbarian = Barbarian4 + 1, Barbarian4 + 1, Barbarian4 + 1, Barbarian4
        end
        
        local Archer4 = math.floor(Archer/4)
        if Archer%4 == 0 then
          B1Archer, B2Archer, B3Archer, B4Archer = Archer4, Archer4, Archer4, Archer4
        elseif Archer%4 == 1 then
          B1Archer, B2Archer, B3Archer, B4Archer = Archer4 + 1, Archer4, Archer4, Archer4
        elseif Archer%4 == 2 then
          B1Archer, B2Archer, B3Archer, B4Archer = Archer4 + 1, Archer4 + 1, Archer4, Archer4
        elseif Archer%4 == 3 then
          B1Archer, B2Archer, B3Archer, B4Archer = Archer4 + 1, Archer4 + 1, Archer4 + 1, Archer4
        end
        
        local Giant4 = math.floor(Giant/4)
        if Giant%4 == 0 then
          B1Giant, B2Giant, B3Giant, B4Giant = Giant4, Giant4, Giant4, Giant4
        elseif Giant%4 == 1 then
          B1Giant, B2Giant, B3Giant, B4Giant = Giant4 + 1, Giant4, Giant4, Giant4
        elseif Giant%4 == 2 then
          B1Giant, B2Giant, B3Giant, B4Giant = Giant4 + 1, Giant4 + 1, Giant4, Giant4
        elseif Giant%4 == 3 then
          B1Giant, B2Giant, B3Giant, B4Giant = Giant4 + 1, Giant4 + 1, Giant4 + 1, Giant4
        end
        
        local Goblin4 = math.floor(Goblin/4)
        if Goblin%4 == 0 then
          B1Goblin, B2Goblin, B3Goblin, B4Goblin = Goblin4, Goblin4, Goblin4, Goblin4
        elseif Goblin%4 == 1 then
          B1Goblin, B2Goblin, B3Goblin, B4Goblin = Goblin4 + 1, Goblin4, Goblin4, Goblin4
        elseif Goblin%4 == 2 then
          B1Goblin, B2Goblin, B3Goblin, B4Goblin = Goblin4 + 1, Goblin4 + 1, Goblin4, Goblin4
        elseif Goblin%4 == 3 then
          B1Goblin, B2Goblin, B3Goblin, B4Goblin = Goblin4 + 1, Goblin4 + 1, Goblin4 + 1, Goblin4
        end
        
        local WallBreaker4 = math.floor(WallBreaker/4)
        if WallBreaker%4 == 0 then
          B1WallBreaker, B2WallBreaker, B3WallBreaker, B4WallBreaker = WallBreaker4, WallBreaker4, WallBreaker4, WallBreaker4
        elseif WallBreaker%4 == 1 then
          B1WallBreaker, B2WallBreaker, B3WallBreaker, B4WallBreaker = WallBreaker4 + 1, WallBreaker4, WallBreaker4, WallBreaker4
        elseif WallBreaker%4 == 2 then
          B1WallBreaker, B2WallBreaker, B3WallBreaker, B4WallBreaker = WallBreaker4 + 1, WallBreaker4 + 1, WallBreaker4, WallBreaker4
        elseif WallBreaker%4 == 3 then
          B1WallBreaker, B2WallBreaker, B3WallBreaker, B4WallBreaker = WallBreaker4 + 1, WallBreaker4 + 1, WallBreaker4 + 1, WallBreaker4
        end
        
        local Balloon4 = math.floor(Balloon/4)
        if Balloon%4 == 0 then
          B1Balloon, B2Balloon, B3Balloon, B4Balloon = Balloon4, Balloon4, Balloon4, Balloon4
        elseif Balloon%4 == 1 then
          B1Balloon, B2Balloon, B3Balloon, B4Balloon = Balloon4 + 1, Balloon4, Balloon4, Balloon4
        elseif Balloon%4 == 2 then
          B1Balloon, B2Balloon, B3Balloon, B4Balloon = Balloon4 + 1, Balloon4 + 1, Balloon4, Balloon4
        elseif Balloon%4 == 3 then
          B1Balloon, B2Balloon, B3Balloon, B4Balloon = Balloon4 + 1, Balloon4 + 1, Balloon4 + 1, Balloon4
        end
        
        local Wizard4 = math.floor(Wizard/4)
        if Wizard%4 == 0 then
          B1Wizard, B2Wizard, B3Wizard, B4Wizard = Wizard4, Wizard4, Wizard4, Wizard4
        elseif Wizard%4 == 1 then
          B1Wizard, B2Wizard, B3Wizard, B4Wizard = Wizard4, Wizard4, Wizard4, Wizard4 + 1
        elseif Wizard%4 == 2 then
          B1Wizard, B2Wizard, B3Wizard, B4Wizard = Wizard4, Wizard4, Wizard4 + 1, Wizard4 + 1
        elseif Wizard%4 == 3 then
          B1Wizard, B2Wizard, B3Wizard, B4Wizard = Wizard4, Wizard4 + 1, Wizard4 + 1, Wizard4 + 1
        end
        
        local Healer4 = math.floor(Healer/4)
        if Healer%4 == 0 then
          B1Healer, B2Healer, B3Healer, B4Healer = Healer4, Healer4, Healer4, Healer4
        elseif Healer%4 == 1 then
          B1Healer, B2Healer, B3Healer, B4Healer = Healer4 + 1, Healer4, Healer4, Healer4
        elseif Healer%4 == 2 then
          B1Healer, B2Healer, B3Healer, B4Healer = Healer4 + 1, Healer4 + 1, Healer4, Healer4
        elseif Healer%4 == 3 then
          B1Healer, B2Healer, B3Healer, B4Healer = Healer4 + 1, Healer4 + 1, Healer4 + 1, Healer4
        end
        
        local Dragon4 = math.floor(Dragon/4)
        if Dragon%4 == 0 then
          B1Dragon, B2Dragon, B3Dragon, B4Dragon = Dragon4, Dragon4, Dragon4, Dragon4
        elseif Dragon%4 == 1 then
          B1Dragon, B2Dragon, B3Dragon, B4Dragon = Dragon4 + 1, Dragon4, Dragon4, Dragon4
        elseif Dragon%4 == 2 then
          B1Dragon, B2Dragon, B3Dragon, B4Dragon = Dragon4 + 1, Dragon4 + 1, Dragon4, Dragon4
        elseif Dragon%4 == 3 then
          B1Dragon, B2Dragon, B3Dragon, B4Dragon = Dragon4 + 1, Dragon4 + 1, Dragon4 + 1, Dragon4
        end
        
        local PEKKA4 = math.floor(PEKKA/4)
        if PEKKA%4 == 0 then
          B1PEKKA, B2PEKKA, B3PEKKA, B4PEKKA = PEKKA4, PEKKA4, PEKKA4, PEKKA4
        elseif PEKKA%4 == 1 then
          B1PEKKA, B2PEKKA, B3PEKKA, B4PEKKA = PEKKA4 + 1, PEKKA4, PEKKA4, PEKKA4
        elseif PEKKA%4 == 2 then
          B1PEKKA, B2PEKKA, B3PEKKA, B4PEKKA = PEKKA4 + 1, PEKKA4 + 1, PEKKA4, PEKKA4
        elseif PEKKA%4 == 3 then
          B1PEKKA, B2PEKKA, B3PEKKA, B4PEKKA = PEKKA4 + 1, PEKKA4 + 1, PEKKA4 + 1, PEKKA4
        end
        
      elseif (not B1able) and B2able and B3able and B4able then--2,3,4可用
        
        local Barbarian3 = math.floor(Barbarian/3)
        if Barbarian%3 == 0 then
          B2Barbarian, B3Barbarian, B4Barbarian = Barbarian3, Barbarian3, Barbarian3
        elseif Barbarian%3 == 1 then
          B2Barbarian, B3Barbarian, B4Barbarian = Barbarian3 + 1, Barbarian3, Barbarian3
        elseif Barbarian%3 == 2 then
          B2Barbarian, B3Barbarian, B4Barbarian = Barbarian3 + 1, Barbarian3 + 1, Barbarian3
        end
        
        local Archer3 = math.floor(Archer/3)
        if Archer%3 == 0 then
          B2Archer, B3Archer, B4Archer = Archer3, Archer3, Archer3
        elseif Archer%3 == 1 then
          B2Archer, B3Archer, B4Archer = Archer3 + 1, Archer3, Archer3
        elseif Archer%3 == 2 then
          B2Archer, B3Archer, B4Archer = Archer3 + 1, Archer3 + 1, Archer3
        end
        
        local Giant3 = math.floor(Giant/3)
        if Giant%3 == 0 then
          B2Giant, B3Giant, B4Giant = Giant3, Giant3, Giant3
        elseif Giant%3 == 1 then
          B2Giant, B3Giant, B4Giant = Giant3 + 1, Giant3, Giant3
        elseif Giant%3 == 2 then
          B2Giant, B3Giant, B4Giant = Giant3 + 1, Giant3 + 1, Giant3
        end
        
        local Goblin3 = math.floor(Goblin/3)
        if Goblin%3 == 0 then
          B2Goblin, B3Goblin, B4Goblin = Goblin3, Goblin3, Goblin3
        elseif Goblin%3 == 1 then
          B2Goblin, B3Goblin, B4Goblin = Goblin3 + 1, Goblin3, Goblin3
        elseif Goblin%3 == 2 then
          B2Goblin, B3Goblin, B4Goblin = Goblin3 + 1, Goblin3 + 1, Goblin3
        end
        
        local WallBreaker3 = math.floor(WallBreaker/3)
        if WallBreaker%3 == 0 then
          B2WallBreaker, B3WallBreaker, B4WallBreaker = WallBreaker3, WallBreaker3, WallBreaker3
        elseif WallBreaker%3 == 1 then
          B2WallBreaker, B3WallBreaker, B4WallBreaker = WallBreaker3 + 1, WallBreaker3, WallBreaker3
        elseif WallBreaker%3 == 2 then
          B2WallBreaker, B3WallBreaker, B4WallBreaker = WallBreaker3 + 1, WallBreaker3 + 1, WallBreaker3
        end
        
        local Balloon3 = math.floor(Balloon/3)
        if Balloon%3 == 0 then
          B2Balloon, B3Balloon, B4Balloon = Balloon3, Balloon3, Balloon3
        elseif Balloon%3 == 1 then
          B2Balloon, B3Balloon, B4Balloon = Balloon3 + 1, Balloon3, Balloon3
        elseif Balloon%3 == 2 then
          B2Balloon, B3Balloon, B4Balloon = Balloon3 + 1, Balloon3 + 1, Balloon3
        end
        
        local Wizard3 = math.floor(Wizard/3)
        if Wizard%3 == 0 then
          B2Wizard, B3Wizard, B4Wizard = Wizard3, Wizard3, Wizard3
        elseif Wizard%3 == 1 then
          B2Wizard, B3Wizard, B4Wizard = Wizard3 + 1, Wizard3, Wizard3
        elseif Wizard%3 == 2 then
          B2Wizard, B3Wizard, B4Wizard = Wizard3 + 1, Wizard3 + 1, Wizard3
        end
        
        local Healer3 = math.floor(Healer/3)
        if Healer%3 == 0 then
          B2Healer, B3Healer, B4Healer = Healer3, Healer3, Healer3
        elseif Healer%3 == 1 then
          B2Healer, B3Healer, B4Healer = Healer3 + 1, Healer3, Healer3
        elseif Healer%3 == 2 then
          B2Healer, B3Healer, B4Healer = Healer3 + 1, Healer3 + 1, Healer3
        end
        
        local Dragon3 = math.floor(Dragon/3)
        if Dragon%3 == 0 then
          B2Dragon, B3Dragon, B4Dragon = Dragon3, Dragon3, Dragon3
        elseif Dragon%3 == 1 then
          B2Dragon, B3Dragon, B4Dragon = Dragon3 + 1, Dragon3, Dragon3
        elseif Dragon%3 == 2 then
          B2Dragon, B3Dragon, B4Dragon = Dragon3 + 1, Dragon3 + 1, Dragon3
        end
        
        local PEKKA3 = math.floor(PEKKA/3)
        if PEKKA%3 == 0 then
          B2PEKKA, B3PEKKA, B4PEKKA = PEKKA3, PEKKA3, PEKKA3
        elseif PEKKA%3 == 1 then
          B2PEKKA, B3PEKKA, B4PEKKA = PEKKA3 + 1, PEKKA3, PEKKA3
        elseif PEKKA%3 == 2 then
          B2PEKKA, B3PEKKA, B4PEKKA = PEKKA3 + 1, PEKKA3 + 1, PEKKA3
        end
        
      elseif B1able and (not B2able) and B3able and B4able then--1,3,4可用
        
        local Barbarian3 = math.floor(Barbarian/3)
        if Barbarian%3 == 0 then
          B1Barbarian, B3Barbarian, B4Barbarian = Barbarian3, Barbarian3, Barbarian3
        elseif Barbarian%3 == 1 then
          B1Barbarian, B3Barbarian, B4Barbarian = Barbarian3 + 1, Barbarian3, Barbarian3
        elseif Barbarian%3 == 2 then
          B1Barbarian, B3Barbarian, B4Barbarian = Barbarian3 + 1, Barbarian3 + 1, Barbarian3
        end
        
        local Archer3 = math.floor(Archer/3)
        if Archer%3 == 0 then
          B1Archer, B3Archer, B4Archer = Archer3, Archer3, Archer3
        elseif Archer%3 == 1 then
          B1Archer, B3Archer, B4Archer = Archer3 + 1, Archer3, Archer3
        elseif Archer%3 == 2 then
          B1Archer, B3Archer, B4Archer = Archer3 + 1, Archer3 + 1, Archer3
        end
        
        local Giant3 = math.floor(Giant/3)
        if Giant%3 == 0 then
          B1Giant, B3Giant, B4Giant = Giant3, Giant3, Giant3
        elseif Giant%3 == 1 then
          B1Giant, B3Giant, B4Giant = Giant3 + 1, Giant3, Giant3
        elseif Giant%3 == 2 then
          B1Giant, B3Giant, B4Giant = Giant3 + 1, Giant3 + 1, Giant3
        end
        
        local Goblin3 = math.floor(Goblin/3)
        if Goblin%3 == 0 then
          B1Goblin, B3Goblin, B4Goblin = Goblin3, Goblin3, Goblin3
        elseif Goblin%3 == 1 then
          B1Goblin, B3Goblin, B4Goblin = Goblin3 + 1, Goblin3, Goblin3
        elseif Goblin%3 == 2 then
          B1Goblin, B3Goblin, B4Goblin = Goblin3 + 1, Goblin3 + 1, Goblin3
        end
        
        local WallBreaker3 = math.floor(WallBreaker/3)
        if WallBreaker%3 == 0 then
          B1WallBreaker, B3WallBreaker, B4WallBreaker = WallBreaker3, WallBreaker3, WallBreaker3
        elseif WallBreaker%3 == 1 then
          B1WallBreaker, B3WallBreaker, B4WallBreaker = WallBreaker3 + 1, WallBreaker3, WallBreaker3
        elseif WallBreaker%3 == 2 then
          B1WallBreaker, B3WallBreaker, B4WallBreaker = WallBreaker3 + 1, WallBreaker3 + 1, WallBreaker3
        end
        
        local Balloon3 = math.floor(Balloon/3)
        if Balloon%3 == 0 then
          B1Balloon, B3Balloon, B4Balloon = Balloon3, Balloon3, Balloon3
        elseif Balloon%3 == 1 then
          B1Balloon, B3Balloon, B4Balloon = Balloon3 + 1, Balloon3, Balloon3
        elseif Balloon%3 == 2 then
          B1Balloon, B3Balloon, B4Balloon = Balloon3 + 1, Balloon3 + 1, Balloon3
        end
        
        local Wizard3 = math.floor(Wizard/3)
        if Wizard%3 == 0 then
          B1Wizard, B3Wizard, B4Wizard = Wizard3, Wizard3, Wizard3
        elseif Wizard%3 == 1 then
          B1Wizard, B3Wizard, B4Wizard = Wizard3 + 1, Wizard3, Wizard3
        elseif Wizard%3 == 2 then
          B1Wizard, B3Wizard, B4Wizard = Wizard3 + 1, Wizard3 + 1, Wizard3
        end
        
        local Healer3 = math.floor(Healer/3)
        if Healer%3 == 0 then
          B1Healer, B3Healer, B4Healer = Healer3, Healer3, Healer3
        elseif Healer%3 == 1 then
          B1Healer, B3Healer, B4Healer = Healer3 + 1, Healer3, Healer3
        elseif Healer%3 == 2 then
          B1Healer, B3Healer, B4Healer = Healer3 + 1, Healer3 + 1, Healer3
        end
        
        local Dragon3 = math.floor(Dragon/3)
        if Dragon%3 == 0 then
          B1Dragon, B3Dragon, B4Dragon = Dragon3, Dragon3, Dragon3
        elseif Dragon%3 == 1 then
          B1Dragon, B3Dragon, B4Dragon = Dragon3 + 1, Dragon3, Dragon3
        elseif Dragon%3 == 2 then
          B1Dragon, B3Dragon, B4Dragon = Dragon3 + 1, Dragon3 + 1, Dragon3
        end
        
        local PEKKA3 = math.floor(PEKKA/3)
        if PEKKA%3 == 0 then
          B1PEKKA, B3PEKKA, B4PEKKA = PEKKA3, PEKKA3, PEKKA3
        elseif PEKKA%3 == 1 then
          B1PEKKA, B3PEKKA, B4PEKKA = PEKKA3 + 1, PEKKA3, PEKKA3
        elseif PEKKA%3 == 2 then
          B1PEKKA, B3PEKKA, B4PEKKA = PEKKA3 + 1, PEKKA3 + 1, PEKKA3
        end
        
      elseif B1able and B2able and (not B3able) and B4able then--1,2,4可用
        
        local Barbarian3 = math.floor(Barbarian/3)
        if Barbarian%3 == 0 then
          B1Barbarian, B2Barbarian, B4Barbarian = Barbarian3, Barbarian3, Barbarian3
        elseif Barbarian%3 == 1 then
          B1Barbarian, B2Barbarian, B4Barbarian = Barbarian3 + 1, Barbarian3, Barbarian3
        elseif Barbarian%3 == 2 then
          B1Barbarian, B2Barbarian, B4Barbarian = Barbarian3 + 1, Barbarian3 + 1, Barbarian3
        end
        
        local Archer3 = math.floor(Archer/3)
        if Archer%3 == 0 then
          B1Archer, B2Archer, B4Archer = Archer3, Archer3, Archer3
        elseif Archer%3 == 1 then
          B1Archer, B2Archer, B4Archer = Archer3 + 1, Archer3, Archer3
        elseif Archer%3 == 2 then
          B1Archer, B2Archer, B4Archer = Archer3 + 1, Archer3 + 1, Archer3
        end
        
        local Giant3 = math.floor(Giant/3)
        if Giant%3 == 0 then
          B1Giant, B2Giant, B4Giant = Giant3, Giant3, Giant3
        elseif Giant%3 == 1 then
          B1Giant, B2Giant, B4Giant = Giant3 + 1, Giant3, Giant3
        elseif Giant%3 == 2 then
          B1Giant, B2Giant, B4Giant = Giant3 + 1, Giant3 + 1, Giant3
        end
        
        local Goblin3 = math.floor(Goblin/3)
        if Goblin%3 == 0 then
          B1Goblin, B2Goblin, B4Goblin = Goblin3, Goblin3, Goblin3
        elseif Goblin%3 == 1 then
          B1Goblin, B2Goblin, B4Goblin = Goblin3 + 1, Goblin3, Goblin3
        elseif Goblin%3 == 2 then
          B1Goblin, B2Goblin, B4Goblin = Goblin3 + 1, Goblin3 + 1, Goblin3
        end
        
        local WallBreaker3 = math.floor(WallBreaker/3)
        if WallBreaker%3 == 0 then
          B1WallBreaker, B2WallBreaker, B4WallBreaker = WallBreaker3, WallBreaker3, WallBreaker3
        elseif WallBreaker%3 == 1 then
          B1WallBreaker, B2WallBreaker, B4WallBreaker = WallBreaker3 + 1, WallBreaker3, WallBreaker3
        elseif WallBreaker%3 == 2 then
          B1WallBreaker, B2WallBreaker, B4WallBreaker = WallBreaker3 + 1, WallBreaker3 + 1, WallBreaker3
        end
        
        local Balloon3 = math.floor(Balloon/3)
        if Balloon%3 == 0 then
          B1Balloon, B2Balloon, B4Balloon = Balloon3, Balloon3, Balloon3
        elseif Balloon%3 == 1 then
          B1Balloon, B2Balloon, B4Balloon = Balloon3 + 1, Balloon3, Balloon3
        elseif Balloon%3 == 2 then
          B1Balloon, B2Balloon, B4Balloon = Balloon3 + 1, Balloon3 + 1, Balloon3
        end
        
        local Wizard3 = math.floor(Wizard/3)
        if Wizard%3 == 0 then
          B1Wizard, B2Wizard, B4Wizard = Wizard3, Wizard3, Wizard3
        elseif Wizard%3 == 1 then
          B1Wizard, B2Wizard, B4Wizard = Wizard3 + 1, Wizard3, Wizard3
        elseif Wizard%3 == 2 then
          B1Wizard, B2Wizard, B4Wizard = Wizard3 + 1, Wizard3 + 1, Wizard3
        end
        
        local Healer3 = math.floor(Healer/3)
        if Healer%3 == 0 then
          B1Healer, B2Healer, B4Healer = Healer3, Healer3, Healer3
        elseif Healer%3 == 1 then
          B1Healer, B2Healer, B4Healer = Healer3 + 1, Healer3, Healer3
        elseif Healer%3 == 2 then
          B1Healer, B2Healer, B4Healer = Healer3 + 1, Healer3 + 1, Healer3
        end
        
        local Dragon3 = math.floor(Dragon/3)
        if Dragon%3 == 0 then
          B1Dragon, B2Dragon, B4Dragon = Dragon3, Dragon3, Dragon3
        elseif Dragon%3 == 1 then
          B1Dragon, B2Dragon, B4Dragon = Dragon3 + 1, Dragon3, Dragon3
        elseif Dragon%3 == 2 then
          B1Dragon, B2Dragon, B4Dragon = Dragon3 + 1, Dragon3 + 1, Dragon3
        end
        
        local PEKKA3 = math.floor(PEKKA/3)
        if PEKKA%3 == 0 then
          B1PEKKA, B2PEKKA, B4PEKKA = PEKKA3, PEKKA3, PEKKA3
        elseif PEKKA%3 == 1 then
          B1PEKKA, B2PEKKA, B4PEKKA = PEKKA3 + 1, PEKKA3, PEKKA3
        elseif PEKKA%3 == 2 then
          B1PEKKA, B2PEKKA, B4PEKKA = PEKKA3 + 1, PEKKA3 + 1, PEKKA3
        end
        
      elseif B1able and B2able and B3able and (not B4able) then--1,2,3可用
        
        local Barbarian3 = math.floor(Barbarian/3)
        if Barbarian%3 == 0 then
          B1Barbarian, B2Barbarian, B3Barbarian = Barbarian3, Barbarian3, Barbarian3
        elseif Barbarian%3 == 1 then
          B1Barbarian, B2Barbarian, B3Barbarian = Barbarian3 + 1, Barbarian3, Barbarian3
        elseif Barbarian%3 == 2 then
          B1Barbarian, B2Barbarian, B3Barbarian = Barbarian3 + 1, Barbarian3 + 1, Barbarian3
        end
        
        local Archer3 = math.floor(Archer/3)
        if Archer%3 == 0 then
          B1Archer, B2Archer, B3Archer = Archer3, Archer3, Archer3
        elseif Archer%3 == 1 then
          B1Archer, B2Archer, B3Archer = Archer3 + 1, Archer3, Archer3
        elseif Archer%3 == 2 then
          B1Archer, B2Archer, B3Archer = Archer3 + 1, Archer3 + 1, Archer3
        end
        
        local Giant3 = math.floor(Giant/3)
        if Giant%3 == 0 then
          B1Giant, B2Giant, B3Giant = Giant3, Giant3, Giant3
        elseif Giant%3 == 1 then
          B1Giant, B2Giant, B3Giant = Giant3 + 1, Giant3, Giant3
        elseif Giant%3 == 2 then
          B1Giant, B2Giant, B3Giant = Giant3 + 1, Giant3 + 1, Giant3
        end
        
        local Goblin3 = math.floor(Goblin/3)
        if Goblin%3 == 0 then
          B1Goblin, B2Goblin, B3Goblin = Goblin3, Goblin3, Goblin3
        elseif Goblin%3 == 1 then
          B1Goblin, B2Goblin, B3Goblin = Goblin3 + 1, Goblin3, Goblin3
        elseif Goblin%3 == 2 then
          B1Goblin, B2Goblin, B3Goblin = Goblin3 + 1, Goblin3 + 1, Goblin3
        end
        
        local WallBreaker3 = math.floor(WallBreaker/3)
        if WallBreaker%3 == 0 then
          B1WallBreaker, B2WallBreaker, B3WallBreaker = WallBreaker3, WallBreaker3, WallBreaker3
        elseif WallBreaker%3 == 1 then
          B1WallBreaker, B2WallBreaker, B3WallBreaker = WallBreaker3 + 1, WallBreaker3, WallBreaker3
        elseif WallBreaker%3 == 2 then
          B1WallBreaker, B2WallBreaker, B3WallBreaker = WallBreaker3 + 1, WallBreaker3 + 1, WallBreaker3
        end
        
        local Balloon3 = math.floor(Balloon/3)
        if Balloon%3 == 0 then
          B1Balloon, B2Balloon, B3Balloon = Balloon3, Balloon3, Balloon3
        elseif Balloon%3 == 1 then
          B1Balloon, B2Balloon, B3Balloon = Balloon3 + 1, Balloon3, Balloon3
        elseif Balloon%3 == 2 then
          B1Balloon, B2Balloon, B3Balloon = Balloon3 + 1, Balloon3 + 1, Balloon3
        end
        
        local Wizard3 = math.floor(Wizard/3)
        if Wizard%3 == 0 then
          B1Wizard, B2Wizard, B3Wizard = Wizard3, Wizard3, Wizard3
        elseif Wizard%3 == 1 then
          B1Wizard, B2Wizard, B3Wizard = Wizard3 + 1, Wizard3, Wizard3
        elseif Wizard%3 == 2 then
          B1Wizard, B2Wizard, B3Wizard = Wizard3 + 1, Wizard3 + 1, Wizard3
        end
        
        local Healer3 = math.floor(Healer/3)
        if Healer%3 == 0 then
          B1Healer, B2Healer, B3Healer = Healer3, Healer3, Healer3
        elseif Healer%3 == 1 then
          B1Healer, B2Healer, B3Healer = Healer3 + 1, Healer3, Healer3
        elseif Healer%3 == 2 then
          B1Healer, B2Healer, B3Healer = Healer3 + 1, Healer3 + 1, Healer3
        end
        
        local Dragon3 = math.floor(Dragon/3)
        if Dragon%3 == 0 then
          B1Dragon, B2Dragon, B3Dragon = Dragon3, Dragon3, Dragon3
        elseif Dragon%3 == 1 then
          B1Dragon, B2Dragon, B3Dragon = Dragon3 + 1, Dragon3, Dragon3
        elseif Dragon%3 == 2 then
          B1Dragon, B2Dragon, B3Dragon = Dragon3 + 1, Dragon3 + 1, Dragon3
        end
        
        local PEKKA3 = math.floor(PEKKA/3)
        if PEKKA%3 == 0 then
          B1PEKKA, B2PEKKA, B3PEKKA = PEKKA3, PEKKA3, PEKKA3
        elseif PEKKA%3 == 1 then
          B1PEKKA, B2PEKKA, B3PEKKA = PEKKA3 + 1, PEKKA3, PEKKA3
        elseif PEKKA%3 == 2 then
          B1PEKKA, B2PEKKA, B3PEKKA = PEKKA3 + 1, PEKKA3 + 1, PEKKA3
        end
        
      elseif (not B1able) and (not B2able) and B3able and B4able then--3,4可用
        
        local Barbarian2 = math.floor(Barbarian/2)
        if Barbarian%2 == 0 then
          B3Barbarian, B4Barbarian = Barbarian2, Barbarian2
        elseif Barbarian%2 == 1 then
          B3Barbarian, B4Barbarian = Barbarian2 + 1, Barbarian2
        end
        
        local Archer2 = math.floor(Archer/2)
        if Archer%2 == 0 then
          B3Archer, B4Archer = Archer2, Archer2
        elseif Archer%2 == 1 then
          B3Archer, B4Archer = Archer2 + 1, Archer2
        end
        
        local Giant2 = math.floor(Giant/2)
        if Giant%2 == 0 then
          B3Giant, B4Giant = Giant2, Giant2
        elseif Giant%2 == 1 then
          B3Giant, B4Giant = Giant2 + 1, Giant2
        end
        
        local Goblin2 = math.floor(Goblin/2)
        if Goblin%2 == 0 then
          B3Goblin, B4Goblin = Goblin2, Goblin2
        elseif Goblin%2 == 1 then
          B3Goblin, B4Goblin = Goblin2 + 1, Goblin2
        end
        
        local WallBreaker2 = math.floor(WallBreaker/2)
        if WallBreaker%2 == 0 then
          B3WallBreaker, B4WallBreaker = WallBreaker2, WallBreaker2
        elseif WallBreaker%2 == 1 then
          B3WallBreaker, B4WallBreaker = WallBreaker2 + 1, WallBreaker2
        end
        
        local Balloon2 = math.floor(Balloon/2)
        if Balloon%2 == 0 then
          B3Balloon, B4Balloon = Balloon2, Balloon2
        elseif Balloon%2 == 1 then
          B3Balloon, B4Balloon = Balloon2 + 1, Balloon2
        end
        
        local Wizard2 = math.floor(Wizard/2)
        if Wizard%2 == 0 then
          B3Wizard, B4Wizard = Wizard2, Wizard2
        elseif Wizard%2 == 1 then
          B3Wizard, B4Wizard = Wizard2 + 1, Wizard2
        end
        
        local Healer2 = math.floor(Healer/2)
        if Healer%2 == 0 then
          B3Healer, B4Healer = Healer2, Healer2
        elseif Healer%2 == 1 then
          B3Healer, B4Healer = Healer2 + 1, Healer2
        end
        
        local Dragon2 = math.floor(Dragon/2)
        if Dragon%2 == 0 then
          B3Dragon, B4Dragon = Dragon2, Dragon2
        elseif Dragon%2 == 1 then
          B3Dragon, B4Dragon = Dragon2 + 1, Dragon2
        end
        
        local PEKKA2 = math.floor(PEKKA/2)
        if PEKKA%2 == 0 then
          B3PEKKA, B4PEKKA = PEKKA2, PEKKA2
        elseif PEKKA%2 == 1 then
          B3PEKKA, B4PEKKA = PEKKA2 + 1, PEKKA2
        end
        
      elseif B1able and (not B2able) and (not B3able) and B4able then--1,4可用
        
        local Barbarian2 = math.floor(Barbarian/2)
        if Barbarian%2 == 0 then
          B1Barbarian, B4Barbarian = Barbarian2, Barbarian2
        elseif Barbarian%2 == 1 then
          B1Barbarian, B4Barbarian = Barbarian2 + 1, Barbarian2
        end
        
        local Archer2 = math.floor(Archer/2)
        if Archer%2 == 0 then
          B1Archer, B4Archer = Archer2, Archer2
        elseif Archer%2 == 1 then
          B1Archer, B4Archer = Archer2 + 1, Archer2
        end
        
        local Giant2 = math.floor(Giant/2)
        if Giant%2 == 0 then
          B1Giant, B4Giant = Giant2, Giant2
        elseif Giant%2 == 1 then
          B1Giant, B4Giant = Giant2 + 1, Giant2
        end
        
        local Goblin2 = math.floor(Goblin/2)
        if Goblin%2 == 0 then
          B1Goblin, B4Goblin = Goblin2, Goblin2
        elseif Goblin%2 == 1 then
          B1Goblin, B4Goblin = Goblin2 + 1, Goblin2
        end
        
        local WallBreaker2 = math.floor(WallBreaker/2)
        if WallBreaker%2 == 0 then
          B1WallBreaker, B4WallBreaker = WallBreaker2, WallBreaker2
        elseif WallBreaker%2 == 1 then
          B1WallBreaker, B4WallBreaker = WallBreaker2 + 1, WallBreaker2
        end
        
        local Balloon2 = math.floor(Balloon/2)
        if Balloon%2 == 0 then
          B1Balloon, B4Balloon = Balloon2, Balloon2
        elseif Balloon%2 == 1 then
          B1Balloon, B4Balloon = Balloon2 + 1, Balloon2
        end
        
        local Wizard2 = math.floor(Wizard/2)
        if Wizard%2 == 0 then
          B1Wizard, B4Wizard = Wizard2, Wizard2
        elseif Wizard%2 == 1 then
          B1Wizard, B4Wizard = Wizard2 + 1, Wizard2
        end
        
        local Healer2 = math.floor(Healer/2)
        if Healer%2 == 0 then
          B1Healer, B4Healer = Healer2, Healer2
        elseif Healer%2 == 1 then
          B1Healer, B4Healer = Healer2 + 1, Healer2
        end
        
        local Dragon2 = math.floor(Dragon/2)
        if Dragon%2 == 0 then
          B1Dragon, B4Dragon = Dragon2, Dragon2
        elseif Dragon%2 == 1 then
          B1Dragon, B4Dragon = Dragon2 + 1, Dragon2
        end
        
        local PEKKA2 = math.floor(PEKKA/2)
        if PEKKA%2 == 0 then
          B1PEKKA, B4PEKKA = PEKKA2, PEKKA2
        elseif PEKKA%2 == 1 then
          B1PEKKA, B4PEKKA = PEKKA2 + 1, PEKKA2
        end
        
      elseif B1able and B2able and (not B3able) and (not B4able) then--1,2可用
        
        local Barbarian2 = math.floor(Barbarian/2)
        if Barbarian%2 == 0 then
          B1Barbarian, B2Barbarian = Barbarian2, Barbarian2
        elseif Barbarian%2 == 1 then
          B1Barbarian, B2Barbarian = Barbarian2 + 1, Barbarian2
        end
        
        local Archer2 = math.floor(Archer/2)
        if Archer%2 == 0 then
          B1Archer, B2Archer = Archer2, Archer2
        elseif Archer%2 == 1 then
          B1Archer, B2Archer = Archer2 + 1, Archer2
        end
        
        local Giant2 = math.floor(Giant/2)
        if Giant%2 == 0 then
          B1Giant, B2Giant = Giant2, Giant2
        elseif Giant%2 == 1 then
          B1Giant, B2Giant = Giant2 + 1, Giant2
        end
        
        local Goblin2 = math.floor(Goblin/2)
        if Goblin%2 == 0 then
          B1Goblin, B2Goblin = Goblin2, Goblin2
        elseif Goblin%2 == 1 then
          B1Goblin, B2Goblin = Goblin2 + 1, Goblin2
        end
        
        local WallBreaker2 = math.floor(WallBreaker/2)
        if WallBreaker%2 == 0 then
          B1WallBreaker, B2WallBreaker = WallBreaker2, WallBreaker2
        elseif WallBreaker%2 == 1 then
          B1WallBreaker, B2WallBreaker = WallBreaker2 + 1, WallBreaker2
        end
        
        local Balloon2 = math.floor(Balloon/2)
        if Balloon%2 == 0 then
          B1Balloon, B2Balloon = Balloon2, Balloon2
        elseif Balloon%2 == 1 then
          B1Balloon, B2Balloon = Balloon2 + 1, Balloon2
        end
        
        local Wizard2 = math.floor(Wizard/2)
        if Wizard%2 == 0 then
          B1Wizard, B2Wizard = Wizard2, Wizard2
        elseif Wizard%2 == 1 then
          B1Wizard, B2Wizard = Wizard2 + 1, Wizard2
        end
        
        local Healer2 = math.floor(Healer/2)
        if Healer%2 == 0 then
          B1Healer, B2Healer = Healer2, Healer2
        elseif Healer%2 == 1 then
          B1Healer, B2Healer = Healer2 + 1, Healer2
        end
        
        local Dragon2 = math.floor(Dragon/2)
        if Dragon%2 == 0 then
          B1Dragon, B2Dragon = Dragon2, Dragon2
        elseif Dragon%2 == 1 then
          B1Dragon, B2Dragon = Dragon2 + 1, Dragon2
        end
        
        local PEKKA2 = math.floor(PEKKA/2)
        if PEKKA%2 == 0 then
          B1PEKKA, B2PEKKA = PEKKA2, PEKKA2
        elseif PEKKA%2 == 1 then
          B1PEKKA, B2PEKKA = PEKKA2 + 1, PEKKA2
        end
        
      elseif (not B1able) and B2able and (not B3able) and B4able then--2,4可用
        
        local Barbarian2 = math.floor(Barbarian/2)
        if Barbarian%2 == 0 then
          B2Barbarian, B4Barbarian = Barbarian2, Barbarian2
        elseif Barbarian%2 == 1 then
          B2Barbarian, B4Barbarian = Barbarian2 + 1, Barbarian2
        end
        
        local Archer2 = math.floor(Archer/2)
        if Archer%2 == 0 then
          B2Archer, B4Archer = Archer2, Archer2
        elseif Archer%2 == 1 then
          B2Archer, B4Archer = Archer2 + 1, Archer2
        end
        
        local Giant2 = math.floor(Giant/2)
        if Giant%2 == 0 then
          B2Giant, B4Giant = Giant2, Giant2
        elseif Giant%2 == 1 then
          B2Giant, B4Giant = Giant2 + 1, Giant2
        end
        
        local Goblin2 = math.floor(Goblin/2)
        if Goblin%2 == 0 then
          B2Goblin, B4Goblin = Goblin2, Goblin2
        elseif Goblin%2 == 1 then
          B2Goblin, B4Goblin = Goblin2 + 1, Goblin2
        end
        
        local WallBreaker2 = math.floor(WallBreaker/2)
        if WallBreaker%2 == 0 then
          B2WallBreaker, B4WallBreaker = WallBreaker2, WallBreaker2
        elseif WallBreaker%2 == 1 then
          B2WallBreaker, B4WallBreaker = WallBreaker2 + 1, WallBreaker2
        end
        
        local Balloon2 = math.floor(Balloon/2)
        if Balloon%2 == 0 then
          B2Balloon, B4Balloon = Balloon2, Balloon2
        elseif Balloon%2 == 1 then
          B2Balloon, B4Balloon = Balloon2 + 1, Balloon2
        end
        
        local Wizard2 = math.floor(Wizard/2)
        if Wizard%2 == 0 then
          B2Wizard, B4Wizard = Wizard2, Wizard2
        elseif Wizard%2 == 1 then
          B2Wizard, B4Wizard = Wizard2 + 1, Wizard2
        end
        
        local Healer2 = math.floor(Healer/2)
        if Healer%2 == 0 then
          B2Healer, B4Healer = Healer2, Healer2
        elseif Healer%2 == 1 then
          B2Healer, B4Healer = Healer2 + 1, Healer2
        end
        
        local Dragon2 = math.floor(Dragon/2)
        if Dragon%2 == 0 then
          B2Dragon, B4Dragon = Dragon2, Dragon2
        elseif Dragon%2 == 1 then
          B2Dragon, B4Dragon = Dragon2 + 1, Dragon2
        end
        
        local PEKKA2 = math.floor(PEKKA/2)
        if PEKKA%2 == 0 then
          B2PEKKA, B4PEKKA = PEKKA2, PEKKA2
        elseif PEKKA%2 == 1 then
          B2PEKKA, B4PEKKA = PEKKA2 + 1, PEKKA2
        end
        
      elseif B1able and (not B2able) and B3able and (not B4able) then--1,3可用
        
        local Barbarian2 = math.floor(Barbarian/2)
        if Barbarian%2 == 0 then
          B1Barbarian, B3Barbarian = Barbarian2, Barbarian2
        elseif Barbarian%2 == 1 then
          B1Barbarian, B3Barbarian = Barbarian2 + 1, Barbarian2
        end
        
        local Archer2 = math.floor(Archer/2)
        if Archer%2 == 0 then
          B1Archer, B3Archer = Archer2, Archer2
        elseif Archer%2 == 1 then
          B1Archer, B3Archer = Archer2 + 1, Archer2
        end
        
        local Giant2 = math.floor(Giant/2)
        if Giant%2 == 0 then
          B1Giant, B3Giant = Giant2, Giant2
        elseif Giant%2 == 1 then
          B1Giant, B3Giant = Giant2 + 1, Giant2
        end
        
        local Goblin2 = math.floor(Goblin/2)
        if Goblin%2 == 0 then
          B1Goblin, B3Goblin = Goblin2, Goblin2
        elseif Goblin%2 == 1 then
          B1Goblin, B3Goblin = Goblin2 + 1, Goblin2
        end
        
        local WallBreaker2 = math.floor(WallBreaker/2)
        if WallBreaker%2 == 0 then
          B1WallBreaker, B3WallBreaker = WallBreaker2, WallBreaker2
        elseif WallBreaker%2 == 1 then
          B1WallBreaker, B3WallBreaker = WallBreaker2 + 1, WallBreaker2
        end
        
        local Balloon2 = math.floor(Balloon/2)
        if Balloon%2 == 0 then
          B1Balloon, B3Balloon = Balloon2, Balloon2
        elseif Balloon%2 == 1 then
          B1Balloon, B3Balloon = Balloon2 + 1, Balloon2
        end
        
        local Wizard2 = math.floor(Wizard/2)
        if Wizard%2 == 0 then
          B1Wizard, B3Wizard = Wizard2, Wizard2
        elseif Wizard%2 == 1 then
          B1Wizard, B3Wizard = Wizard2 + 1, Wizard2
        end
        
        local Healer2 = math.floor(Healer/2)
        if Healer%2 == 0 then
          B1Healer, B3Healer = Healer2, Healer2
        elseif Healer%2 == 1 then
          B1Healer, B3Healer = Healer2 + 1, Healer2
        end
        
        local Dragon2 = math.floor(Dragon/2)
        if Dragon%2 == 0 then
          B1Dragon, B3Dragon = Dragon2, Dragon2
        elseif Dragon%2 == 1 then
          B1Dragon, B3Dragon = Dragon2 + 1, Dragon2
        end
        
        local PEKKA2 = math.floor(PEKKA/2)
        if PEKKA%2 == 0 then
          B1PEKKA, B3PEKKA = PEKKA2, PEKKA2
        elseif PEKKA%2 == 1 then
          B1PEKKA, B3PEKKA = PEKKA2 + 1, PEKKA2
        end
        
      elseif (not B1able) and B2able and B3able and (not B4able) then--2,3可用
        
        local Barbarian2 = math.floor(Barbarian/2)
        if Barbarian%2 == 0 then
          B2Barbarian, B3Barbarian = Barbarian2, Barbarian2
        elseif Barbarian%2 == 1 then
          B2Barbarian, B3Barbarian = Barbarian2 + 1, Barbarian2
        end
        
        local Archer2 = math.floor(Archer/2)
        if Archer%2 == 0 then
          B2Archer, B3Archer = Archer2, Archer2
        elseif Archer%2 == 1 then
          B2Archer, B3Archer = Archer2 + 1, Archer2
        end
        
        local Giant2 = math.floor(Giant/2)
        if Giant%2 == 0 then
          B2Giant, B3Giant = Giant2, Giant2
        elseif Giant%2 == 1 then
          B2Giant, B3Giant = Giant2 + 1, Giant2
        end
        
        local Goblin2 = math.floor(Goblin/2)
        if Goblin%2 == 0 then
          B2Goblin, B3Goblin = Goblin2, Goblin2
        elseif Goblin%2 == 1 then
          B2Goblin, B3Goblin = Goblin2 + 1, Goblin2
        end
        
        local WallBreaker2 = math.floor(WallBreaker/2)
        if WallBreaker%2 == 0 then
          B2WallBreaker, B3WallBreaker = WallBreaker2, WallBreaker2
        elseif WallBreaker%2 == 1 then
          B2WallBreaker, B3WallBreaker = WallBreaker2 + 1, WallBreaker2
        end
        
        local Balloon2 = math.floor(Balloon/2)
        if Balloon%2 == 0 then
          B2Balloon, B3Balloon = Balloon2, Balloon2
        elseif Balloon%2 == 1 then
          B2Balloon, B3Balloon = Balloon2 + 1, Balloon2
        end
        
        local Wizard2 = math.floor(Wizard/2)
        if Wizard%2 == 0 then
          B2Wizard, B3Wizard = Wizard2, Wizard2
        elseif Wizard%2 == 1 then
          B2Wizard, B3Wizard = Wizard2 + 1, Wizard2
        end
        
        local Healer2 = math.floor(Healer/2)
        if Healer%2 == 0 then
          B2Healer, B3Healer = Healer2, Healer2
        elseif Healer%2 == 1 then
          B2Healer, B3Healer = Healer2 + 1, Healer2
        end
        
        local Dragon2 = math.floor(Dragon/2)
        if Dragon%2 == 0 then
          B2Dragon, B3Dragon = Dragon2, Dragon2
        elseif Dragon%2 == 1 then
          B2Dragon, B3Dragon = Dragon2 + 1, Dragon2
        end
        
        local PEKKA2 = math.floor(PEKKA/2)
        if PEKKA%2 == 0 then
          B2PEKKA, B3PEKKA = PEKKA2, PEKKA2
        elseif PEKKA%2 == 1 then
          B2PEKKA, B3PEKKA = PEKKA2 + 1, PEKKA2
        end
        
      elseif B1able and (not B2able) and (not B3able) and (not B4able) then--1可用
        B1Barbarian = Barbarian
        B1Archer = Archer
        B1Giant = Giant
        B1Goblin = Goblin
        B1WallBreaker = WallBreaker
        B1Balloon = Balloon
        B1Wizard = Wizard
        B1Healer = Healer
        B1Dragon = Dragon
        B1PEKKA = PEKKA
      elseif (not B1able) and B2able and (not B3able) and (not B4able) then--2可用
        B2Barbarian = Barbarian
        B2Archer = Archer
        B2Giant = Giant
        B2Goblin = Goblin
        B2WallBreaker = WallBreaker
        B2Balloon = Balloon
        B2Wizard = Wizard
        B2Healer = Healer
        B2Dragon = Dragon
        B2PEKKA = PEKKA
      elseif (not B1able) and (not B2able) and B3able and (not B4able) then--3可用
        B3Barbarian = Barbarian
        B3Archer = Archer
        B3Giant = Giant
        B3Goblin = Goblin
        B3WallBreaker = WallBreaker
        B3Balloon = Balloon
        B3Wizard = Wizard
        B3Healer = Healer
        B3Dragon = Dragon
        B3PEKKA = PEKKA
      elseif (not B1able) and (not B2able) and (not B3able) and B4able then--4可用
        B4Barbarian = Barbarian
        B4Archer = Archer
        B4Giant = Giant
        B4Goblin = Goblin
        B4WallBreaker = WallBreaker
        B4Balloon = Balloon
        B4Wizard = Wizard
        B4Healer = Healer
        B4Dragon = Dragon
        B4PEKKA = PEKKA
      end
      
      if B1able then
        while not isOpen(550,1040) do
          tap(580,1000)--打开1号圣水营
          s()
        end
        
        while B1PEKKA > 0  do
          tap(1425,780)
          PEKKA = PEKKA - 1
          B1PEKKA = B1PEKKA - 1
        end
        while B1Dragon > 0 do
          tap(1200,780)
          Dragon = Dragon - 1
          B1Dragon = B1Dragon - 1
        end
        while B1Healer > 0  do
          tap(970,780)
          Healer = Healer - 1
          B1Healer = B1Healer - 1
        end
        while B1Wizard > 0 do
          tap(745,780)
          Wizard = Wizard - 1
          B1Wizard = B1Wizard - 1
        end
        while B1Balloon > 0 do
          tap(515,780)
          Balloon = Balloon - 1
          B1Balloon = B1Balloon - 1
        end
        while B1WallBreaker > 0 do
          tap(1425,550)
          WallBreaker = WallBreaker - 1
          B1WallBreaker = B1WallBreaker - 1
        end
        while B1Goblin > 0 do
          tap(1200,550)
          Goblin = Goblin - 1
          B1Goblin = B1Goblin - 1
        end
        while B1Giant > 0 do
          tap(970,550)
          Giant = Giant - 1
          B1Giant = B1Giant - 1
        end
        while B1Archer > 0 do
          tap(745,550)
          Archer = Archer - 1
          B1Archer = B1Archer - 1
        end
        while B1Barbarian > 0 do
          tap(515,550)
          Barbarian = Barbarian - 1
          B1Barbarian = B1Barbarian - 1
        end
      end
      
      if B2able then
        while not isOpen(670,1040) do
          tap(709,1000)--打开2号圣水营
          s()
        end
        
        while B2PEKKA > 0  do
          tap(1425,780)
          PEKKA = PEKKA - 1
          B2PEKKA = B2PEKKA - 1
        end
        while B2Dragon > 0 do
          tap(1200,780)
          Dragon = Dragon - 1
          B2Dragon = B2Dragon - 1
        end
        while B2Healer > 0  do
          tap(970,780)
          Healer = Healer - 1
          B2Healer = B2Healer - 1
        end
        while B2Wizard > 0 do
          tap(745,780)
          Wizard = Wizard - 1
          B2Wizard = B2Wizard - 1
        end
        while B2Balloon > 0 do
          tap(515,780)
          Balloon = Balloon - 1
          B2Balloon = B2Balloon - 1
        end
        while B2WallBreaker > 0 do
          tap(1425,550)
          WallBreaker = WallBreaker - 1
          B2WallBreaker = B2WallBreaker - 1
        end
        while B2Goblin > 0 do
          tap(1200,550)
          Goblin = Goblin - 1
          B2Goblin = B2Goblin - 1
        end
        while B2Giant > 0 do
          tap(970,550)
          Giant = Giant - 1
          B2Giant = B2Giant - 1
        end
        while B2Archer > 0 do
          tap(745,550)
          Archer = Archer - 1
          B2Archer = B2Archer - 1
        end
        while B2Barbarian > 0 do
          tap(515,550)
          Barbarian = Barbarian - 1
          B2Barbarian = B2Barbarian - 1
        end
      end
      
      if B3able then
        while not isOpen(800,1040) do
          tap(839,1000)--打开3号圣水营
          s()
        end
        
        while B3PEKKA > 0  do
          tap(1425,780)
          PEKKA = PEKKA - 1
          B3PEKKA = B3PEKKA - 1
        end
        while B3Dragon > 0 do
          tap(1200,780)
          Dragon = Dragon - 1
          B3Dragon = B3Dragon - 1
        end
        while B3Healer > 0  do
          tap(970,780)
          Healer = Healer - 1
          B3Healer = B3Healer - 1
        end
        while B3Wizard > 0 do
          tap(745,780)
          Wizard = Wizard - 1
          B3Wizard = B3Wizard - 1
        end
        while B3Balloon > 0 do
          tap(515,780)
          Balloon = Balloon - 1
          B3Balloon = B3Balloon - 1
        end
        while B3WallBreaker > 0 do
          tap(1425,550)
          WallBreaker = WallBreaker - 1
          B3WallBreaker = B3WallBreaker - 1
        end
        while B3Goblin > 0 do
          tap(1200,550)
          Goblin = Goblin - 1
          B3Goblin = B3Goblin - 1
        end
        while B3Giant > 0 do
          tap(970,550)
          Giant = Giant - 1
          B3Giant = B3Giant - 1
        end
        while B3Archer > 0 do
          tap(745,550)
          Archer = Archer - 1
          B3Archer = B3Archer - 1
        end
        while B3Barbarian > 0 do
          tap(515,550)
          Barbarian = Barbarian - 1
          B3Barbarian = B3Barbarian - 1
        end
      end
      
      if B4able then
        while not isOpen(930,1040) do
          tap(967,1000)--打开4号圣水营
          s()
        end
        
        while B4PEKKA > 0  do
          tap(1425,780)
          PEKKA = PEKKA - 1
          B4PEKKA = B4PEKKA - 1
        end
        while B4Dragon > 0 do
          tap(1200,780)
          Dragon = Dragon - 1
          B4Dragon = B4Dragon - 1
        end
        while B4Healer > 0  do
          tap(970,780)
          Healer = Healer - 1
          B4Healer = B4Healer - 1
        end
        while B4Wizard > 0 do
          tap(745,780)
          Wizard = Wizard - 1
          B4Wizard = B4Wizard - 1
        end
        while B4Balloon > 0 do
          tap(515,780)
          Balloon = Balloon - 1
          B4Balloon = B4Balloon - 1
        end
        while B4WallBreaker > 0 do
          tap(1425,550)
          WallBreaker = WallBreaker - 1
          B4WallBreaker = B4WallBreaker - 1
        end
        while B4Goblin > 0 do
          tap(1200,550)
          Goblin = Goblin - 1
          B4Goblin = B4Goblin - 1
        end
        while B4Giant > 0 do
          tap(970,550)
          Giant = Giant - 1
          B4Giant = B4Giant - 1
        end
        while B4Archer > 0 do
          tap(745,550)
          Archer = Archer - 1
          B4Archer = B4Archer - 1
        end
        while B4Barbarian > 0 do
          tap(515,550)
          Barbarian = Barbarian - 1
          B4Barbarian = B4Barbarian - 1
        end
      end
      
    end
    
    if (Minion + HogRider + Valkyrie + Golem + Witch + LavaHound > 0) and (DB1able or DB2able) then
      
      --分工到每个营
      if DB1able and DB2able then--1,2可用
        
        local Minion2 = math.floor(Minion/2)
        if Minion%2 == 0 then
          DB1Minion, DB2Minion = Minion2, Minion2
        elseif Minion%2 == 1 then
          DB1Minion, DB2Minion = Minion2 + 1, Minion2
        end
        
        local HogRider2 = math.floor(HogRider/2)
        if HogRider%2 == 0 then
          DB1HogRider, DB2HogRider = HogRider2, HogRider2
        elseif HogRider%2 == 1 then
          DB1HogRider, DB2HogRider = HogRider2 + 1, HogRider2
        end
        
        local Valkyrie2 = math.floor(Valkyrie/2)
        if Valkyrie%2 == 0 then
          DB1Valkyrie, DB2Valkyrie = Valkyrie2, Valkyrie2
        elseif Valkyrie%2 == 1 then
          DB1Valkyrie, DB2Valkyrie = Valkyrie2 + 1, Valkyrie2
        end
        
        local Golem2 = math.floor(Golem/2)
        if Golem%2 == 0 then
          DB1Golem, DB2Golem = Golem2, Golem2
        elseif Golem%2 == 1 then
          DB1Golem, DB2Golem = Golem2 + 1, Golem2
        end
        
        local Witch2 = math.floor(Witch/2)
        if Witch%2 == 0 then
          DB1Witch, DB2Witch = Witch2, Witch2
        elseif Witch%2 == 1 then
          DB1Witch, DB2Witch = Witch2 + 1, Witch2
        end
        
        local LavaHound2 = math.floor(LavaHound/2)
        if LavaHound%2 == 0 then
          DB1LavaHound, DB2LavaHound = LavaHound2, LavaHound2
        elseif LavaHound%2 == 1 then
          DB1LavaHound, DB2LavaHound = LavaHound2 + 1, LavaHound2
        end
      elseif (not DB1able) and DB2able then--2可用
        DB2Minion = Minion
        DB2HogRider = HogRider
        DB2Valkyrie = Valkyrie
        DB2Golem = Golem
        DB2Witch = Witch
        DB2LavaHound = LavaHound
      elseif DB1able and (not DB2able) then--1可用
        DB1Minion = Minion
        DB1HogRider = HogRider
        DB1Valkyrie = Valkyrie
        DB1Golem = Golem
        DB1Witch = Witch
        DB1LavaHound = LavaHound
      end
      
      if DB1able then
        while not isOpen(1120, 1040) do
          tap(1150,1000)--打开1号黑水营
          s()
        end
        
        while DB1LavaHound > 0 do
          tap(515,780)
          LavaHound = LavaHound - 1
          DB1LavaHound = DB1LavaHound - 1
        end
        while DB1Witch > 0 do
          tap(1425,550)
          Witch = Witch - 1
          DB1Witch = DB1Witch - 1
        end
        while DB1Golem > 0 do
          tap(1200,550)
          Golem = Golem - 1
          DB1Golem = DB1Golem - 1
        end
        while DB1Valkyrie > 0 do
          tap(970,550)
          Valkyrie = Valkyrie - 1
          DB1Valkyrie = DB1Valkyrie - 1
        end
        while DB1HogRider > 0 do
          tap(745,550)
          HogRider = HogRider - 1
          DB1HogRider = DB1HogRider - 1
        end
        while DB1Minion > 0 do
          tap(515,550)
          Minion = Minion - 1
          DB1Minion = DB1Minion - 1
        end
      end
      
      if DB2able then
        while not isOpen(1240, 1040) do
          tap(1280,1000)--打开2号黑水营
          s()
        end
        
        while DB2LavaHound > 0 do
          tap(515,780)
          LavaHound = LavaHound - 1
          DB2LavaHound = DB2LavaHound - 1
        end
        while DB2Witch > 0 do
          tap(1425,550)
          Witch = Witch - 1
          DB2Witch = DB2Witch - 1
        end
        while DB2Golem > 0 do
          tap(1200,550)
          Golem = Golem - 1
          DB2Golem = DB2Golem - 1
        end
        while DB2Valkyrie > 0 do
          tap(970,550)
          Valkyrie = Valkyrie - 1
          DB2Valkyrie = DB2Valkyrie - 1
        end
        while DB2HogRider > 0 do
          tap(745,550)
          HogRider = HogRider - 1
          DB2HogRider = DB2HogRider - 1
        end
        while DB2Minion > 0 do
          tap(515,550)
          Minion = Minion - 1
          DB2Minion = DB2Minion - 1
        end
      end
      
    end
    
    if (LightningSpell + HealingSpell + RageSpell + JumpSpell + FreezeSpell > 0) and SFable then
      
      while not isOpen(1410, 1040) do
        tap(1460,1000)--打开圣水法术工厂
      end
      
      while (LightningSpell > 0) do
        tap(515,550)
        LightningSpell = LightningSpell - 1
      end
      while (HealingSpell > 0) do
        tap(745,550)
        HealingSpell = HealingSpell - 1
      end
      while (RageSpell > 0) do
        tap(970,550)
        RageSpell = RageSpell - 1
      end
      while (JumpSpell > 0) do
        tap(1200,550)
        JumpSpell = JumpSpell - 1
      end
      while (FreezeSpell > 0) do
        tap(1420,550)
        FreezeSpell = FreezeSpell - 1
      end
      s()
    end
    
    if (PosionSpell + EarthquakeSpell + HasteSpell > 0) and DSFable then
      
      while not isOpen(1540, 1040) do
        tap(1590,1000)--打开黑水法术工厂
      end
      
      while (PosionSpell > 0) do
        tap(515,550)
        PosionSpell = PosionSpell - 1
      end
      while (EarthquakeSpell > 0) do
        tap(745,550)
        EarthquakeSpell = EarthquakeSpell - 1
      end
      while (HasteSpell > 0) do
        tap(970,550)
        HasteSpell = HasteSpell - 1
      end
      s()
    end
    
    while (true) do 
      tap(1600,65)--关闭生产队列
      local color = getColor(360, 925)
      if color ~= 0xe8e8e0 then
        break
      end
    end
    
    ss()
  end
end

function isAvailable(x, y)
  local color = getColor(x, y)
  if color == 0x888070 then
    return true
  else
    return false
  end
end

function isOpen(x, y)
  local color = getColor(x, y)
  if (color == 15790574 or color == 15790830 or color == 15790831 or color == 15790832 or color == 15791087 or color == 15791088) then
    return true
  else
    return false
  end
end

function availableCheck()
  showHUD(runing,"制造队列可用性检查中...",16,"0xffffffff","0x4c000000",0,1300,38,200,50)
  
  while (true) do
    tap(83,785)--打开生产队列
    ss()
    
    local color = getColor(360, 925)
    if color == 0xe8e8e0 then
      break			
    else
      tap(1740,120)--没恢复默认，再来一次
    end
    
  end
  
  B1able = isAvailable(550,1040)
  B2able = isAvailable(670,1040)
  B3able = isAvailable(800,1040)
  B4able = isAvailable(930,1040)
  DB1able = isAvailable(1120,1040)
  DB2able = isAvailable(1240,1040)
  SFable = isAvailable(1410,1040)
  DSFable = isAvailable(1540,1040)
  printFunction(B1able,B2able,B3able,B4able,DB1able,DB2able,SFable,DSFable)
  
  while (true) do 
    tap(1600,65)--关闭生产队列
    local color = getColor(360, 925)
    if color ~= 0xe8e8e0 then
      break
    end
  end
  
  ss()
end
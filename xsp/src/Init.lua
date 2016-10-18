--初始化游戏所需全局参数
Barbarian = 0		--野蛮
Archer = 0			--弓箭
Giant = 0			--胖子
Goblin = 0			--哥布
WallBreaker = 0		--炸弹
Balloon = 0			--气球
Wizard = 0			--法师
Healer = 0			--天使
Dragon = 0			--飞龙
PEKKA = 0			--皮卡

Minion = 0 			--亡灵
HogRider = 0		--野猪
Valkyrie = 0		--武神
Golem = 0			--石头
Witch = 0			--女巫
LavaHound = 0		--天狗

LightningSpell = 0	--闪电
HealingSpell = 0	--治疗
RageSpell = 0		--狂暴
JumpSpell = 0		--弹跳
FreezeSpell = 0		--冰冻

PosionSpell = 0		--毒药
EarthquakeSpell = 0	--地震
HasteSpell = 0		--加速
--可用性检测
B1able = false		--圣水1营不可用
B2able = false		--圣水2营不可用
B3able = false		--圣水3营不可用
B4able = false		--圣水4营不可用
DB1able = false		--黑水1营不可用
DB2able = false		--黑水2营不可用
SFable = false		--法术工厂不可用
DSFable = false		--黑暗法术工厂不可用
--统计参数
eDSF = 0 			--黑水法术捐不了的错误统计
troopsDonatedCount = 0 			--已捐单位统计
--HUD显示参数
runing = createHUD()			--用于显示当前状态
troopsDonated = createHUD()		--用于显示捐出的兵种单位数量
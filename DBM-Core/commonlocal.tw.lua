if GetLocale() ~= "zhTW" then return end
if not DBM_COMMON_L then DBM_COMMON_L = {} end

local CL = DBM_COMMON_L

CL.NONE						= "無"
CL.RANDOM					= "隨機"
CL.UNKNOWN					= "未知"--UNKNOWN which is "Unknown" (does u vs U matter?)
CL.NEXT						= "下一次%s"
CL.COOLDOWN					= "%s冷卻"
CL.INCOMING					= "%s 來了"
CL.INTERMISSION				= "中場時間"--No blizz global for this, and will probably be used in most end tier fights with intermission phases
CL.NO_DEBUFF				= "沒有%s"--For use in places like info frame where you put "Not Spellname"
CL.ALLY						= "隊友"--Such as "Move to Ally"
CL.ALLIES					= "隊友"--Such as "Move to Allies"
CL.SAFE						= "安全"
CL.NOTSAFE					= "不安全"
CL.SEASONAL					= "季節性"--Used for option headers to label options that apply to seasonal mechanics (Such as season of mastery on classic era)
CL.YOU						= "你"
--Movements/Places
CL.LEFT						= "左"
CL.RIGHT					= "右"
CL.BOTH						= "兩邊"
CL.BEHIND					= "背後"
CL.BACK						= "後"--Back as in back of the room, not back as in body part
CL.SIDE						= "側邊"--Side as in move to the side
CL.TOP						= "上"--Top as in up top, not BDSM
CL.BOTTOM					= "下"--Bottom as in at the bottom, not BDSM
CL.MIDDLE					= "中"
CL.FRONT					= "前"
CL.EAST						= "東"
CL.WEST						= "西"
CL.NORTH					= "北"
CL.SOUTH					= "南"
CL.SHIELD					= "護盾"
CL.PILLAR					= "柱子"
CL.SHELTER					= "掩蔽"
CL.EDGE						= "房間邊緣"
CL.FAR_AWAY					= "遠離"
CL.PIT						= "坑洞"--Pit, as in hole in ground
--Mechanics
CL.BOMB						= "炸彈"
CL.BOMBS					= "炸彈"
CL.ORB						= "球"
CL.ORBS						= "球"
CL.RING						= "環"
CL.RINGS					= "環"
CL.CHEST					= "獎勵箱"--As in Treasure 'Chest'. Not Chest as in body part.
CL.ADD						= "小怪"--A fight Add as in "boss spawned extra adds"
CL.ADDS						= "小怪"
CL.ADDCOUNT					= "小怪 %s"--ie, Add 1, Add 2, Add 3
CL.BIG_ADD					= "大怪"
CL.BOSS						= "首領"
CL.ENEMIES					= "敵人"
CL.BREAK_LOS				= "卡視角"
CL.RESTORE_LOS				= "恢復/保持視角"
CL.BOSSTOGETHER				= "首領靠近"
CL.BOSSAPART				= "首領分開"
CL.MINDCONTROL				= "心控"
CL.TANKCOMBO				= "坦克連擊"
CL.TANKCOMBOC				= "坦克連擊 (%s)"
CL.AOEDAMAGE				= "AOE傷害"
CL.GROUPSOAK				= "隊伍分傷"
CL.GROUPSOAKS				= "隊伍分傷"

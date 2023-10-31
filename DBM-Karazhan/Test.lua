local mod	= DBM:NewMod("Test", "DBM-Karazhan")
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 4181 $"):sub(12, -3))

mod:SetCreatureID(18132)

mod:RegisterCombat("combat")

mod:AddBoolOption("RangeFrame")

mod:RegisterEvents(
    "SPELL_AURA_APPLIED",
    "SPELL_AURA_REMOVED",
    "SPELL_CAST_START",
	"CHAT_MSG_MONSTER_YELL",
    "UNIT_DIED"
)

local name = "Umbraglow Stinger"

local timerPortalPhase              = mod:NewTimer(60, "TimerPortalPhase", "Interface\\Icons\\Spell_Arcane_PortalDarnassus")
local warnPortalPhaseSoon	        = mod:NewSpecialWarning("WarnPortalPhaseSoon")
local timerBanishPhase			    = mod:NewTimer(30, "TimerBanishPhase", "Interface\\AddOns\\DBM-Core\\textures\\BanishedDrake.tga")
mod:AddBoolOption("SetIconOnBreathTarget", true)

local function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
 end

function mod:OnCombatStart(delay)
    print(delay)
    if self.Options.RangeFrame then
		DBM.RangeCheck:Show(10)
	end
end

function mod:OnCombatEnd()
	if self.Options.RangeFrame then
		DBM.RangeCheck:Hide()
	end
end


function mod:SPELL_AURA_REMOVED(args)
end

function mod:SPELL_CAST_START(args)

    timerPortalPhase:Start()
end

function mod:UNIT_DIED(args)
    if self.Options.SetIconOnBreathTarget then
        warnPortalPhaseSoon:Show()
        timerBanishPhase:Start()
    end
end

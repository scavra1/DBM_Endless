local mod	= DBM:NewMod("Malchezaar", "DBM-Karazhan")
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 4181 $"):sub(12, -3))

mod:SetCreatureID(15690)

mod:RegisterCombat("combat")

mod:RegisterEvents(
    "SPELL_CAST_START",
    "SPELL_AURA_APPLIED",
	"CHAT_MSG_MONSTER_EMOTE"
)

local timerNextEnfeeble     = mod:NewNextTimer(30, 30843)
local warnEnfeebleSoon      = mod:NewSoonAnnounce(30843, 2)

function mod:OnCombatStart(delay)
    timerNextEnfeeble:Start(-delay)
end


function mod:SPELL_AURA_APPLIED(args)
    if args:IsSpellID(30843) then
        timerNextEnfeeble:Start(30)
        warnEnfeebleSoon:Schedule(27)
    end
end


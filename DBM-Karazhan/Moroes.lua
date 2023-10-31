local mod	= DBM:NewMod("Moroes", "DBM-Karazhan")
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 4181 $"):sub(12, -3))

mod:SetCreatureID(15687)

mod:RegisterCombat("combat")

mod:RegisterEvents(
    "SPELL_AURA_APPLIED",
	"CHAT_MSG_MONSTER_YELL"
)

local warnGarroteTarget     = mod:NewTargetAnnounce(37066, 4)
local timerVanish           = mod:NewNextTimer(30, 29448)

function mod:OnCombatStart(delay)
    timerVanish:Start(-delay)
end


function mod:SPELL_AURA_APPLIED(args)
	if args:IsSpellID(37066) then -- Garrote
			warnGarroteTarget:Show(args.destName)

    elseif args:IsSpellID(29448) then
        timerVanish:Start(39)
    end
end



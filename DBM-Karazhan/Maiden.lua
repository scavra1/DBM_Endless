local mod	= DBM:NewMod("Maiden", "DBM-Karazhan")
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 4181 $"):sub(12, -3))

mod:SetCreatureID(16457)

mod:RegisterCombat("combat")

mod:RegisterEvents(
    "SPELL_AURA_APPLIED",
	"SPELL_CAST_START"
)

-- Custom options
mod:AddBoolOption("SetIconOnHolyFireTarget", true)

-- Timers & Warnings
local isMagicDispeller = select(2, UnitClass("player")) == "PALADIN" or select(2, UnitClass("player")) == "PRIEST"

local warnRepentanceSoon   		= mod:NewSoonAnnounce(29511, 3)
local timerNextRepentance  		= mod:NewNextTimer(20, 29511)

local specWarnHolyFireDispel	= mod:NewSpecialWarningDispel(29522, isMagicDispeller)

function mod:OnCombatStart(delay)
    timerNextRepentance:Start(20-delay)
    warnRepentanceSoon:Schedule(15-delay)
end

local function IsPlayerDispeller()
	return 
	select(2, UnitClass("player")) == "PALADIN"
	or select(2, UnitClass("player")) == "PRIEST"
end



function mod:SPELL_AURA_APPLIED(args)
	if args:IsSpellID(29522) then
		if self.Options.SetIconOnHolyFireTarget then
			self:SetIcon(args.destName, 8)
		end
		if IsPlayerDispeller() then
			specWarnHolyFireDispel:Show(args.destName)
		end
	end
end

function mod:SPELL_CAST_START(args)
    if args:IsSpellID(29511) then
        timerNextRepentance:Start(25)
        warnRepentanceSoon:Schedule(20)
    end
end



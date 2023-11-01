local mod	= DBM:NewMod("Gruul", "DBM-Gruul")
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 4181 $"):sub(12, -3))

mod:SetCreatureID(19044)

mod:SetModelID(19044)
mod:RegisterCombat("combat")

mod:RegisterEvents(
	"SPELL_CAST_START",
	"SPELL_CAST_SUCCESS",
	"SPELL_AURA_APPLIED",
	"SPELL_AURA_APPLIED_DOSE"
)

local warnGrowth		= mod:NewSpecialWarningStack(36300, nil, 20)
local warnGroundSlam	= mod:NewSpellAnnounce(33525, 3)
local warnShatter		= mod:NewSpellAnnounce(33654, 4)
local warnSilence		= mod:NewSpellAnnounce(36297, 4)

local specWarnCaveIn	= mod:NewSpecialWarningMove(36240)

local timerGrowthCD		= mod:NewNextTimer(30, 36300)
local timerGroundSlamCD	= mod:NewCDTimer(64, 33525)
local timerShatterCD	= mod:NewNextTimer(10, 33654)

local timerSilenceCD	= mod:NewNextTimer(20, 36297)



local silenceParity = true

function mod:OnCombatStart(delay)
	silenceParity = true
	timerSilenceCD:Start(20)
	timerGrowthCD:Start(-delay)
	timerGroundSlamCD:Start(35-delay)
	if self.Options.RangeFrame then
		DBM.RangeCheck:Show(10)
	end
end

function mod:OnCombatEnd()
	if self.Options.RangeFrame then
		DBM.RangeCheck:Hide()
	end
end

function mod:SPELL_CAST_START(args)
	if args.spellId == 33525 then--Ground Slam
		warnGroundSlam:Show()
		timerShatterCD:Start()
		timerGroundSlamCD:Start()
	elseif args.spellId == 33654 then--Shatter
		warnShatter:Show()
	end
end

function mod:SPELL_CAST_SUCCESS(args)
	if args.spellId == 36297 then--Reverberation (Silence)
		warnSilence:Show()
		silenceParity = not silenceParity

		if silenceParity then
			timerSilenceCD:Start(22)
		else
			timerSilenceCD:Start(40)
		end
	end
end

function mod:SPELL_AURA_APPLIED(args)
	if args.spellId == 36300 then--Growth
		local amount = args.amount or 1
		warnGrowth:Show(args.spellName, amount)
		timerGrowthCD:Start()
	elseif args.spellId == 36240 and args:IsPlayer() and not self:IsTrivial() then--Cave In
		specWarnCaveIn:Show(args.spellName)
		specWarnCaveIn:Play("watchfeet")
	end
end
mod.SPELL_AURA_APPLIED_DOSE = mod.SPELL_AURA_APPLIED
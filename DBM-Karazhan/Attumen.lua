local mod	= DBM:NewMod("Attumen", "DBM-Karazhan")
local L		= mod:GetLocalizedStrings()

mod:SetRevision("20220518110528")
mod:SetCreatureID(16151, 16152)--15550

mod:SetModelID(16416)
mod:SetBossHPInfoToHighest()

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_SUCCESS 29711 29833",
	"SPELL_SUMMON 29714 29799",
	"UNIT_DIED"
)

local warnKnockdown	= mod:NewSpellAnnounce(29711, 4)
local warningCurse	= mod:NewSpellAnnounce(29833, 4)
local warnPhase2	= mod:NewPhaseAnnounce(2)

function mod:OnCombatStart()
	self:SetStage(1)
end

function mod:SPELL_CAST_SUCCESS(args)
	if args.spellId == 29711 then
		warnKnockdown:Show()
	elseif args.spellId == 29833 then
		warningCurse:Show()
	end
end

function mod:SPELL_SUMMON(args)
	if args.spellId == 29799 then
		self:SetStage(2)
		warnPhase2:Show()
	end
end

function mod:UNIT_DIED(args)
	local cid = self:GetCIDFromGUID(args.destGUID)
	if cid == 16152 then
		DBM:EndCombat(self)
	end
end

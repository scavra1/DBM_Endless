local mod	= DBM:NewMod("Attumen", "DBM-Karazhan")
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 4181 $"):sub(12, -3))

mod:SetCreatureID(16152)

mod:RegisterCombat("combat")

mod:RegisterEvents(
	"SPELL_AURA_APPLIED",
	"SPELL_AURA_REMOVED",
    "CHAT_MSG_MONSTER_YELL",
    "CHAT_MSG_MONSTER_EMOTE",
	"UNIT_DIED"
)

local warnPhase2 = mod:NewPhaseAnnounce(2);
local warnPhase3 = mod:NewPhaseAnnounce(3);
local specWarnCurse = mod:NewSpecialWarningSpell(29833)

function mod:OnCombatStart(delay)
end


local function IsPlayerDispeller()
	return 
	(select(2, UnitClass("player")) == "DRUID" and not select(3, GetTalentTabInfo(2)) >= 40)
	or select(2, UnitClass("player")) == "MAGE"
end

function mod:SPELL_AURA_APPLIED(args)
	if args:IsSpellID(29833) then
		if IsPlayerDispeller() then
			specWarnCurse:Show()
		end
	end
end

function mod:CHAT_MSG_MONSTER_YELL(msg)
	if msg == L.Phase3Yell or msg:find(L.Phase3Yell) then
		warnPhase3:Show()
	end
end

function mod:CHAT_MSG_MONSTER_EMOTE(msg)
	if msg == L.Phase2Emote or msg:find(L.Phase2Emote) then
		warnPhase2:Show()
	end
end

function mod:UNIT_DIED(args)
	local cid = self:GetCIDFromGUID(args.destGUID)
	if cid == 16152 then
		DBM:EndCombat(self)
	end
end
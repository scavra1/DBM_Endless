local mod	= DBM:NewMod("Netherspite", "DBM-Karazhan")
local L		= mod:GetLocalizedStrings()

mod:SetRevision("20220518110528")
mod:SetCreatureID(15689)

mod:SetModelID(15363)
mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_START 38523",
	"SPELL_CAST_SUCCESS 37014 37063",
	"CHAT_MSG_MONSTER_EMOTE"
)

local announceNetherBreathTarget    = mod:NewTargetAnnounce(38523, 3)
local specWarnNetherBreathTargetYou	= mod:NewSpecialWarningYou(38523, nil, nil, nil, 3, 2)

local warningPortal			= mod:NewAnnounce("warningPortal", 1, 135743)
local warningBanish			= mod:NewAnnounce("warningBanish", 1, 136135)

local specWarnVoid			= mod:NewSpecialWarningGTFO(30533, nil, nil, nil, 1, 6)

local timerPortalPhase		= mod:NewTimer(60, "timerPortalPhase", 135743, nil, nil, 2)
local timerBanishPhase		= mod:NewTimer(30, "timerBanishPhase", 136135, nil, nil, 2)

local berserkTimer			= mod:NewBerserkTimer(540)

mod:AddBoolOption("SetIconOnBreathTarget")

function mod:OnCombatStart(delay)
	berserkTimer:Start(-delay)
	timerPortalPhase:Start(60-delay)
	if not self:IsTrivial() then
		self:RegisterShortTermEvents(
			"SPELL_PERIODIC_DAMAGE 30533",
			"SPELL_PERIODIC_MISSED 30533"
		)
	end
end

function mod:OnCombatEnd()
	self:UnregisterShortTermEvents()
end

function mod:SPELL_CAST_START(args)
	if args.spellId == 38523 then
		local targetName = UnitName("boss1target")
        if targetName then
            announceNetherBreathTarget:Show(targetName)
           
            if targetName == UnitName("player") then
                specWarnNetherBreathTargetYou:Show()
            end
            
            if self.Options.SetIconOnBreathTarget then
                self:SetIcon(targetName, 8)
            end
        end
	end
end

function mod:CHAT_MSG_MONSTER_EMOTE(msg)
	if msg == L.DBM_NS_EMOTE_PHASE_2 or msg:find(L.DBM_NS_EMOTE_PHASE_2) then
		timerPortalPhase:Cancel()
		warningBanish:Show()
		timerBanishPhase:Start()
	elseif msg == L.DBM_NS_EMOTE_PHASE_1 or msg:find(L.DBM_NS_EMOTE_PHASE_1) then
		timerBanishPhase:Cancel()
		warningPortal:Show()
		timerPortalPhase:Start()
	end
end

function mod:SPELL_CAST_SUCCESS(args)
end

function mod:SPELL_PERIODIC_DAMAGE(_, _, _, destGUID, _, _, spellId, spellName)
	if spellId == 30533 and destGUID == UnitGUID("player") and self:AntiSpam() then
		specWarnVoid:Show(spellName)
		specWarnVoid:Play("watchfeet")
	end
end
mod.SPELL_PERIODIC_MISSED = mod.SPELL_PERIODIC_DAMAGE



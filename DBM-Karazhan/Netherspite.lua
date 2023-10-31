local mod	= DBM:NewMod("Netherspite", "DBM-Karazhan")
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 4181 $"):sub(12, -3))

mod:SetCreatureID(15689)

mod:RegisterCombat("combat")

mod:RegisterEvents(
    "SPELL_CAST_START",
    "SPELL_AURA_APPLIED",
	"CHAT_MSG_MONSTER_EMOTE"
)

local announceNetherBreathTarget    = mod:NewTargetAnnounce(38523, 3)
local specWarnNetherBreathTargetYou = mod:NewSpecialWarningYou(38523)

local warnPortalPhaseSoon	        = mod:NewSpecialWarning("WarnPortalPhaseSoon")

local timerPortalPhase              = mod:NewTimer(60, "TimerPortalPhase", "Interface\\Icons\\Spell_Arcane_PortalDarnassus")
local timerBanishPhase			    = mod:NewTimer(30, "TimerBanishPhase", "Interface\\AddOns\\DBM-Core\\textures\\BanishedDrake.tga")

mod:AddBoolOption("SetIconOnBreathTarget", true)

function mod:OnCombatStart(delay)
end


function mod:SPELL_CAST_START(args)
    if args:IsSpellID(38523) then
        local targetName = UnitName("boss1target")
        if targetName then
            announceNetherBreathTarget:Show(args.destName)
           
            if targetName == UnitName("player") then
                specWarnNetherBreathTargetYou:Show()
            end
            
            if self.Options.SetIconOnBreathTarget then
                self:SetIcon(args.destName, 8)
            end
        end
    end
end

function mod:CHAT_MSG_MONSTER_EMOTE(msg)
    if msg == L.BanishPhaseEmote or msg:find(L.BanishPhaseEmote) then
        timerBanishPhase:Start(30)
        warnPortalPhaseSoon:Schedule(27)
        timerPortalPhase:Cancel()
    elseif msg == L.PortalPhaseEmote or msg:find(L.PortalPhaseEmote) then
        timerPortalPhase:Start(60)
        timerBanishPhase:Cancel()
    end
end



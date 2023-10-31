local mod	= DBM:NewMod("Curator", "DBM-Karazhan")
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 4181 $"):sub(12, -3))

mod:SetCreatureID(15691)

mod:RegisterCombat("combat")

mod:RegisterEvents(
    "SPELL_AURA_APPLIED",
    "SPELL_AURA_REMOVED",
	"CHAT_MSG_MONSTER_YELL"
);

-- Timers & Warnings
local timerNextEvocation    = mod:NewNextTimer(90, 30254)
local warnEvocationSoon     = mod:NewSoonAnnounce(30254, 3)

local announceFlares		= mod:NewAnnounce("AnnounceFlares")


-- Custom options
mod:AddBoolOption("RangeFrame")

-- Vars
local flaresCount = 0

function mod:OnCombatStart(delay)
    flaresCount = 0
    timerNextEvocation:Start(-delay)

    if self.Options.RangeFrame then
		DBM.RangeCheck:Show(10)
	end
end

function mod:OnCombatEnd()
	if self.Options.RangeFrame then
		DBM.RangeCheck:Hide()
	end
end

function mod:SPELL_AURA_APPLIED(args)
	if args:IsSpellID(30254) then -- Evocation
        flaresCount = 0
    end
end

function mod:SPELL_AURA_REMOVED(args)
    if args:IsSpellID(30254) then -- Evocation ended
        timerNextEvocation:Start(90)
    end
end

function mod:CHAT_MSG_MONSTER_YELL(msg)
    if msg == L.FlareSpawnedYell1 
        or msg == L.FlareSpawnedYell2 
        or msg:find(L.FlareSpawnedYell1) 
        or msg:find(L.FlareSpawnedYell2) then
            
            flaresCount = flaresCount + 1

            announceFlares:Show(flaresCount)

            if flaresCount == 8 then
                warnEvocationSoon:Schedule(5)
            end
    end
end



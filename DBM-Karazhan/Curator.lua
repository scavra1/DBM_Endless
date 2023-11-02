local mod	= DBM:NewMod("Curator", "DBM-Karazhan")
local L		= mod:GetLocalizedStrings()

mod:SetRevision("20220518110528")
mod:SetCreatureID(15691)

mod:SetModelID(16958)
mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_AURA_APPLIED 30254 30403",
	"CHAT_MSG_RAID_BOSS_EMOTE"
)


local flareAnnounce			= mod:NewAnnounce("AnnounceFlares", 3, "136116")
local warnEvocationSoon     = mod:NewSoonAnnounce(30254, 3)

local warnArcaneInfusion	= mod:NewSpellAnnounce(30403, 4)

local timerEvo				= mod:NewBuffActiveTimer(20, 30254, nil, nil, nil, 6)
local timerNextEvo			= mod:NewNextTimer(90, 30254, nil, nil, nil, 6)

local berserkTimer			= mod:NewBerserkTimer(720)

mod:AddRangeFrameOption("10", nil, true)

local flaresCount = 0

local addGUIDS = {}

function mod:OnCombatStart(delay)
	flaresCount = 0
	table.wipe(addGUIDS)
	berserkTimer:Start(-delay)
	timerNextEvo:Start(-delay)
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
	if args.spellId == 30254 then
		timerEvo:Start()
		timerNextEvo:Start(110)
	elseif args.spellId == 30403 then
		warnArcaneInfusion:Show()
		timerNextEvo:Stop()
	end
end

function mod:CHAT_MSG_RAID_BOSS_EMOTE(msg)
	if msg == L.FlareSpawnedYell1 
	or msg == L.FlareSpawnedYell2 
	or msg:find(L.FlareSpawnedYell1) 
	or msg:find(L.FlareSpawnedYell2) then
		
		flaresCount = flaresCount + 1

		flareAnnounce:Show(flaresCount)

		if flaresCount == 8 then
			warnEvocationSoon:Schedule(5)
		end
end
end
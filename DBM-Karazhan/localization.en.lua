local L

---------------------
-- Attumen
---------------------
L = DBM:GetModLocalization("Attumen")

L:SetGeneralLocalization{
	name = "Attumen the Huntsman"
}

L:SetTimerLocalization{
}
	
L:SetMiscLocalization{
	Phase2Emote = "%s calls for her master!";
	Phase3Yell = "Come, Midnight, let's disperse this petty rabble!"
}

L:SetWarningLocalization{
}

L:SetOptionLocalization{
	WarnCurse	= "Show special warning when $spell:29833 is applied",
}


---------------------
-- Maiden
---------------------
L = DBM:GetModLocalization("Maiden")

L:SetGeneralLocalization{
	name = "Maiden of Virtue"
}

L:SetOptionLocalization{
	SetIconOnHolyFireTarget = "Set icon on $spell:29522 target"
}

L:SetTimerLocalization{

}

L:SetMiscLocalization{
	YellPull = "Your behavior will not be tolerated."
}


---------------------
-- Moroes
---------------------
L = DBM:GetModLocalization("Moroes")

L:SetGeneralLocalization{
	name = "Moroes"
}

L:SetTimerLocalization{

}

L:SetMiscLocalization{
	YellPull = "Hm, unannounced visitors. Preparations must be made..."
}


---------------------
-- Curator
---------------------
L = DBM:GetModLocalization("Curator")

L:SetGeneralLocalization{
	name = "Curator"
}

L:SetTimerLocalization{

}

L:SetWarningLocalization{
	AnnounceFlares = "Flare # %d"
}

L:SetOptionLocalization{
	RangeFrame = "Show range check for flares lightning"
}

L:SetMiscLocalization{
	FlareSpawnedYell1 = "This Curator is equipped for gallery protection.",
	FlareSpawnedYell2 = "Gallery rules will be strictly enforced."
}

---------------------
-- Terestian Illhoof
---------------------
L = DBM:GetModLocalization("TerestianIllhoof")

L:SetGeneralLocalization{
	name = "Terestian Illhoof"
}

L:SetMiscLocalization{
	Kilrek					= "Kil'rek",
	DChains					= "Demon Chains"
}


---------------------
-- Netherspite
---------------------
L = DBM:GetModLocalization("Netherspite")

L:SetGeneralLocalization{
	name = "Netherspite"
}

L:SetTimerLocalization{
	TimerBanishPhase 	= "Banished!"
}

L:SetOptionLocalization{
	SetIconOnBreathTarget	= "Set icon on $spell:38523 target"
}

L:SetWarningLocalization{
	WarnPortalPhaseSoon = "Portal Phase Soon - STOP DPS"
}

L:SetMiscLocalization{
	BanishPhaseEmote = "%s goes into a nether-fed rage!"
}



---------------------
-- Prince Malchezaar
---------------------
L = DBM:GetModLocalization("Malchezaar")

L:SetGeneralLocalization{
	name = "Prince Malchezaar"
}

L:SetTimerLocalization{
}

L:SetOptionLocalization{
}

L:SetWarningLocalization{
}

L:SetMiscLocalization{
}

---------------------
-- Playground
---------------------

L = DBM:GetModLocalization("Test")

L:SetGeneralLocalization{
	name = "Test"
}

L:SetTimerLocalization{
	TimerBanishPhase 	= "Banished!"
}

L:SetOptionLocalization{
	RangeFrame = "Show range check for flares lightning",
	SetIconOnBreathTarget = "Huh?"
}

L:SetWarningLocalization{
	WarnPortalPhaseSoon = "Portals Soon - STOP DPS",
	SpecialWarningFlares = "Flare # %d",
	TestWarning = "Nether Power on Lord Jaraxxus - Dispel now"
}

L:SetMiscLocalization{
	FlareSpawnedYell1 = "This Curator is equipped for gallery protection.",
	FlareSpawnedYell2 = "Gallery rules will be strictly enforced."
}
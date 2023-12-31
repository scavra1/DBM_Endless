if GetLocale() ~= "frFR" then return end
if not DBM_COMMON_L then DBM_COMMON_L = {} end

local CL = DBM_COMMON_L

CL.NONE								= "Aucun"
CL.RANDOM							= "Aléatoire"
CL.NEXT								= "Prochain %s"
CL.COOLDOWN							= "CD %s"
CL.UNKNOWN							= "Inconnu"--UNKNOWN which is "Unknown" (does u vs U matter?)
CL.LEFT								= "Gauche"
CL.RIGHT							= "Droite"
CL.BOTH								= "Les deux"
CL.BEHIND							= "Derrière"
CL.BACK								= "Arrière"--Back as in back of the room, not back as in body part
CL.SIDE								= "Coté"--Side as in move to the side
CL.TOP								= "Haut"--Top as in up top, not BDSM
CL.BOTTOM							= "Bas"--Bottom as in at the bottom, not BDSM
CL.MIDDLE							= "Milieu"
CL.FRONT							= "Avant"
CL.EAST								= "Est"
CL.WEST								= "Ouest"
CL.NORTH							= "Nord"
CL.SOUTH							= "Sud"
CL.INTERMISSION						= "Inter-phase"--No blizz global for this, and will probably be used in most end tier fights with intermission phases
CL.ORB								= "Orbe"
CL.ORBS								= "Orbes"
CL.RING								= "Anneau"
CL.RINGS							= "Anneaux"
CL.CHEST							= "Coffre"--As in Treasure 'Chest'. Not Chest as in body part.
CL.NO_DEBUFF						= "Pas %s"--For use in places like info frame where you put "Not Spellname"
CL.ALLY								= "Allié"--Such as "Move to Ally"
CL.ALLIES							= "Alliés"--Such as "Move to Allies"
CL.ADD								= "Add"--A fight Add as in "boss spawned extra adds"
CL.ADDS								= "Adds"
CL.BIG_ADD							= "Big Add"
CL.BOSS								= "Boss"
CL.EDGE								= "Bord de la pièce"
CL.FAR_AWAY							= "Très loin"
CL.BREAK_LOS						= "Rompre LOS"
CL.RESTORE_LOS						= "Maintenir LOS"
CL.SAFE								= "Sûr"
CL.NOTSAFE							= "Pas sûr"
CL.SHIELD							= "Bouclier"
CL.PILLAR							= "Pilier"
CL.SHELTER							= "Abris"
CL.INCOMING							= "%s arrive"
CL.BOSSTOGETHER						= "Bosses réunis"
CL.BOSSAPART						= "Bosses séparés"
CL.TANKCOMBO						= "Tank Combo"
CL.AOEDAMAGE						= "Dégâts de zone"
CL.SEASONAL							= "Seasonal"--Used for option headers to label options that apply to seasonal mechanics (Such as season of mastery on classic era)
CL.YOU								= "Vous"

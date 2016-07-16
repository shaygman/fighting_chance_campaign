class MCC_rts_fortSandbagLong
{
	#ifdef MCCMODE
	picture = "\mcc_sandbox_mod\mcc\rts\forts\data\sandbagLong.paa";
	#else
	picture = "mcc\rts\forts\data\sandbagLong.paa";
	#endif

	displayName = "Sandbag Long";
	descriptionShort = "Build Sandbag Long";
	condition = "";
	requiredBuildings[] = {{"hq",1}};
	needelectricity = 0;
	actionFNC = "MCC_fnc_fortSandbagLong";
	resources[] = {{"repair",10}};
};

class MCC_rts_fortSandbagRound
{
	#ifdef MCCMODE
	picture = "\mcc_sandbox_mod\mcc\rts\forts\data\sandbagRound.paa";
	#else
	picture = "mcc\rts\forts\data\sandbagRound.paa";
	#endif

	displayName = "Sandbag Round";
	descriptionShort = "Build Sandbag Round";
	condition = "";
	requiredBuildings[] = {{"hq",1}};
	needelectricity = 0;
	actionFNC = "MCC_fnc_fortSandbagRound";
	resources[] = {{"repair",10}};
};

class MCC_rts_fortRazorwire
{
	#ifdef MCCMODE
	picture = "\mcc_sandbox_mod\mcc\rts\forts\data\razorwire.paa";
	#else
	picture = "mcc\rts\forts\data\razorwire.paa";
	#endif

	displayName = "Razorwire";
	descriptionShort = "Build Razorwire";
	condition = "";
	requiredBuildings[] = {{"hq",1}};
	needelectricity = 0;
	actionFNC = "MCC_fnc_fortRazorwire";
	resources[] = {{"repair",10}};
};

class MCC_rts_fortSandbagTower
{
	#ifdef MCCMODE
	picture = "\mcc_sandbox_mod\mcc\rts\forts\data\sandbagTower.paa";
	#else
	picture = "mcc\rts\forts\data\sandbagTower.paa";
	#endif

	displayName = "Sandbag Tower";
	descriptionShort = "Build Sandbag Tower";
	condition = "";
	requiredBuildings[] = {{"workshop",1}};
	needelectricity = 0;
	actionFNC = "MCC_fnc_fortSandbagTower";
	resources[] = {{"repair",100}};
};

class MCC_rts_fortHBarrierSmall
{
	#ifdef MCCMODE
	picture = "\mcc_sandbox_mod\mcc\rts\forts\data\hBarrierSmall.paa";
	#else
	picture = "mcc\rts\forts\data\hBarrierSmall.paa";
	#endif

	displayName = "H-Barrier Small";
	descriptionShort = "Build H-Barrier Small";
	condition = "";
	requiredBuildings[] = {{"workshop",1}};
	needelectricity = 0;
	actionFNC = "MCC_fnc_fortHBarrierSmall";
	resources[] = {{"repair",15}};
};

class MCC_rts_fortHBarrierLong
{
	#ifdef MCCMODE
	picture = "\mcc_sandbox_mod\mcc\rts\forts\data\hBarrierLong.paa";
	#else
	picture = "mcc\rts\forts\data\hBarrierLong.paa";
	#endif

	displayName = "H-Barrier Big";
	descriptionShort = "Build H-Barrier Big";
	condition = "";
	requiredBuildings[] = {{"workshop",1}};
	needelectricity = 0;
	actionFNC = "MCC_fnc_fortHBarrierLong";
	resources[] = {{"repair",20}};
};

class MCC_rts_forthBarrierCatwalk
{
	#ifdef MCCMODE
	picture = "\mcc_sandbox_mod\mcc\rts\forts\data\hBarrierCatwalk.paa";
	#else
	picture = "mcc\rts\forts\data\hBarrierCatwalk.paa";
	#endif

	displayName = "H-Barrier Catwalk";
	descriptionShort = "Build H-Barrier Catwalk";
	condition = "";
	requiredBuildings[] = {{"workshop",1}};
	needelectricity = 1;
	actionFNC = "MCC_fnc_forthBarrierCatwalk";
	resources[] = {{"repair",30}};
};

class MCC_rts_forthBarrierCorner
{
	#ifdef MCCMODE
	picture = "\mcc_sandbox_mod\mcc\rts\forts\data\hBarrierCorner.paa";
	#else
	picture = "mcc\rts\forts\data\hBarrierCorner.paa";
	#endif

	displayName = "H-Barrier Corner";
	descriptionShort = "Build H-Barrier Corner";
	condition = "";
	requiredBuildings[] = {{"workshop",1}};
	needelectricity = 1;
	actionFNC = "MCC_fnc_forthBarrierCorner";
	resources[] = {{"repair",30}};
};

class MCC_rts_forthBarrierCorridor
{
	#ifdef MCCMODE
	picture = "\mcc_sandbox_mod\mcc\rts\forts\data\hBarrierCorridor.paa";
	#else
	picture = "mcc\rts\forts\data\hBarrierCorridor.paa";
	#endif

	displayName = "H-Barrier Corridor";
	descriptionShort = "Build H-Barrier Corridor";
	condition = "";
	requiredBuildings[] = {{"workshop",1}};
	needelectricity = 1;
	actionFNC = "MCC_fnc_forthBarrierCorridor";
	resources[] = {{"repair",30}};
};

class MCC_rts_forthBarrierTower
{
	#ifdef MCCMODE
	picture = "\mcc_sandbox_mod\mcc\rts\forts\data\hBarrierTower.paa";
	#else
	picture = "mcc\rts\forts\data\hBarrierTower.paa";
	#endif

	displayName = "H-Barrier Tower";
	descriptionShort = "Build H-Barrier Tower";
	condition = "";
	requiredBuildings[] = {{"workshop",1}};
	needelectricity = 1;
	actionFNC = "MCC_fnc_forthBarrierTower";
	resources[] = {{"repair",80}};
};

class MCC_rts_fortAA
{
	#ifdef MCCMODE
	picture = "\mcc_sandbox_mod\mcc\rts\forts\data\aa.paa";
	#else
	picture = "mcc\rts\forts\data\aa.paa";
	#endif

	displayName = "Anti-Air";
	descriptionShort = "Build Anti-Air";
	condition = "";
	requiredBuildings[] = {{"workshop",1}};
	needelectricity = 1;
	actionFNC = "MCC_fnc_fortAA";
	resources[] = {{"repair",400}};
};

class MCC_rts_fortAT
{
	#ifdef MCCMODE
	picture = "\mcc_sandbox_mod\mcc\rts\forts\data\at.paa";
	#else
	picture = "mcc\rts\forts\data\at.paa";
	#endif

	displayName = "Anti-Tank";
	descriptionShort = "Build Anti-Tank";
	condition = "";
	requiredBuildings[] = {{"workshop",1}};
	needelectricity = 1;
	actionFNC = "MCC_fnc_fortAT";
	resources[] = {{"repair",400}};
};

class MCC_rts_fortgmg
{
	#ifdef MCCMODE
	picture = "\mcc_sandbox_mod\mcc\rts\forts\data\gmg.paa";
	#else
	picture = "mcc\rts\forts\data\gmg.paa";
	#endif

	displayName = "Grenade MG";
	descriptionShort = "Build Grenade MG";
	condition = "";
	requiredBuildings[] = {{"workshop",1}};
	needelectricity = 1;
	actionFNC = "MCC_fnc_fortGMG";
	resources[] = {{"repair",800}};
};

class MCC_rts_fortgmgHigh
{
	#ifdef MCCMODE
	picture = "\mcc_sandbox_mod\mcc\rts\forts\data\gmgHigh.paa";
	#else
	picture = "mcc\rts\forts\data\gmgHigh.paa";
	#endif

	displayName = "Grenade MG (High)";
	descriptionShort = "Build Grenade MG (High)";
	condition = "";
	requiredBuildings[] = {{"workshop",1}};
	needelectricity = 1;
	actionFNC = "MCC_fnc_fortGMGHigh";
	resources[] = {{"repair",800}};
};

class MCC_rts_fortmg
{
	#ifdef MCCMODE
	picture = "\mcc_sandbox_mod\mcc\rts\forts\data\mg.paa";
	#else
	picture = "mcc\rts\forts\data\mg.paa";
	#endif

	displayName = "Heavy MG";
	descriptionShort = "Build Heavy MG";
	condition = "";
	requiredBuildings[] = {{"workshop",1}};
	needelectricity = 1;
	actionFNC = "MCC_fnc_fortMG";
	resources[] = {{"repair",400}};
};

class MCC_rts_fortmgHigh
{
	#ifdef MCCMODE
	picture = "\mcc_sandbox_mod\mcc\rts\forts\data\mgHigh.paa";
	#else
	picture = "mcc\rts\forts\data\mgHigh.paa";
	#endif

	displayName = "Heavy MG (High)";
	descriptionShort = "Build Heavy MG (High)";
	condition = "";
	requiredBuildings[] = {{"workshop",1}};
	needelectricity = 1;
	actionFNC = "MCC_fnc_fortMGHigh";
	resources[] = {{"repair",400}};
};

class MCC_rts_fortMortar
{
	#ifdef MCCMODE
	picture = "\mcc_sandbox_mod\mcc\rts\forts\data\mortar.paa";
	#else
	picture = "mcc\rts\forts\data\mortar.paa";
	#endif

	displayName = "Mortar";
	descriptionShort = "Build Mortar";
	condition = "";
	requiredBuildings[] = {{"workshop",1}};
	needelectricity = 1;
	actionFNC = "MCC_fnc_fortMortar";
	resources[] = {{"repair",400}};
};

class MCC_rts_fortTower
{
	#ifdef MCCMODE
	picture = "\mcc_sandbox_mod\mcc\rts\forts\data\metalTower.paa";
	#else
	picture = "mcc\rts\forts\data\metalTower.paa";
	#endif

	displayName = "Metal Tower";
	descriptionShort = "Build Metal Tower";
	condition = "";
	requiredBuildings[] = {{"workshop",1}};
	needelectricity = 1;
	actionFNC = "MCC_fnc_fortTower";
	resources[] = {{"repair",150}};
};
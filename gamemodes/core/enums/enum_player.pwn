/**********************************************************************************************
*	Convicted Roleplay -- A Prison Themed Roleplay Gamemode brought to you by,
*
*	CodeZulan - Project Leader & Developer
*	Ole - Lead Mapper & Organizer
*	Devi - Developer
*
*	Special thanks to,
*	Y_Less - YSI Library
*	Katursis - Pawn.CMD
*	pBlueG - Mysql Plugin
*	Sreyas-Sreelal - Bcrypt Plugin
*
*	Module:
*	core/enums/enum_player.pwn - This module is for the 3d array of PlayerInfo player variables
************************************************************************************************/

enum pInfo{
    pID,
    pName[MAX_PLAYER_NAME + 1],
    pPassword[64],
    pBanned,
    pAdmin[6],
    pLevel,
    pCash,
    Float:pXPos,
    Float:pYPos,
    Float:pZPos,
    Float:pAngle,
    pInterior,
    pWorld,
    pComponents,
    pMarijuana,
    pMeth,
    pOpium,
    pMushroom,
    pCrack,
    pJob,
};
new PlayerInfo[11][pInfo];
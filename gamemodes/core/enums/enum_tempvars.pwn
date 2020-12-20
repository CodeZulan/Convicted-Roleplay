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
*	core/enums/enum_tempvars.pwn - This module is for the 3d array of Temporary Player Variables
************************************************************************************************/

enum tempInfo{
    bool:LoggedIn,
    LoginAttempt = 5,
    ClickedPlayer,
    TempString[1024]
};
new TempVars[1][tempInfo];
/****************************************************************************************
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
*	core/utilities/utils_functions.pwn - This module is for general functions for the gm.
******************************************************************************************/
/*
	-------------------
	Dependency includes
	-------------------
*/

#include <YSI_Coding\y_inline>
#include <YSI_Visual\y_dialog>

GetPlayerNameEx(playerid)
{
    new playername[MAX_PLAYER_NAME + 1];
    GetPlayerName(playerid, playername);
    return playername;
}
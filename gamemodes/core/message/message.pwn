/******************************************************************************
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
*	core/enums/enum_dialogs.pwn - This module is for message formatting etc.
*******************************************************************************/

/*
	-------------------
	Dependency includes
	-------------------
*/
#include <YSI_Coding/y_va>

/*
	---------------------
	Function Declarations
	---------------------
*/
stock SendClientMessageEx(playerid, color, const fmat[], va_args<>)
{
    new str[145];
	va_format(str, sizeof (str), fmat, va_start<3>);
	SendClientMessage(playerid, color, str);
    return 1;
}
/**************************************************************************************************
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
*	main.pwn - This is the main module for the gamemode, includes the necessary files for building.
***************************************************************************************************/
#define YSI_YES_HEAP_MALLOC

/*
	-------------------
	Dependency includes
	-------------------
*/
#include <a_samp>
#include <a_mysql>
#include <utils>

/*
	-----------------
	Gamemode includes
	-----------------
*/
#include "core/enums/enum_player.pwn"                // - Player Enum
#include "core/enums/enum_dialogs.pwn"               // - Dialog ID Enum

#include "core/utilities/utils_functions.pwn"        // - Utility Functions

#include "core/database/database.pwn"                // - MYSQL Database Handling
#include "core/database/accounts.pwn"                // - MYSQL Account Handling

#include "core/message/message.pwn"                  // - Messaging Stuffs

/*
	-------------
	Main Function
	-------------
*/
main()
{	
	ConnectToSQL();
}
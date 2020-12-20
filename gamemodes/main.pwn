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
#define YSI_NO_HEAP_MALLOC
#define YSI_NO_OPTIMISATION_MESSAGE
#define YSI_NO_MODE_CACHE
#define YSI_NO_VERSION_CHECK

/*
	-------------------
	Dependency includes
	-------------------
*/
#include <a_samp>
#include <samp_bcrypt>
#include <a_mysql>
#include <Pawn.CMD>
#include <streamer>
#include <sscanf2>
#include <utils>

/*
	-------
	Modules
	-------
*/
#include "core/server/heartbeat.pwn"                 // - Heartbeat timers

#include "core/enums/enum_player.pwn"                // - Player Enum
#include "core/enums/enum_dialogs.pwn"               // - Dialog ID Enum
#include "core/enums/enum_tempvars.pwn"              // - Temporary Player Variables
#include "core/enums/enum_jobs.pwn"                  // - Jobs Enum

#include "core/database/database.pwn"                // - MYSQL Database Handling
#include "core/database/accounts.pwn"                // - MYSQL Account Handling
#include "core/database/authdialogs.pwn"             // - Inline Dialogs for Authentication (Login/Register)

#include "core/commands/commands.pwn"                // - General Command Configuration
#include "core/commands/cmd_help.pwn"                // - Help Command

#include "core/jobs/jobs.pwn"
#include "core/jobs/rockminer.pwn"                   // - Rock Miner Job

#include "core/character/defaults.pwn"               // - Player Default Variables

#include "core/utilities/utils_functions.pwn"        // - Utility Functions

#include "core/systems/tab.pwn"                      // - Tab Clicking System

#include "core/admin/admincmds.pwn"                  // - Admin Commands
#include "core/admin/restart.pwn"                    // - Restart Command

#include "core/message/message.pwn"                  // - Messaging Stuffs

#include "core/mappings/prison.pwn"                  // - Prison Mappings

/*
	-------------
	Main Function
	-------------
*/
main()
{	
	ConnectToSQL();
}

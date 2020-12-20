/*******************************************************************************
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
*	core/database/accounts.pwn - This module is for handling the MySQL connection
*********************************************************************************/

/*
	-------------------
	Dependency includes
	-------------------
*/
#include <YSI_Coding/y_hooks>

/*
	----------------
	Global Variables
	----------------
*/
new MySQL:mysql;

/*
	--------------
	Callback Hooks
	--------------
*/
hook OnGameModeExit()
{
    CloseSQL();
    return 1;
}

/*
	---------------------
	Function Declarations
	---------------------
*/
ConnectToSQL()
{
    mysql = mysql_connect("127.0.0.1", "root", "", "convictedrp_db");

    if(mysql_errno(mysql))
	{
		print("MYSQL Connection failed to establish! Closing the server...");
        print("Make sure to check gamemodes/core/database/database.pwn and configure the details...");
		SendRconCommand("exit");
	}
    else
    {
        print("MYSQL Connection has been successfuly established!");
    }
}

CloseSQL()
{
    mysql_close(mysql);
    print("MYSQL Connection has been closed.");
}
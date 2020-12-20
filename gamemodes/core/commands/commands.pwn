/**********************************************************************************************************************
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
*	core/commands/commands.pwn - This module is for the general commands configurations
*   Callbacks:
*   OnPlayerCommandPerformed
*   OnPlayerCommandText
************************************************************************************************************************/

#include <YSI_Coding\y_hooks>

public OnPlayerCommandPerformed(playerid, cmd[], params[], result, flags)
{
    if(result == -1)
    {
        SendClientMessage(playerid, COLOR_RED, "[ERROR]: "COL_AZURE"That command does not seem to exist! Use /cmds or /help to see the list of available commands.");
    }
    return 1;
}

hook OnPlayerCommandText(playerid, cmdtext[])
{
    if(!(strcmp(cmdtext, "/test")))
    {
        SendClientMessage(playerid, COLOR_WHITE, "Convicted Roleplay | samp.convictedrp.com | https://convictedrp.com | https://discord.io/convictedrp");
    }
    return 1;
}
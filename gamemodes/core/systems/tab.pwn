/*************************************************************************************
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
*	core/systems/tab.pwn - This module is for the TAB/Scoreboard Click Functionality
*************************************************************************************/

#include <YSI_Coding\y_hooks>

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    switch(dialogid)
    {
        case DIALOG_SHOWID:
        {
            new Float:Position[3];
            if(response)
            {
                if(PlayerInfo[playerid][pAdmin] >= 3)
                {
                    if(TempVars[playerid][ClickedPlayer] != playerid)
                    {
                        GetPlayerPos(TempVars[playerid][ClickedPlayer], Position[0], Position[1], Position[2]);
                        SetPlayerPos(playerid, Position[0], Position[1], Position[2]);
                        SendClientMessage(playerid, COLOR_ORANGERED, "[ADMIN]: "COL_AZURE"You have teleported to the target player!");
                    }
                    else
                    {
                        SendClientMessage(playerid, COLOR_RED, "[ERROR]: "COL_AZURE"You cannot teleport to yourself!");
                        return 1;
                    }
                }
                else
                {
                    SendClientMessage(playerid, COLOR_WHITE, TempVars[playerid][TempString]);
                    return 1;
                }
            }
        }
    }
    return 1;
}

hook OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
    new string[256], string1[256];
    format(string1, sizeof(string1), ""COL_AQUAMARINE"Name: "COL_BEIGE"%s\n", GetPlayerNameEx(clickedplayerid));
    strcat(string, string1);
    format(string1, sizeof(string1), ""COL_AQUAMARINE"Player ID: "COL_BEIGE"%d\n", clickedplayerid);
    strcat(string, string1);
    format(string1, sizeof(string1), ""COL_AQUAMARINE"Ping: "COL_BEIGE"%dms\n", GetPlayerPing(clickedplayerid));
    strcat(string, string1);
    format(string1, sizeof(string1), ""COL_AQUAMARINE"VIP Package: "COL_BEIGE"None\n");
    strcat(string, string1);
    if(PlayerInfo[playerid][pAdmin] >= 3)
    {
        TempVars[playerid][ClickedPlayer] = clickedplayerid;
        ShowPlayerDialog(playerid, DIALOG_SHOWID, DIALOG_STYLE_MSGBOX, ""COL_ORANGE"Player Identification", string, "Goto", "Exit");
    }
    else
    {
        ShowPlayerDialog(playerid, DIALOG_SHOWID, DIALOG_STYLE_MSGBOX, ""COL_ORANGE"Player Identification", string, "Print", "Exit");
        format(TempVars[playerid][TempString], sizeof(string), string);
    }
    return 1;
}
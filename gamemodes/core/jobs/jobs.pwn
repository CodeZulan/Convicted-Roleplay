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
*	core/jobs/jobs.pwn - This module is for job joining system for players, players can join a job inside the Prison HQ
************************************************************************************************************************/

#include <YSI_Coding\y_hooks>

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    switch(dialogid)
    {
        case DIALOG_JOBOFFERS:
        {
            switch(listitem)
            {
                case 0:
                {
                    PlayerInfo[playerid][pJob] = JOB_MINER;
                    SendClientMessage(playerid, COLOR_LIMEGREEN, "[SUCCESS]: "COL_AZURE"You are now a rock miner! Use /jobhelp to see the list of commands for rock miner job.");
                }
                case 1:
                {
                    PlayerInfo[playerid][pJob] = JOB_LUMBERJACK;
                    SendClientMessage(playerid, COLOR_LIMEGREEN, "[SUCCESS]: "COL_AZURE"You are now a lumberjack! Use /jobhelp to see the list of commands for lumberjack job.");
                }
                case 2:
                {
                    PlayerInfo[playerid][pJob] = JOB_SWEEPER;
                    SendClientMessage(playerid, COLOR_LIMEGREEN, "[SUCCESS]: "COL_AZURE"You are now a sweeper! Use /jobhelp to see the list of commands for sweeper job.");
                }
                case 3:
                {
                    PlayerInfo[playerid][pJob] = JOB_FARMER;
                    SendClientMessage(playerid, COLOR_LIMEGREEN, "[SUCCESS]: "COL_AZURE"You are now a farm! Use /jobhelp to see the list of commands for farmer job.");
                }
            }
        }
    }
    return 1;
}

CMD:joboffers(playerid, params[])
{
    new string[1024];
    strcat(string, ""COL_AQUAMARINE"Job\t"COL_LIME"Payout\n");
    strcat(string, ""COL_AQUAMARINE"Rock Miner\t"COL_GREEN"$"COL_LIMEGREEN"1-5\n");
    strcat(string, ""COL_AQUAMARINE"Lumberjack\t"COL_GREEN"$"COL_LIMEGREEN"2-4\n");
    strcat(string, ""COL_AQUAMARINE"Sweeper\t"COL_GREEN"$"COL_LIMEGREEN"15\n");
    strcat(string, ""COL_AQUAMARINE"Farmer\t"COL_GREEN"$"COL_LIMEGREEN"7\n");
    if(!PlayerInfo[playerid][pJob])
    {
        if(IsPlayerInRangeOfPoint(playerid, 3.0, 207.0770, 1921.0101, 17.6406) && GetPlayerVirtualWorld(playerid) == 0)
        {
            ShowPlayerDialog(playerid, DIALOG_JOBOFFERS, DIALOG_STYLE_TABLIST_HEADERS, "Prison Job Offers", string, "Apply", "Exit");
        }
    }
    else
    {
        SendClientMessage(playerid, COLOR_RED, "[ERROR]: "COL_AZURE"You are already employed! Use the command /resign to quit your current job.");
        SendClientMessage(playerid, COLOR_ORANGE, "[WARNING]: "COL_AZURE"You can not apply for a new job for 5 minutes after resigning to your job!");
        return 1;
    }
    return 1;
}

CMD:joblocations(playerid, params[])
{
    
    return 1;
}
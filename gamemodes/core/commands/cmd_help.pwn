/*****************************************************************************
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
*	core/commands/cmd_help.pwn - This module is for the help command
*****************************************************************************/
/*
	-------------------
	Dependency includes
	-------------------
*/

#include <YSI_Coding/y_hooks>

/*
	--------------
	Callback Hooks
	--------------
*/

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    new h_string[256];
    strcat(h_string, "Commands\n");
    strcat(h_string, "Roleplaying\n");
    strcat(h_string, "Bunker\n");
    strcat(h_string, "Rules\n");
    strcat(h_string, "FAQ");
    strcat(h_string, "Credits\n");
    switch(dialogid)
    {
        case DIALOG_HELP:
        {
            new string[2048];
            if(response)
            {
                switch(listitem)
                {
                    case 0:
                    {
                        strcat(string, "General Commands\n");
                        strcat(string, "Roleplaying Commands\n");
                        strcat(string, "Animation Commands\n");
                        strcat(string, "Store Commands\n");
                        strcat(string, "Prison Commands\n");
                        strcat(string, "Cell Commands\n");
                        strcat(string, "Bunker Commands");

                        ShowPlayerDialog(playerid, DIALOG_COMMANDS, DIALOG_STYLE_LIST, "Commands", string, "Select", "Exit");
                    }
                    case 1:
                    {
                        strcat(string, ""COL_YELLOW"How to Roleplay?\n");
                        strcat(string, ""COL_BEIGE"Roleplaying is exciting if properly executed; In SA:MP Roleplaying there are two things to consider,\n");
                        strcat(string, ""COL_BEIGE"the In-Character and the Out-Of-Character, IC or In-Character is your game character, controllable by\n");
                        strcat(string, ""COL_BEIGE"you, everything that relates to that character or relates anything in-game is called In-Character, OOC\n");
                        strcat(string, ""COL_BEIGE"or Out-Of-Character is everything that is outside of the game related, Out-Of-Character can be identified\n");
                        strcat(string, ""COL_BEIGE"when you see a text inside double parentheses ((text)). Information from OOC should never be mixed with IC.\n\n");
                        strcat(string, ""COL_CORAL"Commands and their definitions:\n");
                        strcat(string, ""COL_GOLD"/me"COL_AZURE" - is can be described as a verb, explain your action through /me, example:\n");
                        strcat(string, ""COL_BISUQE"  - /me takes out his wallet from his right jeans' pocket.\n");
                        strcat(string, ""COL_GOLD"/do"COL_AZURE" - is can be described as an adverb, give your action a definition or modify it\n");
                        strcat(string, ""COL_AZURE"by explaining what happened to your action or what other people or you will be able to sense\n");
                        strcat(string, ""COL_AZURE"on your surroundings, example:\n");
                        strcat(string, ""COL_BISUQE"  - /do the wallet is smooth on touch and the amount of cash inside it is 5 $20 bills.\n");
                        strcat(string, ""COL_GOLD"/ame"COL_AZURE" - is basically /me but instead of showing the action in the chatbox, it's annotated above\n");
                        strcat(string, ""COL_AZURE"the player's head, it's used when the action is just short like /ame nods.\n");
                        strcat(string, ""COL_GOLD"/attempt"COL_AZURE" - is used when trying to explain an action that takes probabilities of two. example:\n");
                        strcat(string, ""COL_BISUQE"  - /attempt kick John Smith on the leg. ((Output will be - \"Your Name attempted to kick John Smith\n");
                        strcat(string, ""COL_AZURE"on the leg and (succeeded/failed).\" succeeded or failed will show.))\n");

                        ShowPlayerDialog(playerid, DIALOG_ROLEPLAYING, DIALOG_STYLE_MSGBOX, "Roleplaying Help", string, "Print", "Exit");
                    }
                    case 2:
                    {
                        strcat(string, ""COL_GOLD"");
                        ShowPlayerDialog(playerid, DIALOG_BUNKER, DIALOG_STYLE_MSGBOX, "Bunker System Help", string, "Print", "Exit");
                    }
                    case 3:
                    {

                    }
                }
            }
        }
        case DIALOG_COMMANDS:
        {
            new string[256];
            if(response)
            {
                switch(listitem)
                {
                    case 0: // - General Commands
                    {
                        strcat(string, "/help, /animhelp, /commands, /assitance, /report, /id");
                        ShowPlayerDialog(playerid, DIALOG_UNIVERSAL, DIALOG_STYLE_MSGBOX, "Roleplaying Commands", string, "Select", "Exit");
                    }
                    case 1: // - Roleplaying Commands
                    {
                        strcat(string, "/me, /do, /ame, /attempt, /b, /ooc");
                        ShowPlayerDialog(playerid, DIALOG_UNIVERSAL, DIALOG_STYLE_MSGBOX, "Roleplaying Commands", string, "Select", "Exit");
                    }
                    case 2: // - Animation Commands
                    {
                        strcat(string, "/wave, /dance, /getjiggy, /lean, /smoke, /reload");
                        ShowPlayerDialog(playerid, DIALOG_UNIVERSAL, DIALOG_STYLE_MSGBOX, "Animation Commands", string, "Select", "Exit");
                    }
                    case 3: // - Store Commands
                    {
                        strcat(string, "/buy, /sellfish, /products, /attempt, /b, /ooc");
                        ShowPlayerDialog(playerid, DIALOG_UNIVERSAL, DIALOG_STYLE_MSGBOX, "Roleplaying Commands", string, "Select", "Exit");
                    }
                }
            }
            else
            {
                ShowPlayerDialog(playerid, DIALOG_HELP, DIALOG_STYLE_LIST, "Help Categories", h_string, "Select", "Exit");
                return 1;
            }
        }
    }
    return 1;
}

CMD:help(playerid, params[])
{
    new h_string[256];
    strcat(h_string, "Commands\n");
    strcat(h_string, "Roleplaying\n");
    strcat(h_string, "Bunker\n");
    strcat(h_string, "Rules\n");
    strcat(h_string, "FAQ");
    strcat(h_string, "Credits\n");
    ShowPlayerDialog(playerid, DIALOG_HELP, DIALOG_STYLE_LIST, "Help Categories", h_string, "Select", "Exit");
    return 1;
}
alias:help("elp");

CMD:commands(playerid, params[])
{
    SendClientMessage(playerid, COLOR_PLUM, "[GENERAL COMMANDS]: "COL_AZURE"/help "COL_AQUA"/report "COL_AZURE"/assitance "COL_AQUA"/id "COL_AZURE"/interact");
    SendClientMessage(playerid, COLOR_PLUM, "[GENERAL COMMANDS]: "COL_AZURE"/stats "COL_AQUA"/pay "COL_AZURE"/(s)hout "COL_AQUA"/(w)hisper "COL_AZURE"/(l)ow");
    SendClientMessage(playerid, COLOR_PLUM, "[ROLEPLAY COMMANDS]: "COL_AZURE"/me "COL_AQUA"/ame "COL_AZURE"/do "COL_AQUA"/attempt, "COL_AZURE"/b, "COL_AQUA"/ooc");
    return 1;
}
alias:commands("cmds", "cmdhelp", "cmdshelp", "commandhelp", "commandshelp");
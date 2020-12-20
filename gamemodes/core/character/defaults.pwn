#include <YSI_Coding\y_hooks>

/*
	----------------
	Global Variables
	----------------
*/

/*
	--------------
	Callback Hooks
	--------------
*/
hook OnPlayerConnect(playerid)    // - OnPlayerConnect callback hook
{
    /*
        --------------------------
        STARTING PLAYER VARIABLES
        --------------------------
    */
    PlayerInfo[playerid][pLevel] = 1;
    PlayerInfo[playerid][pBanned] = 0;
    PlayerInfo[playerid][pCash] = 500;
    PlayerInfo[playerid][pInterior] = 0;
    PlayerInfo[playerid][pWorld] = 0;
    PlayerInfo[playerid][pComponents] = 0;
    PlayerInfo[playerid][pMarijuana] = 0;
    PlayerInfo[playerid][pMeth] = 0;
    PlayerInfo[playerid][pOpium] = 0;
    PlayerInfo[playerid][pMushroom] = 0;

    TempVars[playerid][LoginAttempt] = 5;

    PlayerInfo[playerid][pJob] = JOB_NONE;
    return 1;
}
/********************************************************************************************************************
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
*	core/jobs/rockminer.pwn - This module is for the rock miner job, located on the north west of the prison facility.
**********************************************************************************************************************/

#include <YSI_Coding\y_hooks>
#include <YSI_Data\y_iterate>

#define MAX_ROCKS       13

static Iterator:gRockIter<MAX_ROCKS>;

enum rInfo
{
    ID,
    Float:XPos,
    Float:YPos,
    Float:ZPos,
    Text3D:Text,
    quality,
    worth,
};
new RockInfo[MAX_ROCKS][rInfo];

hook OnGameModeInit()
{
    // SetRockPos(0,  176.3375, 2064.1738, 25.8792);
    // SetRockPos(1,  169.1819, 2062.7717, 25.2572);
    // SetRockPos(2,  173.4613, 2057.3066, 20.2558);
    // SetRockPos(3,  166.8014, 2058.3994, 19.8337);
    // SetRockPos(4,  164.3814, 2064.0947, 22.1754);
    // SetRockPos(5,  162.9003, 2102.9446, 19.7211); //       T
    // SetRockPos(6,  184.7682, 2108.0581, 20.7526); //       |
    // SetRockPos(7,  194.7517, 2107.8850, 20.6347); //       |
    // SetRockPos(8,  200.8713, 2108.7842, 19.5352); //      \/
    // SetRockPos(9,  205.3460, 2106.2600, 19.5473); // (QUALITY ROCKS)
    // SetRockPos(10, 214.1014, 2113.9053, 17.4374); //
    // SetRockPos(11, 217.6013, 2112.4175, 17.4482); //
    // SetRockPos(12, 220.7029, 2107.3696, 17.5280); //

    return 1;
}

SetRockPos(Float:x, Float:y, Float:z)
{
    new rockid = Iter_Alloc(gRockIter);
    if(rockid != ITER_NONE)
    {
        RockInfo[rockid][ID] = rockid;
        RockInfo[rockid][XPos] = x;
        RockInfo[rockid][YPos] = y;
        RockInfo[rockid][ZPos] = z;
        RockInfo[rockid][Text] = CreateDynamic3DTextLabel("[MINABLE ROCK]\n"COL_BISUQE"[/mine] to start mining.", COLOR_CORNFLOWERBLUE, x, y, z, 20.0);

        mysql_format(mysql, queryBuffer, sizeof(queryBuffer), "INSERT INTO `rocks`(`rockid`, `XPos`, `YPos`, `ZPos`) VALUES (%d, %f, %f, %f)", RockInfo[rockid][ID], RockInfo[rockid][XPos], RockInfo[rockid][YPos], RockInfo[rockid][ZPos]);
        mysql_query(mysql, queryBuffer);
    }
    return 1;
}

CMD:createminablerock(playerid, params[])
{
    new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x, y, z);
    if(SetRockPos(x, y, z))
    {
        SendClientMessage(playerid, COLOR_ORANGERED, "[ADMIN]: "COL_AZURE"You have successfuly set a minable rock location!");
    }
    else
    {
        SendClientMessage(playerid, -1, "No more free rockids left");
        return 1;
    }
    return 1;
}

CMD:disablerocklabels(playerid, params[])
{
    return 1;
}

CMD:mine(playerid, params[])
{
    if(PlayerInfo[playerid][pJob] == JOB_MINER)
    {
        for(new i; i < MAX_ROCKS; i++)
        {
            if(IsPlayerInRangeOfPoint(playerid, 3.0, RockInfo[i][XPos], RockInfo[i][YPos], RockInfo[i][ZPos]))
            {

            }
            else
            {
                SendClientMessage(playerid, COLOR_RED, "[ERROR]: "COL_AZURE"You are not in range of minable rocks! they are located on the North West of the prison facility.");
                PlayerPlaySound(playerid, 1055, 0.0, 0.0, 0.0);
                return 1;
            }
        }
    }
    else
    {
        SendClientMessage(playerid, COLOR_RED, "[ERROR]: "COL_AZURE"You cannot mine rocks as you are not a rock miner! Apply for rock miner job inside the Prison Headquarters.");
        return 1;
    }
    return 1;
}
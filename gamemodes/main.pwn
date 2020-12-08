#include <a_samp>
#include <Pawn.CMD>

main()
{
    print("Convicted Roleplay Started...");
}

public OnGameModeInit()
{
    print("Server Initiated...");
    return 1;
}

public OnGameModeExit()
{
    return 1;
}

CMD:test(playerid, params[])
{
    SendClientMessage(playerid, -1, "Test");
    return 1;
}
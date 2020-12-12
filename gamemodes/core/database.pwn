

new MySQL:mysql;

stock ConnectToSQL()
{
    MySQL:mysql = mysql_connect("127.0.0.1", "root", "", "convictedrp_db");

    if(mysql_errno(mysql))
	{
		print("MYSQL Connection failed to establish! Closing the server...");
		SendRconCommand("exit");
	}
    else
    {
        print("MYSQL Connection has been successfuly established!");
    }
}

stock CloseSQL()
{
    mysql_close(mysql);
    print("MYSQL Connection has been closed.");
}
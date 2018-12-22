using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;

public partial class StoredProcedures
{
    [Microsoft.SqlServer.Server.SqlProcedure]
    public static void GetPassengers(int Pass)
    {
        using (SqlConnection contextConnection = new SqlConnection("context connection = true"))
        {
            SqlCommand contextCommand =
            new SqlCommand(
            "Select LineID" + "from TrainsT " +
            "where MaxPassangers =  @Pass");
            SqlParameter pPass = new SqlParameter("@Pass", SqlDbType.Int);
            pPass.Value = Pass;
            contextCommand.Parameters.Add(pPass);
            contextConnection.Open();
            SqlContext.Pipe.ExecuteAndSend(contextCommand);
        }
    }
}
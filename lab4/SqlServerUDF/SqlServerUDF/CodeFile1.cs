using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;

public partial class StoredProcedures
{
    [Microsoft.SqlServer.Server.SqlProcedure]
    public static void GetConcatenatedNames(string role)
    {
        using (SqlConnection contextConnection = new SqlConnection("context connection = true"))
        {
            SqlCommand contextCommand =
            new SqlCommand(
            "Select dbo.Concatenator(PersonName) from Person " +
            "where PersonRole = @Role Group By PersonRole", contextConnection);
            contextCommand.Parameters.AddWithValue("@Role", role);
            contextConnection.Open();
            SqlContext.Pipe.ExecuteAndSend(contextCommand);
        }
    }
}
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
        using (SqlConnection c = new SqlConnection("context connection = true"))
        {
            SqlCommand cmd = new SqlCommand("Select MaxPassengers from TrainsT where MaxPassengers =  @Pass", c);


            SqlParameter pPass = new SqlParameter("@Pass", SqlDbType.Int);
            pPass.Value = Pass;
            cmd.Parameters.Add(pPass);
            c.Open();
            SqlContext.Pipe.ExecuteAndSend(cmd);
            c.Close();
        }
    }
}
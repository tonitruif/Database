using System;
using System.Data;
using System.Data.SqlClient;
using Microsoft.SqlServer.Server;

public partial class Triggers
{
    public static void SqlTrigger1()
    {
        SqlTriggerContext triggContext = SqlContext.TriggerContext;
        if (triggContext.TriggerAction == TriggerAction.Insert)
        {
            using (SqlConnection connection = new SqlConnection("context connection = true"))
            {
                SqlCommand command = new SqlCommand(@"SELECT * FROM INSERTED;", connection);
                connection.Open();
                SqlContext.Pipe.ExecuteAndSend(command);
                connection.Close();

            }
        }
    }
}
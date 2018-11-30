using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;

namespace HandWrittenUDF
{
    public class UserDefinedFunctions
    {
        [Microsoft.SqlServer.Server.SqlFunction]
        public static SqlInt32 GetRandomNumber()
        {
            Random rnd = new Random();
            return rnd.Next();
        }
    }
}
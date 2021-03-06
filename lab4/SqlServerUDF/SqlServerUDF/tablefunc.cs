﻿using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;
using System.Collections;

public partial class UserDefinedFunctions
{
    public class AvPass
    {
        public Int32 Vagon;
        public Int32 Passangers;
        public AvPass(Int32 Vagon, Int32 Passangers)
        {
            this.Vagon = Vagon;
            this.Passangers = Passangers;
        }
    }

    [Microsoft.SqlServer.Server.SqlFunction(
       DataAccess = DataAccessKind.Read,
       FillRowMethodName = "fillPass",
       TableDefinition = "Vagon int, Pass int"
       )]
    public static IEnumerable getPass()
    {
        ArrayList vagarr = new ArrayList();

        using (SqlConnection c = new SqlConnection("context connection=true"))
        {
            c.Open();
            using (SqlCommand cmd = new SqlCommand(
                "select Vagons, Passangers " +
                "from LinkerT " +
                "where Passangers > 500", c
                ))
            {
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        vagarr.Add(new AvPass(
                            reader.GetInt32(0),
                            reader.GetInt32(1)));
                    }
                }
            }
        }

        return vagarr;
    }

    public static void fillPass(object obj, out int Vagons, out int Pass)
    {
        AvPass V = (AvPass)obj;
        Vagons = V.Vagon;
        Pass = V.Passangers;
    }
}
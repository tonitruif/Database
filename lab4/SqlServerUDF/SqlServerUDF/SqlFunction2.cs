using System;
using System.Data;
using System.Data.Sql;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;
using System.Collections;
namespace SqlServerTVF
{
    public partial class UserDefinedFunctions
    {
        [Microsoft.SqlServer.Server.SqlFunction(FillRowMethodName = "FillRow",
        TableDefinition = "charpart nchar(1), intpart int")]
        public static IEnumerable NameToAscii(string InputName)
        {
            foreach (char c in InputName)
            {
                yield return new NameRow(c, (int)c);
            }
        }
        public static void FillRow(object row, out char charpart, out int intpart)
        {
            // Разбор строки на отдельные столбцы.
            charpart = ((NameRow)row).CharPart;
            intpart = ((NameRow)row).IntPart;
        }
    };
    public class NameRow
    {
        public Char CharPart;
        public Int32 IntPart;
        public NameRow(Char c, Int32 i)
        {
            CharPart = c;
            IntPart = i;
        }
    }
}
using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;

[Serializable]
[Microsoft.SqlServer.Server.SqlUserDefinedAggregate(Format.Native)]
public struct SqlAggregate1
{
    private int count;
    public void Init()
    {
        count = 0;
        // ¬ведите здесь код
    }

    public void Accumulate(SqlInt32 Value)
    {
        if (Value > 400)
            count++;
        // ¬ведите здесь код
    }

    public void Merge(SqlAggregate1 Group)
    {
        ;
        // ¬ведите здесь код
    }

    public SqlInt32 Terminate()
    {
        // ¬ведите здесь код
        return new SqlInt32(count);
    }

    // Ёто поле элемента-заполнител€
    public int _var1;
}

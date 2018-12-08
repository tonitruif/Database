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
        // Введите здесь код
    }

    public void Accumulate(SqlInt32 Value)
    {
        if (Value > 400)
            count++;
        // Введите здесь код
    }

    public void Merge (SqlAggregate1 Group)
    {
        ;
        // Введите здесь код
    }

    public SqlInt32 Terminate ()
    {
        // Введите здесь код
        return new SqlInt32(count);
    }

    // Это поле элемента-заполнителя
    public int _var1;
}

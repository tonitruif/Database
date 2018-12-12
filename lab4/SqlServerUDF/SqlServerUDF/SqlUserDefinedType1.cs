using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;


[Serializable]
[Microsoft.SqlServer.Server.SqlUserDefinedType(Format.Native)]
public struct SqlUserDefinedType1: INullable
{
    private string name;
    private string surname;

    public override string ToString()
    {
        if (this._null)
            return string.Empty;
        return name + ' ' + surname;
    }
    
    public bool IsNull
    {
        get
        {
            // Введите здесь код
            return _null;
        }
    }
    
    public static SqlUserDefinedType1 Null
    {
        get
        {
            SqlUserDefinedType1 h = new SqlUserDefinedType1();
            h._null = true;
            return h;
        }
    }
    
    public static SqlUserDefinedType1 Parse(SqlString s)
    {
        if (s.IsNull)
            return Null;
        SqlUserDefinedType1 u = new SqlUserDefinedType1();
        string str = s.ToString();
        string[] group = str.Split(' ');
        u.name = group[0];
        u.surname = group[1];
        return u;
    }

    // Закрытый член
    private bool _null;
}
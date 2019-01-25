using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.IO;
using Microsoft.SqlServer.Server;


[Serializable]

[SqlUserDefinedType(Format.UserDefined, MaxByteSize = 8000)]
public struct SqlUserDefinedType1 : INullable, IBinarySerialize
{
    private string name;
    private string surname;
    public override string ToString()
    {
        if (this._null)
            return string.Empty;
        return name + ',' + surname;
    }

    public bool IsNull
    {
        get
        {
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
        string[] group = str.Split(',');
        u.name = group[0];
        u.surname = group[1];
        return u;
    }

    public void Read(BinaryReader r)
    {
        string s = r.ReadString();
        string[] group = s.Split(' ');
        this.name = group[0];
        this.surname = group[1];
    }

    public void Write(BinaryWriter w)
    {
        string s = name + ',' + surname;
        w.Write(s.ToString());
    }

    private bool _null;
}
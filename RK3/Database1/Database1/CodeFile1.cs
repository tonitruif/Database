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
        // ������� ����� ���
    }

    public void Accumulate(SqlInt32 Value)
    {
        if (Value > 400)
            count++;
        // ������� ����� ���
    }

    public void Merge(SqlAggregate1 Group)
    {
        ;
        // ������� ����� ���
    }

    public SqlInt32 Terminate()
    {
        // ������� ����� ���
        return new SqlInt32(count);
    }

    // ��� ���� ��������-�����������
    public int _var1;
}

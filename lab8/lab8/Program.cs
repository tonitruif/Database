using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Lab8
{
    class Program
    {
        private static string connectionString = @"Data Source = .\MSSQLSERVER02; Database = Metro; Integrated Security = true";
        static void Main(string[] args)
        {
            Program lab = new Program();
            
            lab.sqlConnectionString();
            lab.selection();
            lab.sqlDataReader();
            lab.sqlCommandWithParameters();
            lab.dataSetFromTable();
            lab.filterSort();
            lab.insert();
            lab.toXml();
            lab.delete();
            lab.storedProcedure(); 
        }
        public void sqlConnectionString()
        {

            SqlConnection connection = new SqlConnection(connectionString);
            try
            {
                connection.Open();
                Console.WriteLine("Connection has been opened.");
                Console.WriteLine("Connection properties:");
                Console.WriteLine("\tConnection string: {0}", connection.ConnectionString);
                Console.WriteLine("\tDatabase:          {0}", connection.Database);
                Console.WriteLine("\tConnection state:  {0}", connection.State);
                Console.WriteLine("\tWorkstation id:    {0}", connection.WorkstationId);
            }
            catch (SqlException e)
            {
                Console.WriteLine("Error: " + e.Message);
            }
            finally
            {
                connection.Close();
                Console.WriteLine("Connection has been closed.");
            }
            Console.ReadLine();
        }

        public void selection()
        {

            string queryString = @"select count(*) from LinkerT";
            SqlConnection connection = new SqlConnection(connectionString);

            SqlCommand scalarQueryCommand = new SqlCommand(queryString, connection);
            try
            {
                connection.Open();
                Console.WriteLine("Linker count: {0}", scalarQueryCommand.ExecuteScalar());
            }
            catch (SqlException e)
            {
                Console.WriteLine(e.Message);
            }
            finally
            {
                connection.Close();
            }
            Console.ReadLine();
        }

        public void sqlDataReader()
        {

            string queryString = @"select Vagons
                from LinkerT
                where Passangers > 999";

            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand dataQueryCommand = new SqlCommand(queryString, connection);
            try
            {
                connection.Open();
                SqlDataReader dataReader = dataQueryCommand.ExecuteReader();
                while (dataReader.Read())
                {
                    Console.WriteLine("vagons:" + dataReader.GetValue(0));
                }
            }
            catch (SqlException e)
            {
                Console.WriteLine(e.Message);
            }
            finally
            {
                connection.Close();
            }
            Console.ReadLine();
        }

        public void sqlCommandWithParameters()
        {

            string selectWithDuration = @"Select MaxPassengers from TrainsT where MaxPassengers =  @Pass";

            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand selectCommand = new SqlCommand(selectWithDuration, connection);

            selectCommand.Parameters.Add("@Pass", SqlDbType.Int);

            try
            {
                connection.Open();

                int passeng = Convert.ToInt32(Console.ReadLine());
                selectCommand.Parameters["@Pass"].Value = passeng;
                var dataReader = selectCommand.ExecuteReader();
                while (dataReader.Read())
                    Console.WriteLine(dataReader.GetValue(0));
            }
            catch (SqlException e)
            {
                Console.WriteLine(e.Message);
            }
            catch (FormatException ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                connection.Close();
            }
            Console.ReadLine();
        }

        public void storedProcedure()
        {

            SqlConnection connection = new SqlConnection(connectionString);

            SqlCommand storedProcedureCommand = connection.CreateCommand();
            storedProcedureCommand.CommandType = CommandType.StoredProcedure;
            storedProcedureCommand.CommandText = "GetPassengers";
            try
            {
                connection.Open();

                Console.Write("Passengers: ");
                int value = Convert.ToInt32(Console.ReadLine());
                storedProcedureCommand.Parameters.Add("Pass", SqlDbType.Int).Value = value;

                var returnParameter = storedProcedureCommand.Parameters.Add("@ReturnVal", SqlDbType.Int);

                returnParameter.Direction = ParameterDirection.ReturnValue;

                storedProcedureCommand.ExecuteNonQuery();
                var result = returnParameter.Value;

                Console.WriteLine("passengers" +  value + ' ' + result);
            }
            catch (SqlException e)
            {
                Console.WriteLine(e.Message);
            }
            finally
            {
                connection.Close();
                Console.ReadLine();
            }
        }

        public void dataSetFromTable()
        {

            string query = @"select Vagons, Passangers
                from LinkerT
                where Passangers > 999";

            SqlConnection connection = new SqlConnection(connectionString);
            try
            {
                connection.Open();

                SqlDataAdapter dataAdapter = new SqlDataAdapter(query, connection);
                DataSet dataSet = new DataSet();
                dataAdapter.Fill(dataSet, "Result");
                DataTable table = dataSet.Tables["Result"];

               
                foreach (DataRow row in table.Rows)
                {
                    Console.Write("vagons " +row["Vagons"]);
                    Console.Write("  passengers " + row["Passangers"]);
                }
                Console.WriteLine();
            }
            catch (SqlException e)
            {
                Console.WriteLine(e.Message);
            }
            finally
            {
                connection.Close();
            }
            Console.ReadLine();
        }

        public void filterSort()
        {

            string query = @"select * from LinesT";
            SqlConnection connection = new SqlConnection(connectionString);
            try
            {
                connection.Open();

                SqlDataAdapter dataAdapter = new SqlDataAdapter(query, connection);
                DataSet dataSet = new DataSet();
                dataAdapter.Fill(dataSet, "Res");
                DataTableCollection tables = dataSet.Tables;

                Console.Write("Input line name: ");
                string search = Console.ReadLine();
                Console.WriteLine();

                string filter = "Line like '%" + search + "%'";
                string sort = "Line asc";
                foreach (DataRow row in tables["Res"].Select(filter, sort))
                {
                    Console.Write(row["LineID"] + "  " );
                    Console.Write(row["Line"] + "  ");
                    Console.Write(row["StatusS"] + "  ");
                }
                Console.WriteLine();
            }
            catch (SqlException e)
            {
                Console.WriteLine(e.Message);
            }
            catch (FormatException ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                connection.Close();
            }
            Console.ReadLine();
        }

        public void insert()
        {

            string dataCommand = @"select * from LinesT";
            string insertQueryString = @"insert into LinesT (Line, LineID, StatusS) values (@Line, @LineID, @StatusS)";

            SqlConnection connection = new SqlConnection(connectionString);

            try
            {
                connection.Open();
                Console.Write("Line: ");
                string Line = Console.ReadLine();
                Console.Write("LineID: ");
                int LineID = Convert.ToInt32(Console.ReadLine());
                Console.Write("Status: ");
                string StatusS = Console.ReadLine();

                SqlDataAdapter dataAdapter = new SqlDataAdapter(new SqlCommand(dataCommand, connection));
                DataSet dataSet = new DataSet();
                dataAdapter.Fill(dataSet, "LinesT");
                DataTable table = dataSet.Tables["LinesT"];

                DataRow insertingRow = table.NewRow();
                insertingRow["Line"] = Line;
                insertingRow["LineID"] = LineID;
                insertingRow["StatusS"] = StatusS;


                table.Rows.InsertAt(insertingRow, 2);

                Console.WriteLine("Table: ");
                foreach (DataRow row in table.Rows)
                {
                    Console.Write("{0} ", row["Line"]);
                    Console.Write("{0} ", row["LineID"]);
                    Console.Write("{0} ", row["StatusS"]);
                }

                SqlCommand insertQueryCommand = new SqlCommand(insertQueryString, connection);
                insertQueryCommand.Parameters.Add("@Line", SqlDbType.VarChar, 85, "Line");
                insertQueryCommand.Parameters.Add("@StatusS", SqlDbType.VarChar, 20, "StatusS");
                insertQueryCommand.Parameters.Add("@LineID", SqlDbType.Int, 4, "LineID");

                dataAdapter.InsertCommand = insertQueryCommand;
                dataAdapter.Update(dataSet, "LinesT");
            }
            catch (SqlException e)
            {
                Console.WriteLine(e.Message);
            }
            catch (FormatException ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                connection.Close();
            }
            Console.ReadLine();
        }

        public void delete()
        {

            string dataCommand = @"select * from LinesT";
            string deleteQueryString = @"delete from LinesT where Line = @value";

            SqlConnection connection = new SqlConnection(connectionString);

            try
            {
                connection.Open();
                Console.Write("Insert name to delete: ");
                string value = Console.ReadLine();

                SqlDataAdapter dataAdapter = new SqlDataAdapter(new SqlCommand(dataCommand, connection));
                DataSet dataSet = new DataSet();
                dataAdapter.Fill(dataSet, "LinesT");
                DataTable table = dataSet.Tables["LinesT"];

                string filter = " Line = '" + value + "'";
                if (table.Select(filter).Count() == 0)
                    Console.Write("No elements \n");
                else
                    foreach (DataRow row in table.Select(filter))
                    {
                        row.Delete();
                    }

                SqlCommand deleteQueryCommand = new SqlCommand(deleteQueryString, connection);
                deleteQueryCommand.Parameters.Add("@value", SqlDbType.VarChar, 85, "Line");

                dataAdapter.DeleteCommand = deleteQueryCommand;
                dataAdapter.Update(dataSet, "LinesT");

                
            }
            catch (SqlException e)
            {
                Console.WriteLine("Error: " + e.Message);
            }
            catch (FormatException ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                connection.Close();
            }
            Console.ReadLine();
        }

        public void toXml()
        {

            string query = @"select * from TrainsT";

            SqlConnection connection = new SqlConnection(connectionString);
            try
            {
                connection.Open();

                SqlDataAdapter dataAdapter = new SqlDataAdapter(query, connection);
                DataSet dataSet = new DataSet();
                dataAdapter.Fill(dataSet, "TrainsT");
                DataTable table = dataSet.Tables["TrainsT"];

                dataSet.WriteXml("TrainsT.xml");

            }
            catch (SqlException e)
            {
                Console.WriteLine(e.Message);
            }
            finally
            {
                connection.Close();
            }
            Console.ReadLine();
        }

    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Linq;//проект- добавить ссылку
using System.Text;
using System.Threading.Tasks;



//a.Создать классы сущностей, которые моделируют таблицы Вашей базы данных.
//b.Создать запросы четырех типов:
//i.Однотабличный запрос на выборку.
//ii.Многотабличный запрос на выборку.
//iii.Три запроса на добавление, изменение и удаление данных в базе данных.
//iv.Получение доступа к данным, выполняя только хранимую процедуру

namespace task3
{//класс сущностей - таблица, член класса - столбец, ассоциация - внешний ключ, метод - хранимая процедура
    class Program  
    {
        public static DataContext db;
        static void Main(string[] args)
        {
            db = new DataContext(@"Data Source = .\MSSQLSERVER02; Database = Metro; Integrated Security = true");

            select1();
            select2();
            add();
            update();
            delete();

            Console.ReadLine();
        }

        static public void select1()
        {
            Table<LinesT> table = db.GetTable<LinesT>();

            var query = from t in table
                        where t.LineID < 5
                        select t.Line;

            foreach (var item in query)
                Console.WriteLine(item + "   ");
        }
        
        static public void select2()
        {
            Table<LinesT> lines = db.GetTable<LinesT>();
            Table<TrainsT> trains = db.GetTable<TrainsT>();

            var query = from l in lines
                        join t in trains on l.LineID equals t.Lineid
                        where t.buildDate < 1990
                        select l.Line;
            foreach (var item in query)
                Console.WriteLine(item + "  ");
        }

        static public void add()
        {
            LinesT toAdd = new LinesT();
            toAdd.Line = "asf";
            toAdd.LineID = 50;
            toAdd.StatusS = "work";

            Table<LinesT> lines = db.GetTable<LinesT>();
            lines.InsertOnSubmit(toAdd);
            db.SubmitChanges();

            var query = from l in lines
                        where l.StatusS == "work"
                        select l.Line;
            foreach (var item in query)
                Console.WriteLine(item);
        }

        static public void update()
        {
            Table<LinesT> lines = db.GetTable<LinesT>();

            var query = from l in lines
                        where l.StatusS == "work"
                        select l;
            foreach (var item in query)
            {
                item.Line = "lynq";
            }
            db.SubmitChanges();

            var query1 = from l in lines
                        where l.StatusS == "work"
                        select l.Line;
            foreach (var item in query1)
                Console.WriteLine(item);


        }
        static public void delete()
        {
            Table<LinesT> lines = db.GetTable<LinesT>();
            var query = from l in lines
                        where l.StatusS == "work"
                        select l;
            foreach (var item in query)
            {
                lines.DeleteOnSubmit(item);
                db.SubmitChanges();
                Console.WriteLine("DELETED");
            }
        }


    }
}

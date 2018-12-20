using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{
    public class Line
    {
        public string Name { get; set; }
        public int ID { get; set; }
        public int Pass { get; set; }
    }

    public class Station
    {
        public string Name { get; set; }
        public int ID { get; set; }
        public int LineID  { get; set; }
    }

    class task1
    {
        static void Main(string[] args)
        {
            ArrayList arrList = new ArrayList();
            arrList.Add(
                new Line  { Name = "Arbatskaya", ID = 1, Pass = 700 } );
            arrList.Add(
                new Line { Name = "Filevskaya", ID = 2, Pass = 400 });
            arrList.Add(
                new Line { Name = "Kolcevaya", ID = 3, Pass = 500});

            ArrayList arrList2 = new ArrayList();
            arrList2.Add(
                new Station { Name = "Baumanskaya", ID = 1, LineID = 1 });
            arrList2.Add(
                new Station { Name = "Park", ID = 2, LineID = 2 });
            arrList2.Add(
                new Station { Name = "Fili", ID = 3, LineID = 2 });
            arrList2.Add(
                new Station { Name = "Taganskaya", ID = 4, LineID = 3 });

            var query1 = from Line L in arrList
                         where L.ID < 3 && L.Pass > 500
                         select L;
            foreach (Line L in query1)
                Console.WriteLine(L.Name + "  " + L.ID + " " + L.Pass + "\n\n");

            var query2 = from Station S in arrList2
                         where S.ID < 4
                         orderby S.LineID
                         select S;

            foreach (Station S in query2)
                Console.WriteLine(S.Name + "  " + S.LineID + "\n\n");

            var query3 = from Line L in arrList
                         join Station S in arrList2 on L.ID equals S.LineID
                         select new { Line = L.Name, Station = S.Name };
            foreach (var item in query3)
            {
                Console.WriteLine(item.Line + "   " + item.Station + "\n\n");
            }

            var query4 = from Line L in arrList
                         join Station S in arrList2 on L.ID equals S.LineID into JoinResult
                         select JoinResult;
            foreach (var item in query4)
            {
                Console.WriteLine("Station on line: " + item.Count() + "\n\n");
            }

            var query5 = from Station S in arrList2
                         where S.ID < 4
                         group S by S.LineID into g
                         orderby g.Key
                         select g;

            foreach (var sGroup in query5)
                Console.WriteLine(sGroup.Key + "\n\n");

            Console.ReadLine();
        }

         
    }
}

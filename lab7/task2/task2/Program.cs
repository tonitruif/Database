using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;


//iii.Запись (Добавление) в XML документ.
namespace ConsoleApp1
{

    class task2
    {
        static void Main(string[] args)
        {
            //read();
            //update();
            add();
            Console.ReadLine();
        }

        static void read()
        {
            Console.WriteLine("\nREAD XML \n");
            XDocument xdoc = XDocument.Load("../../working.xml");
            var query = from Lines in xdoc.Descendants("Lines")
                        select Lines.Value;
            foreach (var item in query)
                Console.WriteLine(item + "  ");  
        }

        static void update()
        {
            Console.WriteLine("\nUPDATE XML \n");
            XDocument xdoc = XDocument.Load("../../working.xml");
            xdoc.Element("Lines").Element("Line").Element("LineName").SetValue("asf");
            Console.WriteLine(xdoc.Element("Lines").Element("Line").Element("LineName").Value);
        }

        static void add()
        {
            Console.WriteLine("\nADD TO XML \n");
            XDocument xdoc = XDocument.Load("../../working.xml");
            XElement elementAdd = new XElement("Line", "newlinename");
            var query1 = from res in xdoc.Descendants("Line")
                         select res.Value;
            foreach (var item in query1)
            {
                if (item == "Кольцевая линия")
                {
                    Console.WriteLine(item + "  ");
                    Console.WriteLine("EXIST");
                }
            }
            xdoc.Element("Lines").Add(elementAdd);


            var query = from res in xdoc.Descendants("Line")
                        select res.Value;
            Console.WriteLine("\n\n");
            foreach (var item in query)
                Console.WriteLine(item + "  ");
        }
    }
}
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;


//ii.Обновление XML документа.
//iii.Запись (Добавление) в XML документ.
namespace ConsoleApp1
{

    class task2
    {
        static void Main(string[] args)
        {
            read();
            update();
            Console.ReadLine();
        }

        static void read()
        {
            XDocument xdoc = XDocument.Load("../../try1.xml");
            var query = from Lines in xdoc.Descendants("Lines")
                        select Lines.Value;
            foreach (var item in query)
                Console.WriteLine(item);  
        }

        static void update()
        {
            XDocument xdoc = XDocument.Load("../../try2.xml");
            xdoc.Element("Lines").Element("Line").SetValue("asf");
            Console.WriteLine(xdoc.Element("Lines").Element("Line"));
        }

    }
}
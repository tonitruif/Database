using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using System.IO;

namespace ConsoleApp1
{
    class Program
    {
        static void Main(string[] args)
        {
            XmlDocument xDoc = new XmlDocument();
            FileStream myFile = new FileStream("../../lab6.xml", FileMode.Open);
            xDoc.Load(myFile);

            //----------------
            XmlNodeList names = xDoc.GetElementsByTagName("Line");
            for (int i = 0; i < names.Count; i++)
                Console.Write(names[i] + "\r\n");

            Console.ReadLine();
        }
    }
}

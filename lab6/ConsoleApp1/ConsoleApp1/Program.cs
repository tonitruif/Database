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
            FileStream myFile = new FileStream("../../try1.xml", FileMode.Open);
            xDoc.Load(myFile);

            //----------------
            XmlNodeList names = xDoc.GetElementsByTagName("Line");
            for (int i = 0; i < names.Count; i++)
                Console.Write(names[i].ChildNodes[0].Value + "\r\n");
            //----------
            //XmlElement id = xDoc.GetElementById("1");
            //Console.Write(id.Value + "\r\n");
            //------------
            XmlNodeList sur = xDoc.SelectNodes("//row/Line/text()[../../LineID/text()<'5']");
            for (int i = 0; i < sur.Count; i++)
                Console.Write("\nSelect Nodes: " + sur[i].Value + "\r\n");

            XmlNodeList second = xDoc.SelectNodes("descendant::row[LineID=5]");
            for (int i = 0; i < second.Count; i++)
                Console.Write("\nSelect Nodesssss: " + second[i].ChildNodes[1].ChildNodes[0].Value + "\r\n");

            XmlNode single = xDoc.SelectSingleNode("descendant::row[LineID<5]");
            Console.Write("\nSelect Single: " + single.ChildNodes[1].ChildNodes[0].Value + "\r\n");




            Console.ReadLine();
        }
    }
}

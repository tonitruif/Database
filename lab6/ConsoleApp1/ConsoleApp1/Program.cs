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
            while (true)
            {
                Console.WriteLine("MENU: \n 1 - Search \n 2 - Access \n 3 - Change \n Enter your choice:");
                int menu = Convert.ToInt32 (Console.ReadLine());
                switch (menu)
                {
                    case (1):
                        {
                                search();
                                break;
                        }
                    case (2):
                        {
                                access();
                                break;
                        }
                    case (3):
                        {
                            change();
                            break;
                        }
                        
                }
            }
        }
        static void search()
        {
            XmlDocument xDoc = new XmlDocument();
            FileStream myFile = new FileStream("../../try1.xml", FileMode.Open);
            xDoc.Load(myFile);

            XmlNodeList names = xDoc.GetElementsByTagName("Line");
            for (int i = 0; i < names.Count; i++)
                Console.Write(names[i].ChildNodes[0].Value + "\r\n");
            //---------
            string idToFind = Console.ReadLine();
            XmlElement id = xDoc.GetElementById(idToFind);
            if (id == null)
                Console.Write("Null");
            else
                Console.Write(id + "\r\n");
            //------------
            XmlNodeList sur = xDoc.SelectNodes("//row/Line/text()[../../LineID/text()<'5']");
            for (int i = 0; i < sur.Count; i++)
                Console.Write("\nSelect Nodes: " + sur[i].Value + "\r\n");

            XmlNodeList second = xDoc.SelectNodes("descendant::row[LineID=5]");
            for (int i = 0; i < second.Count; i++)
                Console.Write("\nSelect Nodesssss: " + second[i].ChildNodes[1].ChildNodes[0].Value + "\r\n");
            //----------------
            XmlNode single = xDoc.SelectSingleNode("descendant::row[LineID<5]");
            Console.Write("\nSelect Single: " + single.ChildNodes[1].ChildNodes[0].Value + "\r\n");
        }
        static void access()
        {
            XmlDocument xDoc = new XmlDocument();
            FileStream myFile = new FileStream("../../try1.xml", FileMode.Open);
            xDoc.Load(myFile);

            Console.Write("Access to XmlElement, nodetype: " + xDoc.DocumentElement.NodeType + "\n\n");
            //++++++++++++++++
            XmlNodeList second = xDoc.SelectNodes("descendant::row[LineID=5]");
            Console.Write("Access to XmlText, nodetype: " + second[0].ChildNodes[1].ChildNodes[0].InnerText + "\n\n");
            //++++++++++++++++
            foreach (XmlComment commentNode in xDoc.SelectNodes("//comment()"))
            {
                Console.Write("Access to comment: " + commentNode.Value);
            }
            //++++++++++++++++++
            XmlProcessingInstruction procIns = (XmlProcessingInstruction)xDoc.DocumentElement.ChildNodes[0];
            Console.Write("\n\nAccess to instruction: " + procIns.Name);
            //++++++++++++++++
            second = xDoc.SelectNodes("descendant::row[LineID<5]");
            for (int i = 0; i < second.Count; i++)
                Console.Write("\nAccess to attribute: " + second[i].ChildNodes[1].ChildNodes[0].Value + "\r\n");

        }
        static void change()
        {
            XmlDocument xDoc = new XmlDocument();
            FileStream myFile = new FileStream("../../try1.xml", FileMode.Open);
            xDoc.Load(myFile);
            XmlElement toDel = (XmlElement)xDoc.GetElementsByTagName("Line")[1];
            XmlNode parent = toDel.ParentNode;
            parent.RemoveChild(toDel);
            xDoc.Save("../../delete.xml");
            //++++++++++++++++
            xDoc = new XmlDocument();
            myFile.Close();
            myFile = new FileStream("../../try1.xml", FileMode.Open);
            xDoc.Load(myFile);
            XmlNode single = xDoc.SelectSingleNode("descendant::row[LineID<5]");
            Console.Write("\nBefore change: " + single.ChildNodes[1].ChildNodes[0].Value);
            single.ChildNodes[1].ChildNodes[0].Value = "asd";
            Console.Write("   After change:" + single.ChildNodes[1].ChildNodes[0].Value + "\n");
            xDoc.Save("../../change.xml");
            //+++++++++++++++
            xDoc = new XmlDocument();
            myFile.Close();
            myFile = new FileStream("../../try1.xml", FileMode.Open);
            xDoc.Load(myFile);
            single = xDoc.SelectSingleNode("descendant::row[LineID<2]");
            XmlElement elementToAdd = xDoc.CreateElement("new"); 
            elementToAdd.AppendChild(xDoc.CreateTextNode("123")); 
            single.AppendChild(elementToAdd);
            Console.Write(" Added:" + single.ChildNodes[2].InnerText + "\n");
            xDoc.Save("../../addnew.xml");
            //++++++++++++++
            XmlElement attAdd = (XmlElement)single;
            attAdd.SetAttribute("newatt", "123");
            Console.Write("   After change:" + single.Attributes[0].Name + "\n");
            xDoc.Save("../../attAdd.xml");
        }

    }
}

using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;


//a.Создать XML документ, извлекая его из таблиц Вашей базы данных с помощью
//инструкции SELECT … FOR XML.
//b.Создать три запроса:
//i.Чтение из XML документа.
//ii.Обновление XML документа.
//iii.Запись (Добавление) в XML документ.
namespace ConsoleApp1
{

    class task2
    {
        static void Main(string[] args)
        {

        }

        static void read()
        {
            xDocument xdoc = xdocument.load(@"try1.xml");
        }
    }
}

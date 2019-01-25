using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data.Linq.Mapping;

namespace ConsoleApp2
{
    [Table(Name = "FilialT")]
    public class FilialT
    {
        [Column]
        public int FilialID { get; set; }
        [Column]
        public string NameF { get; set; }
        [Column]
        public string Adress { get; set; }
        [Column]
        public string Phone { get; set; }

    }

    [Table(Name = "SotrT")]
    public class SotrT
    {
        [Column]
        public int SotrID { get; set; }
        [Column]
        public string Fio { get; set; }
        [Column]
        public DateTime Rozhd { get; set; }
        [Column]
        public string Otdel { get; set; }
        [Column]
        public int FilialID { get; set; }
    }
}

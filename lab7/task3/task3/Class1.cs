using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data.Linq.Mapping;

namespace task3

{
 //   (Line nvarchar(100) NOT NULL,
 //   LineID int NOT NULL,
	//StatusS nvarchar(25) NOT NULL)
    [Table(Name = "LinesT")]
    public class LinesT
    {
        [Column(CanBeNull = false)]
        public string Line { get; set; }
        [Column(IsPrimaryKey = true, CanBeNull = false)]
        public int LineID { get; set; }
        [Column(CanBeNull = false)]
        public string StatusS{ get; set; }
    }
    //CREATE TABLE TrainsT
    //(BuildDate int NOT NULL,
    //LineID int NOT NULL,
    //MaxPassengers int NOT NULL,
    //MaxVagon int NOT NULL,
    //Train nvarchar(20) NOT NULL,
    //TrainID int NOT NULL,)
    [Table(Name = "TrainsT")]
    public class TrainsT
    {
        [Column(CanBeNull = false)]
        public int buildDate { get; set; }
        [Column(CanBeNull = false)]
        public int Lineid { get; set; }
        [Column(CanBeNull = false)]
        public int MaxPassengers { get; set; }
        [Column(CanBeNull = false)]
        public int MaxVagon { get; set; }
        [Column(CanBeNull = false)]
        public string Train { get; set; }
        [Column(IsPrimaryKey = true, CanBeNull = false)]
        public int TrainID { get; set; }
    }
}


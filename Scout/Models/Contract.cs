using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Linq.Mapping;

namespace Scout.Models
{
    [Table(Name = "Contracts")]

    public class Contract
    {
        [Column(IsPrimaryKey = true, IsDbGenerated = true)]
        public int ID { get; set; }
        [Column]
        public int PlayerID { get; set; }
        [Column]
        public decimal Salary { get; set; }
        [Column]
        public float Term { get; set; }
        [Column]
        public int ClubID { get; set; }
        [Column]
        public decimal Compensation { get; set; }
    }
}
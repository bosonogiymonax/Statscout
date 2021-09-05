using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Linq.Mapping;

namespace Scout.Models
{
    [Table(Name = "Players")]
    
    public class Player
    {
        [Column(IsPrimaryKey = true, IsDbGenerated = true)]
        public int ID { get; set; }
        [Column]
        public string Name { get; set; }
        [Column]
        public int Age{ get; set; }
        [Column]
        public string Position { get; set; }
        [Column]
        public decimal MarketValue { get; set; }
        [Column]
        public int NationID { get; set; }
        [Column]
        public int ClubID { get; set; }
        [Column(CanBeNull = true)]
        public int ContractID { get; set; }
    }
}
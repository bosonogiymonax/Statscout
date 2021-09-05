using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Scout
{
    public class MarketEntity
    {
        public string Name { get; set; }
        public string Position { get; set; }
        public int Age { get; set; }
        public decimal MarketValue { get; set; }
        public string Nation { get; set; }
        public string Club { get; set; }
    }
}
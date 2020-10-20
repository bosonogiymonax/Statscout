using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Scout
{
    public class Market
    {
        static public List<MarketEntity> transferMarket = Database.getDatabase();

        static public List<MarketEntity> suitablePlayers(List<MarketEntity> all, MarketEntity find)
        {
            List<MarketEntity> isSuitable = new List<MarketEntity>();
            foreach (var entity in all)
                if (find.MarketValue >= entity.MarketValue && find.Position == entity.Position)
                    isSuitable.Add(entity);

            return isSuitable;
        }

        static public void initDatabase()
        {
            transferMarket = Database.getDatabase();
        }

    }
}
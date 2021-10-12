using System.Collections.Generic;
using System.Linq;

namespace CdisMart_DAL
{
    public class AuctionRecordDAL : BaseDAL
    {
        // Get all Auction Record entries from the database.
        public IEnumerable<AuctionRecord> Get()
        {
            return DbContext.AuctionRecord;
        }

        // Add an entry to Auction Records in the database.
        // Validations like Auction ID & User ID happen in the BLL.
        public void Add(AuctionRecord newAuctionRecord)
        {
            DbContext.AuctionRecord.Add(newAuctionRecord);
            DbContext.SaveChanges();
        }
    }
}

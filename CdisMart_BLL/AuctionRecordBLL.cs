using CdisMart_BLL.Models;
using CdisMart_DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Transactions;

namespace CdisMart_BLL
{
    public class AuctionRecordBLL
    {
        // Get all Auction Record entries from the database.
        public IEnumerable<AuctionRecordInfoDTO> Get()
        {
            IEnumerable<AuctionRecord> dbAuctionRecordList = new AuctionRecordDAL().Get();

            return dbAuctionRecordList.Select(auctionRecord => new AuctionRecordInfoDTO(auctionRecord));
        }

        // Get all Auction Records related with the Auction ID.
        public IEnumerable<AuctionRecordInfoDTO> Get(int auctionId)
        {
            return Get().Where(auctionRecord => auctionRecord.AuctionId == auctionId);
        }

        // Add an entry to Auction Records in the database.
        public void Add(AuctionRecordAddDTO newAuctionRecord)
        {
            // Throws Validation Exception if the Auction ID is not found.
            Auction dbAuction = new AuctionDAL().Get(newAuctionRecord.AuctionId);

            newAuctionRecord.ValidateAuctionDate(dbAuction.StartDate, dbAuction.EndDate);
            newAuctionRecord.ValidateBidder(dbAuction.OwnerId);

            using (TransactionScope ts = new TransactionScope())
            {
                new AuctionRecordDAL().Add(newAuctionRecord.GetDataBaseObject());
                new AuctionBLL().UpdateBid(newAuctionRecord);

                ts.Complete();
            }
        }
    }
}

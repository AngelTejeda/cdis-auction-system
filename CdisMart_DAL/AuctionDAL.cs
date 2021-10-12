using System;
using System.Collections.Generic;
using System.Linq;

namespace CdisMart_DAL
{
    public class AuctionDAL : BaseDAL
    {
        // Get all Auction entries from the database.
        public IEnumerable<Auction> Get()
        {
            return DbContext.Auction;
        }

        // Get an Auction entry from the database.
        // If the Auction ID does not exist, an Exception will be thrown.
        public Auction Get(int auctionId)
        {
            TryGet(auctionId, out Auction dbAuction);

            if (dbAuction == null)
                throw new ValidationException("El número de subasta no existe.");

            return dbAuction;
        }

        // Get an Auction entry from the database.
        // If the Auction ID does not exist, dbAuction will be null and the function will return false.
        public bool TryGet(int auctionId, out Auction dbAuction)
        {
            dbAuction = Get().Where(auction => auction.AuctionId == auctionId).FirstOrDefault();

            return dbAuction != null;
        }

        // Add an entry to Auction in the database.
        public void Add(Auction newAuction)
        {
            if (!new UserDAL().Exists(newAuction.OwnerId))
                throw new Exception("El ID de usuario no existe.");

            DbContext.Auction.Add(newAuction);
            DbContext.SaveChanges();
        }

        // Update the Highest Bid and Highest Bidder.
        public void UpdateBid(AuctionRecord newAuctionRecord)
        {
            // Throws Validation Exception if Auction ID does not exist.
            Auction dbAuction = Get(newAuctionRecord.AuctionId);

            if (!new UserDAL().Exists(newAuctionRecord.BidderId))
                throw new Exception("El ID de usuario no existe.");

            // Update values
            dbAuction.WinnerId = newAuctionRecord.BidderId;
            dbAuction.HighestBid = newAuctionRecord.BidAmount;

            DbContext.SaveChanges();
        }
    }
}

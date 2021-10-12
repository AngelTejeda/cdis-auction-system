using CdisMart_BLL.Models;
using CdisMart_DAL;
using System;
using System.Collections.Generic;
using System.Linq;

namespace CdisMart_BLL
{
    public class AuctionBLL
    {
        // Get all Auction entries.
        public IEnumerable<AuctionInfoDTO> Get()
        {
            IEnumerable<Auction> dbAuctionList = new AuctionDAL().Get();

            return dbAuctionList.Select(auction => new AuctionInfoDTO(auction));
        }

        // Get an Auction entry from the database.
        // If the Auction ID does not exist, auction will be null and the function will return false.
        public bool TryGet(int auctionId, out AuctionInfoDTO auction)
        {
            new AuctionDAL().TryGet(auctionId, out Auction dbAuction);

            auction = dbAuction != null ? new AuctionInfoDTO(dbAuction) : null;

            return dbAuction != null;
        }

        // Get all the active Auctions in the given timespan.
        public IEnumerable<AuctionInfoDTO> GetActiveAuctions(DateTime startDate, DateTime endDate)
        {
            return Get().Where(auction =>
                    (startDate <= auction.StartDate && auction.StartDate <= endDate) ||
                    (startDate <= auction.EndDate && auction.EndDate <= endDate));
        }

        // Get the active Auctions from the given list.
        public static IEnumerable<AuctionInfoDTO> GetActiveAuctions(IEnumerable<AuctionInfoDTO> auctions)
        {
            DateTime now = DateTime.Now;
            now = new DateTime(now.Year, now.Month, now.Day, now.Hour, now.Minute, 0);

            return auctions.Where(auction => auction.StartDate < now && now < auction.EndDate);
        }

        // Add an entry to Auctions in the database.
        public void Add(AuctionAddDTO newAuction)
        {
            newAuction.ValidateDates();
            ValidateActiveAuctions(newAuction.OwnerId, newAuction.StartDate, newAuction.EndDate);

            Auction dbAuction = newAuction.GetDataBaseObject();

            // User Id is validated in AuctionDAL
            new AuctionDAL().Add(dbAuction);
        }

        // Update the Highest Bid and Bidder.
        // 
        public void UpdateBid(AuctionRecordAddDTO newAuctionRecord)
        {
            // Throws Validation Exception if the Auction ID doesn't exist.
            Auction dbAuction = new AuctionDAL().Get(newAuctionRecord.AuctionId);

            decimal highestBid = dbAuction.HighestBid == null ? 0 : (decimal)dbAuction.HighestBid;

            newAuctionRecord.ValidateBidAmount(highestBid);

            new AuctionDAL().UpdateBid(newAuctionRecord.GetDataBaseObject());
        }

        #region Validations
        // Check if the owner has already 3 active Auctions in the given timespan.
        private void ValidateActiveAuctions(int ownerId, DateTime startDate, DateTime endDate)
        {
            IEnumerable<AuctionInfoDTO> userActiveAuctions = GetActiveAuctions(startDate, endDate)
                .Where(auction => auction.OwnerId == ownerId);

            var temp2 = GetActiveAuctions(startDate, endDate).ToList();

            var temp = userActiveAuctions.ToList();

            if (userActiveAuctions.Count() >= 3)
                throw new ValidationException($"El usuario ya tiene 3 subastas activas en el periodo de { startDate } a { endDate }");
        }
        #endregion
    }
}

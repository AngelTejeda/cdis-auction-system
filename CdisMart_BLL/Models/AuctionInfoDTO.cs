using CdisMart_DAL;
using System;

namespace CdisMart_BLL.Models
{
    [Serializable]
    public class AuctionInfoDTO
    {
        public int AuctionId { get; set; }
        public int OwnerId { get; set; }
        public string ProductName { get; set; }
        public string ProductDescription { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public decimal HighestBid { get; set; }
        public string HighestBidder { get; set; }

        public AuctionInfoDTO()
        {

        }

        public AuctionInfoDTO(Auction dbAuction)
        {
            if (dbAuction == null)
                return;

            AuctionId = dbAuction.AuctionId;
            OwnerId = dbAuction.OwnerId;
            ProductName = dbAuction.ProductName;
            ProductDescription = dbAuction.ProductDescription;
            StartDate = dbAuction.StartDate;
            EndDate = dbAuction.EndDate;
            HighestBid = (decimal)(dbAuction.HighestBid == null ? 0 : dbAuction.HighestBid);
            HighestBidder = dbAuction.Winner == null ? "" : dbAuction.Winner.FullName;
        }
    }
}

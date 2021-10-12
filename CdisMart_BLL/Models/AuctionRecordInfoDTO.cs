using CdisMart_DAL;
using System;

namespace CdisMart_BLL.Models
{
    [Serializable]
    public class AuctionRecordInfoDTO
    {
        public int AuctionId { get; set; }
        public int BidderId { get; set; }
        public string BidderName { get; set; }
        public decimal BidAmount { get; set; }
        public DateTime BidDate { get; set; }

        public AuctionRecordInfoDTO()
        {

        }

        public AuctionRecordInfoDTO(AuctionRecord dbAuctionRecord)
        {
            AuctionId = dbAuctionRecord.AuctionId;
            BidderId = dbAuctionRecord.BidderId;
            BidderName = dbAuctionRecord.Bidder.FullName;
            BidAmount = dbAuctionRecord.BidAmount;
            BidDate = dbAuctionRecord.BidDate;
        }
    }
}

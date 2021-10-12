using CdisMart_DAL;
using System;

namespace CdisMart_BLL.Models
{
    public class AuctionRecordAddDTO
    {
        public int AuctionId { get; set; }
        public int BidderId { get; set; }
        public decimal BidAmount { get; set; }

        public AuctionRecord GetDataBaseObject()
        {
            return new AuctionRecord()
            {
                AuctionId = AuctionId,
                BidderId = BidderId,
                BidAmount = BidAmount,
                BidDate = DateTime.Now
            };
        }

        #region Validations
        public void ValidateBidder(int ownerId)
        {
            if (ownerId == BidderId)
                throw new ValidationException("No se le permite ofertar en esta subasta.");
        }

        public void ValidateBidAmount(decimal highestBid)
        {
            if (BidAmount <= highestBid)
                throw new ValidationException("La oferta debe ser mayor que la oferta actual.");
        }

        public void ValidateAuctionDate(DateTime startDate, DateTime endDate)
        {
            if (DateTime.Now > endDate)
                throw new ValidationException("La subasta ha finalizado.");

            if (DateTime.Now < startDate)
                throw new ValidationException("La subasta aún no ha empezado.");
        }
        #endregion
    }
}

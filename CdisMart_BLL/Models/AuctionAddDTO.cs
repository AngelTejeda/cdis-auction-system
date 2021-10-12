using CdisMart_DAL;
using System;
using System.Collections.Generic;

namespace CdisMart_BLL.Models
{
    public class AuctionAddDTO
    {
        public int OwnerId { get; set; }
        public string ProductName { get; set; }
        public string ProductDescription { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }

        public Auction GetDataBaseObject()
        {
            return new Auction()
            {
                OwnerId = OwnerId,
                ProductName = ProductName,
                ProductDescription = ProductDescription,
                StartDate = StartDate,
                EndDate = EndDate
            };
        }

        #region Validations
        public void ValidateDates()
        {
            DateTime now = GetTruncatedDate();

            if (StartDate < now)
                throw new ValidationException("La fecha de inicio debe ser posterior a la fecha actual.");

            if (EndDate <= StartDate)
                throw new ValidationException("La fecha de fin debe ser posterior a la fecha de inicio.");
        }

        public static DateTime GetTruncatedDate()
        {
            DateTime date = DateTime.Now;

            return new DateTime(date.Year, date.Month, date.Day, date.Hour, date.Minute, 0);
        }
        #endregion
    }
}

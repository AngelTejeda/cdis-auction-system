//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CdisMart_DAL
{
    using System;
    using System.Collections.Generic;
    
    public partial class Auction
    {
        public Auction()
        {
            this.AuctionRecords = new HashSet<AuctionRecord>();
        }
    
        public int AuctionId { get; set; }
        public string ProductName { get; set; }
        public string ProductDescription { get; set; }
        public System.DateTime StartDate { get; set; }
        public System.DateTime EndDate { get; set; }
        public Nullable<decimal> HighestBid { get; set; }
        public Nullable<int> WinnerId { get; set; }
        public int OwnerId { get; set; }
    
        public virtual User Owner { get; set; }
        public virtual User Winner { get; set; }
        public virtual ICollection<AuctionRecord> AuctionRecords { get; set; }
    }
}

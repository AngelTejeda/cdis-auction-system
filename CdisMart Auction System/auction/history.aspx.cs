using CdisMart_BLL;
using CdisMart_BLL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace CdisMart_Auction_System.Screens.Auctions
{
    public partial class AuctionHistory : ThemedPage
    {
        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!LoadAuctionFromDataBase(out AuctionInfoDTO auction))
                    Response.Redirect("~/auction/list.aspx");

                FillAuctionLabels(auction);

                List<AuctionRecordInfoDTO> auctionRecords = new AuctionRecordBLL().Get(auction.AuctionId).ToList();

                FillBiddersDropDownList(auctionRecords);
                FillAuctionRecordsGrid(auctionRecords);
            }
        }
        #endregion


        #region Startup
        private bool LoadAuctionFromDataBase(out AuctionInfoDTO auction)
        {
            if (!int.TryParse(Request.QueryString["id"], out int auctionRecordId))
            {
                auction = null;
                return false;
            }

            // Get Auction Basic Data. If Auction ID does not exist returns false.
            if (!new AuctionBLL().TryGet(auctionRecordId, out auction))
                return false;

            return true;
        }

        public void FillAuctionLabels(AuctionInfoDTO auction)
        {
            AuctionIdLabel.Text = auction.AuctionId.ToString();
            ProductNameLabel.Text = auction.ProductName;
            DescriptionLabel.Text = auction.ProductDescription;
        }

        private void FillAuctionRecordsGrid(List<AuctionRecordInfoDTO> auctionRecords)
        {
            AuctionRecordsGrid.DataSource = auctionRecords;
            AuctionRecordsGrid.DataBind();

            if (AuctionRecordsGrid.Rows.Count > 0)
                AuctionRecordsGrid.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        private void FillBiddersDropDownList(List<AuctionRecordInfoDTO> auctionRecords)
        {
            List<AuctionRecordInfoDTO> bidders = auctionRecords
                .GroupBy(auctionRecord => auctionRecord.BidderId)
                .Select(group => group.First())
                .ToList();

            BiddersDropDownList.DataSource = bidders;
            BiddersDropDownList.DataTextField = "BidderName";
            BiddersDropDownList.DataValueField = "BidderId";
            BiddersDropDownList.DataBind();

            if (bidders.Count > 0)
                BiddersDropDownList.Items.Insert(0, new ListItem("--- Seleccione un Ofertor ---", "0"));
            else
            {
                BiddersDropDownList.Items.Insert(0, new ListItem("--- No hay ofertas ---", "0"));
                BiddersDropDownList.Attributes["disabled"] = "disabled";
            }
        }
        #endregion
    }
}
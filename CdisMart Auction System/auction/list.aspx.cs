using CdisMart_BLL;
using CdisMart_BLL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace CdisMart_Auction_System.Screens.Auctions
{
    public partial class AuctionList : ThemedPage
    {
        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                BindAuctionsList(LoadAuctionsFromDatabase());
        }

        protected void ActiveAuctionsCheckBox_CheckedChanged(object sender, EventArgs e)
        {
            List<AuctionInfoDTO> auctions = (List<AuctionInfoDTO>)ViewState["Auctions"];

            if (ActiveAuctionsCheckBox.Checked)
                auctions = AuctionBLL.GetActiveAuctions(auctions).ToList();

            BindAuctionsList(auctions);
        }

        protected void AuctionsGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Bid")
                Response.Redirect("~/auction/info.aspx?id=" + e.CommandArgument);
            else if (e.CommandName == "History")
                Response.Redirect("~/auction/history.aspx?id=" + e.CommandArgument);
            else
                throw new NotImplementedException();
        }
        #endregion


        #region Startup
        private List<AuctionInfoDTO> LoadAuctionsFromDatabase()
        {
            List<AuctionInfoDTO> auctions = new AuctionBLL().Get().ToList();
            ViewState["Auctions"] = auctions;

            return auctions;
        }

        private void BindAuctionsList(List<AuctionInfoDTO> auctions)
        {
            AuctionsGrid.DataSource = auctions;
            AuctionsGrid.DataBind();

            if (auctions.Count() > 0)
                AuctionsGrid.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
        #endregion
    }
}
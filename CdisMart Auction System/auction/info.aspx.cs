using CdisMart_BLL;
using CdisMart_BLL.Models;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CdisMart_Auction_System.Screens.Auctions
{
    public partial class AuctionInfo : ThemedPage
    {
        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!LoadAuctionFromDataBase())
                    Response.Redirect("~/auction/list.aspx");

                FillAuctionLabels();

                if (!ValidateAuctionBidder() || !ValidateAuctionDate())
                {
                    StartupValidationMessage.Attributes.Remove("style");
                    BidAmountTextBox.Attributes["disabled"] = "disabled";
                    BidButton.Attributes["disabled"] = "disabled";
                }
            }
        }

        protected void BidButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
                RegisterBidRecord();
        }

        protected void CustomValidatorBidAmmount_ServerValidate(object source, ServerValidateEventArgs args)
        {
            AuctionInfoDTO auction = (AuctionInfoDTO)ViewState["Auction"];

            if (auction.HighestBid >= decimal.Parse(args.Value))
                args.IsValid = false;
        }
        #endregion


        #region Startup
        private bool LoadAuctionFromDataBase()
        {
            if (!int.TryParse(Request.QueryString["id"], out int auctionId))
                return false;

            if (!new AuctionBLL().TryGet(auctionId, out AuctionInfoDTO auction))
                return false;

            ViewState["Auction"] = auction;

            return true;
        }

        public void FillAuctionLabels()
        {
            AuctionInfoDTO auction = (AuctionInfoDTO)ViewState["Auction"];

            // Fill labels
            AuctionIdLabel.Text = auction.AuctionId.ToString();
            ProductNameLabel.Text = auction.ProductName;
            DescriptionLabel.Text = auction.ProductDescription;
            StartDateLabel.Text = auction.StartDate.ToString();
            EndDateLabel.Text = auction.EndDate.ToString();
            HighestBidLabel.Text = auction.HighestBid.ToString();
            HighestBidderLabel.Text = auction.HighestBidder;
        }
        #endregion


        #region Methods
        private void RegisterBidRecord()
        {
            AuctionInfoDTO auction = (AuctionInfoDTO)ViewState["Auction"];
            UserSessionDTO currentUser = (UserSessionDTO)Session["UserSession"];

            AuctionRecordAddDTO newAuctionRecord = new AuctionRecordAddDTO()
            {
                AuctionId = auction.AuctionId,
                BidderId = currentUser.UserId,
                BidAmount = decimal.Parse(BidAmountTextBox.Text),
            };

            try
            {
                new AuctionRecordBLL().Add(newAuctionRecord);
            }
            catch (Exception ex)
            {
                Alert("Error", ex.Message);
                return;
            }

            auction.HighestBid = decimal.Parse(BidAmountTextBox.Text);
            auction.HighestBidder = currentUser.FullName;

            Alert("Movimiento Exitoso", "Se registro el movimiento de manera exitosa.");
            FillAuctionLabels();
            ClearFormData();
        }

        private void ClearFormData()
        {
            BidAmountTextBox.Text = "";
        }
        #endregion


        #region Validations
        private bool ValidateAuctionBidder()
        {
            AuctionInfoDTO auction = (AuctionInfoDTO)ViewState["Auction"];
            UserSessionDTO currentUser = (UserSessionDTO)Session["UserSession"];

            if (auction.OwnerId == currentUser.UserId)
            {
                StartupValidationMessage.Text = "No puede ofertar en esta subasta.";
                return false;
            }

            return true;
        }

        private bool ValidateAuctionDate()
        {
            AuctionInfoDTO auction = (AuctionInfoDTO)ViewState["Auction"];
            DateTime now = DateTime.Now;

            now = new DateTime(now.Year, now.Month, now.Day, now.Hour, now.Minute, 0);

            if (now < auction.StartDate)
            {
                StartupValidationMessage.Text = "La subasta no ha comenzado.";
                return false;
            }

            if (auction.EndDate < now)
            {
                StartupValidationMessage.Text = "La subasta ha finalizado.";
                return false;
            }

            return true;
        }
        #endregion
    }
}
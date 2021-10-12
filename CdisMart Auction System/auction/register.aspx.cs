using CdisMart_BLL;
using CdisMart_BLL.Models;
using System;

namespace CdisMart_Auction_System.Screens.Auctions
{
    public partial class AuctionRegister : ThemedPage
    {
        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void AuctionButton_Click(object sender, EventArgs e)
        {
            RegisterAuction();
        }
        #endregion

        #region Methods
        private void RegisterAuction()
        {
            UserSessionDTO user = (UserSessionDTO)Session["UserSession"];

            AuctionAddDTO auction = new AuctionAddDTO()
            {
                OwnerId = user.UserId,
                ProductName = ProductNameTextBox.Text,
                ProductDescription = DescriptionTextArea.Text,
                StartDate = DateTime.Parse(StartDateTextBox.Text + " " + StartHourTextBox.Text),
                EndDate = DateTime.Parse(EndDateTextBox.Text + " " + EndHourTextBox.Text)
            };

            try
            {
                new AuctionBLL().Add(auction);
            }
            catch (Exception ex)
            {
                Alert("Error", ex.Message);
                return;
            }

            Alert("Movimiento Exitoso", "Se registro el movimiento de manera exitosa.");
            ClearForm();
        }

        private void ClearForm()
        {
            ProductNameTextBox.Text = "";
            DescriptionTextArea.Text = "";
            StartDateTextBox.Text = "";
            StartHourTextBox.Text = "";
            EndDateTextBox.Text = "";
            EndHourTextBox.Text = "";
        }
        #endregion
    }
}
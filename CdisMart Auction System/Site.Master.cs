using CdisMart_BLL;
using CdisMart_BLL.Models;
using System;
using System.Web.Services;
using System.Web.UI;

namespace CdisMart_Auction_System
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if user is logged in.
                if (Session["UserSession"] == null)
                    Response.Redirect("~/account/login.aspx");

                UserSessionDTO user = (UserSessionDTO)Session["UserSession"];
                UserFullNameLabel.Text = user.FullName;
            }
        }
    }
}
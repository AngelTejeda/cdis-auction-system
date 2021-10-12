using CdisMart_BLL;
using CdisMart_BLL.Models;
using System;
using System.Web.UI;

namespace CdisMart_Auction_System.Screens
{
    public partial class Login : ThemedPage
    {
        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            CheckLogin();
        }
        #endregion


        #region Methods
        public void CheckLogin()
        {
            string username = UsernameTextBox.Text;
            string password = PasswordTextBox.Text;

            UserSessionDTO user = new UserBLL().Login(username, password);

            if (user != null)
            {
                Session["UserSession"] = user;
                Response.Redirect("~/auction/list.aspx");
            }
            else
            {
                Alert("Error", "Usuario y/o contraseña incorrectos.");
            }
        }
        #endregion
    }
}
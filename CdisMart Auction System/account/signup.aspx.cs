using CdisMart_BLL;
using CdisMart_BLL.Models;
using System;
using System.Web.UI;

namespace CdisMart_Auction_System.Screens
{
    public partial class SignUp : ThemedPage
    {
        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SignUpButton_Click(object sender, EventArgs e)
        {
            UserRegisterDTO newUser = new UserRegisterDTO()
            {
                FullName = FullNameTextBox.Text,
                Email = EmailTextBox.Text,
                UserName = UsernameTextBox.Text,
                Password = PasswordTextBox.Text
            };

            try
            {
                new UserBLL().Register(newUser);
            }
            catch(Exception ex)
            {
                Alert("Error", ex.Message);
                return;
            }

            Alert("Operación Exitosa", "El registro se completo de manera exitosa.");
            Response.Redirect("~/account/Login");
        }
        #endregion
    }
}
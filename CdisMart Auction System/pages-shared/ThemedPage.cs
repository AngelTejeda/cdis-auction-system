using System;
using System.Web.UI;

namespace CdisMart_Auction_System.Screens
{
    public class ThemedPage : Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["Theme"] == null)
                Session["Theme"] = "DefaultTheme";

            Page.Theme = (string)Session["Theme"];
        }

        protected void Alert(string title, string message)
        {
            string script = $"alert('{ message }');";

            ScriptManager.RegisterStartupScript(this, this.GetType(), title, script, true);
        }
    }
}
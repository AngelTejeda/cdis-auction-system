using System.Web.Services;

namespace CdisMart_Auction_System.Screens
{
    [WebService(Namespace = "http://themeservice.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class ThemeService : System.Web.Services.WebService
    {
        [WebMethod(EnableSession = true)]
        public void ToggleTheme()
        {
            if (Session == null)
                return;

            if (Session["Theme"] == null)
                Session["Theme"] = "DefaultTheme";

            string theme = (string)Session["Theme"];

            Session["Theme"] = theme == "DarkTheme" ? "DefaultTheme" : "DarkTheme";
        }

        [WebMethod(EnableSession = true)]
        public void Logout()
        {
            if (Session == null)
                return;

            Session["UserSession"] = null;
        }
    }
}

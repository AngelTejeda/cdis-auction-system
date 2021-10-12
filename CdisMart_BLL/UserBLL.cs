using CdisMart_BLL.Models;
using CdisMart_DAL;

namespace CdisMart_BLL
{
    public class UserBLL
    {
        // Get the User entry from the database if the username and password match.
        public UserSessionDTO Login(string username, string password)
        {
            User dbUser = new UserDAL().Login(username, password);

            return dbUser != null ? new UserSessionDTO(dbUser) : null;
        }

        // Add an entry to Users in the database if the conditions are fullfield.
        public void Register(UserRegisterDTO newUser)
        {
            User dbUser = newUser.GetDataBaseObject();

            new UserDAL().Register(dbUser);
        }
    }
}

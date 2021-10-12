using CdisMart_DAL;

namespace CdisMart_BLL.Models
{
    public class UserSessionDTO
    {
        public int UserId { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; }
        public string FullName { get; set; }

        public UserSessionDTO()
        {

        }

        public UserSessionDTO(User dbUser)
        {
            UserId = dbUser.UserId;
            UserName = dbUser.UserName;
            Email = dbUser.Email;
            FullName = dbUser.FullName;
        }
    }
}

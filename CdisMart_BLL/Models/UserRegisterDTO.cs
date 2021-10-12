using CdisMart_DAL;

namespace CdisMart_BLL.Models
{
    public class UserRegisterDTO
    {
        public string UserName { get; set; }
        public string Password { get; set; }
        public string FullName { get; set; }
        public string Email { get; set; }

        public User GetDataBaseObject()
        {
            return new User()
            {
                UserName = UserName,
                Email = Email,
                Password = Password,
                FullName = FullName
            };
        }
    }
}

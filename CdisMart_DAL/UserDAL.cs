using System.Collections.Generic;
using System.Linq;

namespace CdisMart_DAL
{
    public class UserDAL : BaseDAL
    {
        // Get the User entry from the database if the username and password match.
        public User Login(string username, string password)
        {
            return DbContext.User
                .Where(user => user.UserName == username && user.Password == password)
                .FirstOrDefault();
        }

        // Add an entry to Users in the database if the conditions are fullfield.
        public void Register(User newUser)
        {
            ValidateUniqueUsername(newUser.UserName);
            ValidateUniqueEmail(newUser.Email);

            DbContext.User.Add(newUser);
            DbContext.SaveChanges();
        }

        // Check if the User ID exists in the database.
        public bool Exists(int userId)
        {
            User dbUser = DbContext.User
                .Where(user => user.UserId == userId)
                .FirstOrDefault();

            return dbUser != null;
        }

        #region Validations
        // Get all the User entries from the databes..
        private IEnumerable<User> Get()
        {
            return DbContext.User;
        }

        // Check if the email is unique in the database.
        private void ValidateUniqueEmail(string email)
        {
            User dbUser = Get().Where(user => user.Email == email).FirstOrDefault();

            if (dbUser != null)
                throw new ValidationException("El correo ingresado ya está en uso.");
        }

        // Check if the username is unique in the database.
        private void ValidateUniqueUsername(string username)
        {
            User dbUser = Get().Where(user => user.UserName == username).FirstOrDefault();

            if (dbUser != null)
                throw new ValidationException("El ususario ingresado ya está en uso.");
        }
        #endregion
    }
}

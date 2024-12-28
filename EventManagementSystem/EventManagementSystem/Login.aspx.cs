using System;
using System.Configuration;
using System.Data.SqlClient;

namespace EventManagementSystem
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            // Validate the user credentials
            if (ValidateUser(username, password))
            {
                // Get the user's role
                string role = GetUserRole(username);

                // Store the role and username in session
                Session["Username"] = username;
                Session["Role"] = role;

                // Redirect user based on role
                if (role == "Admin")
                {
                    Response.Redirect("AdminDashboard.aspx");
                }
                else if (role == "Organizer")
                {
                    Response.Redirect("OrganizerDashboard.aspx");
                }
                else if (role == "User")
                {
                    Response.Redirect("UserProfile.aspx"); // Redirect to UserProfile if user is logged in as "User"
                }
                else
                {
                    Response.Write("<script>alert('Role not recognized');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid credentials');</script>");
            }
        }

        // Function to validate user credentials against the database
        private bool ValidateUser(string username, string password)
        {
            string query = "SELECT COUNT(1) FROM Users WHERE Username = @Username AND Password = @Password";
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EventDB"].ConnectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Password", password);
                int result = Convert.ToInt32(cmd.ExecuteScalar());
                return result > 0; // Returns true if the user exists
            }
        }

        // Function to get the user's role based on the username
        private string GetUserRole(string username)
        {
            string query = "SELECT Role FROM Users WHERE Username = @Username";
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EventDB"].ConnectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Username", username);
                return cmd.ExecuteScalar().ToString(); // Returns the role of the user
            }
        }
    }
}

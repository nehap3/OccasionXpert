using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace EventManagementSystem
{
    public partial class EditProfile : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string username = Session["Username"]?.ToString();

                // If the user is not logged in, redirect to login page
                if (string.IsNullOrEmpty(username))
                {
                    Response.Redirect("Login.aspx");
                    return;
                }

                // Load the user profile details
                LoadUserProfile(username);
            }
        }

        private void LoadUserProfile(string username)
        {
            string query = "SELECT Username, Email FROM Users WHERE Username = @Username";

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EventDB"].ConnectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Username", username);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    reader.Read();
                    txtUsername.Text = reader["Username"].ToString();
                    txtEmail.Text = reader["Email"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('User not found');</script>");
                    Response.Redirect("Login.aspx");
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();

            // Ensure the passwords match
            if (password != confirmPassword)
            {
                Response.Write("<script>alert('Passwords do not match');</script>");
                return;
            }

            // Update user information in the database
            UpdateUserProfile(username, email, password);
        }

        private void UpdateUserProfile(string username, string email, string password)
        {
            string query = "UPDATE Users SET Email = @Email, Password = @Password WHERE Username = @Username";

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EventDB"].ConnectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password);  // In real-world use, hash the password before saving

                int result = cmd.ExecuteNonQuery();

                if (result > 0)
                {
                    Response.Write("<script>alert('Profile updated successfully');</script>");
                }
                else
                {
                    Response.Write("<script>alert('Error updating profile');</script>");
                }
            }
        }
    }
}

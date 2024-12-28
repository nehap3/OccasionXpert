using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;

namespace EventManagementSystem
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            if (ValidateEmail(email))
            {
                // Logic to send reset email (you may need to integrate an email service)
                // For demo purposes, show a success message.
                Response.Write("<script>alert('Password reset email sent.');</script>");
            }
            else
            {
                Response.Write("<script>alert('Email not found.');</script>");
            }
        }

        private bool ValidateEmail(string email)
        {
            // Create the connection string
            string connectionString = ConfigurationManager.ConnectionStrings["EventDB"].ConnectionString;

            // Define the SQL query
            string query = "SELECT COUNT(1) FROM Users WHERE Email = @Email";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Email", email);

                try
                {
                    conn.Open();
                    int result = Convert.ToInt32(cmd.ExecuteScalar());
                    return result > 0;
                }
                catch (Exception ex)
                {
                    // Handle exceptions (e.g., connection issues)
                    Response.Write("<script>alert('An error occurred: " + ex.Message + "');</script>");
                    return false;
                }
                finally
                {
                    conn.Close(); // Ensure the connection is closed
                }
            }
        }
    }
}

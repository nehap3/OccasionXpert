using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;

namespace EventManagementSystem
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();
            string role = ddlRole.SelectedValue;

            // Check if the email is valid
            if (!IsValidEmail(email))
            {
                Response.Write("<script>alert('Please enter a valid email address.');</script>");
                return;
            }

            // Check if passwords match
            if (password != confirmPassword)
            {
                Response.Write("<script>alert('Passwords do not match.');</script>");
                return;
            }

            // Check if a role is selected
            if (string.IsNullOrEmpty(role))
            {
                Response.Write("<script>alert('Please select a role.');</script>");
                return;
            }

            // Proceed with the registration logic if email is valid, passwords match, and role is selected
            if (RegisterUser(username, email, password, role))
            {
                Response.Write("<script>alert('Registration successful!'); window.location.href='Login.aspx';</script>");
            }
            else
            {
                Response.Write("<script>alert('Registration failed. Please try again later.');</script>");
            }
        }

        // Function to validate email using Regex
        private bool IsValidEmail(string email)
        {
            string emailPattern = @"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";
            Regex regex = new Regex(emailPattern);
            return regex.IsMatch(email);
        }

        // Function to register user in the database
        private bool RegisterUser(string username, string email, string password, string role)
        {
            string query = "INSERT INTO Users (Username, Email, Password, Role) VALUES (@Username, @Email, @Password, @Role)";
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EventDB"].ConnectionString))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Password", password);
                    cmd.Parameters.AddWithValue("@Role", role); // Store the role as selected by the user

                    conn.Open();
                    int result = cmd.ExecuteNonQuery(); // Returns the number of affected rows
                    return result > 0; // If rows are affected, registration is successful
                }
                catch (Exception ex)
                {
                    // Log or display the error message for debugging purposes
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                    return false;
                }
            }
        }
    }
}

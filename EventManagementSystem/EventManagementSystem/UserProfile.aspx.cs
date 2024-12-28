using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventManagementSystem
{
    public partial class UserProfile : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string username = Session["Username"]?.ToString();

                // If the user is not logged in, redirect to the login page
                if (string.IsNullOrEmpty(username))
                {
                    Response.Redirect("Login.aspx");
                    return;
                }

                // Load the user profile details
                LoadUserProfile(username);

                // Load the registered events
                LoadRegisteredEvents(username);
            }
        }

        // Load user details (username, email)
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
                    lblUsername.Text = reader["Username"].ToString();
                    lblEmail.Text = reader["Email"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('User not found');</script>");
                    Response.Redirect("Login.aspx");
                }
            }
        }

        // Load the events the user is registered for
        private void LoadRegisteredEvents(string username)
        {
            string query = "SELECT E.EventName, E.EventDate, E.Location FROM Events E " +
                           "JOIN Registrations R ON E.EventID = R.EventID " +
                           "JOIN Users U ON R.UserID = U.UserID " +
                           "WHERE U.Username = @Username";

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EventDB"].ConnectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Username", username);

                SqlDataReader reader = cmd.ExecuteReader();
                gvRegisteredEvents.DataSource = reader;
                gvRegisteredEvents.DataBind();
            }
        }
    }
}

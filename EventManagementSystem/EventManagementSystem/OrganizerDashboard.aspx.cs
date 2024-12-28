using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventManagementSystem
{
    public partial class OrganizerDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string username = Session["Username"]?.ToString();

                // If the user is not logged in or not an organizer, redirect to the login page
                if (string.IsNullOrEmpty(username) || Session["Role"]?.ToString() != "Organizer")
                {
                    Response.Redirect("Login.aspx");
                    return;
                }

                // Load events for this organizer
                LoadOrganizerEvents(username);
            }
        }

        private void LoadOrganizerEvents(string organizerUsername)
        {
            string query = "SELECT EventID, EventName, EventDate, Location, Capacity FROM Events WHERE Organizer = @Organizer";
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EventDB"].ConnectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Organizer", organizerUsername);  // Use organizer's username as filter

                SqlDataReader reader = cmd.ExecuteReader();
                gvOrganizerEvents.DataSource = reader;
                gvOrganizerEvents.DataBind();
            }
        }
    }
}

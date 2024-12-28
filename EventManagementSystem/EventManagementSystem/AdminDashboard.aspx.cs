using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace EventManagementSystem
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the user is logged in and has the "Admin" role
            if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
            {
                // Redirect user to Default.aspx if not an Admin
                Response.Redirect("Default.aspx");
            }

            // Load events if not postback
            if (!IsPostBack)
            {
                LoadEvents();
            }
        }

        // Load events to be displayed in the GridView
        private void LoadEvents()
        {
            string query = "SELECT EventID, EventName, EventDate, Location, Capacity, Organizer FROM Events";
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EventDB"].ConnectionString))
            {
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvAdminEvents.DataSource = dt;
                gvAdminEvents.DataBind();
            }
        }

        // Delete event from the database
        protected void gvAdminEvents_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int eventId = Convert.ToInt32(gvAdminEvents.DataKeys[e.RowIndex].Value);
            string query = "DELETE FROM Events WHERE EventID = @EventID";

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EventDB"].ConnectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@EventID", eventId);

                cmd.ExecuteNonQuery();
            }

            // Reload the events after deleting
            LoadEvents();
        }

        // Add new event to the database
        protected void btnAddEvent_Click(object sender, EventArgs e)
        {
            string eventName = txtEventName.Text.Trim();
            string eventDate = txtEventDate.Text.Trim();
            string location = txtLocation.Text.Trim();
            int capacity = Convert.ToInt32(txtCapacity.Text.Trim());
            string organizer = txtOrganizer.Text.Trim();  // Organizer's username

            string query = "INSERT INTO Events (EventName, EventDate, Location, Capacity, Organizer) " +
                           "VALUES (@EventName, @EventDate, @Location, @Capacity, @Organizer)";

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EventDB"].ConnectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@EventName", eventName);
                cmd.Parameters.AddWithValue("@EventDate", eventDate);
                cmd.Parameters.AddWithValue("@Location", location);
                cmd.Parameters.AddWithValue("@Capacity", capacity);
                cmd.Parameters.AddWithValue("@Organizer", organizer);

                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Event added successfully!');</script>");

                // Refresh the event list to show the new event
                LoadEvents();
            }
        }
    }
}

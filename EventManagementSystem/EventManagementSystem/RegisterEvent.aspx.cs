using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace EventManagementSystem
{
    public partial class RegisterEvent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string eventId = Request.QueryString["EventID"];

                // Check if eventId is null or empty
                if (string.IsNullOrEmpty(eventId))
                {
                    Response.Write("<script>alert('Invalid Event ID. Redirecting to events list.');</script>");
                    Response.Redirect("Default.aspx");
                    return;
                }

                // Load event details
                LoadEventDetails(eventId);
            }
        }

        private void LoadEventDetails(string eventId)
        {
            string query = "SELECT EventName FROM Events WHERE EventID = @EventID";
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EventDB"].ConnectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@EventID", eventId);

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    reader.Read();
                    lblEventName.Text = reader["EventName"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Event not found.');</script>");
                    Response.Redirect("Default.aspx");
                }
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string eventId = Request.QueryString["EventID"];
            string username = Session["Username"]?.ToString();

            // Validate if user is logged in
            if (string.IsNullOrEmpty(username))
            {
                Response.Write("<script>alert('Please login to register for events.');</script>");
                Response.Redirect("Login.aspx");
                return;
            }

            string query = "INSERT INTO Registrations (UserID, EventID) SELECT UserID, @EventID FROM Users WHERE Username = @Username";
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EventDB"].ConnectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@EventID", eventId);
                cmd.Parameters.AddWithValue("@Username", username);

                cmd.ExecuteNonQuery();
            }

            // Trigger the JavaScript popup after successful registration
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "showPopup('Registered successfully!');", true);
            Response.Redirect("Default.aspx"); // Redirect to the default page after registration
        }
    }
}

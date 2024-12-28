using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventManagementSystem
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadEvents();
            }
        }

        private void LoadEvents()
        {
            string query = "SELECT EventID, EventName, EventDate, Location FROM Events";
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EventDB"].ConnectionString))
            {
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvEvents.DataSource = dt;
                gvEvents.DataBind();
            }
        }

        protected void gvEvents_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Register")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                string eventId = gvEvents.DataKeys[index].Value.ToString();
                Response.Redirect($"RegisterEvent.aspx?EventID={eventId}");
            }
        }
    }
}

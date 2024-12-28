using System;
using System.Web.UI;

namespace EventManagementSystem
{
    public partial class Contact : Page
    {
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string message = txtMessage.Text.Trim();

            // For demonstration, show a simple alert (in real-world use, store this in the database or send via email)
            if (!string.IsNullOrEmpty(name) && !string.IsNullOrEmpty(email) && !string.IsNullOrEmpty(message))
            {
                Response.Write("<script>alert('Thank you for contacting us. We will get back to you soon!');</script>");
                txtName.Text = "";
                txtEmail.Text = "";
                txtMessage.Text = "";
            }
            else
            {
                Response.Write("<script>alert('Please fill all fields before submitting.');</script>");
            }
        }
    }
}

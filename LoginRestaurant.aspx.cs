using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient; 
using System.Configuration;

namespace Final_Project
{
    public partial class LoginRestaurant : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUser.Text.Trim();
            string password = txtPass.Text.Trim();
            string connStr = ConfigurationManager.ConnectionStrings["Database"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT user_id FROM Users WHERE username = @username AND password = @password";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@password", password);
                conn.Open();
                object result = cmd.ExecuteScalar();
                if (result != null)
                {
                    int userId = Convert.ToInt32(result);
                    Session["user_id"] = userId;
                    string returnUrl = Request.QueryString["ReturnUrl"];
                    if (!string.IsNullOrEmpty(returnUrl))
                    {
                        Response.Redirect(returnUrl, false);
                        Context.ApplicationInstance.CompleteRequest();
                    }
                    else
                    {
                        Response.Redirect("Default.aspx", false);
                        Context.ApplicationInstance.CompleteRequest();
                    }
                }
                else
                {
                    lblMessage.Text = "Invalid username or password.";
                }
            }

        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Final_Project
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Clear session when visiting login page (good practice)
            Session["User"] = null;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // 1. Get the connection string from Web.config
            string connStr = ConfigurationManager.ConnectionStrings["RestaurantDB"].ConnectionString;

            // 2. Define the SQL Query (Using parameters is safer than string concatenation)
            string query = "SELECT Count(*) FROM tblUsers WHERE Username=@user AND Password=@pass";

            // 3. Connect to Database
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    // Add parameters to prevent SQL Injection
                    cmd.Parameters.AddWithValue("@user", txtUser.Text.Trim());
                    cmd.Parameters.AddWithValue("@pass", txtPass.Text.Trim());

                    try
                    {
                        conn.Open();
                        // ExecuteScalar returns the first column of the first row (the Count)
                        int count = (int)cmd.ExecuteScalar();

                        // 4. IF/ELSE Logic
                        if (count > 0)
                        {
                            // Login Success: Create Session
                            Session["User"] = txtUser.Text.Trim();

                            // Redirect to Menu
                            Response.Redirect("Menu.aspx");
                        }
                        else
                        {
                            // Login Failed
                            lblMessage.Text = "Invalid Username or Password.";
                        }
                    }
                    catch (Exception ex)
                    {
                        // Handle potential database errors
                        lblMessage.Text = "Error: " + ex.Message;
                    }
                }
            }
        }
    }
}
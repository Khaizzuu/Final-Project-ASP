using System;
using System.Configuration;
using System.Data.SqlClient;

namespace RestaurantProject
{
    public partial class RegisterUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Usually empty for register page
        }

        // FIX: This method name matches the OnClick="ButtonRegister_Click" in the HTML
        protected void ButtonRegister_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["RestaurantDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                // Simple Insert Query
                string query = "INSERT INTO tblUsers (Username, Password) VALUES (@user, @pass)";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@user", txtRegUser.Text.Trim());
                    cmd.Parameters.AddWithValue("@pass", txtRegPass.Text.Trim());

                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();

                        // Redirect to Login on success
                        Response.Redirect("Login.aspx");
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = "Error: " + ex.Message;
                    }
                }
            }
        }
    }
}
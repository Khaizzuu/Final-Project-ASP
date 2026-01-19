using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Final_Project
{
    public partial class RegisterUserRestaurant : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPass.Text.Trim();

            //Get Connection String
            string connStr = ConfigurationManager.ConnectionStrings["Database"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                try
                {
                    conn.Open();

                    // Check if Email already exists to prevent duplicates
                    string checkQuery = "SELECT COUNT(*) FROM Users WHERE email = @email";
                    SqlCommand checkCmd = new SqlCommand(checkQuery, conn);
                    checkCmd.Parameters.AddWithValue("@email", email);

                    int exists = (int)checkCmd.ExecuteScalar();

                    if (exists > 0)
                    {
                        lblMessage.Text = "This email is already registered.";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                    else
                    {
                        // Insert new user
                        string insertQuery = "INSERT INTO Users (username, email, password) VALUES (@username, @email, @password)";

                        SqlCommand insertCmd = new SqlCommand(insertQuery, conn);
                        insertCmd.Parameters.AddWithValue("@name", name);
                        insertCmd.Parameters.AddWithValue("@email", email);
                        insertCmd.Parameters.AddWithValue("@password", password); 

                        int rowsAffected = insertCmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            // Registration Successful
                            lblMessage.Text = "Registration Successful! Redirecting to login...";
                            lblMessage.ForeColor = System.Drawing.Color.Green;

                            // Optional: Redirect after a short delay or immediately
                            Response.Redirect("LoginRestaurant.aspx");
                        }
                        else
                        {
                            lblMessage.Text = "Registration failed. Please try again.";
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Handle database errors
                    lblMessage.Text = "Error: " + ex.Message;
                }
            }
        }
    }
}

using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Final_Project
{
    public partial class ItemMenu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadMenuItems();
            }
        }

        private void LoadMenuItems()
        {
            // Create DataTable to hold menu items
            DataTable menuTable = GetMenuFromDatabase();

            // Bind data to Repeater
            RepeaterMenu.DataSource = menuTable;
            RepeaterMenu.DataBind();
        }

        private DataTable GetMenuFromDatabase() { 
            DataTable dt = new DataTable();
            string connectionString = ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString)) { 
                string query = "SELECT menu_item_id, name, price, description, image_url FROM menu_items ORDER BY menu_item_id"; 
                using (SqlDataAdapter adapter = new SqlDataAdapter(query, conn)) 
                { 
                    adapter.Fill(dt); 
                } 
            } return dt; 
        }

        protected void RepeaterMenu_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "AddToCart")
            {
                int itemId = Convert.ToInt32(e.CommandArgument);
                AddToCart(itemId);
            }
        }

        private void AddToCart(int itemId)
        {
            // Add your cart logic here
            // For now, just show a message
            string script = $"alert('Item {itemId} added to cart!');";
            ClientScript.RegisterStartupScript(this.GetType(), "AddToCartAlert", script, true);

            // You can implement actual cart functionality:
            // - Store in Session
            // - Save to database
            // - Update cart counter, etc.
        }
    }
}

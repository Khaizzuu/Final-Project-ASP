using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Final_Project
{
    public partial class Checkout : System.Web.UI.Page
    {

        private DataTable retrieveCartItems()
        {
            int[,] cartItems = (int[,])Session["cart_items"];
            if (cartItems == null || cartItems.Length == 0)
            {
                return null;
            }
            else
            {
                int userId = (int)Session["user_id"];
                DataTable dt = new DataTable();
                dt.Columns.Add("id", typeof(int));
                dt.Columns.Add("name", typeof(string));
                dt.Columns.Add("price", typeof(decimal));
                dt.Columns.Add("quantity", typeof(int));
                dt.Columns.Add("total", typeof(decimal));

                string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();
                    string query = "SELECT name, price FROM menu_items WHERE menu_item_id = @MenuItemID";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        for (int i = 0; i < cartItems.GetLength(0); i++)
                        {
                            int menuID = cartItems[i, 0];
                            int qty = cartItems[i, 1];
                            cmd.Parameters.Clear();
                            cmd.Parameters.AddWithValue("@MenuItemID", menuID);
                            using (SqlDataReader reader = cmd.ExecuteReader())
                            {
                                if (reader.Read())
                                {
                                    string name = reader["name"].ToString();
                                    decimal price = Convert.ToDecimal(reader["price"]);
                                    decimal total = price * qty;

                                    dt.Rows.Add(menuID, name, price, qty, total);
                                }
                            }
                        }
                    }
                }
                return dt;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            int[,] a = { {1, 1} };
            Session["cart_items"] = a;
            ;
            if (!IsPostBack) 
            {
                if (Session["user_id"] != null)
                {
                    DataTable cartItemsTable = retrieveCartItems();
                    if (cartItemsTable != null)
                    {
                        Panel2.Visible = true;
                        Panel1.Visible = false;
                        rptCartItem.DataSource = cartItemsTable;
                        rptCartItem.DataBind();
                        decimal grandTotal = 0;
                        foreach (DataRow row in cartItemsTable.Rows)
                        {
                            grandTotal += (decimal)row["total"];
                        }
                        lblGrandTotal.Text = grandTotal.ToString("F2");
                    }
                    else 
                    {
                        lblPanel1.Text = "Cart is empty";
                        Panel2.Visible = false;
                        Panel1.Visible = true;
                    }
                }
                else
                {
                    Response.Redirect("LoginRestaurant.aspx?ReturnUrl=" + Server.UrlEncode(Request.RawUrl), false);
                    Context.ApplicationInstance.CompleteRequest();
                }
            }
        }

        protected void returnMenuButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
        }

        protected void checkout_Click(object sender, EventArgs e)
        {
            DataTable cartItemsTable = retrieveCartItems();
            if (cartItemsTable != null)
            {
                decimal grandTotal = 0;
                foreach (DataRow row in cartItemsTable.Rows)
                {
                    grandTotal += (decimal)row["total"];
                }
            }
        }
    }
}
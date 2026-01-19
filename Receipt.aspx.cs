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
    public partial class Receipt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) 
            {
                string orderIdString = Request.QueryString["id"];
                int orderId;
                if (orderIdString != null && int.TryParse(orderIdString, out orderId)) 
                {
                    DateTime order_date;
                    decimal grandTotal;
                    int status_id;
                    int user_id;
                    string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
                    using (SqlConnection conn = new SqlConnection(connStr))
                    {
                        conn.Open();
                        string orderQuery = "SELECT order_date, total_amount, status_id, user_id FROM orders WHERE order_id = @orderID";
                        using (SqlCommand cmd = new SqlCommand(orderQuery, conn))
                        {
                            cmd.Parameters.AddWithValue("@orderId", orderId);
                            using (SqlDataReader reader = cmd.ExecuteReader())
                            {
                                if (reader.HasRows)
                                {
                                    reader.Read();
                                    order_date = (DateTime)reader["order_date"];
                                    grandTotal = (decimal)reader["total_amount"];
                                    status_id = (int)reader["status_id"];
                                    user_id = (int)reader["user_id"];
                                    lblGrandTotal.Text = grandTotal.ToString();
                                    lblOrderId.Text = orderId.ToString();
                                    lblStatus.Text = status_id.ToString();
                                    lblDate.Text = order_date.ToString();
                                }
                            }
                        }


                        string query = "SELECT quantity, price_at_order, menu_items.name as name FROM order_items INNER JOIN menu_items ON order_items.menu_item_id = menu_items.menu_item_id WHERE order_id = @orderId";
                        using (SqlCommand cmd = new SqlCommand(query, conn)) 
                        {
                            cmd.Parameters.AddWithValue("@orderId", orderId);
                            using (SqlDataAdapter sda = new SqlDataAdapter(cmd)) 
                            {
                                DataTable dt = new DataTable();
                                sda.Fill(dt);
                                rptOrderItems.DataSource = dt;
                                rptOrderItems.DataBind();
                            }
                        }
                    }
                }
                else 
                {
                    Response.Redirect("Menu.aspx", false);
                    Context.ApplicationInstance.CompleteRequest();
                }
            }
        }

        protected void menuBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
        }

        protected void orderHistoryBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("statusOrder.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}
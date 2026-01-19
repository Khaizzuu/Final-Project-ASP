using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Final_Project
{
    public partial class statusOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["user_id"] != null)
                {
                    int userId = (int)Session["user_id"];
                    string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString;

                    using (SqlConnection conn = new SqlConnection(connStr))
                    {
                        conn.Open();
                        string queryOrder = "SELECT order_id, order_date, total_amount, status_.name FROM orders " +
                            "INNER JOIN status_ ON orders.status_id = status_.status_id " +
                            "WHERE user_id = @UserID";
                        using (SqlCommand cmd = new SqlCommand(queryOrder, conn))
                        {
                            cmd.Parameters.AddWithValue("@UserID", userId);

                            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                            {
                                DataTable ordersTable = new DataTable();
                                sda.Fill(ordersTable);
                                if (ordersTable.Rows.Count > 0)
                                {
                                    rptOrders.DataSource = ordersTable;
                                    rptOrders.DataBind();
                                }
                                else
                                {
                                    lblMessage.Text = "No orders found.";
                                }
                            }
                        } 
                    }
                }
                else
                {
                    Response.Redirect("LoginRestaurant.aspx?ReturnUrl=" + Server.UrlEncode(Request.RawUrl), false);
                    Context.ApplicationInstance.CompleteRequest();
                }
            }
        }

        protected void rptOrders_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView row = (DataRowView)e.Item.DataItem;
                int orderId = Convert.ToInt32(row["order_id"]);

                Repeater rptItems = (Repeater)e.Item.FindControl("rptItems");

                string connStr = ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string sqlItems = "SELECT menu_items.name, quantity, price_at_order FROM order_items " +
                                      "INNER JOIN menu_items ON order_items.menu_item_id = menu_items.menu_item_id " +
                                      "WHERE order_id = @OrderID";

                    using (SqlCommand cmd = new SqlCommand(sqlItems, conn))
                    {
                        cmd.Parameters.AddWithValue("@OrderID", orderId);
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            DataTable dtItems = new DataTable();
                            sda.Fill(dtItems);

                            rptItems.DataSource = dtItems;
                            rptItems.DataBind();
                        }
                    }
                }
            }
        }


        protected string GetStatusClasses(object statusObj)
        {
            string status = statusObj.ToString().ToLower();

            string common = "px-3 py-1 rounded-full text-xs font-bold uppercase tracking-wider ";

            if (status == "completed")
            {
                return common + "bg-emerald-100 text-emerald-700";
            }
            else if (status == "pending")
            {
                return common + "bg-amber-100 text-amber-700";
            }
            else if (status == "cancelled")
            {
                return common + "bg-rose-100 text-rose-700";
            }
            else
            {
                return common + "bg-slate-100 text-slate-600";
            }
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}
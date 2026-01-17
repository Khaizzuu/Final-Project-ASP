using System;
using System.Collections.Generic;
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
                    int orderId = (int)Session["user_id"];
                    lblDisplayUserId.Text = orderId.ToString();
                }
                else
                {
                    Response.Redirect("LoginRestaurant.aspx?ReturnUrl=" + Server.UrlEncode(Request.RawUrl), false);
                    Context.ApplicationInstance.CompleteRequest();
                }
            }
        }
    }
}
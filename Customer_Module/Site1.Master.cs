using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookInn
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        public string user_name;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if session variables exist
                if (Session["CustomerID"] != null && Session["UserName"] != null)
                {
                    string customerID = Session["CustomerID"].ToString();
                    string username = Session["UserName"].ToString();

                    // Update labels or controls with admin ID and name
                    //lblAdminID.Text = "Admin ID: " + adminID;
                    user_name = "" + username;
                }
                
            }
        }

        protected void logout_bt_Click(object sender, EventArgs e)
        {
            Session["UserName"] = null;
            Session["Email"] = null;
            Session["CustomerID"] = null;

            Response.Redirect("Index.aspx");
        }
    }
}
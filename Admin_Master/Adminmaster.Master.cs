using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookInn
{
    public partial class Adminmaster : System.Web.UI.MasterPage
    {
        public string admin_username;
        public string admin_ID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if session variables exist
                if (Session["AdminID"] != null && Session["AdminName"] != null)
                {
                    string adminID = Session["AdminID"].ToString();
                    string adminName = Session["AdminName"].ToString();

                    // Update labels or controls with admin ID and name
                    admin_ID = " " + adminID;
                    admin_username = "" + adminName;
                }
                
            }
        }

        protected void logout_bt2_Click(object sender, EventArgs e)
        {
            Session["AdminID"] = null;
            Session["Hotel_ID"] = null;
            Response.Redirect("~/Customer_Module/Index.aspx");
        }
    }
}
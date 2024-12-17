using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookInn
{
    public partial class Admin_home : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataReader rdr;
        string con;
        int adminID;
        int hotelID;

        public List<Dictionary<string, dynamic>> hotelDataList = new List<Dictionary<string, dynamic>>();
        protected void Page_Load(object sender, EventArgs e)
        {
            con = WebConfigurationManager.ConnectionStrings["con1"].ConnectionString;
            conn = new SqlConnection(con);
            conn.Open();
            if (!IsPostBack)
            {

                adminID = Convert.ToInt32(Session["AdminID"]);
                hotelID = Convert.ToInt32(Session["Hotel_ID"]);


                // Call this method to load data on initial page load
                fillhotel();

                hotelName.InnerText = hotelDataList[0]["hotel_name"];

            }

        }
        protected void fillhotel()
        {
            // Initialize the list inside the fillstaff method
            hotelDataList = new List<Dictionary<string, dynamic>>();
            try
            {
                string query = "Select * from Hotel_registration where hotel_ID = " + hotelID;
                using (cmd = new SqlCommand(query, conn))
                {
                    using (rdr = cmd.ExecuteReader())
                    {
                        if (rdr.HasRows)
                        {
                            while (rdr.Read())
                            {
                                Dictionary<string, dynamic> temDic = new Dictionary<string, dynamic>
                                {
                                    { "hotel_ID" , rdr["hotel_ID"]},
                                    { "admin_ID",rdr["admin_ID"]},
                                    { "hotel_name",rdr["hotel_name"]},
                                    { "hotel_address",rdr["hotel_address"]},
                                    { "hotel_contact",rdr["hotel_contact"]},
                                    { "hotel_email",rdr["hotel_email"]},
                                    { "City",rdr["City"]},
                                    { "Country", rdr["Country"] },
                                    { "image_data", rdr["image_data"] },
                                    { "starting_rates", rdr["starting_rates"] }

                                };
                                hotelDataList.Add(temDic);
                            }
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                string script = "alert('" + ex.Message + "');";
                ClientScript.RegisterStartupScript(this.GetType(), "ErrorPopupScript", script, true);
            }
        }
        public string GetImageName()
        {
            // Return the image name from the first dictionary in the list
            return hotelDataList[0]["image_data"].ToString();
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Collections;
using System.Configuration;
using System.Web.Services;

namespace BookInn.Admin_Master
{
    public partial class Facilities_page : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataReader rdr;
        string con;
        int adminID;
        int hotelID;

        // Declare the list to hold all staff data at the class level
        public List<Dictionary<string, dynamic>> facilitiesDataList = new List<Dictionary<string, dynamic>>();
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
                fillfacilities();

                // Bind the staffDataList to the Repeater
                FacilitiesRepeater.DataSource = facilitiesDataList;
                FacilitiesRepeater.DataBind();
            }
        }
        protected void fillfacilities()
        {
            // Initialize the list inside the fillstaff method
            facilitiesDataList = new List<Dictionary<string, dynamic>>();
            try
            {
                string query = "Select * from hotels_facilities where hotel_ID = " + hotelID;
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
                                    { "facilityID" , rdr["facilityID"]},
                                    { "hotel_ID",rdr["hotel_ID"]},
                                    { "admin_ID",rdr["admin_ID"]},
                                    { "FacilityName",rdr["FacilityName"]}
                                    

                                };
                                facilitiesDataList.Add(temDic);
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
    [WebMethod]
    public static bool UpdatefacilityDetails(string facilityid, string hotelfacilities)
    {

        string connectionString = WebConfigurationManager.ConnectionStrings["con1"].ConnectionString;
        string query = @"
            UPDATE hotels_facilities
            SET 
                FacilityName = @v1

            WHERE facilityID = @facilityID";

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@facilityID", facilityid);
                cmd.Parameters.AddWithValue("@v1", hotelfacilities);


                try
                {
                    conn.Open();
                    int result = cmd.ExecuteNonQuery();
                    return result == 1;
                }
                catch (Exception)
                {
                    // Log the exception

                    return false;
                }
            }
        }
    }

        protected void addfacilities_bt_Click(object sender, EventArgs e)
        {
            Response.Redirect("Facilities_details.aspx");
        }
    }
}
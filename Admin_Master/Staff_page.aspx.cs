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
    public partial class Staff_page : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataReader rdr;
        string con;
        int adminID;
        int hotelID;
        // Define staffData as a property of the page class
        // Declare the list to hold all staff data at the class level
        public List<Dictionary<string, dynamic>> staffDataList = new List<Dictionary<string, dynamic>>();
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
                fillstaff();

                // Bind the staffDataList to the Repeater
                StaffRepeater.DataSource = staffDataList;
                StaffRepeater.DataBind();
            }
        }
        protected void fillstaff()
        {
            // Initialize the list inside the fillstaff method
            staffDataList = new List<Dictionary<string, dynamic>>();
            try
            {
                string query = "Select * from Adminstaff_details where hotel_ID = " + hotelID;
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
                                    { "staffID" , rdr["staffID"]},
                                    { "staff_fname",rdr["staff_fname"]},
                                    { "staff_lname",rdr["staff_lname"]},
                                    { "staff_position",rdr["staff_position"]},
                                    { "staff_email",rdr["staff_email"]},
                                    { "staff_location",rdr["staff_location"]},
                                    { "staff_phone",rdr["staff_phone"]},
                                    { "staff_gender", rdr["staff_gender"] }

                                };
                                staffDataList.Add(temDic);
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
        public static bool UpdateStaffDetails(string staffId, string staffFname, string staffPosition, string staffEmail, string staffLocation, string staffPhone, string staffGender)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["con1"].ConnectionString;
            string query = @"
            UPDATE Adminstaff_details
            SET 
                staff_fname = @v1,
                staff_position = @v2,
                staff_email = @v3,
                staff_location = @v4,
                staff_phone = @v5,
                staff_gender = @v6
            WHERE staffID = @StaffID";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@StaffID", staffId);
                    cmd.Parameters.AddWithValue("@v1", staffFname);
                    cmd.Parameters.AddWithValue("@v2", staffPosition);
                    cmd.Parameters.AddWithValue("@v3", staffEmail);
                    cmd.Parameters.AddWithValue("@v4", staffLocation);
                    cmd.Parameters.AddWithValue("@v5", staffPhone);
                    cmd.Parameters.AddWithValue("@v6", staffGender);

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

        protected void addstaff_bt_Click(object sender, EventArgs e)
        {

            Response.Redirect("Staff_details.aspx");
        }
    }
}
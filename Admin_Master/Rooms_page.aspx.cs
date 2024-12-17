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
    public partial class Rooms_page : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataReader rdr;
        string con;
        int adminID;
        int hotelID;


        // Declare the list to hold all staff data at the class level
        public List<Dictionary<string, dynamic>> roomDataList = new List<Dictionary<string, dynamic>>();
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
                fillrooms();

                // Bind the staffDataList to the Repeater
                RoomRepeater.DataSource = roomDataList;
                RoomRepeater.DataBind();
            }
        }
        protected void fillrooms()
        {
            // Initialize the list inside the fillstaff method
            roomDataList = new List<Dictionary<string, dynamic>>();
            try
            {
                string query = "Select * from Adminrooms_table where hotel_ID = " + hotelID;
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
                                    { "roomID" , rdr["roomID"]},
                                    { "hotel_ID",rdr["hotel_ID"]},
                                    { "admin_ID",rdr["admin_ID"]},
                                    { "roomno",rdr["roomno"]},
                                    { "roomcategoies",rdr["roomcategoies"]},
                                    { "per_night_range",rdr["per_night_range"]},
                                    { "room_photo",rdr["room_photo"]},
                                    { "room_description", rdr["room_description"] },
                                    { "room_services", rdr["room_services"] },
                                    { "room_availability", rdr["room_availability"] }

                                };
                                roomDataList.Add(temDic);
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

        public static bool UpdateRoomsDetails(string roomId, string roomfacilities, string roomcategoies,string roomrange,string roomavailable)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["con1"].ConnectionString;

            string query = @"
            UPDATE Adminrooms_table
            SET 
                room_services = @v1,
                roomcategoies = @v2,
                per_night_range = @v3,
                room_availability = @v4
            WHERE roomID = @roomID";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@roomID", roomId);
                    cmd.Parameters.AddWithValue("@v1", roomfacilities);
                    cmd.Parameters.AddWithValue("@v2", roomcategoies);
                    cmd.Parameters.AddWithValue("@v3", roomrange);
                    cmd.Parameters.AddWithValue("@v4", roomavailable);
                    
                    

                   
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
        protected void addroom_bts_Click(object sender, EventArgs e)
        {
            Response.Redirect("Rooms_details.aspx");
        }
    }
}
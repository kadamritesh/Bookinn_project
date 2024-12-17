using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookInn.Customer_Module
{
    public partial class RoomSelect_page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string hotelName = Request.QueryString["hotelName"];


            // Use the hotel name to fetch hotel details from the database
            string connectionString = WebConfigurationManager.ConnectionStrings["con1"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = @"
                SELECT 
                    HR.hotel_name,
                    AR.roomcategoies,
                    AR.per_night_range,
                    AR.room_photo,
                    AR.room_services,
                    AR.room_availability,
                    AR.roomID
                FROM 
                    Hotel_registration HR
                JOIN 
                    Adminrooms_table AR ON HR.hotel_ID = AR.hotel_ID
                JOIN 
                    hotels_facilities HF ON HR.hotel_ID = HF.hotel_ID
                WHERE
                    HR.hotel_name = @HotelName
                    
                 GROUP BY
                HR.hotel_name,
                AR.roomcategoies,
                AR.per_night_range,
                AR.room_photo,
                AR.room_services,
	            AR.room_availability,
	            AR.roomID";

                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@HotelName", hotelName);

                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                roomRepeater.DataSource = reader;
                roomRepeater.DataBind();
            }

        }
    }
}
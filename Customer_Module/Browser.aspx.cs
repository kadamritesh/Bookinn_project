using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
using System.Drawing;
using System.Web.Configuration;

namespace BookInn
{
    public partial class Browser : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataReader rdr;
        string con;
        // Declare the list to hold all staff data at the class level
        public List<Dictionary<string, dynamic>> hotelDataList = new List<Dictionary<string, dynamic>>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                con = WebConfigurationManager.ConnectionStrings["con1"].ConnectionString;
                conn = new SqlConnection(con);
                conn.Open();


                // Call this method to load data on initial page load
                fillhotel();

                // Bind the staffDataList to the Repeater
                HotelRepeater.DataSource = hotelDataList;
                HotelRepeater.DataBind();
            }
        }
        protected void fillhotel()
        {
            // Initialize the list inside the fillstaff method
            hotelDataList = new List<Dictionary<string, dynamic>>();
            try
            {
                string query = "Select * from Hotel_registration";
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
        [WebMethod]
        public static List<Hotel> GetHotelData(string searchText)
        {
            List<Hotel> hotels = new List<Hotel>();
            string connectionString = ConfigurationManager.ConnectionStrings["con1"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT hotel_name, starting_rates, hotel_address, image_data FROM Hotel_registration WHERE hotel_name LIKE @searchText OR hotel_address LIKE @searchText";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@searchText", "%" + searchText + "%");
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Hotel hotel = new Hotel();
                            hotel.Name = reader["hotel_name"].ToString();
                            hotel.Price = Convert.ToDecimal(reader["starting_rates"]);
                            hotel.Location = reader["hotel_address"].ToString();
                            hotel.ImageUrl = reader["image_data"].ToString();
                            hotels.Add(hotel);
                        }
                    }
                }
            }
            return hotels;
        }
    }
    public class Hotel
    {
        public string Name { get; set; }
        public decimal Price { get; set; }
        public string Location { get; set; }
        public string ImageUrl { get; set; }
    }
}
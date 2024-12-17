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
using System.Web.UI.HtmlControls;
using System.Net.Mail;
using System.Text.RegularExpressions;
using System.EnterpriseServices;

namespace BookInn.Customer_Module
{
    public partial class Hotel_details : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataReader rdr;
        string con;
        int hotelID = 0;
        string hotelname = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                // Retrieve hotel name from query string
                string hotelName = Request.QueryString["hotelName"];

                // Use the hotel name to fetch hotel details from the database
                string connectionString = WebConfigurationManager.ConnectionStrings["con1"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = @"
                    SELECT 
                        HR.hotel_name,
                        HR.hotel_ID,
                        HR.hotel_address,
                        HR.image_data,
                        HR.starting_rates,
                        AR.roomcategoies,
                        AR.per_night_range,
                        AR.room_photo,
                        AR.room_services,
                        STRING_AGG(HF.FacilityName, ', ') AS hotel_facilities

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
                        HR.hotel_ID,
                        HR.hotel_address,
                        HR.image_data,
                        HR.starting_rates,
                        AR.roomcategoies,
                        AR.per_night_range,
                        AR.room_photo,
                        AR.room_services";

                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@HotelName", hotelName);

                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.Read())
                    {
                        // Assign fetched data to label text properties
                        hotelname_lb.InnerText = reader["hotel_name"].ToString();
                        startingprice_lbl.InnerText = "₹" + reader["starting_rates"].ToString() + "/Pernight";
                        location_lbl.Text = reader["hotel_address"].ToString();
                        hotelID = reader.GetInt32(reader.GetOrdinal("hotel_ID"));
                        hotelname = reader["hotel_name"].ToString();
                        // Split facility names by comma
                        string facilities = reader["hotel_facilities"].ToString();
                        string[] facilityNames = facilities.Split(',');

                        // Dynamically create label controls for each facility name and add them to the placeholder
                        for (int i = 0; i < facilityNames.Length; i++)
                        {
                            Label facilityLabel = new Label();
                            facilityLabel.ID = "facility" + (i + 1) + "_lbl"; // Dynamically assign ID
                            facilityLabel.Text = facilityNames[i].Trim(); // Trim to remove any extra spaces
                            facilityLabel.CssClass = "facility"; // Set CSS class
                            facilityPlaceholder.Controls.Add(facilityLabel);
                            facilityPlaceholder.Controls.Add(new LiteralControl("<br/>")); // Add line break after each label
                        }
                        // Similarly, assign other fields to their respective labels
                        // Example:
                        // hotelAddressLabel.Text = reader["hotel_address"].ToString();
                        // Set the image URL
                        string imageName = reader["image_data"].ToString();
                        if (!string.IsNullOrEmpty(imageName))
                        {
                            hotelImage.ImageUrl = "../Images/Hotels_browser/" + imageName; // Adjust the path as per your actual directory structure
                        }
                    }
                }

            }
        }



        [WebMethod]
        public static string SaveFeedback(string customerName, string customerEmail, string review ,string hotelName)
        {
            try
            {
                // Your connection string
                string connectionString = WebConfigurationManager.ConnectionStrings["con1"].ConnectionString;
                string tablename = "feedback_table";
                // Get the last feedback ID from the database
                // Ensure Session["CustomerID"] is not null and contains a valid value
                if (HttpContext.Current.Session["CustomerID"] == null)
                {
                    return "Session expired or invalid.";
                }
                string lastFeedbackId = GetLastFeedbackId(connectionString, tablename);

                // Increment the feedback ID to generate a new one
                string newFeedbackId = IncrementFeedbackId(lastFeedbackId);

                // Retrieve hotelID based on hotelName
                int hotelID = GetHotelIDFromDatabase(connectionString, hotelName);

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    // Insert command
                    string insertQuery = "INSERT INTO feedback_table (feedbackID, hotel_ID, hotel_name, customer_ID, customername, customeremail, customer_reviews) VALUES (@v1, @v2, @v3, @v4, @v5, @v6, @v7)";
                    using (SqlCommand cmd = new SqlCommand(insertQuery, connection))
                    {
                        // Add parameters
                        cmd.Parameters.AddWithValue("@v1", newFeedbackId);
                        cmd.Parameters.AddWithValue("@v2", hotelID);
                        cmd.Parameters.AddWithValue("@v3", hotelName);
                        cmd.Parameters.AddWithValue("@v4", HttpContext.Current.Session["CustomerID"].ToString());
                        cmd.Parameters.AddWithValue("@v5", customerName);
                        cmd.Parameters.AddWithValue("@v6", customerEmail);
                        cmd.Parameters.AddWithValue("@v7", review);

                        // Execute query
                        int rowsAffected = cmd.ExecuteNonQuery();

                        // Check if data was successfully inserted
                        if (rowsAffected > 0)
                        {
                            // Data inserted successfully
                            return "success";
                        }
                        else
                        {
                            // Data insertion failed
                            return "failure";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
           


        }
        // Retrieve hotelID based on hotelName
        private static int GetHotelIDFromDatabase(string connectionString, string hotelName)
        {
            int hotelID = -1; // Initialize hotelID to a default value (e.g., -1) in case the hotel is not found

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Query to retrieve hotelID based on hotelName
                string query = "SELECT hotel_ID FROM Hotel_registration WHERE hotel_name = @hotelName";

                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    // Add parameter for hotelName
                    cmd.Parameters.AddWithValue("@hotelName", hotelName);

                    // Execute scalar query to get the hotelID
                    object result = cmd.ExecuteScalar();

                    // Check if result is not null and is convertible to int
                    if (result != null && int.TryParse(result.ToString(), out hotelID))
                    {
                        // Hotel found, hotelID retrieved successfully
                        return hotelID;
                    }
                    else
                    {
                        // Hotel not found or hotelID retrieval failed
                        // Handle this scenario based on your application's logic
                        // For example, you can throw an exception or return a default value
                        throw new Exception("Hotel not found or hotelID retrieval failed.");
                    }
                }
            }
        }
        // Function to get the last feedback ID from the database
        private static string GetLastFeedbackId(string connectionString, string tablename)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string query = $"SELECT TOP 1 feedbackID FROM {tablename} ORDER BY CAST(SUBSTRING(feedbackID, 5, LEN(feedbackID)) AS INT) DESC";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    object result = cmd.ExecuteScalar();
                    return result != null ? result.ToString() : null;
                }
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }
        // Function to increment the feedback ID
        private static string IncrementFeedbackId(string lastFeedbackId)
        {
            if (lastFeedbackId == null)
            {
                return "FEED0001"; // If no records found, start from FEED0001
            }
            else
            {
                string prefix = lastFeedbackId.Substring(0, 4);
                int number;
                if (int.TryParse(lastFeedbackId.Substring(4), out number))
                {
                    number++; // Increment the numeric part
                    return $"{prefix}{number:D4}";
                }
                else
                {
                    // If parsing fails, return default value
                    return "FEED0001";
                }
            }
        }

        [WebMethod]
        public static string CheckRoomsAvailability(string hotelName, string rooms)
        {
            try
            {
                // Your connection string
                string connectionString = ConfigurationManager.ConnectionStrings["con1"].ConnectionString;

                int hotelID = GetHotelIDFromDatabase(connectionString, hotelName);
                // Query to check room availability based on user input
                string query = "SELECT room_availability FROM Adminrooms_table WHERE hotel_ID = @v1";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    using (SqlCommand cmd = new SqlCommand(query, connection))
                    {
                        // Add parameter
                        cmd.Parameters.AddWithValue("@v1", hotelID);

                        // Execute query
                        object result = cmd.ExecuteScalar();

                        // Check availability
                        if (result != null)
                        {
                            int availableRooms = Convert.ToInt32(result);

                            // Check if selected number of rooms is less than available rooms
                            int selectedRooms = Convert.ToInt32(rooms);
                            if (selectedRooms < availableRooms)
                            {
                                return "Rooms available: " + availableRooms;
                            }
                            else
                            {
                                return "Selected number of rooms exceeds available rooms.";
                            }
                        }
                        else
                        {
                            return "No availability found for the selected date.";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                return "Error: " + ex.Message;
            }
        }


    }

}
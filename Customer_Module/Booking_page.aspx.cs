using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Configuration;
using System.Collections;
using System.Globalization;

namespace BookInn.Customer_Module
{
    public partial class Booking_page : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataReader rdr;
        string query;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            //roomID_txt.Text = roomID;

            query = WebConfigurationManager.ConnectionStrings["con1"].ConnectionString;
            conn = new SqlConnection(query);
            conn.Open();

        }

        protected void submit_Click(object sender, EventArgs e)
        {
            string roomID = Request.QueryString["roomID"];

            string name = guestname_txt.Text;
            string email = guestemail_txt.Text;
            string phone = guestcontact_txt.Text;
            string location = guestlocation_txt.Text;
            string gender = guestgender.SelectedValue;
            string numberOfAdults = adults_dropdown.SelectedValue;
            string numberOfChildren = childers_dropdown.SelectedValue;
            int numberOfRooms = int.Parse(Rooms_dropdown.SelectedValue);

            // Define variables for check-in and check-out dates
            DateTime checkinDate, checkoutDate;

            // Parse check-in date
            if (DateTime.TryParseExact(checkinDateTextBox.Text, "M-d-yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out checkinDate) &&
                DateTime.TryParseExact(checkoutDateTextBox.Text, "M-d-yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out checkoutDate))
            {// Retrieve the per night rate of the selected room category from the database
                string connectionString = WebConfigurationManager.ConnectionStrings["con1"].ConnectionString;
                decimal perNightRate = 0;
                string roomCategory = "";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "SELECT per_night_range, roomcategoies FROM Adminrooms_table WHERE roomID = @RoomID";

                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@RoomID", roomID);

                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.Read())
                    {
                        perNightRate = Convert.ToDecimal(reader["per_night_range"]);
                        roomCategory = reader["roomcategoies"].ToString();
                    }
                    else
                    {
                        // Handle case where room is not found
                        // You can set default values or display an error message
                    }
                }
                // Calculate the number of nights stayed
                int numberOfNights = (int)(checkoutDate - checkinDate).TotalDays;

                // Calculate the total payment bill
                decimal totalBill = perNightRate * numberOfNights * numberOfRooms; // Assuming numberOfRooms is retrieved from your form


                string bookingID;
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "SELECT MAX(CAST(SUBSTRING(bookingID, 5, LEN(bookingID) - 4) AS INT)) FROM Booking_table";

                    SqlCommand command = new SqlCommand(query, connection);

                    connection.Open();
                    var result = command.ExecuteScalar();
                    int maxBookingID = result == DBNull.Value ? 0 : Convert.ToInt32(result);

                    bookingID = "book" + (maxBookingID + 1);
                }

                // Fetch hotel details based on roomID
                int hotelID = 0;
                string hotelName = "";
                string hotelAddress = "";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = @"SELECT hr.hotel_ID, hr.hotel_name, hr.hotel_address
                         FROM hotel_registration hr
                         INNER JOIN Adminrooms_table ar ON hr.hotel_ID = ar.hotel_ID
                         WHERE ar.roomID = @RoomID";

                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@RoomID", roomID);

                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.Read())
                    {
                        hotelID = Convert.ToInt32(reader["hotel_ID"]);
                        hotelName = reader["hotel_name"].ToString();
                        hotelAddress = reader["hotel_address"].ToString();
                    }
                    else
                    {
                        // Handle case where hotel is not found for the room
                        // You can set default values or display an error message
                    }
                }

                // Store booking details in session variables
                Session["BookingID"] = bookingID;
                Session["HotelID"] = hotelID; // Assuming you have a hotel ID
                Session["HotelName"] = hotelName; // Assuming you have a hotel name field in your form
                Session["HotelLocation"] = hotelAddress; // Assuming you have a hotel location field in your form
                Session["RoomID"] = roomID;
                Session["RoomCategory"] = roomCategory; // Assuming you have a way to retrieve room category

                Session["CustomerName"] = name;
                Session["CustomerEmail"] = email;
                Session["CustomerNumber"] = phone; // Assuming you have a phone number field in your form
                Session["Location"] = location; // Assuming you have a location field in your form
                Session["Gender"] = gender; // Assuming you have a gender dropdown in your form

                Session["Checkin"] = checkinDate;
                Session["Checkout"] = checkoutDate;
                Session["Adults"] = numberOfAdults; // Assuming you have a way to retrieve number of adults
                Session["Children"] = numberOfChildren; // Assuming you have a way to retrieve number of children
                Session["Rooms"] = numberOfRooms;
                Session["PaymentBill"] = totalBill;

                string script = "alert('Go To payment gateway'); window.location='Booking_payment.aspx';";
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
            }
            else
            {
                // Date parsing failed, display error message or handle accordingly
                // For example, show an alert message
                ClientScript.RegisterStartupScript(this.GetType(), "DateParsingError", "alert('Invalid date format. Please enter dates in the format MM-dd-yyyy.');", true);
            }
        }
    }
}
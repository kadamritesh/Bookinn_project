using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;
using System.Configuration;
using System.Collections;

namespace BookInn.Customer_Module
{
    public partial class Booking_payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve session data and display it
                if (Session["BookingID"] != null)
                {
                    // Retrieve session data
                    string bookingID = Session["BookingID"].ToString();
                    int hotelID = Convert.ToInt32(Session["HotelID"]);
                    string hotelName = Session["HotelName"].ToString();
                    string hotelLocation = Session["HotelLocation"].ToString();
                    string roomID = Session["RoomID"].ToString();
                    string roomCategory = Session["RoomCategory"].ToString();
                    string customerID = Session["CustomerID"].ToString() ;
                    string customerName = Session["CustomerName"].ToString();
                    string customerEmail = Session["CustomerEmail"].ToString();
                    string customerNumber = Session["CustomerNumber"].ToString();
                    string location = Session["Location"].ToString();
                    string gender = Session["Gender"].ToString();
                    DateTime checkinDate = Convert.ToDateTime(Session["Checkin"]);
                    DateTime checkoutDate = Convert.ToDateTime(Session["Checkout"]);
                    string numberOfAdults = Session["Adults"].ToString();
                    string numberOfChildren = Session["Children"].ToString();
                    int numberOfRooms = Convert.ToInt32(Session["Rooms"]);
                    decimal paymentBill = Convert.ToDecimal(Session["PaymentBill"]);

                    // Store the session data in ViewState to access it in postback
                    ViewState["BookingID"] = bookingID;
                    ViewState["HotelID"] = hotelID;
                    ViewState["HotelName"] = hotelName;
                    ViewState["HotelLocation"] = hotelLocation;
                    ViewState["RoomID"] = roomID;
                    ViewState["RoomCategory"] = roomCategory;
                    ViewState["CustomerID"] = customerID;
                    ViewState["CustomerName"] = customerName;
                    ViewState["CustomerEmail"] = customerEmail;
                    ViewState["CustomerNumber"] = customerNumber;
                    ViewState["Location"] = location;
                    ViewState["Gender"] = gender;
                    ViewState["CheckinDate"] = checkinDate;
                    ViewState["CheckoutDate"] = checkoutDate;
                    ViewState["NumberOfAdults"] = numberOfAdults;
                    ViewState["NumberOfChildren"] = numberOfChildren;
                    ViewState["NumberOfRooms"] = numberOfRooms;
                    ViewState["PaymentBill"] = paymentBill;
                }
            }
        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            // Retrieve session data from ViewState
            string bookingID = ViewState["BookingID"].ToString();
            int hotelID = Convert.ToInt32(ViewState["HotelID"]);
            string hotelName = ViewState["HotelName"].ToString();
            string hotelLocation = ViewState["HotelLocation"].ToString();
            string roomID = ViewState["RoomID"].ToString();
            string roomCategory = ViewState["RoomCategory"].ToString();
            string customerID = ViewState["CustomerID"].ToString();
            string customerName = ViewState["CustomerName"].ToString();
            string customerEmail = ViewState["CustomerEmail"].ToString();
            string customerNumber = ViewState["CustomerNumber"].ToString();
            string location = ViewState["Location"].ToString();
            string gender = ViewState["Gender"].ToString();
            DateTime checkinDate = Convert.ToDateTime(ViewState["CheckinDate"]);
            DateTime checkoutDate = Convert.ToDateTime(ViewState["CheckoutDate"]);
            string numberOfAdults = ViewState["NumberOfAdults"].ToString();
            string numberOfChildren = ViewState["NumberOfChildren"].ToString();
            int numberOfRooms = Convert.ToInt32(ViewState["NumberOfRooms"]);
            decimal paymentBill = Convert.ToDecimal(ViewState["PaymentBill"]);

            string connectionString = WebConfigurationManager.ConnectionStrings["con1"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Insert data into booking_table
                string bookingInsertQuery = "INSERT INTO Booking_table (bookingID, hotel_ID, hotel_name, hotel_address, roomID, roomcategoies, customer_ID, guestname, guestemail, guestlocation, guestnumber, guestgender, checkin_date, checkout_date, adults, childrens, rooms,paymentbill) " +
                                            "VALUES (@v1, @v2, @v3, @v4, @v5, @v6, @v7, @v8, @v9, @v10, @v11, @v12, @v13, @v14, @v15, @v16, @v17,@v18)";

                using (SqlCommand command = new SqlCommand(bookingInsertQuery, connection))
                {
                    command.Parameters.AddWithValue("@v1", bookingID);
                    command.Parameters.AddWithValue("@v2", hotelID);
                    command.Parameters.AddWithValue("@v3", hotelName);
                    command.Parameters.AddWithValue("@v4", hotelLocation);
                    command.Parameters.AddWithValue("@v5", roomID);
                    command.Parameters.AddWithValue("@v6", roomCategory);
                    command.Parameters.AddWithValue("@v7", customerID);
                    command.Parameters.AddWithValue("@v8", customerName);
                    command.Parameters.AddWithValue("@v9", customerEmail);
                    command.Parameters.AddWithValue("@v10", location);
                    command.Parameters.AddWithValue("@v11", customerNumber);
                    command.Parameters.AddWithValue("@v12", gender);
                    command.Parameters.AddWithValue("@v13", checkinDate);
                    command.Parameters.AddWithValue("@v14", checkoutDate);
                    command.Parameters.AddWithValue("@v15", numberOfAdults);
                    command.Parameters.AddWithValue("@v16", numberOfChildren);
                    command.Parameters.AddWithValue("@v17", numberOfRooms);
                    command.Parameters.AddWithValue("@v18", paymentBill);


                    // Add other parameters similarly

                    connection.Open();
                    try
                    {
                        command.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        string script = "alert('Error1: " + ex.Message + "');";
                        ClientScript.RegisterStartupScript(this.GetType(), "ErrorMessage", script, true);
                    }


                }


                // Generate unique customerpaymentID
                string customerpaymentID;
                string query = "SELECT MAX(CAST(SUBSTRING(customerpaymentID, 11, LEN(customerpaymentID) - 10) AS INT)) FROM customerpayment_table";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    object result = command.ExecuteScalar();
                    int maxBookingID = result == DBNull.Value ? 0 : Convert.ToInt32(result);

                    customerpaymentID = "Cuspayment" + (maxBookingID + 1);
                }

                   

                // Insert data into customerpayment_table
                string paymentInsertQuery = "INSERT INTO customerpayment_table (customerpaymentID,customer_ID, hotel_ID,customername, customercard_name, total_bill) " +
                                            "VALUES (@v1, @v2, @v3, @v4,@v5,@v6)";

                using (SqlCommand command = new SqlCommand(paymentInsertQuery, connection))
                {
                    command.Parameters.AddWithValue("@v1", customerpaymentID);
                    command.Parameters.AddWithValue("@v2", customerID);
                    command.Parameters.AddWithValue("@v3", hotelID);
                    command.Parameters.AddWithValue("@v4", customerName);
                    command.Parameters.AddWithValue("@v5", cardName.Text);
                    command.Parameters.AddWithValue("@v6", paymentBill);

                    try
                    {
                        command.ExecuteNonQuery();

                        Response.Redirect("Thankyou_page.aspx");
                    }
                    catch(Exception ex)
                    {
                        string script = "alert('Error2: " + ex.Message + "');";
                        ClientScript.RegisterStartupScript(this.GetType(), "ErrorMessage", script, true);
                    }
                }
            }
        
        }
    }
}
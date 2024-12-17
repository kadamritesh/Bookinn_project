using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Net.NetworkInformation;

namespace BookInn.Customer_Module
{
    public partial class Viewbooking_page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Specify the hotel_ID to filter by
                string customerID = Session["CustomerID"].ToString(); ; // Replace with the desired hotel ID

                // Call method to bind GridView with data
                hotelbookingdata(customerID);
            }
        }
        private void hotelbookingdata(string customerID)
        {
            // Get the connection string from Web.config
            string connectionString = WebConfigurationManager.ConnectionStrings["con1"].ConnectionString;

            // SQL query to fetch data where hotel_ID matches the given value
            string query = "SELECT * FROM Booking_table WHERE customer_ID = @v1";

            // Create connection and command objects
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters to the query
                    command.Parameters.AddWithValue("@v1", customerID);

                    // Open the connection
                    connection.Open();

                    // Execute the command and get the data
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    // Bind the data to the GridView
                    viewbooking_data.DataSource = dataTable;
                    viewbooking_data.DataBind();
                }
            }
        }
        protected void viewbooking_data_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteRow")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                // Get the customer_ID of the selected row
                string bookingID = viewbooking_data.DataKeys[rowIndex]["bookingID"].ToString();

                // Call a method to delete the row from the database
                DeleteBooking(bookingID);

                // Rebind the GridView after deletion
                hotelbookingdata(Session["CustomerID"].ToString());
            }
        }

        private void DeleteBooking(string bookingID)
        {
            // Get the connection string from Web.config
            string connectionString = WebConfigurationManager.ConnectionStrings["con1"].ConnectionString;

            // SQL query to delete the booking
            string query = "DELETE FROM Booking_table WHERE bookingID = @bookingID";

            // Create connection and command objects
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameter to the query
                    command.Parameters.AddWithValue("@bookingID", bookingID);

                    try
                    {
                        // Open the connection
                        connection.Open();

                        // Execute the command
                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            // Display success message if the booking was deleted successfully
                            string script = "alert('Cancellation Successful!'); window.location='Index.aspx';";
                            ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
                        }
                        else
                        {
                            // Display a message if no rows were affected (e.g., no matching bookingID)
                            string errorScript = "alert('No booking found for cancellation.');";
                            ClientScript.RegisterStartupScript(this.GetType(), "ErrorMessage", errorScript, true);
                        }
                    }
                    catch (Exception ex)
                    {
                        // Display error message if an exception occurs
                        string errorScript = "alert('Error: " + ex.Message + "');";
                        ClientScript.RegisterStartupScript(this.GetType(), "ErrorMessage", errorScript, true);
                    }
                }
            }
        }

       
    }
}
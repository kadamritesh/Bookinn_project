using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace BookInn.Admin_Master
{
    public partial class Viewpayment_transaction : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Specify the hotel_ID to filter by
                int hotelID = Convert.ToInt32(Session["Hotel_ID"]); ; // Replace with the desired hotel ID

                // Call method to bind GridView with data
                customerpaymentDataByHotelID(hotelID);
            }
        }
        private void customerpaymentDataByHotelID(int hotelID)
        {
            // Get the connection string from Web.config
            string connectionString = ConfigurationManager.ConnectionStrings["con1"].ConnectionString;

            // SQL query to fetch data where hotel_ID matches the given value
            string query = "SELECT * FROM customerpayment_table WHERE hotel_ID = @HotelID";

            // Create connection and command objects
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters to the query
                    command.Parameters.AddWithValue("@HotelID", hotelID);

                    // Open the connection
                    connection.Open();

                    // Execute the command and get the data
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    // Bind the data to the GridView
                    customerpayment_data.DataSource = dataTable;
                    customerpayment_data.DataBind();
                }
            }
        }
    }
}
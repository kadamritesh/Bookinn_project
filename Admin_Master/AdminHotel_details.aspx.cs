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
    public partial class AdminHotel_details : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataReader rdr;
        string query;
        public Dictionary<string, dynamic> hoteldetails = new Dictionary<string, dynamic>();
        protected void Page_Load(object sender, EventArgs e)
        {
            query = WebConfigurationManager.ConnectionStrings["con1"].ConnectionString;
            conn = new SqlConnection(query);
            conn.Open();

            fillHotels();

            //txtHotelName.Text = hoteldetails["hotel_name"];
            //txtHotelAddress.Text = hoteldetails["hotel_address"];
            //txtHotelContact.Text = hoteldetails["hotel_contact"].ToString(); // Convert double to string
            //txtHotelEmail.Text = hoteldetails["hotel_email"];
            //txtStartingRates.Text = hoteldetails["starting_rates"].ToString();

            //string imageName = hoteldetails["image_data"].ToString();
            //string imageUrl = ResolveUrl("../Images/Hotels_browser/") + imageName; // Assuming the images are stored in a folder named "Images/Hotels"
            //imgHotelImage.ImageUrl = imageUrl;


        }
        protected void fillHotels()
        {
            try
            {
                string query = "SELECT * FROM Hotel_registration WHERE hotel_ID = '" + Session["Hotel_ID"].ToString() + "'";
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
                                    { "image_data",rdr["image_data"]},
                                    { "starting_rates",rdr["starting_rates"]}
                                };
                                hoteldetails = temDic;
                            }
                        }
                    }
                    txtHotelName.Text = hoteldetails["hotel_name"];
                    txtHotelAddress.Text = hoteldetails["hotel_address"];
                    txtHotelContact.Text = hoteldetails["hotel_contact"].ToString(); // Convert double to string
                    txtHotelEmail.Text = hoteldetails["hotel_email"];
                    txtStartingRates.Text = hoteldetails["starting_rates"].ToString();

                    string imageName = hoteldetails["image_data"].ToString();
                    string imageUrl = ResolveUrl("../Images/Hotels_browser/") + imageName; // Assuming the images are stored in a folder named "Images/Hotels"
                    imgHotelImage.ImageUrl = imageUrl;

                }


            }
            catch (Exception ex)
            {
                string script = "alert('" + ex.Message + "');";
                ClientScript.RegisterStartupScript(this.GetType(), "ErrorPopupScript", script, true);
            }
        }

        protected void saveProfileButtonHidden_Click(object sender, EventArgs e)
        {
            try
            {
                // Get the updated values from the textboxes
                string hotelName = txtHotelName.Text;
                string hotelAddress = txtHotelAddress.Text;
                string hotelContact = txtHotelContact.Text;
                string hotelEmail = txtHotelEmail.Text;
                string startingRates = txtStartingRates.Text;


                // All validations passed, proceed with database update
                if (!IsHotelNameExists(hotelName))
                {
                    if (!IsHotelEmailExists(hotelEmail))
                    {
                        UpdateHotelDetails(hotelName, hotelAddress, hotelContact, hotelEmail, startingRates);
                        // Optionally, you can add additional logic or redirect the user to another page after saving
                    }
                    else
                    {
                        // Hotel email already exists
                        string script = "alert('Hotel email already exists. Please use a different email.');";
                        ScriptManager.RegisterStartupScript(this, GetType(), "EmailExistsAlert", script, true);
                    }
                }
                else
                {
                    // Hotel name already exists
                    string script = "alert('Hotel name already exists. Please use a different name.');";
                    ScriptManager.RegisterStartupScript(this, GetType(), "NameExistsAlert", script, true);

                }
            }
            catch (Exception ex)
            {
                string script = "alert('" + ex.Message + "');";
                ClientScript.RegisterStartupScript(this.GetType(), "ErrorPopupScript", script, true);
            }

        }
        // Method to update hotel details in the database
        private void UpdateHotelDetails(string hotelName, string hotelAddress, string hotelContact, string hotelEmail, string startingRates)
        {
            try
            {
                // Create a connection to the database
                using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["con1"].ConnectionString))
                {
                    // Construct the SQL query to update hotel details
                    string query = "UPDATE Hotel_registration SET hotel_name = @HotelName, hotel_address = @HotelAddress, hotel_contact = @HotelContact, hotel_email = @HotelEmail, starting_rates = @StartingRates WHERE hotel_ID = @v1";

                    // Open the connection
                    conn.Open();

                    // Create a command with the query and connection
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        // Add parameters to the command
                        cmd.Parameters.AddWithValue("@HotelName", hotelName);
                        cmd.Parameters.AddWithValue("@HotelAddress", hotelAddress);
                        cmd.Parameters.AddWithValue("@HotelContact", hotelContact);
                        cmd.Parameters.AddWithValue("@HotelEmail", hotelEmail);
                        cmd.Parameters.AddWithValue("@StartingRates", startingRates);
                        cmd.Parameters.AddWithValue("@v1", Session["Hotel_ID"].ToString());

                        try
                        {
                            // Execute the query
                            cmd.ExecuteNonQuery();

                            string script = "alert('update successful');";
                            ClientScript.RegisterStartupScript(this.GetType(), "ErrorPopupScript", script, true);
                            fillHotels();
                        }
                        catch (Exception ex)
                        {
                            throw new Exception("Error occurred while execute query: " + ex.Message);
                        }

                        
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle the exception here
                throw new Exception("Error occurred while updating hotel details: " + ex.Message);
            }
        }

        // Method to check if the hotel name already exists in the database
        private bool IsHotelNameExists(string hotelName)
        {
            bool exists = false;

            try
            {
                // Create a connection to the database
                using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["con1"].ConnectionString))
                {
                    // Construct the SQL query
                    string query = "SELECT COUNT(*) FROM Hotel_registration WHERE hotel_name = @HotelName";

                    // Open the connection
                    conn.Open();

                    // Create a command with the query and connection
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        // Add parameters to the command
                        cmd.Parameters.AddWithValue("@HotelName", hotelName);

                        // Execute the query and get the count
                        int count = (int)cmd.ExecuteScalar();

                        // Check if count is greater than 0, indicating that the hotel name exists
                        exists = (count > 0);
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle any exceptions here
                // For example, log the exception or display an error message
                // You can also throw the exception to propagate it further
                throw new Exception("Error occurred while checking hotel name existence: " + ex.Message);
            }

            return exists;
        }
        // Method to check if the hotel email already exists in the database
        private bool IsHotelEmailExists(string hotelEmail)
        {
            bool exists = false;

            try
            {
                // Create a connection to the database
                using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["con1"].ConnectionString))
                {
                    // Construct the SQL query
                    string query = "SELECT COUNT(*) FROM Hotel_registration WHERE hotel_email = @HotelEmail";

                    // Open the connection
                    conn.Open();

                    // Create a command with the query and connection
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        // Add parameters to the command
                        cmd.Parameters.AddWithValue("@HotelEmail", hotelEmail);

                        // Execute the query and get the count
                        int count = (int)cmd.ExecuteScalar();

                        // Check if count is greater than 0, indicating that the hotel email exists
                        exists = (count > 0);
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle any exceptions here
                // For example, log the exception or display an error message
                // You can also throw the exception to propagate it further
                throw new Exception("Error occurred while checking hotel email existence: " + ex.Message);
            }

            return exists;
        }


    }
}
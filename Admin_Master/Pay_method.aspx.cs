using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text.RegularExpressions;
using System.IO;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.Services;

namespace BookInn.Admin_Master
{
    public partial class Pay_method : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        string query;
        protected void Page_Load(object sender, EventArgs e)
        {
            query = WebConfigurationManager.ConnectionStrings["con1"].ConnectionString;
            conn = new SqlConnection(query);

            conn.Open();

            //if (!IsPostBack)
            //{
            //    int adminID = Convert.ToInt32(Session["AdminID"]);
            //    string hotelName = Convert.ToString(Session["HotelName"]);
            //    string address = Convert.ToString(Session["Address"]);
            //    string contact = Convert.ToString(Session["Contact"]);
            //    string email = Convert.ToString(Session["Email"]);
            //    string country = Convert.ToString(Session["Country"]);
            //    string city = Convert.ToString(Session["City"]);

            //}

        }
        // Server-side method to handle button click
        
        protected void submitButton_Click(object sender, EventArgs e)
        {
            
            try
            {
                int adminID = Convert.ToInt32(Session["AdminID"]);
                string hotelName = Convert.ToString(Session["HotelName"]);
                string address = Convert.ToString(Session["Address"]);
                string contact = Convert.ToString(Session["Contact"]);
                string email = Convert.ToString(Session["Email"]);
                string country = Convert.ToString(Session["Country"]);
                string city = Convert.ToString(Session["City"]);
                string imagename = Convert.ToString(Session["ImageName"]);
                string prices = Convert.ToString(Session["Prices"]);

                // Insert data into the hotel_registration table
                string hotelRegistrationQuery = "INSERT INTO hotel_registration (admin_ID, hotel_name, hotel_address, hotel_contact, hotel_email,  Country, City, image_data,starting_rates) " +
                    "VALUES (@AdminID, @HotelName, @Address, @Contact, @Email, @Country, @City, @ImageData,@starting_rates)";
                using (SqlCommand cmd = new SqlCommand(hotelRegistrationQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@AdminID", adminID);
                    cmd.Parameters.AddWithValue("@HotelName", hotelName);
                    cmd.Parameters.AddWithValue("@Address", address);
                    cmd.Parameters.AddWithValue("@Contact", contact);
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@Country", country);
                    cmd.Parameters.AddWithValue("@City", city);
                    cmd.Parameters.AddWithValue("@ImageData", imagename);
                    cmd.Parameters.AddWithValue("@starting_rates", prices);
                   
                    try
                    {
                        // Execute the query
                        // Execute the query and retrieve the inserted hotel ID
                        cmd.ExecuteNonQuery();
                        int hotelID = 0;
                        query = $"select hotel_ID from Hotel_registration where hotel_name = '{Session["HotelName"]}'";
                        using(SqlCommand hotelcmd = new SqlCommand(query, conn))
                        {
                            using(SqlDataReader reader = hotelcmd.ExecuteReader())
                            {
                                if (reader.HasRows)
                                {
                                    while (reader.Read())
                                    {
                                        hotelID = Convert.ToInt32(reader["hotel_ID"]);
                                    }
                                }
                            }
                        }
                        // Now you have the hotelID, you can store it in session for future use
                        Session["HotelID"] = hotelID;
                        // Store other fields in session
                        Session["AdminID"] = adminID;
                        Session["HotelName"] = hotelName;
                        Session["Address"] = address;
                        Session["Contact"] = contact;
                        Session["Email"] = email;
                        Session["Country"] = country;
                        Session["City"] = city;
                        Session["ImageName"] = imagename;
                        Session["Prices2"] = prices;

                        // Insert data into the payment_info table
                        string cardNameValue = cardName.Text.ToString();
                        decimal subscriptionPrice = 50000.00m; // Example subscription price

                        string getNextAccountIDQuery = "SELECT MAX(CAST(SUBSTRING(account_id, 4, LEN(account_id)) AS INT)) FROM payment_info";
                        using (SqlCommand paymentCmd = new SqlCommand(getNextAccountIDQuery, conn))
                        {
                            object result = paymentCmd.ExecuteScalar();
                            int nextAccountNumber = (result == DBNull.Value) ? 1 : Convert.ToInt32(result) + 1;

                            // Generate the next account ID
                            string nextAccountID = "acc" + nextAccountNumber;

                            // Insert data into the payment_info table
                            query = "INSERT INTO payment_info (account_ID, admin_ID, hotel_ID, card_name,Amount) " +
                                "VALUES (@AccountID, @AdminID, @HotelID, @CardName , @amount)";

                            // Parameters for the payment query
                            using (SqlCommand insertCmd = new SqlCommand(query, conn))
                            {
                                insertCmd.Parameters.AddWithValue("@AccountID", nextAccountID);
                                insertCmd.Parameters.AddWithValue("@AdminID", adminID);
                                insertCmd.Parameters.AddWithValue("@HotelID", hotelID);
                                insertCmd.Parameters.AddWithValue("@CardName", cardNameValue);
                                insertCmd.Parameters.AddWithValue("@Amount", subscriptionPrice);

                                insertCmd.ExecuteNonQuery();
                            }
                        }
                        string script1 = "alert('Payment successful.'); window.location='Admin.aspx';";
                        ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script1, true);
                    }
                    catch(Exception ex)
                    {

                        //string script = "alert('Error: " + ex.Message + "');";
                        //ClientScript.RegisterStartupScript(this.GetType(), "ErrorMessage", script, true);
                        cardNumber.Text = ex.Message +" => "+ ex.StackTrace+" => "+ ex.TargetSite;
                    }

                    
                }
            }
            catch(Exception ex)
            {
                string script = "alert('Error: " + ex.Message + "');";
                ClientScript.RegisterStartupScript(this.GetType(), "ErrorMessage", script, true);
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Collections;
using System.Web.Services;
using System.Drawing;

namespace BookInn.Admin_Master
{
    public partial class Facilities_details : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataReader rdr;
        string con;
        int hotel_id;
        int admin_id;
        private static int lastFacilityNumber = 0; // Static variable to keep track of the last number used
        protected void Page_Load(object sender, EventArgs e)
        {
            con = WebConfigurationManager.ConnectionStrings["con1"].ConnectionString;
            conn = new SqlConnection(con);
            conn.Open();
            hotel_id = Convert.ToInt32(Session["Hotel_ID"]);
            admin_id = Convert.ToInt32(Session["AdminID"]);
        }
        protected void btnSubmitFacilities_Click(object sender, EventArgs e)
        {
            
            // Assuming you have a connection string variable for your database
            string connectionString = ConfigurationManager.ConnectionStrings["con1"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                // Open the connection
                conn.Open();

                // Start a transaction
                SqlTransaction transaction = conn.BeginTransaction();

                try
                {
                    // Create a command object with the transaction
                    using (SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.Transaction = transaction;
                        cmd.CommandType = CommandType.Text;

                        // Build the INSERT statement
                        StringBuilder sql = new StringBuilder("INSERT INTO hotels_facilities (facilityID, hotel_ID, admin_ID, FacilityName) VALUES ");

                        // Collect the values from the input fields
                        List<string> valuesList = new List<string>();
                        for (int i = 0; i < Convert.ToInt32(txtNumberOfFacilities.Text); i++)
                        {
                            string facilityName = Request.Form["facility" + i];
                            string facilityID = "Faci" + (++lastFacilityNumber).ToString(); // Increment and format the facility ID

                            if (!string.IsNullOrEmpty(facilityName))
                            {

                                // Use parameters to prevent SQL injection
                                string paramName = "@facilityName" + i;
                                string paramFacilityID = "@facilityID" + i;
                                cmd.Parameters.AddWithValue(paramName, facilityName);
                                cmd.Parameters.AddWithValue(paramFacilityID, facilityID);
                                valuesList.Add($"({paramFacilityID}, @HotelID, @AdminID, {paramName})"); // Replace 1 with the actual HotelID
                            }
                        }
                        // Add the HotelID parameter
                        cmd.Parameters.AddWithValue("@HotelID", hotel_id);
                        cmd.Parameters.AddWithValue("@AdminID", admin_id);

                        // Join the values and complete the SQL statement
                        sql.Append(string.Join(", ", valuesList));
                        cmd.CommandText = sql.ToString();

                        // Execute the command
                        cmd.ExecuteNonQuery();
                        // Optionally, show a success message
                        string script1 = "alert('New Facilities Add successfully.'); window.location='Facilities_page.aspx';";
                        ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script1, true);
                        // Commit the transaction
                        transaction.Commit();
                    }
                }
                catch (Exception ex)
                {
                    // Roll back the transaction on error
                    transaction.Rollback();
                    string script = "alert('Error: " + ex.Message + "');";
                    ClientScript.RegisterStartupScript(this.GetType(), "ErrorMessage", script, true);
                    // Handle the error (log it, show message to user, etc.)
                }
                
                
            }
        }

    }
}
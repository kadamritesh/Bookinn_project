using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text.RegularExpressions;
using System.IO;

namespace BookInn.Admin_Master
{
    public partial class Admin_hotels : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataReader rdr;
        string query;
        protected void Page_Load(object sender, EventArgs e)
        {
            query = WebConfigurationManager.ConnectionStrings["con1"].ConnectionString;
            conn = new SqlConnection(query);

            conn.Open();
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        { 
            try
            {
                int adminID = GetAdminIDFromSession();
                if (adminID == -1)
                {
                    Response.Write("<script>alert('Admin ID not found. Please login again.');</script>");
                    return;
                }

                string hotelName = txtHotelName.Text.Trim();
                string address = txtAddress.Text.Trim();
                string contact = txtContact.Text.Trim();
                string email = txtEmail.Text.Trim();
                string country = txtCountry.SelectedValue;
                string city = txtCity.SelectedValue;
                string prices = txtprices.Text.Trim();

                if (IsHotelNameExists(hotelName))
                {
                    Response.Write("<script>alert('Hotel name already exists');</script>");
                    return;
                }

                if (IsEmailExists(email))
                {
                    Response.Write("<script>alert('Email already exists');</script>");
                    return;
                }

                // Get the binary data of the uploaded image
                System.Drawing.Image File;
                if (FileUpload1.HasFile)    
                {
                    File = System.Drawing.Image.FromStream(FileUpload1.PostedFile.InputStream);
                    File.Save(@"D:\vs Practice\BookInn\Images" + FileUpload1.FileName);
                    Session["ImageName"] = FileUpload1.FileName;
                }
                else
                {
                    // Handle case where no file is selected
                    Response.Write("<script>alert('ImageNotFound');</script>");
                }

                // Store session variables
                Session["AdminID"] = adminID;
                Session["HotelName"] = hotelName;
                Session["Address"] = address;
                Session["Contact"] = contact;
                Session["Email"] = email;
                Session["Country"] = country;
                Session["City"] = city;
                Session["Prices"] = prices;
                // Display success message
                string script = "alert('Go to payment page'); window.location='Pay_method.aspx';";
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);


                //Session["ImageName"] = FileUpload1.FileName;

                //try
                //{
                //    query = "INSERT INTO Hotel_registration (admin_ID, hotel_name, hotel_address, hotel_contact, hotel_email, City, Country,image_data) " +
                //               "VALUES (@AdminID, @HotelName, @Address, @Contact, @Email, @City, @Country ,@ImageData)";

                //   cmd = new SqlCommand(query, conn);
                //    cmd.Parameters.AddWithValue("@AdminID", adminID);
                //    cmd.Parameters.AddWithValue("@HotelName", hotelName);
                //    cmd.Parameters.AddWithValue("@Address", address);
                //    cmd.Parameters.AddWithValue("@Contact", contact);
                //    cmd.Parameters.AddWithValue("@Email", email);
                //    cmd.Parameters.AddWithValue("@Country", country);
                //    cmd.Parameters.AddWithValue("@City", city);
                //    cmd.Parameters.AddWithValue("@ImageData", Session["ImageName"]);

                //    try
                //    {
                //        cmd.ExecuteNonQuery();

                //        Session["AdminID"] = adminID;
                //        Session["HotelName"] = hotelName;
                //        Session["Address"] = address;
                //        Session["Contact"] = contact;
                //        Session["Email"] = email;
                //        Session["Country"] = country;
                //        Session["City"] = city;




                //        // Display success message
                //        string script = "alert('Form submitted successfully'); window.location='Pay_method.aspx';";
                //        ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
                //    }
                //catch(Exception ex)
                //{
                //    // Display error message if query execution fails
                //    string script = "alert('Error: " + ex.Message + "');";
                //    ClientScript.RegisterStartupScript(this.GetType(), "ErrorMessage", script, true);
                //}


                //}
                //catch (Exception ex)
                //{
                //    // Display error message if query execution fails
                //    string script = "alert('Error: " + ex.Message + "');";
                //    ClientScript.RegisterStartupScript(this.GetType(), "ErrorMessage", script, true);
                //}




            }
            catch (Exception ex)
            {
                // Log the exception for debugging purposes
                // Optionally, display a generic error message to the user
                //Console.WriteLine("An error occurred: " + ex.ToString());
                imagelb.Text="error" + ex.Message;
                //Response.Write("<script>alert('An error occurred while processing your request. Please try again later.');</script>"+ex);
                //// Log the exception
                // LogException(ex);
            }
        }
        private int GetAdminIDFromSession()
        {
            // Assuming you've stored the admin ID in a session variable named "adminID"
            if (Session["AdminID"] != null)
            {
                return Convert.ToInt32(Session["AdminID"]);
            }
            else
            {
                // Handle if session is null or admin ID is not found
                return -1; // Or throw an exception or return a default value
            }
        }
        //private byte[] ReadFileBytes(Stream stream)
        //{
        //    using (MemoryStream memoryStream = new MemoryStream())
        //    {
        //        stream.CopyTo(memoryStream);
        //        return memoryStream.ToArray();
        //    }
        //}
        private bool IsHotelNameExists(string hotelName)
        {
            query = "SELECT COUNT(*) FROM Hotel_registration WHERE hotel_name = @HotelName";

            using (cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@HotelName", hotelName);
                int count = Convert.ToInt32(cmd.ExecuteScalar());
                return count > 0;
            }
        }

        private bool IsEmailExists(string email)
        {
            query = "SELECT COUNT(*) FROM Hotel_registration WHERE hotel_email = @Email";

            using (cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@Email", email);
                int count = Convert.ToInt32(cmd.ExecuteScalar());
                return count > 0;
            }
        }

        //private bool InsertData(int adminID, string hotelName, string address, string contact, string email, string city, string country, byte[] imageData)
        //{
        //    query = "INSERT INTO Hotel_registration (admin_ID, hotel_name, hotel_address, hotel_contact, hotel_email, City, Country,image_data) " +
        //            "VALUES (@AdminID, @HotelName, @Address, @Contact, @Email, @City, @Country ,@ImageData)";

        //    using (cmd = new SqlCommand(query, conn))
        //    {
        //        cmd.Parameters.AddWithValue("@AdminID", adminID);
        //        cmd.Parameters.AddWithValue("@HotelName", hotelName);
        //        cmd.Parameters.AddWithValue("@Address", address);
        //        cmd.Parameters.AddWithValue("@Contact", contact);
        //        cmd.Parameters.AddWithValue("@Email", email);
        //        cmd.Parameters.AddWithValue("@City", city);
        //        cmd.Parameters.AddWithValue("@Country", country);
        //        cmd.Parameters.AddWithValue("@ImageData", Session["ImageName"]);

        //        int rowsAffected = cmd.ExecuteNonQuery();
        //        return rowsAffected > 0;
        //    }
        //}

    }
}
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
using System.Security.Policy;
using System.Xml.Linq;

namespace BookInn.Admin_Master
{
    public partial class Rooms_details : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataReader rdr;
        string query;
        int admin_ID;
        int hotel_ID;
        protected void Page_Load(object sender, EventArgs e)
        {
            query = WebConfigurationManager.ConnectionStrings["con1"].ConnectionString;
            conn = new SqlConnection(query);

            conn.Open();

            admin_ID = Convert.ToInt32(Session["AdminID"]);
            hotel_ID = Convert.ToInt32(Session["Hotel_ID"]);
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            // Perform server-side validations first
            bool isRoomCategoryValid = RoomCategories_ServerValidate();
            bool isDescriptionValid = Description_ServerValidate();
            bool isPriceValid = PricePerNight_ServerValidate();
            bool isRoomServices = RoomsServices_ServerValidate();
            bool isRoomAvailable = RoomAvailable_ServerValidate();

            if (isRoomCategoryValid && isDescriptionValid && isPriceValid && isRoomServices && isRoomAvailable)
            {
                string conn1 = WebConfigurationManager.ConnectionStrings["con1"].ConnectionString;

                string roomIdValue = GetNextRoomID(conn1);
                string roomNoValue = GetNextRoomNo(conn1);
                string roomcategoies = categoies.SelectedValue;
                string roomrange = range_txt.Text.Trim();
                string roomdescription = roomdescription_txt.Text.Trim();
                string roomservices = services_txt.Text.Trim();
                string roomavailable = roomavailable_txt.Text.Trim();

                // Get the binary data of the uploaded image
                System.Drawing.Image File;
                if (FileUploadImage.HasFile)
                {
                    File = System.Drawing.Image.FromStream(FileUploadImage.PostedFile.InputStream);
                    File.Save(@"D:\vs Practice\BookInn\img\room" + FileUploadImage.FileName);
                    Session["RoomImageName"] = FileUploadImage.FileName;
                }
                else
                {
                    // Handle case where no file is selected
                    Response.Write("<script>alert('ImageNotFound');</script>");
                }
                string roomimg = Session["RoomImageName"].ToString();

                

                InsertDataIntoDatabase(roomIdValue, admin_ID, hotel_ID, roomNoValue, roomcategoies, roomrange, roomdescription, roomimg, roomservices, roomavailable);

                
            }
            else
            {
                // Handle the case where validation fails
                Response.Write("<script>alert('Validation Failed');</script>");
            }
        }
        // Validation methods (make sure to adjust them to return a boolean value)
        private bool RoomCategories_ServerValidate()
        {
            if (categoies.SelectedItem.Value == "")
            {
                room_error.InnerText = "Please select a room category.";
                return false;
            }
            else
            {
                room_error.InnerText = "";
                return true;
            }
            
        }
        private bool Description_ServerValidate()
        {
            if (string.IsNullOrWhiteSpace(roomdescription_txt.Text))
            {
                descriptionerror.InnerText = "Description cannot be empty.";
                return false;
            }
            else
            {
                descriptionerror.InnerText = "";
                return true;
            }
            
        }
        private bool PricePerNight_ServerValidate()
        {
            decimal price;
            bool isDecimal = decimal.TryParse(range_txt.Text, out price);
            if (!isDecimal || price <= 0)
            {
                rangeerror.InnerText = "Please enter a valid price.";
                return false;
            }
            else
            {
                rangeerror.InnerText = "";
                return true;
            }
            
        }
        private bool RoomsServices_ServerValidate()
        {
            if(string .IsNullOrWhiteSpace(services_txt.Text))
            {
                serviceserror.InnerText = "Services cannot be empty";
                return false;
            }
            else
            {
                serviceserror.InnerText = "";
                return true;
            }
        }
        private bool RoomAvailable_ServerValidate()
        {
            int roomAvailability;
            if (!int.TryParse(roomavailable_txt.Text, out roomAvailability) || roomAvailability <= 0)
            {
                roomavailableerror.InnerText = "enter a valid positive number for room availability";
                return false;
            }
            else
            {
                roomavailableerror.InnerText = "";
                return true;
            }
        }
        private string GetNextRoomID(string conn1)
        {
            string getNextRoomIDQuery = "SELECT MAX(CAST(SUBSTRING(roomID, 5, LEN(roomID)) AS INT)) FROM Adminrooms_table";
            using (SqlConnection conn = new SqlConnection(conn1))
            {
                using (SqlCommand cmd = new SqlCommand(getNextRoomIDQuery, conn))
                {
                    conn.Open();
                    object result = cmd.ExecuteScalar();
                    int nextRoomID = (result == DBNull.Value) ? 1 : Convert.ToInt32(result) + 1;
                    return "room" + nextRoomID.ToString();
                }
            }
        }
        private string GetNextRoomNo(string  conn1)
        {
            string getNextRoomNoQuery = "SELECT MAX(CAST(SUBSTRING(roomno, 2, LEN(roomno)) AS INT)) FROM Adminrooms_table";
            using (SqlConnection conn = new SqlConnection(conn1))
            {
                using (SqlCommand cmd = new SqlCommand(getNextRoomNoQuery, conn))
                {
                    conn.Open();
                    object result = cmd.ExecuteScalar();
                    int nextRoomNumber = (result == DBNull.Value) ? 1 : Convert.ToInt32(result) + 1;
                    return "r" + nextRoomNumber.ToString();
                }
            }
        }
        private void InsertDataIntoDatabase(string roomIdValue,int admin_ID,int hotel_ID, string roomNoValue, string roomcategoies,string roomrange, string roomdescription,string roomimg,string roomservices,string roomavailable)
        {
            

            string connectionString = ConfigurationManager.ConnectionStrings["con1"].ConnectionString;

            query = "INSERT INTO Adminrooms_table (roomID, hotel_ID, admin_ID, roomno, roomcategoies, per_night_range,room_description, room_photo,room_services,room_availability) VALUES (@v1 ,@v2 ,@v3 ,@v4, @v5, @v6, @v7, @v8,@v9,@v10)";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@v1", roomIdValue);
                    cmd.Parameters.AddWithValue("@v2", hotel_ID);
                    cmd.Parameters.AddWithValue("@v3", admin_ID);
                    cmd.Parameters.AddWithValue("@v4", roomNoValue);
                    cmd.Parameters.AddWithValue("@v5", roomcategoies);
                    cmd.Parameters.AddWithValue("@v6", roomrange);
                    cmd.Parameters.AddWithValue("@v7", roomdescription);
                    cmd.Parameters.AddWithValue("@v8", roomimg);
                    cmd.Parameters.AddWithValue("@v9", roomservices);
                    cmd.Parameters.AddWithValue("@v10", roomavailable);
                    


                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        // Optionally, show a success message
                        string script1 = "alert('New rooms Add successfully.'); window.location='Rooms_page.aspx';";
                        ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script1, true);
                    }
                    catch (Exception ex)
                    {
                        // Handle exceptions
                        // Optionally, show an error message
                        string script = "alert('" + ex.Message + "');";
                        ClientScript.RegisterStartupScript(this.GetType(), "ErrorPopupScript", script, true);

                    }
                }
            }


        }
    }
}
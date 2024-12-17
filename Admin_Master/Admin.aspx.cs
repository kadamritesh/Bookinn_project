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

namespace BookInn
{
    public partial class Admin : System.Web.UI.Page
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
        protected void loginbt_Click(object sender, EventArgs e)
        {
            bool isEmailValid = false;
            bool isPassValid = false;
            string adminID = "";
            string adminName = "";
            string adminfname = "";
            string adminlname = "";
            string adminlocation = "";
            string adminbirth = "";
            string adminemail = "";
            string adminpassword = "";
            string admincontact = "";
            string admingender = "";
            //hotel details variable
            int hotelID = 0;
            string hotelname ="";
            string hotellocation = "";
            string hotelphone = "";
            string hotelemail = "";


            query = "SELECT * FROM admin_table";
            cmd = new SqlCommand(query, conn);
            try
            {
                using (rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        if (rdr["admin_email"].ToString() == txtemail.Text.ToString() || rdr["admin_username"].ToString() == txtemail.Text.ToString())
                        {
                            isEmailValid = true;
                            adminID = rdr["admin_id"].ToString(); // Assuming admin_id is the ID field in your table
                            adminName = rdr["admin_username"].ToString();
                            adminfname = rdr["admin_fname"].ToString();
                            adminlname = rdr["admin_lname"].ToString();
                            adminlocation = rdr["admin_location"].ToString();
                            adminbirth = rdr["admin_birthdate"].ToString();
                            adminemail = rdr["admin_email"].ToString();
                            adminpassword = rdr["admin_password"].ToString();
                            admincontact = rdr["admin_contact"].ToString();
                            admingender = rdr["gender"].ToString();


                        }
                        if (rdr["admin_password"].ToString() == txtpassword.Text.ToString())
                        {
                            isPassValid = true;
                        }
                    }
                }
                    
                if(!isEmailValid)
                {
                    emaillb.Text = "Incorrect Email!";
                }
                else
                {
                    emaillb.Text = "";
                }
                if (!isPassValid)
                {
                    passlb.Text = "Incorrect Password!";
                }
                else
                {
                    passlb.Text = "";
                }

                if(isEmailValid && isPassValid) 
                {
                    try
                    {
                        query = $"SELECT * FROM Hotel_registration WHERE admin_ID = {adminID}";
                        using(cmd = new SqlCommand(query, conn))
                        {
                            using(rdr = cmd.ExecuteReader())
                            {
                                if (rdr.HasRows)
                                {
                                    while (rdr.Read())
                                    {
                                        hotelID = Convert.ToInt32(rdr["hotel_ID"]);
                                        hotelname = rdr["hotel_name"].ToString();
                                        hotellocation = rdr["hotel_address"].ToString();
                                        hotelphone = rdr["hotel_contact"].ToString();
                                        hotelemail = rdr["hotel_email"].ToString();
                                    }
                                }
                            }
                        }
                    }catch (Exception ex)
                    {
                        Response.Write($"<script>alert('{ex.Message}')</script>");
                    }
                    // Store admin ID and name in session variables
                    Session["AdminID"] = adminID;
                    Session["AdminName"] = adminName;
                    Session["AdminFname"] = adminfname;
                    Session["AdminLname"] = adminlname;
                    Session["AdminLocation"] = adminlocation;
                    Session["AdminBirthdate"] = adminbirth;
                    Session["AdminContact"] = admincontact;
                    Session["AdminEmail"] = adminemail;
                    Session["AdminPassword"] = adminpassword;
                    Session["AdminGender"] = admingender;
                    //hotels sessiion variable
                    Session["Hotel_ID"] = hotelID;
                    Session["HotelName"] = hotelname;
                    Session["Hotellocation"] = hotellocation;
                    Session["Hotelcontact"] = hotelphone;
                    Session["Hotelemail"] = hotelemail;
                    
 
                    string script = "alert('Log In successful!'); window.location='Admin_home.aspx';";
                    ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
                }
            }
            catch (Exception ex)
            {
                // Handle any exceptions that may occur during the database operation
                emaillb.Text = "Error: " + ex.Message;
            }
            

        }
        
        protected void createbt_Click(object sender, EventArgs e)
        {
            // Perform any necessary processing here

            // Redirect to the next page
            Response.Redirect("Admin_reg.aspx");
        }
    }
}
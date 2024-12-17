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
using System.Text.RegularExpressions;
using System.Drawing;
using System.Globalization;
using System.Threading;
using System.Net.NetworkInformation;

namespace BookInn
{
    public partial class Admin_reg : System.Web.UI.Page
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

        protected void registerbt_Click(object sender, EventArgs e)
        {
            string username = user_txt.Text;
            string fname = fname_txt.Text;
            string lname = lname_txt.Text;
            string birthdate = birthdate_txt.Text;
            string location = location_txt.Text;
            string email = email_txt.Text;
            string password = pass_txt.Text;
            string comfirmpass = confirmpass_txt.Text;
            string contact = contect_txt.Text;
            string gender = Request.Form["gender"];
            
            

            
            


            // Server-side validation
            bool isValid = true;

            // Validate username
            if (string.IsNullOrEmpty(username))
            {
                isValid = false;
                user_lb.Visible = true;
                user_lb.Text = "Username is required";
            }
            else
            {
                user_lb.Visible = false;
                if (IsUsernameExists(username))
                {
                    isValid = false;
                    Response.Write("<script>alert('User name already exists');</script>");
                    return;
                }
            }

            // Validate first name
            if (string.IsNullOrEmpty(fname))
            {
                isValid = false;
                fname_lb.Visible = true;
                fname_lb.Text = "First Name is required";
            }
            else
            {
                fname_lb.Visible = false;
            }

            // Validate last name
            if (string.IsNullOrEmpty(lname))
            {
                isValid = false;
                lname_lb.Visible = true;
                lname_lb.Text = "Last Name is required";
            }
            else
            {
                lname_lb.Visible = false;
            }

            // Validate email
            if (string.IsNullOrEmpty(email_txt.Text.Trim()))
            {
                isValid = false;
                email_lb.Visible = true;
                email_lb.Text = "Email is required";
            }
            else
            {
                email_lb.Visible = false;
                if (IsEmailExists(email))
                {
                    isValid = false;
                    Response.Write("<script>alert('Email already exists');</script>");
                    return;
                }
            }

            // Validate birth date
            if (string.IsNullOrEmpty(birthdate))
            {
                isValid = false;
                birthdate_lb.Visible = true;
                birthdate_lb.Text = "Birth Date is required";
            }
            else
            {
                birthdate_lb.Visible = false;
                // You can add more validation for birth date if needed
            }

            // Validate password
            if (string.IsNullOrEmpty(password))
            {
                isValid = false;
                pass_lb.Visible = true;
                pass_lb.Text = "Password is required";
            }
            else if (!IsStrongPassword(password))
            {
                isValid = false;
                pass_lb.Text = "Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one digit, and one special character.";
            }
            else { pass_lb.Visible = false; }

            // Validate confirm password
            if (string.IsNullOrEmpty(comfirmpass))
            {
                isValid = false;
                confirmpass_lb.Visible = true;
                confirmpass_lb.Text = "Confirm Password is required";
            }
            else if (password != comfirmpass)
            {
                isValid = false;
                confirmpass_lb.Text = "Passwords do not match";
            }
            else { confirmpass_lb.Visible = false; }
            // Validate contact
            if (string.IsNullOrEmpty(contact))
            {
                isValid = false;
                contact_lb.Text = "Contact is required";
            }
            else if (!Regex.IsMatch(contact, @"^\d{10}$"))
            {
                isValid = false;
                contact_lb.Text = "Contact must be a 10-digit number";
            }
            else {  contact_lb.Visible = false; }
            // Validate location
            if (string.IsNullOrEmpty(location_txt.Text.Trim()))
            {
                isValid = false;
                location_lb.Text = "Location is required";
            }
            else {  location_lb.Visible = false; }
            // You can continue with other validations for gender, terms and conditions, etc.

            // If all validations pass, proceed with registration
            if (isValid)
            {
                try
                {
                    query = "insert into admin_table (admin_username, admin_fname, admin_lname, admin_location, admin_birthdate, admin_email, admin_password , admin_contact, gender) values (@v1, @v2, @v3, @v4 ,@v5 , @v6, @v7, @v8 ,@v9)";
                    cmd = new SqlCommand(query, conn);

                    cmd.Parameters.AddWithValue("@v1", username);
                    cmd.Parameters.AddWithValue("@v2", fname);
                    cmd.Parameters.AddWithValue("@v3", lname);
                    cmd.Parameters.AddWithValue("@v4", location);
                    cmd.Parameters.AddWithValue("@v5", birthdate);
                    cmd.Parameters.AddWithValue("@v6", email);
                    cmd.Parameters.AddWithValue("@v7", password);
                    cmd.Parameters.AddWithValue("@v8", contact);
                    cmd.Parameters.AddWithValue("@v9", gender);



                    try
                    {
                        cmd.ExecuteNonQuery();

                        int adminid = 0;
                        query = $"select admin_ID from admin_table where admin_username = '{username}'";
                        using (SqlCommand admincmd = new SqlCommand(query, conn))
                        {
                            using (SqlDataReader reader = admincmd.ExecuteReader())
                            {
                                if (reader.HasRows)
                                {
                                    while (reader.Read())
                                    {
                                        adminid = Convert.ToInt32(reader["admin_ID"]);
                                    }
                                }
                            }
                        }
                        Session["AdminID"] = adminid;



                        //Response.Redirect("Admin.aspx");
                        string script = "alert('Registration successful!'); window.location='Admin_hotels.aspx';";
                        ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
                    }
                    catch (Exception ex)
                    {
                        string script = "alert('Error: " + ex.Message + "');";
                        ClientScript.RegisterStartupScript(this.GetType(), "ErrorMessage", script, true);
                    }
                }
                catch (Exception ex)
                {
                    string script = "alert('Error: " + ex.Message + "');";
                    ClientScript.RegisterStartupScript(this.GetType(), "ErrorMessage", script, true);
                }
            }



            
        }



        private bool IsUsernameExists(string username)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["con1"].ConnectionString; // Replace with your actual connection string
            string query = "SELECT COUNT(*) FROM admin_table WHERE admin_username = @Username";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Username", username);
                    connection.Open();
                    int count = (int)command.ExecuteScalar();
                    return count > 0;
                }
            }
        }
        private bool IsEmailExists(string email)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["con1"].ConnectionString; // Replace with your actual connection string
            string query = "SELECT COUNT(*) FROM admin_table WHERE admin_email = @Email";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Email", email);
                    connection.Open();
                    int count = (int)command.ExecuteScalar();
                    return count > 0;
                }
            }
        }

        // IsStrongPassword method to check password strength
        private bool IsStrongPassword(string password)
        {
            // Minimum length requirement
            if (password.Length < 8)
                return false;

            // Check for at least one uppercase letter, one lowercase letter, one digit, and one special character
            if (!Regex.IsMatch(password, @"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]+$"))
                return false;

            return true;
        }
        protected void backbt_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin.aspx");
        }
    }

        

}

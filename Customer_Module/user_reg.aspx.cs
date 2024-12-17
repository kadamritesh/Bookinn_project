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
using System.Text.RegularExpressions;

namespace BookInn
{
    public partial class user_reg : System.Web.UI.Page
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
            string fname = fname_txt.Text;
            string lname = lname_txt.Text;
            string email = email_txt.Text;
            string password = pass_txt.Text;
            string comfimpass = confirmpass_txt.Text;
            string contact = contect_txt.Text;
            string address = address_txt.Text;
            string gender = Request.Form["gender"];
            string birthdate = birthdate_txt.Text;
            string username = username_txt.Text;
            int c = 0;


            // fname required field
            // fname required field and regex pattern validation
            if (String.IsNullOrEmpty(fname))
            {
                lbl_fname.Visible = true;
                lbl_fname.Text = "First name is required.";
                c--;
            }
            else if (!IsValidName(fname))
            {
                lbl_fname.Visible = true;
                lbl_fname.Text = "First name should contain only characters.";
                c--;
            }
            else
            {
                lbl_fname.Visible = false;
                c++;
            }

            // lname required field and regex pattern validation
            if (String.IsNullOrEmpty(lname))
            {
                lbl_lname.Visible = true;
                lbl_lname.Text = "Last name is required.";
                c--;
            }
            else if (!IsValidName(lname))
            {
                lbl_lname.Visible = true;
                lbl_lname.Text = "Last name should contain only characters.";
                c--;
            }
            else
            {
                lbl_lname.Visible = false;
                c++;
            }

            // email required field and format validation
            if (String.IsNullOrEmpty(email))
            {
                lbl_email.Visible = true;
                lbl_email.Text = "Email is required.";
                c--;
            }
            else if (!IsValidEmail(email))
            {
                lbl_email.Visible = true;
                lbl_email.Text = "Invalid email format.";
                c--;
            }
            else if (EmailExistsInDatabase(email))
            {
                lbl_email.Visible = true;
                lbl_email.Text = "Email already exists.";
                c--;
            }
            else
            {
                lbl_email.Visible = false;
                c++;
            }

            // strong password 
            if (!IsStrongPassword(password))
            {
                lbpass.Visible = true;
                lbpass.Text = "Password must contain at least 8 characters, including at least one uppercase letter, one lowercase letter, and one digit.";
                c--;
            }
            else
            {
                lbpass.Visible = false;
                c++;
            }

            // confirm password
            if (!password.Equals(comfimpass))
            {
                lblconfirpass.Visible = true;
                lblconfirpass.Text = "Passwords should match.";
                c--;
            }
            else
            {
                lblconfirpass.Visible = false;
                c++;
            }

            // Contact field validation with regex pattern
            if (String.IsNullOrEmpty(contact))
            {
                lbcontact.Visible = true;
                lbcontact.Text = "Contact number is required.";
                c--;
            }
            else if (!IsValidContact(contact))
            {
                lbcontact.Visible = true;
                lbcontact.Text = "Invalid contact number format.";
                c--;
            }
            else
            {
                lbcontact.Visible = false;
                c++;
            }

            // address field
            if (String.IsNullOrEmpty(address))
            {
                lbladdress.Visible = true;
                lbladdress.Text = "Address is required.";
                c--;
            }
            else
            {
                lbladdress.Visible = false;
                c++;
            }

            // Birthdate field validation
            DateTime parsedBirthdate;
            if (!DateTime.TryParse(birthdate, out parsedBirthdate))
            {
                lbl_birthdate.Visible = true;
                lbl_birthdate.Text = "Invalid date format. Please enter a valid date.";
                c--;
            }
            else
            {
                lbl_birthdate.Visible = false;
                c++;
            }

            // Username field required validation
            if (String.IsNullOrEmpty(username))
            {
                lbl_username.Visible = true;
                lbl_username.Text = "Username is required.";
                c--;
            }
            else if (UsernameExistsInDatabase(username))
            {
                lbl_username.Visible = true;
                lbl_username.Text = "Username already exists.";
                c--;
            }
            else
            {
                lbl_username.Visible = false;
                c++;
            }



            if (c==9)
            {
                try
                {
                    string connectionString = WebConfigurationManager.ConnectionStrings["con1"].ConnectionString;
                    string tablename = "customer_table";

                    string lastCustomerId = GetLastCustomerId(connectionString, tablename);
                    string newCustomerId = IncrementCustomerId(lastCustomerId);

                    query = "Insert into customer_table (customer_ID ,username,first_name , last_name , customer_email ,birthdate ,customer_password ,customer_phone , customer_address , customer_gender ) values (@customerId,@username, @fname ,@lname ,@email , @birthdate ,@password ,@contact, @address ,@gender)";
                    cmd = new SqlCommand(query, conn);

                    cmd.Parameters.AddWithValue("@customerId", newCustomerId);
                    cmd.Parameters.AddWithValue("@username", username);
                    cmd.Parameters.AddWithValue("@fname",fname);
                    cmd.Parameters.AddWithValue("@lname", lname);
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@birthdate", birthdate);
                    cmd.Parameters.AddWithValue("@password", password);
                    cmd.Parameters.AddWithValue("@contact", contact);
                    cmd.Parameters.AddWithValue("@address", address);
                    cmd.Parameters.AddWithValue("@gender", gender);

                    try
                    {
                        cmd.ExecuteNonQuery();

                        //Response.Redirect("Admin.aspx");
                        string script = "alert('Registration Successful!'); window.location='user_login.aspx';";
                        ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
                    }
                    catch (Exception ex)
                    {
                        string errorScript = "alert('Error: " + ex.Message + "');";
                        ClientScript.RegisterStartupScript(this.GetType(), "ErrorMessage", errorScript, true);
                    }

                }
                catch(Exception ex)
                {
                    string errorScript = "alert('Error: " + ex.Message + "');";
                    ClientScript.RegisterStartupScript(this.GetType(), "ErrorMessage", errorScript, true);
                }
            }
        }
        // Function to validate name format (contains only characters)
        bool IsValidName(string name)
        {
            // Use a regular expression for name validation
            // This regex pattern allows only letters (uppercase or lowercase), spaces, hyphens, and apostrophes
            // Modify the pattern according to your requirements
            string namePattern = @"^[a-zA-Z\s\-']+$";
            return Regex.IsMatch(name, namePattern);
        }
        // Function to validate email format
        bool IsValidEmail(string email)
        {
            // Use a regular expression for email validation
            // This regex pattern may need to be adjusted based on your requirements
            string emailPattern = @"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$";
            return Regex.IsMatch(email, emailPattern);
        }
        // Function to check if email exists in the database
        bool EmailExistsInDatabase(string email)
        {
            try
            {
                string connectionString = WebConfigurationManager.ConnectionStrings["con1"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string query = "SELECT COUNT(*) FROM customer_table WHERE customer_email = @Email";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@Email", email);
                    int count = (int)cmd.ExecuteScalar();
                    return count > 0;
                }
            }
            catch (Exception ex)
            {
                // Handle database error
                lbl_email.Visible = true;
                lbl_email.Text = "Error checking email: " + ex.Message;
                return false;
            }
        }
        // Function to validate contact number format
        bool IsValidContact(string contact)
        {
            // Use a regular expression for contact validation
            // This regex pattern may need to be adjusted based on your requirements
            string contactPattern = @"^\d{10}$"; // Assuming 10 digit phone number
            return Regex.IsMatch(contact, contactPattern);
        }
        // Function to check if username exists in the database
        bool UsernameExistsInDatabase(string username)
        {
            try
            {
                string connectionString = WebConfigurationManager.ConnectionStrings["con1"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string query = "SELECT COUNT(*) FROM customer_table WHERE username = @Username";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@Username", username);
                    int count = (int)cmd.ExecuteScalar();
                    return count > 0;
                }
            }
            catch (Exception ex)
            {
                // Handle database error
                lbl_username.Visible = true;
                lbl_username.Text = "Error checking username: " + ex.Message;
                return false;
            }
        }
        private string GetLastCustomerId(string connectionString,string tablename)
        {
            string lastCustomerId = string.Empty;


            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                string query = $"SELECT TOP 1 customer_ID FROM customer_table ORDER BY CAST(SUBSTRING( customer_ID , 4, LEN(customer_ID)) AS INT) DESC";
                SqlCommand cmd = new SqlCommand(query, conn);

                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        lastCustomerId = rdr["customer_ID"].ToString();
                    }
                }
            }
            return lastCustomerId;
        }
        private string IncrementCustomerId(string lastCustomerId)
        {
            string prefix = "cus";
            int currentId = 0;

            if(lastCustomerId.StartsWith(prefix) && int.TryParse(lastCustomerId.Substring(prefix.Length), out currentId))
            {
                // Increment the ID for the new customer registration
                int newId = currentId + 1;
                return $"{prefix}{newId}";
            }
            // Handle the case where the ID format is not as expected
            return string.Empty;
        }
        private bool IsStrongPassword(string password)
        {
            // Add your own password policy (e.g., minimum length, special characters, etc.)
            return Regex.IsMatch(password, @"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$");
        }

        protected void backbt_Click(object sender, EventArgs e)
        {
            Response.Redirect("user_login.aspx");
        }
    }
}
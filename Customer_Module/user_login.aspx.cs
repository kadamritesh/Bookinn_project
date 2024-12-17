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
using System.Net.Sockets;

namespace BookInn
{
    public partial class user_login : System.Web.UI.Page
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
            string customerID = "";
            string username = "";
            string first_name = "";
            string last_name = "";
            string phone = "";
            string address = "";
            string email = "";
            string password = "";
            string birthday = "";

             
            query = "SELECT * FROM customer_table";
            cmd = new SqlCommand(query, conn);
            try
            {
                rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    if (rdr["customer_email"].ToString() == txtemail.Text.ToString() || rdr["username"].ToString() == txtemail.Text.ToString())
                    {
                        isEmailValid = true;
                        customerID = rdr["customer_ID"].ToString();
                        username = rdr["username"].ToString();
                        first_name = rdr["first_name"].ToString();
                        last_name = rdr["last_name"].ToString();
                        email = rdr["customer_email"].ToString();
                        phone = rdr["customer_phone"].ToString();
                        address = rdr["customer_address"].ToString();
                        password = rdr["customer_password"].ToString();
                        birthday = rdr["birthdate"].ToString();

                    }
                    if (rdr["customer_password"].ToString() == txtpassword.Text.ToString())
                    {
                        isPassValid = true;
                    }
                }
                if (!isEmailValid)
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
                if (isEmailValid && isPassValid)
                {
                    // Store admin ID and name in session variables
                    Session["CustomerID"] = customerID;
                    Session["UserName"] = username;
                    Session["Fname"] = first_name;
                    Session["Lname"] = last_name;
                    Session["CusPhone"] = phone;
                    Session["Address"] = address;
                    Session["Email"] = email;
                    Session["Password"] = password;
                    Session["Birthdate"] = birthday;
                    
                    string script = "alert('Log In successful!'); window.location='index.aspx';";
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
            Response.Redirect("user_reg.aspx");
        }
    }
}
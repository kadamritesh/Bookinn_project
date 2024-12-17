using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Net;
using System.Security.Policy;

namespace BookInn.Customer_Module
{
    public partial class user_profile : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataReader rdr;
        string query;

        public Dictionary<string, dynamic> profile = new Dictionary<string, dynamic>();
        protected void Page_Load(object sender, EventArgs e)
        {
            query = WebConfigurationManager.ConnectionStrings["con1"].ConnectionString;
            conn = new SqlConnection(query);

            conn.Open();

            fillProfile();
        }
        //protected global::System.Web.UI.WebControls.TextBox username;
        protected void fillProfile()
        {
            try
            {
                query = "SELECT * FROM customer_table WHERE customer_ID = '" + Session["CustomerID"].ToString()+"'";
                using(cmd = new SqlCommand(query, conn))
                {
                    using(rdr = cmd.ExecuteReader())
                    {
                        if (rdr.HasRows)
                        {
                            while (rdr.Read())
                            {
                                Dictionary<string, dynamic> temDic = new Dictionary<string, dynamic>
                                {
                                    { "username",rdr["username"]},
                                    { "first_name",rdr["first_name"]},
                                    { "last_name",rdr["last_name"]},
                                    { "customer_phone",rdr["customer_phone"]},
                                    { "customer_address",rdr["customer_address"]},
                                    { "customer_email",rdr["customer_email"]},
                                    { "birthdate", rdr["birthdate"] },
                                    { "customer_password",rdr["customer_password"] }
                                };
                                profile = temDic;
                            }
                        }
                    }
                }
                
            }catch(Exception ex)
            {
                string script = "alert('" + ex.Message + "');";
                ClientScript.RegisterStartupScript(this.GetType(), "ErrorPopupScript", script, true);
            }
        }
        protected void updatePro_hidden_Click(object sender, EventArgs e)
        {
            if (ProNavClickedbtn.Value.ToString() == "genral")
            {
                try  
                {
                    query = "update customer_table set username = @v1, first_name = @v2, last_name = @v3, customer_email = @v6  where customer_ID = @v8";
                    using (cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@v1", Request.Form["username"].ToString());
                        cmd.Parameters.AddWithValue("@v2", Request.Form["fname"].ToString());
                        cmd.Parameters.AddWithValue("@v3", Request.Form["lname"].ToString());
                        cmd.Parameters.AddWithValue("@v6", Request.Form["email"].ToString());
                        

                        cmd.Parameters.AddWithValue("@v8", Session["CustomerID"].ToString());

                        Session["UserName"] = Request.Form["username"].ToString();
                        Session["Fname"] = Request.Form["fname"].ToString();
                        Session["Lname"] = Request.Form["lname"].ToString();
                        Session["Email"] = Request.Form["email"].ToString();
                        


                        cmd.ExecuteNonQuery();
                        string script = "alert('Update SuccessFull')";
                        ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
                        fillProfile();
                    }
                }
                catch (Exception ex)
                {
                    string script = "alert('" + ex.Message + "');";
                    ClientScript.RegisterStartupScript(this.GetType(), "ErrorPopupScript", script, true);
                }

            }
            else if (ProNavClickedbtn.Value.ToString() == "change_password")
            {
                try
                {
                    query = "update customer_table set customer_password = @v9 where customer_ID = @v8";
                    using(cmd = new SqlCommand(query , conn))
                    {
                        cmd.Parameters.AddWithValue("@v9", Request.Form["new_pass"].ToString());
                        cmd.Parameters.AddWithValue("@v8", Session["CustomerID"].ToString());

                        Session["Password"] = Request.Form["new_pass"].ToString();
                        cmd.ExecuteNonQuery ();
                        string script = "alert('Password Update SuccessFull')";
                        ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
                        fillProfile();
                       
                    }
                }
                catch (Exception ex)
                {
                    string script = "alert('" + ex.Message + "');";
                    ClientScript.RegisterStartupScript(this.GetType(), "ErrorPopupScript", script, true);
                }

            }
            else if (ProNavClickedbtn.Value.ToString() == "acc_info")
            {
                try
                {
                    
                    query = "update customer_table set customer_phone = @v4 , customer_address = @v5, birthdate = @v7 where  customer_ID = @v8";
                    using(cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@v4", Request.Form["phone"].ToString());
                        cmd.Parameters.AddWithValue("@v5", Request.Form["location"].ToString());
                        cmd.Parameters.AddWithValue("@v7", Request.Form["birthdate"].ToString());
                        cmd.Parameters.AddWithValue("@v8", Session["CustomerID"].ToString());

                        Session["CusPhone"] = Request.Form["phone"].ToString();
                        Session["Address"] = Request.Form["location"].ToString();
                        Session["Birthdate"] = Request.Form["birthdate"].ToString();
                        cmd.ExecuteNonQuery();
                        fillProfile();
                    }
                }
                catch ( Exception ex )
                {
                    string script = "alert('" + ex.Message + "');";
                    ClientScript.RegisterStartupScript(this.GetType(), "ErrorPopupScript", script, true);
                }
            }

        }
    }
}
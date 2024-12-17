using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;
using System.Net;
using System.Security.Policy;

namespace BookInn.Admin_Master
{
    public partial class Admin_profile : System.Web.UI.Page
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
        protected void fillProfile()
        {
            try
            {
                query = "SELECT * FROM admin_table WHERE admin_ID = '" + Session["AdminID"].ToString() + "'";
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
                                    { "admin_username",rdr["admin_username"]},
                                    { "admin_fname",rdr["admin_fname"]},
                                    { "admin_lname",rdr["admin_lname"]},
                                    { "admin_location",rdr["admin_location"]},
                                    { "admin_birthdate",rdr["admin_birthdate"]},
                                    { "admin_contact",rdr["admin_contact"]},
                                    { "admin_email", rdr["admin_email"] },
                                    { "gender", rdr["gender"] },
                                    { "admin_password",rdr["admin_password"] }
                                };
                                profile = temDic;
                            }
                        }
                    }
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
                //// Determine which fields to update based on user input
                //List<string> fieldsToUpdate = new List<string>();
                //if (!string.IsNullOrEmpty(Request.Form["AdminName"]))
                //    fieldsToUpdate.Add("AdminName");
                //if (!string.IsNullOrEmpty(Request.Form["AdminFname"]))
                //    fieldsToUpdate.Add("AdminFname");
                //if (!string.IsNullOrEmpty(Request.Form["AdminLname"]))
                //    fieldsToUpdate.Add("AdminLname");
                //if (!string.IsNullOrEmpty(Request.Form["AdminLocation"]))
                //    fieldsToUpdate.Add("AdminLocation");
                //if (!string.IsNullOrEmpty(Request.Form["AdminBirthdate"]))
                //    fieldsToUpdate.Add("AdminBirthdate");
                //if (!string.IsNullOrEmpty(Request.Form["AdminContact"]))
                //    fieldsToUpdate.Add("AdminContact");
                //if (!string.IsNullOrEmpty(Request.Form["AdminEmail"]))
                //    fieldsToUpdate.Add("admin_email");



                //// Construct the SQL query dynamically
                //string query = "UPDATE admin_table SET ";
                //for (int i = 0; i < fieldsToUpdate.Count; i++)
                //{
                //    query += fieldsToUpdate[i] + " = @" + fieldsToUpdate[i];
                //    if (i < fieldsToUpdate.Count - 1)
                //        query += ", ";
                //}
                //query += " WHERE admin_ID = @AdminID";

                //using (SqlCommand cmd = new SqlCommand(query, conn))
                //{
                //    // Set parameters for each field to update
                //    //foreach (string field in fieldsToUpdate)
                //    //{
                //    //    cmd.Parameters.AddWithValue("@" + field, Request.Form[field].ToString());
                //    //    Session[field] = Request.Form[field].ToString(); // Update session variable if needed
                //    //    //string fieldValue = Request.Form[field].ToString(); // Retrieve the field value
                //    //    //cmd.Parameters.AddWithValue("@" + field, fieldValue);
                //    //    //Session[field] = fieldValue; // Update session variable if needed
                //    //}

                //    foreach (string field in fieldsToUpdate)
                //    {
                //        // check if the form field exists in the form data
                //        if (Request.Form[field] != null)
                //        {
                //            string fieldvalue = Request.Form[field].ToString(); // retrieve the field value
                //            cmd.Parameters.AddWithValue("@" + field, fieldvalue);
                //            Session[field] = fieldvalue; // update session variable if needed
                //        }
                //        else
                //        {
                //            // log or handle the case where the form field is not found in the form data
                //            Console.WriteLine("form field '" + field + "' not found in form data.");
                //        }
                //   }
                //cmd.Parameters.AddWithValue("@AdminID", Session["AdminID"].ToString());

                //cmd.ExecuteNonQuery();

                //string script = "alert('update successful');";
                //ClientScript.RegisterStartupScript(this.GetType(), "ErrorPopupScript", script, true);
                //// Optionally, reload the profile
                //fillProfile();

                string username = Request.Form["admin_username"].ToString();
                string fname = Request.Form["admin_fname"].ToString();
                string lname = Request.Form["admin_lname"].ToString();
                string location = Request.Form["admin_location"].ToString();
                string email = Request.Form["admin_email"].ToString();
                string birthdate = Request.Form["admin_birthdate"].ToString();
                string phone = Request.Form["admin_contact"].ToString();

                query = $"UPDATE admin_table SET admin_username = '{username}',admin_fname = '{fname}', admin_lname = '{lname}' ,admin_location = '{location}', admin_email = '{email}',admin_birthdate = '{birthdate}', admin_contact = '{phone}'   WHERE admin_ID = @v1";
                using(SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@v1", Session["AdminID"].ToString());

                    
                    Session["AdminName"] = username;
                    Session["AdminFname"] = fname;
                    Session["AdminLname"] = lname;
                    Session["AdminLocation"] = location;
                    Session["AdminBirthdate"] = birthdate;
                    Session["AdminContact"] = phone;
                    Session["AdminEmail"] = email;

                    cmd.ExecuteNonQuery();



                }
                string script = "alert('update successful');";
                ClientScript.RegisterStartupScript(this.GetType(), "ErrorPopupScript", script, true);
                fillProfile();
            }

            catch (Exception ex)
            {
                string script = "alert('" + ex.Message + "');";
                ClientScript.RegisterStartupScript(this.GetType(), "ErrorPopupScript", script, true);
            }

        }

        protected void saveSecurityButtonHidden_Click(object sender, EventArgs e)
        {
            try
            {
                query = "update admin_table set admin_password = @v1 where admin_ID = @v2";
                using (cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@v1", Request.Form["newPassword"].ToString());
                    cmd.Parameters.AddWithValue("@v2", Session["AdminID"].ToString());

                    Session["AdminPassword"] = Request.Form["newPassword"].ToString();
                    cmd.ExecuteNonQuery();

                    string script = "alert('password update');";
                    ClientScript.RegisterStartupScript(this.GetType(), "ErrorPopupScript", script, true);
                    fillProfile();

                }
            }
            catch (Exception ex)
            {
                string script = "alert('" + ex.Message + "');";
                ClientScript.RegisterStartupScript(this.GetType(), "ErrorPopupScript", script, true);
            }
        }
    }
}
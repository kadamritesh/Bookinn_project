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

namespace BookInn.Admin_Master
{

    public partial class Staff_details : System.Web.UI.Page
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
            string conn1 = WebConfigurationManager.ConnectionStrings["con1"].ConnectionString;

            string staffIdValue = GetNextStaffID(conn1);
            string fname = staff_fname.Text.Trim();
            string lname = staff_lname.Text.Trim();
            string staff_position = position.Text.Trim();
            string email = staff_email.Text.Trim();
            string location = staff_location.Text.Trim();
            string phone = staff_phone.Text.Trim();
            string staf_gender = gender.SelectedValue;

            InsertDataIntoDatabase(staffIdValue,admin_ID, hotel_ID,fname, lname, staff_position, email, location, phone, staf_gender);
        }
        private string GetNextStaffID(string conn1)
        {
            string getNextStaffIDQuery = "SELECT MAX(CAST(SUBSTRING(StaffID, 2, LEN(StaffID)) AS INT)) FROM Adminstaff_details";
            using (SqlConnection conn = new SqlConnection(conn1))
            {
                using (SqlCommand cmd = new SqlCommand(getNextStaffIDQuery, conn))
                {
                    conn.Open();
                    object result = cmd.ExecuteScalar();
                    int nextStaffNumber = (result == DBNull.Value) ? 1 : Convert.ToInt32(result) + 1;
                    return "s" + nextStaffNumber.ToString();
                }
            }
        }
        private void InsertDataIntoDatabase(string staffId, int admin_ID,int hotel_ID, string fname, string lname, string staff_position, string email, string location, string phone, string staf_gender)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["con1"].ConnectionString;

            query = "INSERT INTO Adminstaff_details (staffID, admin_ID, hotel_ID, staff_fname, staff_lname, staff_position,staff_email, staff_location, staff_phone,staff_gender) VALUES (@v1 ,@v2 ,@v3 ,@v4, @v5, @v6, @v7, @v8 ,@v9, @v10)";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@v1", staffId);
                    cmd.Parameters.AddWithValue("@v2", admin_ID);
                    cmd.Parameters.AddWithValue("@v3", hotel_ID);
                    cmd.Parameters.AddWithValue("@v4", fname);
                    cmd.Parameters.AddWithValue("@v5", lname);
                    cmd.Parameters.AddWithValue("@v6", staff_position);
                    cmd.Parameters.AddWithValue("@v7", email);
                    cmd.Parameters.AddWithValue("@v8", location);
                    cmd.Parameters.AddWithValue("@v9", phone);
                    cmd.Parameters.AddWithValue("@v10", staf_gender);
                    
                    

                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        // Optionally, show a success message
                        string script1 = "alert('New Staff Add successfully.'); window.location='Staff_page.aspx';";
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
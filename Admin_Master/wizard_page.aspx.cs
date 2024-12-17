using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Text.RegularExpressions;
using System.Web.Configuration;
using System.Web.UI.WebControls;

namespace BookInn
{
    public partial class wizard_page : System.Web.UI.Page
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

       




        //private byte[] ReadFileBytes(Stream stream)
        //{
        //    using (MemoryStream memoryStream = new MemoryStream())
        //    {
        //        stream.CopyTo(memoryStream);
        //        return memoryStream.ToArray();
        //    }
        //}
        //private bool InsertData(byte[] imageData)
        //{
        //    // Connection string for your database
        //    string connectionString = WebConfigurationManager.ConnectionStrings["con1"].ConnectionString; 

        //    // SQL query to insert data into the Hotels table
        //    query = "INSERT INTO images ( image_data) VALUES (@ImageData)";

        //    // Use using statement to ensure proper disposal of resources
        //    using (SqlConnection conn = new SqlConnection(connectionString))
        //    {
        //        // Open the connection
        //        conn.Open();


        //        // Create command with parameters
        //        using (SqlCommand cmd = new SqlCommand(query, conn))
        //        {
        //            // Add parameters

        //            cmd.Parameters.AddWithValue("@ImageData", imageData);

        //            // Execute the command
        //            int rowsAffected = cmd.ExecuteNonQuery();

        //            // If insertion successful, return true; otherwise, return false
        //            return rowsAffected > 0;
        //        }
        //    }
        //}
        //private void LoadImageData()
        //{
        //    // Connection string for your database
        //    string connectionString = WebConfigurationManager.ConnectionStrings["con1"].ConnectionString;

        //    // SQL query to fetch image data from the database
        //    query = "SELECT image_id, image_data FROM images";

        //    // Use using statement to ensure proper disposal of resources
        //    using (SqlConnection conn = new SqlConnection(connectionString))
        //    {
        //        // Open the connection
        //        conn.Open();

        //        // Create command with parameters
        //        using (SqlCommand cmd = new SqlCommand(query, conn))
        //        {
        //            // Execute the command and read the data
        //            using (SqlDataReader rdr = cmd.ExecuteReader())
        //            {
        //                // Loop through the result set
        //                while (rdr.Read())
        //                {
        //                    // Get the image ID and binary image data
        //                    int imageid = rdr.GetInt32(0);
        //                    byte[] imageData = (byte[])rdr["image_data"];

        //                    // Render the image on the webpage
        //                    RenderImage(imageid, imageData);
        //                }
        //            }
        //        }
        //    }
        //}
        //private void RenderImage(int imageid, byte[] imageData)
        //{
        //    // Convert the byte array to a base64 string
        //    string base64String = Convert.ToBase64String(imageData);

        //    // Build the image tag with the base64 string as the source
        //    string imageTag = $"<img src='data:image/jpeg;base64,{base64String}' alt='Hotel Image'>";

        //    // Display the image ID and the image
        //    imageContainer.InnerHtml += $"<p>Image ID: {imageid}</p>{imageTag}<br />";
        //}

        //protected void btnLoadImages_Click(object sender, EventArgs e)
        //{
        //    // Load data when the page is first loaded
        //    LoadImageData();
        //}
    }
}
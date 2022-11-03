using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.WebRequestMethods;

namespace Mini_Project
{
    public partial class Create : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = "";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string s1 = TextProductType.Text;
            string s2 = TextProductName.Text;
            string s3 = TextProductMrp.Text;
            string s4 = TextProductManDate.Text;
            string s5 = TextProductExpDate.Text;
            byte[] s6 = null;

            HttpPostedFile postedFile = FileUpload1.PostedFile;
            string fileName = Path.GetFileName(postedFile.FileName);
            string fileExtension = Path.GetExtension(fileName);
            int fileSize = postedFile.ContentLength;

            try
            {
                if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".png")
                {
                    SqlConnection conn = new SqlConnection();
                    conn.ConnectionString = "Data Source=DESKTOP-DC28L56\\SQLEXPRESS;Initial Catalog=01_database;Integrated Security=True";

                    Stream stream = postedFile.InputStream;
                    BinaryReader binaryReader = new BinaryReader(stream);
                    s6 = binaryReader.ReadBytes((int)stream.Length);

                    conn.Open();
                    string queryStr = "insert into product(product_type,product_name,product_mrp,product_manufacture_date,product_expire_date,product_image) values ('" + s1 + "','" + s2 + "','" + s3 + "','" + s4 + "','" + s5 + "'," + "@product_image" + ")";
                    SqlCommand cmd = new SqlCommand(queryStr, conn);
                    var binary1 = cmd.Parameters.Add("@product_image", SqlDbType.VarBinary, -1);
                    binary1.Value = s6;

                    cmd.ExecuteNonQuery();

                    Label1.ForeColor = System.Drawing.Color.Green;
                    Label1.Text = "Product Created Sucsseccfully";

                    cmd.Dispose();
                    conn.Close();
                }
                else
                {
                    Label1.ForeColor = System.Drawing.Color.Red;
                    Label1.Text = "NOT image file";
                }


            }
            catch (Exception ex)
            {
                Label1.ForeColor = System.Drawing.Color.Black;
                Label1.Text = ex.Message;
            }
        }
    }
}

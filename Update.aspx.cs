using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mini_Project
{
    public partial class Update : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Panel2.Visible = false;
            Label1.Text = "";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection();
                conn.ConnectionString = "Data Source=DESKTOP-DC28L56\\SQLEXPRESS;Initial Catalog=01_database;Integrated Security=True";
                conn.Open();

                string checkStr = "SELECT * FROM product WHERE product_id = " + TextBox1.Text;
                string queryStr = "SELECT product_type,product_name,product_mrp, product_manufacture_date,product_expire_date FROM product WHERE product_id = " + TextBox1.Text;

                SqlCommand cmd = new SqlCommand(checkStr, conn);
                SqlDataReader sqlDataReader = cmd.ExecuteReader();
                cmd.Dispose();
                if (sqlDataReader.Read())
                {
                    sqlDataReader.Close();
                    cmd = new SqlCommand(queryStr, conn);
                    sqlDataReader = cmd.ExecuteReader();
                    if (sqlDataReader.Read())
                    {
                        TextProductType.Text = sqlDataReader.GetString(0);
                        TextProductName.Text = sqlDataReader.GetString(1);
                        TextProductMrp.Text = sqlDataReader.GetValue(2).ToString();
                        TextProductManDate.Text = sqlDataReader.GetString(3);
                        TextProductExpDate.Text = sqlDataReader.GetString(4);
                        Panel2.Visible = true;
                    }

                }
                else
                {
                    Label1.ForeColor = System.Drawing.Color.Red;
                    Label1.Text = "Item not found";
                }
                cmd.Dispose();
                conn.Close();
            }
            catch (Exception ex)
            {
                Label1.ForeColor = System.Drawing.Color.Black;
                Label1.Text = ex.Message;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Panel2.Visible = true;
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
                    string queryStr = "UPDATE product SET product_type='" + s1 + "'," + "product_name='" + s2 + "'," + "product_mrp='" + s3 + "'," + "product_manufacture_date='" + s4 + "'," + "product_expire_date='" + s5 + "'," + "product_image=" + "@product_image where product_id = " + TextBox1.Text;
                    SqlCommand cmd = new SqlCommand(queryStr, conn);
                    var binary1 = cmd.Parameters.Add("@product_image", SqlDbType.VarBinary, -1);
                    binary1.Value = s6;

                    cmd.ExecuteNonQuery();

                    Label1.ForeColor = System.Drawing.Color.Green;
                    Label1.Text = "Product Updated Sucsseccfully";

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
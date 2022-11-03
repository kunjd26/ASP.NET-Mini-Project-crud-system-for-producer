using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mini_Project
{
    public partial class Delete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = "";
            Panel2.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Panel2.Visible = true;
            try
            {
                //string checkStr = "SELECT * FROM product WHERE product_id = " + TextBox1.Text;
                //SqlCommand cmd = new SqlCommand(checkStr, conn);
                //SqlDataReader sqlDataReader = cmd.ExecuteReader();
                //cmd.Dispose();
                //if (sqlDataReader.Read())
                //{
                //sqlDataReader.Close();
                //}
                //else
                //{
                //    Label1.ForeColor = System.Drawing.Color.Red;
                //    Label1.Text = "Item not found";
                //}
                if (TextBox2.Text == "confirm")
                {

                    SqlConnection conn = new SqlConnection();
                    conn.ConnectionString = "Data Source=DESKTOP-DC28L56\\SQLEXPRESS;Initial Catalog=01_database;Integrated Security=True";
                    conn.Open();

                    string queryStr = "DELETE FROM product WHERE product_id = " + TextBox1.Text;

                    SqlCommand cmd = new SqlCommand(queryStr, conn);
                    cmd.ExecuteNonQuery();

                    Label1.ForeColor = System.Drawing.Color.Green;
                    Label1.Text = "Product Deleted Successfully!";

                    cmd.Dispose();
                    conn.Close();
                }
                else
                {
                    Label1.ForeColor = System.Drawing.Color.Red;
                    Label1.Text = "type confirm and re-try";
                }
            }
            catch (Exception ex)
            {
                Label1.ForeColor = System.Drawing.Color.Black;
                Label1.Text = ex.Message;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection();
                conn.ConnectionString = "Data Source=DESKTOP-DC28L56\\SQLEXPRESS;Initial Catalog=01_database;Integrated Security=True";
                conn.Open();

                string checkStr = "SELECT * FROM product WHERE product_id = " + TextBox1.Text;

                SqlCommand cmd = new SqlCommand(checkStr, conn);
                SqlDataReader sqlDataReader = cmd.ExecuteReader();
                cmd.Dispose();
                if (sqlDataReader.Read())
                {
                    Panel2.Visible = true;

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
    }
}
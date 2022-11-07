using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mini_Project
{
    public partial class Default1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection();
            try
            {
                conn.ConnectionString = "Data Source=DESKTOP-DC28L56\\SQLEXPRESS;Initial Catalog=01_database;Integrated Security=True";
                conn.Open();
                string queryStr = "insert into table_03 values('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox4.Text + "')";
                try
                {

                    SqlCommand cmd = new SqlCommand(queryStr, conn);
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    Response.Redirect("Create.aspx");

                }
                catch (Exception ex)
                {
                    //Response.Write("1 " + ex.Message);
                    Response.Write("User already regidtered");
                }

                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("2 " + ex.Message);
            }
        }
    }
}
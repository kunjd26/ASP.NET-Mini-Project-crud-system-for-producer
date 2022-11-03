using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mini_Project
{
    public partial class Read : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = "";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection();
                conn.ConnectionString = "Data Source=DESKTOP-DC28L56\\SQLEXPRESS;Initial Catalog=01_database;Integrated Security=True";
                conn.Open();
                string queryStr = "SELECT * FROM product";

                SqlCommand cmd = new SqlCommand(queryStr, conn);
                SqlDataReader sqlDataReader = cmd.ExecuteReader();
                GridView1.DataSource = sqlDataReader;
                GridView1.DataBind();

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
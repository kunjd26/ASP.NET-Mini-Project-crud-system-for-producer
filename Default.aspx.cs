using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mini_Project
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection();
                conn.ConnectionString = "Data Source=DESKTOP-DC28L56\\SQLEXPRESS;Initial Catalog=01_database;Integrated Security=True";
                conn.Open();
                string queryStr = "select * from table_03 where username = '" + TextBox1.Text + "'";


                SqlCommand cmd = new SqlCommand(queryStr, conn);
                SqlDataReader dataReader = cmd.ExecuteReader();
                cmd.Dispose();
                if (dataReader.Read())
                {
                    if (TextBox2.Text == dataReader.GetString(2))
                    {
                        //HttpCookie userName = new HttpCookie("userName");
                        //userName["userName1"] = dataReader.GetString(0);
                        //Response.Cookies.Add(userName);
                        Response.Redirect("Read.aspx");
                    }
                    else
                        Response.Write("Invalid Username or Password");

                }
                else
                {
                    Response.Write("Invalid Username or Password!");
                }

                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("ERROR: " + ex.Message);
            }
        }
    }
}
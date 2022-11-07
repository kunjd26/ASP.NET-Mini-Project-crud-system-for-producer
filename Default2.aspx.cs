﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mini_Project
{
    public partial class Default2 : System.Web.UI.Page
    {
        static int otp = 0;
        static string userName = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            Panel2.Visible = false;
            Panel3.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection();
            Random rand = new Random();
            otp = rand.Next(99999, 1000000);
            try
            {
                conn.ConnectionString = "Data Source=DESKTOP-DC28L56\\SQLEXPRESS;Initial Catalog=01_database;Integrated Security=True";
                conn.Open();
                string queryStr = "select * from table_03 where username = '" + TextBox1.Text + "' and email = '" + TextBox2.Text + "'";
                try
                {

                    SqlCommand cmd = new SqlCommand(queryStr, conn);
                    SqlDataReader dataReader = cmd.ExecuteReader();
                    cmd.Dispose();
                    if (dataReader.Read())
                    {
                        if (TextBox1.Text == dataReader.GetString(0) && TextBox2.Text == dataReader.GetString(1))
                        {
                            userName = dataReader.GetString(0);
                            MailMessage mailMessage = new MailMessage("kunj.o727@gmail.com", dataReader.GetString(1));

                            mailMessage.Subject = "OTP For Reset Password";
                            mailMessage.Body = "Your One Time Password is " + otp.ToString() + " Plese Don't Share With Anyone!";

                            SmtpClient smtpClient = new SmtpClient();
                            smtpClient.Send(mailMessage);
                            Panel1.Visible = false;
                            Panel3.Visible = false;
                            Panel2.Visible = true;
                        }
                        else
                            Response.Write("Invalid Username or Email");

                    }
                    else
                    {
                        Response.Write("Invalid Username or Email!");
                    }

                }
                catch (Exception ex)
                {

                    Response.Write("1 " + ex.Message);
                }

                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("2 " + ex.Message);
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Panel2.Visible = true;
            if (TextBox3.Text == otp.ToString())
            {
                Panel1.Visible = false;
                Panel2.Visible = false;
                Panel3.Visible = true;
            }
            else
            {
                Response.Write("Invalid OTP");
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection();
            try
            {
                conn.ConnectionString = "Data Source=DESKTOP-DC28L56\\SQLEXPRESS;Initial Catalog=01_database;Integrated Security=True";
                conn.Open();
                string queryStr = "update table_03 set password = '" + TextBox5.Text + "' where username = '" + userName + "'";
                try
                {

                    SqlCommand cmd = new SqlCommand(queryStr, conn);
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    Response.Redirect("Read.aspx");

                }
                catch (Exception ex)
                {

                    Response.Write("1 " + ex.Message);
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
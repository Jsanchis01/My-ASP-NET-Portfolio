using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace MyWebResume
{
    public partial class Contact : System.Web.UI.Page
    {
        string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    using (SqlConnection con = new SqlConnection(connStr))
                    {
                        string sql = "INSERT INTO Contacts (Name, Email, Message) VALUES (@n, @e, @m)";
                        SqlCommand cmd = new SqlCommand(sql, con);
                        cmd.Parameters.AddWithValue("@n", txtName.Text.Trim());
                        cmd.Parameters.AddWithValue("@e", txtEmail.Text.Trim());
                        cmd.Parameters.AddWithValue("@m", txtMsg.Text.Trim());
                        con.Open();
                        cmd.ExecuteNonQuery();

                        // Show Success View
                        mvContact.ActiveViewIndex = 1;
                    }
                }
                catch (Exception ex)
                {
                    lblError.Text = "Error: " + ex.Message;
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            txtName.Text = "";
            txtEmail.Text = "";
            txtMsg.Text = "";
            mvContact.ActiveViewIndex = 0;
        }
    }
}
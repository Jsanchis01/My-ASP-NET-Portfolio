using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace MyWebResume
{
    public partial class Module3 : System.Web.UI.Page
    {
        // Ensure this connection string exists in your Web.config
        string cs = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindAllGrids();
            }
        }

        protected void Menu_Click(object sender, EventArgs e)
        {
            mvMod3.ActiveViewIndex = int.Parse(((Button)sender).CommandArgument);
            BindAllGrids(); // Refresh data when switching tabs
        }

        // --- CENTRAL DATA BINDING METHOD ---
        private void BindAllGrids()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                // Basic select for all general controls
                SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM Students", con);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                // Bind Main Grids (Q22, Q24)
                gvManage.DataSource = dt;
                gvManage.DataBind();

                // Bind Q25 Filter (Only if no search is active)
                if (string.IsNullOrEmpty(txtSearch.Text))
                {
                    gvFilter.DataSource = dt;
                    gvFilter.DataBind();
                }

                // Bind Extra Controls (Q26-Q30)
                dvStudent.DataSource = dt; dvStudent.DataBind();
                fvStudent.DataSource = dt; fvStudent.DataBind();
                rptStudents.DataSource = dt; rptStudents.DataBind();
                dlStudents.DataSource = dt; dlStudents.DataBind();
                lvStudents.DataSource = dt; lvStudents.DataBind();
            }
        }

        // Q22: INSERT (With Clear Logic)
        protected void btnInsert_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string sql = "INSERT INTO Students (Name, Course, Email) VALUES (@n, @c, @e)";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@n", txtName.Text);
                cmd.Parameters.AddWithValue("@c", txtCourse.Text);
                cmd.Parameters.AddWithValue("@e", txtEmail.Text);
                con.Open();
                cmd.ExecuteNonQuery();
            }

            // Clear Inputs
            txtName.Text = ""; txtCourse.Text = ""; txtEmail.Text = "";
            lblStatus.Text = "Record Inserted Successfully!";
            BindAllGrids();
        }

        // Q23: DISCONNECTED DATASET
        protected void btnFetchDS_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM Students", con);
                DataSet ds = new DataSet();
                sda.Fill(ds, "St");
                gvDataSet.DataSource = ds.Tables["St"];
                gvDataSet.DataBind();
            }
        }

        // Q24: GRIDVIEW EDITING
        protected void gvManage_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvManage.EditIndex = e.NewEditIndex;
            BindAllGrids();
        }

        protected void gvManage_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvManage.EditIndex = -1;
            BindAllGrids();
        }

        protected void gvManage_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // Using NewValues to avoid "Index Out of Range" errors
            int id = Convert.ToInt32(gvManage.DataKeys[e.RowIndex].Value);
            string name = e.NewValues["Name"]?.ToString();
            string course = e.NewValues["Course"]?.ToString();
            string email = e.NewValues["Email"]?.ToString();

            using (SqlConnection con = new SqlConnection(cs))
            {
                string sql = "UPDATE Students SET Name=@n, Course=@c, Email=@e WHERE Id=@id";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@n", name);
                cmd.Parameters.AddWithValue("@c", course);
                cmd.Parameters.AddWithValue("@e", email);
                cmd.Parameters.AddWithValue("@id", id);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            gvManage.EditIndex = -1;
            BindAllGrids();
        }

        protected void gvManage_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvManage.DataKeys[e.RowIndex].Value);
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Students WHERE Id=@id", con);
                cmd.Parameters.AddWithValue("@id", id);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            BindAllGrids();
        }

        // Q25: FILTER BUTTON LOGIC
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string sql = "SELECT * FROM Students WHERE Name LIKE @s + '%'";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@s", txtSearch.Text);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                gvFilter.DataSource = dt;
                gvFilter.DataBind();
            }
        }

        // Q26 & Q27: PAGING LOGIC
        protected void dvStudent_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
        {
            dvStudent.PageIndex = e.NewPageIndex;
            BindAllGrids();
        }
        protected void fvStudent_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {
            fvStudent.PageIndex = e.NewPageIndex;
            BindAllGrids();
        }

        // Q31: MASTER-DETAIL DROPDOWN
        protected void ddlCourses_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlCourses.SelectedIndex == 0) return;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string sql = "SELECT * FROM Students WHERE Course = @c";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@c", ddlCourses.SelectedValue);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                gvMasterDetail.DataSource = dt;
                gvMasterDetail.DataBind();
            }
        }

        // Q32: STORED PROCEDURE (Simulated)
        protected void btnSP_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                // Note: Change to CommandType.StoredProcedure if you have a real Proc created
                SqlCommand cmd = new SqlCommand("SELECT * FROM Students", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                gvSP.DataSource = dt;
                gvSP.DataBind();
            }
        }
    }
}
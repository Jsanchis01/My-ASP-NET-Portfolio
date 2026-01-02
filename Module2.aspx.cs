using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MyWebResume
{
    public partial class Module2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Init ViewState for Q11
                ViewState["clicks"] = 0;

                // Init Image for Q16
                imgSlider.ImageUrl = "https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=400";

                // Q12 QueryString Check
                if (Request.QueryString["msg"] != null)
                {
                    lblQueryResult.Visible = true;
                    lblQueryResult.Text = "URL Message: " + Server.UrlDecode(Request.QueryString["msg"]);
                }
            }
        }

        protected void Menu_Click(object sender, EventArgs e)
        {
            mvMod2.ActiveViewIndex = int.Parse(((Button)sender).CommandArgument);
        }

        // Q11
        protected void btnCount_Click(object sender, EventArgs e)
        {
            int count = (int)ViewState["clicks"] + 1;
            ViewState["clicks"] = count;
            lblCounter.Text = "Counter: " + count;
        }

        // Q12
        protected void btnQuery_Click(object sender, EventArgs e)
        {
            Response.Redirect("Module2.aspx?msg=" + Server.UrlEncode(txtQuery.Text));
        }

        // Q13
        protected void btnSetSession_Click(object sender, EventArgs e)
        {
            Session["UserName"] = txtSessionName.Text;
            lblSessionResult.Text = "Session Saved! Hello " + Session["UserName"];
        }

        // Q14
        protected void btnWeight_Click(object sender, EventArgs e)
        {
            try
            {
                double height = double.Parse(txtHeight.Text);
                double ideal = height - 100;
                HttpCookie ck = new HttpCookie("UserPref");
                ck["IdealWeight"] = ideal.ToString();
                ck.Expires = DateTime.Now.AddHours(1);
                Response.Cookies.Add(ck);
                lblWeightResult.Text = "Ideal Weight calculated: " + ideal + "kg. (Saved in Cookie)";
            }
            catch { lblWeightResult.Text = "Please enter numeric height."; }
        }

        // Q15
        protected void Timer1_Tick(object sender, EventArgs e)
        {
            lblTime.Text = DateTime.Now.ToString("T");
        }

        // Q16
        protected void Timer2_Tick(object sender, EventArgs e)
        {
            string[] imgs = {
                "https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=400",
                "https://images.unsplash.com/photo-1461749280684-dccba630e2f6?w=400",
                "https://images.unsplash.com/photo-1555066931-4365d14bab8c?w=400"
            };
            imgSlider.ImageUrl = imgs[new Random().Next(0, imgs.Length)];
        }

        // Q17
        protected void btnWait_Click(object sender, EventArgs e)
        {
            System.Threading.Thread.Sleep(2000); // Simulate network lag
            lblWaitResult.Text = "Server Task Finished at " + DateTime.Now.ToString("T");
        }

        // Q19
        protected void btnBindList_Click(object sender, EventArgs e)
        {
            lbItems.DataSource = new string[] { "Visual Studio", "ASP.NET WebForms", "C# Basics", "ADO.NET" };
            lbItems.DataBind();
        }

        // Q20
        protected void btnBindBullet_Click(object sender, EventArgs e)
        {
            blItems.DataSource = new string[] { "Cloud Computing", "Network Security", "Data Science", "Web Development" };
            blItems.DataBind();
        }

        // Q21
        protected void btnBindXml_Click(object sender, EventArgs e)
        {
            try
            {
                DataSet ds = new DataSet();
                ds.ReadXml(Server.MapPath("~/App_Data/Ads.xml"));
                gvXml.DataSource = ds;
                gvXml.DataBind();
            }
            catch
            {
                Response.Write("<script>alert('Please ensure App_Data/Ads.xml exists!');</script>");
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyWebResume
{
    public partial class Module45 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Q35: Load Visitor Count from Global.asax
                if (Application["TotalUsers"] != null)
                    lblVisitors.Text = Application["TotalUsers"].ToString();
                else
                    lblVisitors.Text = "1 (Dev Mode)";
            }
        }

        protected void Menu_Click(object sender, EventArgs e)
        {
            // Switches between all views (0 to 6)
            mvMod45.ActiveViewIndex = int.Parse(((Button)sender).CommandArgument);
        }

        // Q34: Web Service Logic
        protected void btnCalc_Click(object sender, EventArgs e)
        {
            try
            {
                // Instantiate the Web Service
                MyWebResume.MyService service = new MyWebResume.MyService();

                int a = int.Parse(txtA.Text);
                int b = int.Parse(txtB.Text);

                // Call the 'Add' method from the service
                int result = service.Add(a, b);
                string time = service.GetServerTime();

                lblServiceResult.Text = "Result: " + result + " | Server Time: " + time;
            }
            catch (Exception ex)
            {
                lblServiceResult.Text = "Error: Ensure inputs are numbers.";
            }
        }
    }
}
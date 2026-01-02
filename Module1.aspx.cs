using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing; // Needed for Color

namespace MyWebResume
{
    public partial class Module1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // This line disables the requirement for jQuery validation
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            // Q5 Logic: Check if it's PostBack
            if (IsPostBack)
                lblPostBack.Text = "Status: PostBack Event Triggered! (Page Reloaded)";
            else
                lblPostBack.Text = "Status: First Time Page Load.";
        }

        // NAVIGATION
        protected void Menu_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int index = int.Parse(btn.CommandArgument);
            mvMod1.ActiveViewIndex = index;
        }

        // Q1
        protected void btnColor_Click(object sender, EventArgs e)
        {
            string color = ((Button)sender).CommandArgument;
            lblQ1.ForeColor = Color.FromName(color);
        }

        // Q2
        protected void ddlSize_Changed(object sender, EventArgs e)
        {
            lblQ2.Font.Size = FontUnit.Parse(ddlSize.SelectedValue);
        }
        protected void chkStyle_Changed(object sender, EventArgs e)
        {
            lblQ2.Font.Bold = chkBold.Checked;
            lblQ2.Font.Strikeout = chkStrike.Checked;
        }

        // Q3
        protected void btnQ3_Click(object sender, EventArgs e)
        {
            lblQ3Result.Text = "Hello " + txtQ3Name.Text;
        }

        // Q4
        protected void btnQ4_Click(object sender, EventArgs e)
        {
            if (rbBreakfast.SelectedIndex > -1)
                lblQ4Result.Text = $"Confirmed: {rbBreakfast.SelectedValue} for {txtQ4Name.Text}";
            else
                lblQ4Result.Text = "Please select a meal";
        }

        // Q6
        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (fuProfile.HasFile)
            {
                lblUploadMsg.Text = "Success: " + fuProfile.FileName;
                lblUploadMsg.ForeColor = Color.Green;
            }
        }

        // Q9: Registration
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                lblRegResult.Text = "Registration Successful for " + regName.Text;
                lblRegResult.ForeColor = Color.Green;
            }
        }

        // Q10
        protected void cal1_SelectionChanged(object sender, EventArgs e)
        {
            lblDate.Text = cal1.SelectedDate.ToLongDateString();
        }
    }
}
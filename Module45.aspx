<%@ Page Title="Module 4 & 5" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Module45.aspx.cs" Inherits="MyWebResume.Module45" %>
<%@ Register Src="~/LoginBox.ascx" TagPrefix="uc" TagName="LoginBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .dash-container { display: flex; min-height: 700px; background: white; border-radius: 15px; box-shadow: 0 5px 20px rgba(0,0,0,0.05); margin: 40px 0; border: 1px solid #eee; overflow: hidden; }
        .dash-sidebar { width: 280px; background: #1a1a2e !important; padding: 20px; overflow-y: auto; }
        .sidebar-header { color: #888; font-size: 0.85rem; font-weight: bold; margin-top: 15px; margin-bottom: 5px; text-transform: uppercase; letter-spacing: 1px; }
        .menu-btn { display: block; width: 100%; background: #252545 !important; color: #ffffff !important; padding: 12px 15px !important; margin-bottom: 6px !important; border: 1px solid #3f3f6e !important; border-radius: 6px; text-align: left; font-size: 14px !important; cursor: pointer; transition: 0.2s; }
        .menu-btn:hover { background: #6C63FF !important; transform: translateX(5px); }
        .dash-content { flex: 1; padding: 40px; background: #fcfcfc; overflow-y: auto; }
        .demo-box { border: 2px dashed #ddd; padding: 25px; border-radius: 10px; background: white; margin-top: 15px; }
        .val-error { color: #e74c3c; font-size: 12px; display: block; margin-top: 5px; font-weight: bold; }
    </style>

    <div class="dash-container">
        <div class="dash-sidebar">
            <h3 style="color:white; text-align:center; margin-bottom:20px;">Adv. Modules</h3>
            
            <div class="sidebar-header">Module 4: Services</div>
            <asp:Button ID="btnQ33" runat="server" Text="Q33: User Controls" CssClass="menu-btn" OnClick="Menu_Click" CommandArgument="0" />
            <asp:Button ID="btnQ34" runat="server" Text="Q34: Web Services" CssClass="menu-btn" OnClick="Menu_Click" CommandArgument="1" />
            <asp:Button ID="btnQ35" runat="server" Text="Q35: Global.asax" CssClass="menu-btn" OnClick="Menu_Click" CommandArgument="2" />

            <div class="sidebar-header">Module 5: Validation</div>
            <asp:Button ID="btnQ37" runat="server" Text="Q37: Required Field" CssClass="menu-btn" OnClick="Menu_Click" CommandArgument="3" />
            <asp:Button ID="btnQ38" runat="server" Text="Q38: Range Check" CssClass="menu-btn" OnClick="Menu_Click" CommandArgument="4" />
            <asp:Button ID="btnQ39" runat="server" Text="Q39: Compare & Regex" CssClass="menu-btn" OnClick="Menu_Click" CommandArgument="5" />
            <asp:Button ID="btnQ40" runat="server" Text="Q40: Validation Summary" CssClass="menu-btn" OnClick="Menu_Click" CommandArgument="6" />

            <div style="margin-top: 30px;">
                <asp:Button ID="btnExit" runat="server" Text="← Back to Projects" CssClass="menu-btn" PostBackUrl="~/Projects.aspx" style="background:rgba(255,255,255,0.1); color:white;" />
            </div>
        </div>

        <div class="dash-content">
            <asp:MultiView ID="mvMod45" runat="server" ActiveViewIndex="0">
                
                <asp:View ID="v33" runat="server">
                    <h2>Q33: Reusable User Controls (.ascx)</h2>
                    <p>The login box below is an imported component (`LoginBox.ascx`).</p>
                    <div class="demo-box" style="display:flex; justify-content:center;">
                        <uc:LoginBox runat="server" ID="LoginBox1" />
                    </div>
                </asp:View>

                <asp:View ID="v34" runat="server">
                    <h2>Q34: Consuming Web Services (.asmx)</h2>
                    <div class="demo-box">
                        Number 1: <asp:TextBox ID="txtA" runat="server" Width="80px" CssClass="form-control" style="display:inline; width:100px;"></asp:TextBox>
                        Number 2: <asp:TextBox ID="txtB" runat="server" Width="80px" CssClass="form-control" style="display:inline; width:100px;"></asp:TextBox>
                        <br /><br />
                        <asp:Button ID="btnCalc" runat="server" Text="Add via Service" OnClick="btnCalc_Click" CssClass="btn btn-success" />
                        <br /><br />
                        <asp:Label ID="lblServiceResult" runat="server" Font-Bold="true" ForeColor="#6C63FF"></asp:Label>
                    </div>
                </asp:View>

                <asp:View ID="v35" runat="server">
                    <h2>Q35: Application State</h2>
                    <div class="demo-box">
                        <p>Total Visitors (tracked in Global.asax):</p>
                        <h1 style="color:#6C63FF; font-size:40pt; margin:0;">
                            <asp:Label ID="lblVisitors" runat="server"></asp:Label>
                        </h1>
                    </div>
                </asp:View>

                <asp:View ID="v37" runat="server">
                    <h2>Q37: RequiredFieldValidator</h2>
                    <div class="demo-box">
                        Username: <asp:TextBox ID="txtReq" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txtReq" ErrorMessage="Username is mandatory!" CssClass="val-error" Display="Dynamic"></asp:RequiredFieldValidator>
                        <br />
                        <asp:Button ID="btnV1" runat="server" Text="Submit Form" CssClass="btn btn-primary" />
                    </div>
                </asp:View>

                <asp:View ID="v38" runat="server">
                    <h2>Q38: RangeValidator</h2>
                    <div class="demo-box">
                        Age (18-60): <asp:TextBox ID="txtAge" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RangeValidator ID="rv1" runat="server" ControlToValidate="txtAge" MinimumValue="18" MaximumValue="60" Type="Integer" ErrorMessage="Age must be between 18 and 60" CssClass="val-error" Display="Dynamic"></asp:RangeValidator>
                        <br />
                        <asp:Button ID="btnV2" runat="server" Text="Verify Age" CssClass="btn btn-info" />
                    </div>
                </asp:View>

                <asp:View ID="v39" runat="server">
                    <h2>Q39: Compare & RegularExpression</h2>
                    <div class="demo-box">
                        Password: <asp:TextBox ID="txtPass1" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        Confirm: <asp:TextBox ID="txtPass2" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        <asp:CompareValidator ID="cv1" runat="server" ControlToValidate="txtPass2" ControlToCompare="txtPass1" ErrorMessage="Passwords do not match!" CssClass="val-error" Display="Dynamic"></asp:CompareValidator>
                        <br />
                        Email: <asp:TextBox ID="txtEmailVal" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="rev1" runat="server" ControlToValidate="txtEmailVal" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Invalid Email Format" CssClass="val-error" Display="Dynamic"></asp:RegularExpressionValidator>
                        <br />
                        <asp:Button ID="btnV3" runat="server" Text="Validate Inputs" CssClass="btn btn-success" />
                    </div>
                </asp:View>

                <asp:View ID="v40" runat="server">
                    <h2>Q40: Validation Summary</h2>
                    <div class="demo-box">
                        <p><b>scenario:</b> Try clicking "Submit" without typing anything, or type invalid data.</p>
        
                        <asp:ValidationSummary ID="vs1" runat="server" 
                            ForeColor="Red" 
                            HeaderText="<b>Please fix the following errors:</b>" 
                            ShowMessageBox="true" 
                            ShowSummary="true"
                            BackColor="#ffe6e6" 
                            BorderStyle="Solid"
                            BorderColor="Red"
                            BorderWidth="1px"
                            Padding="10" 
                            Style="margin-bottom:20px; border-radius:5px;" />

                        <div style="margin-bottom:10px;">
                            <label>Name (Required):</label>
                            <asp:TextBox ID="txtSumName" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvSum" runat="server" 
                                ControlToValidate="txtSumName" 
                                ErrorMessage="Name is required." 
                                Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>

                        <div style="margin-bottom:10px;">
                            <label>Age (18-100):</label>
                            <asp:TextBox ID="txtSumAge" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RangeValidator ID="rvSum" runat="server" 
                                ControlToValidate="txtSumAge" 
                                MinimumValue="18" MaximumValue="100" Type="Integer" 
                                ErrorMessage="Age must be 18+." 
                                Text="*" ForeColor="Red"></asp:RangeValidator>
                        </div>

                        <div style="margin-bottom:10px;">
                            <label>Email (Format):</label>
                            <asp:TextBox ID="txtSumEmail" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="revSum" runat="server" 
                                ControlToValidate="txtSumEmail" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                ErrorMessage="Invalid Email." 
                                Text="*" ForeColor="Red"></asp:RegularExpressionValidator>
                        </div>

                        <asp:Button ID="btnAll" runat="server" Text="Submit Registration" CssClass="btn btn-danger" />
                    </div>
                </asp:View>

            </asp:MultiView>
        </div>
    </div>
</asp:Content>
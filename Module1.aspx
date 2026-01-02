<%@ Page Title="Module 1" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Module1.aspx.cs" Inherits="MyWebResume.Module1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .dash-container { display: flex; min-height: 650px; background: white; border-radius: 15px; box-shadow: 0 5px 20px rgba(0,0,0,0.05); margin: 40px 0; overflow: hidden; border: 1px solid #eee; }
        .dash-sidebar { width: 260px; background: var(--dark); padding: 20px; color: white; display: flex; flex-direction: column; overflow-y:auto; }
        .dash-sidebar h3 { color: var(--primary); margin-bottom: 20px; font-size: 1.2rem; text-transform: uppercase; letter-spacing: 1px; }
        .menu-btn { background: transparent; border: none; color: #bbb; text-align: left; padding: 10px; font-size: 0.95rem; cursor: pointer; transition: 0.3s; border-radius: 5px; margin-bottom: 2px; width: 100%; }
        .menu-btn:hover, .menu-btn.active { background: var(--primary); color: white; padding-left: 15px; }
        .dash-content { flex: 1; padding: 40px; background: #fcfcfc; }
        .demo-box { border: 2px dashed #ddd; padding: 25px; border-radius: 10px; background: white; margin-top: 15px; }
        .error { color: red; font-size: 0.9rem; display: block; margin-top: 5px; }
    </style>

    <div class="dash-container">
        <div class="dash-sidebar">
            <h3>Module 1</h3>
            <asp:Button ID="btnQ1" runat="server" Text="Q1: Color Controls" CssClass="menu-btn" OnClick="Menu_Click" CommandArgument="0" />
            <asp:Button ID="btnQ2" runat="server" Text="Q2: Font Effects" CssClass="menu-btn" OnClick="Menu_Click" CommandArgument="1" />
            <asp:Button ID="btnQ3" runat="server" Text="Q3: Basic Form" CssClass="menu-btn" OnClick="Menu_Click" CommandArgument="2" />
            <asp:Button ID="btnQ4" runat="server" Text="Q4: Breakfast" CssClass="menu-btn" OnClick="Menu_Click" CommandArgument="3" />
            <asp:Button ID="btnQ5" runat="server" Text="Q5: PostBack Demo" CssClass="menu-btn" OnClick="Menu_Click" CommandArgument="4" />
            <asp:Button ID="btnQ6" runat="server" Text="Q6: File Upload" CssClass="menu-btn" OnClick="Menu_Click" CommandArgument="5" />
            <asp:Button ID="btnQ7" runat="server" Text="Q7: Ad Rotator" CssClass="menu-btn" OnClick="Menu_Click" CommandArgument="6" />
            <asp:Button ID="btnQ8" runat="server" Text="Q8: Navigation" CssClass="menu-btn" OnClick="Menu_Click" CommandArgument="7" />
            <asp:Button ID="btnQ9" runat="server" Text="Q9: Registration" CssClass="menu-btn" OnClick="Menu_Click" CommandArgument="8" />
            <asp:Button ID="btnQ10" runat="server" Text="Q10: Calendar" CssClass="menu-btn" OnClick="Menu_Click" CommandArgument="9" />
            
            <div style="margin-top: 30px;">
                <asp:Button ID="btnExit" runat="server" Text="← Back to Projects" CssClass="menu-btn" PostBackUrl="~/Projects.aspx" style="background:rgba(255,255,255,0.1); color:white;" />
            </div>
        </div>

        <div class="dash-content">
            <asp:MultiView ID="mvMod1" runat="server" ActiveViewIndex="0">
                
                <asp:View ID="v1" runat="server">
                    <h2>Q1: Dynamic CSS Control</h2>
                    <div class="demo-box" style="text-align:center;">
                        <asp:Label ID="lblQ1" runat="server" Text="ASP.NET CONTROLS" Font-Size="28pt" Font-Bold="true"></asp:Label>
                        <br /><br />
                        <asp:Button ID="btnRed" runat="server" Text="Red" OnClick="btnColor_Click" 
                            CommandArgument="Red" BackColor="#ff7675" ForeColor="White" 
                            BorderStyle="None" style="padding:10px 20px; cursor:pointer;" />

                        <asp:Button ID="btnGreen" runat="server" Text="Green" OnClick="btnColor_Click" 
                            CommandArgument="Green" BackColor="#55efc4" ForeColor="White" 
                            BorderStyle="None" style="padding:10px 20px; cursor:pointer;" />

                        <asp:Button ID="btnBlue" runat="server" Text="Blue" OnClick="btnColor_Click" 
                            CommandArgument="Blue" BackColor="#74b9ff" ForeColor="White" 
                            BorderStyle="None" style="padding:10px 20px; cursor:pointer;" />
                    </div>
                </asp:View>

                <asp:View ID="v2" runat="server">
                    <h2>Q2: Font Effects</h2>
                    <div class="demo-box">
                        <asp:Label ID="lblQ2" runat="server" Text="Sample Text" Font-Size="14pt"></asp:Label>
                        <hr />
                        <asp:DropDownList ID="ddlSize" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSize_Changed" CssClass="form-control" style="width:auto; display:inline-block;">
                            <asp:ListItem Value="12pt">Small</asp:ListItem>
                            <asp:ListItem Value="20pt">Medium</asp:ListItem>
                            <asp:ListItem Value="30pt">Large</asp:ListItem>
                        </asp:DropDownList>
                        <asp:CheckBox ID="chkBold" runat="server" Text="Bold" AutoPostBack="true" OnCheckedChanged="chkStyle_Changed" />
                        <asp:CheckBox ID="chkStrike" runat="server" Text="Strikeout" AutoPostBack="true" OnCheckedChanged="chkStyle_Changed" />
                    </div>
                </asp:View>

                <asp:View ID="v3" runat="server">
                    <h2>Q3: Basic Form</h2>
                    <div class="demo-box">
                        Name: <asp:TextBox ID="txtQ3Name" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:Button ID="btnQ3Submit" runat="server" Text="Submit" OnClick="btnQ3_Click" CssClass="btn-primary" />
                        <br /><br />
                        <asp:Label ID="lblQ3Result" runat="server" Font-Bold="true" ForeColor="#6C63FF"></asp:Label>
                    </div>
                </asp:View>

                <asp:View ID="v4" runat="server">
                    <h2>Q4: Breakfast Selector</h2>
                    <div class="demo-box">
                        Name: <asp:TextBox ID="txtQ4Name" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RadioButtonList ID="rbBreakfast" runat="server">
                            <asp:ListItem>Pancakes</asp:ListItem>
                            <asp:ListItem>Sandwich</asp:ListItem>
                            <asp:ListItem>Oats</asp:ListItem>
                        </asp:RadioButtonList>
                        <br />
                        <asp:Button ID="btnQ4Submit" runat="server" Text="Confirm" OnClick="btnQ4_Click" CssClass="btn-primary" />
                        <br /><br />
                        <asp:Label ID="lblQ4Result" runat="server"></asp:Label>
                    </div>
                </asp:View>

                <asp:View ID="v5" runat="server">
                    <h2>Q5: PostBack Demonstration</h2>
                    <p>Understanding Page Life Cycle: Is this the first load or a reload?</p>
                    <div class="demo-box" style="background:#fff3cd; border-color:#ffeeba;">
                        <asp:Label ID="lblPostBack" runat="server" Font-Bold="true"></asp:Label>
                        <br /><br />
                        <asp:Button ID="btnPostBack" runat="server" Text="Click Me to Cause PostBack" CssClass="btn-primary" />
                    </div>
                </asp:View>

                <asp:View ID="v6" runat="server">
                    <h2>Q6: File Upload</h2>
                    <div class="demo-box">
                        <asp:FileUpload ID="fuProfile" runat="server" />
                        <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" CssClass="btn-primary" />
                        <br /><br />
                        <asp:Label ID="lblUploadMsg" runat="server"></asp:Label>
                    </div>
                </asp:View>

                <asp:View ID="v7" runat="server">
                    <h2>Q7: Ad Rotator Control</h2>
                    <p>Refresh the page or click the button to see a random ad from XML.</p>
                    <div class="demo-box" style="text-align:center;">
                        <asp:AdRotator ID="AdRotator1" runat="server" AdvertisementFile="~/App_Data/Ads.xml" Height="150px" Width="150px" style="border-radius:50%;" />
                        <br /><br />
                        <asp:Button ID="btnRefreshAds" runat="server" Text="Refresh Ad" CssClass="btn-primary" />
                    </div>
                </asp:View>

                <asp:View ID="v8" runat="server">
                    <h2>Q8: Navigation Control (TreeView)</h2>
                    <div class="demo-box">
                        <asp:TreeView ID="TreeView1" runat="server" ShowLines="True">
                            <Nodes>
                                <asp:TreeNode Text="My Web Resume" Value="Root">
                                    <asp:TreeNode Text="Home" NavigateUrl="~/Home.aspx" />
                                    <asp:TreeNode Text="Projects" NavigateUrl="~/Projects.aspx">
                                        <asp:TreeNode Text="Module 1" NavigateUrl="~/Module1.aspx" />
                                        <asp:TreeNode Text="Module 2" />
                                    </asp:TreeNode>
                                    <asp:TreeNode Text="Contact" NavigateUrl="~/Contact.aspx" />
                                </asp:TreeNode>
                            </Nodes>
                        </asp:TreeView>
                    </div>
                </asp:View>

                <asp:View ID="v9" runat="server">
                    <h2>Q9: Registration with Validation</h2>
                    <div class="demo-box">
                        Name: <asp:TextBox ID="regName" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvRegName" runat="server" ControlToValidate="regName" ErrorMessage="Name is required" ForeColor="Red" ValidationGroup="reg" Display="Dynamic" />

                        Mobile (10 digits): <asp:TextBox ID="regMobile" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="revMobile" runat="server" ControlToValidate="regMobile" ValidationExpression="^[0-9]{10}$" ErrorMessage="Invalid Mobile Number" ForeColor="Red" ValidationGroup="reg" Display="Dynamic" />

                        Email: <asp:TextBox ID="regEmail" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="revRegEmail" runat="server" ControlToValidate="regEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Invalid Email" ForeColor="Red" ValidationGroup="reg" Display="Dynamic" />

                        Password: <asp:TextBox ID="regPass" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPass" runat="server" ControlToValidate="regPass" ErrorMessage="Password required" ForeColor="Red" ValidationGroup="reg" Display="Dynamic" />

                        Confirm Password: <asp:TextBox ID="regConfirm" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        <asp:CompareValidator ID="cvPass" runat="server" ControlToCompare="regPass" ControlToValidate="regConfirm" ErrorMessage="Passwords do not match" ForeColor="Red" ValidationGroup="reg" Display="Dynamic" />

                        <br /><br />
                        <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" ValidationGroup="reg" CssClass="btn-primary" />
                        <br />
                        <asp:Label ID="lblRegResult" runat="server" Font-Bold="true"></asp:Label>
                        
                        <asp:ValidationSummary ID="vs1" runat="server" ValidationGroup="reg" ForeColor="Red" HeaderText="Please fix these errors:" />
                    </div>
                </asp:View>

                <asp:View ID="v10" runat="server">
                    <h2>Q10: Calendar</h2>
                    <div class="demo-box">
                        <asp:Calendar ID="cal1" runat="server" OnSelectionChanged="cal1_SelectionChanged" BackColor="White" BorderColor="#ddd" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" Height="180px" Width="200px">
                            <SelectedDayStyle BackColor="#6C63FF" ForeColor="White" />
                            <TitleStyle BackColor="#2F2E41" Font-Bold="True" ForeColor="White" />
                        </asp:Calendar>
                        <br />
                        <asp:Label ID="lblDate" runat="server"></asp:Label>
                    </div>
                </asp:View>

            </asp:MultiView>
        </div>
    </div>
</asp:Content>
<%@ Page Title="Module 2" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Module2.aspx.cs" Inherits="MyWebResume.Module2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .dash-container { display: flex; min-height: 700px; background: white; border-radius: 15px; box-shadow: 0 5px 20px rgba(0,0,0,0.05); margin: 40px 0; overflow: hidden; border: 1px solid #eee; }
        .dash-sidebar { width: 280px; background: #1a1a2e !important; padding: 20px; overflow-y: auto; height: 700px; }
        .sidebar-title { color: #6C63FF; font-weight: bold; font-size: 1.2rem; margin-bottom: 20px; display: block; text-align: center; text-transform: uppercase; border-bottom: 1px solid #333; padding-bottom: 10px; }
        .menu-btn { display: block; width: 100%; background: #252545 !important; color: #ffffff !important; padding: 12px 15px !important; margin-bottom: 6px !important; border: 1px solid #3f3f6e !important; border-radius: 6px; text-align: left; font-size: 14px !important; cursor: pointer; transition: 0.2s; }
        .menu-btn:hover { background: #6C63FF !important; transform: translateX(5px); }
        .dash-content { flex: 1; padding: 40px; background: #fcfcfc; overflow-y: auto; }
        .demo-box { border: 2px dashed #ddd; padding: 25px; border-radius: 10px; background: white; margin-top: 15px; }
        .status-msg { padding: 10px; border-radius: 5px; background: #e8f4fd; color: #2980b9; font-weight: bold; display: inline-block; margin-bottom: 10px; }
    </style>

    <div class="dash-container">
        <div class="dash-sidebar">
            <span class="sidebar-title">Module 2 Labs</span>
            
            <asp:Button ID="btnQ11" runat="server" Text="Q11: ViewState" CssClass="menu-btn" OnClick="Menu_Click" CommandArgument="0" />
            <asp:Button ID="btnQ12" runat="server" Text="Q12: Query Strings" CssClass="menu-btn" OnClick="Menu_Click" CommandArgument="1" />
            <asp:Button ID="btnQ13" runat="server" Text="Q13: Sessions" CssClass="menu-btn" OnClick="Menu_Click" CommandArgument="2" />
            <asp:Button ID="btnQ14" runat="server" Text="Q14: Cookies (Weight)" CssClass="menu-btn" OnClick="Menu_Click" CommandArgument="3" />
            <asp:Button ID="btnQ15" runat="server" Text="Q15: AJAX Timer" CssClass="menu-btn" OnClick="Menu_Click" CommandArgument="4" />
            <asp:Button ID="btnQ16" runat="server" Text="Q16: Ad Slider" CssClass="menu-btn" OnClick="Menu_Click" CommandArgument="5" />
            <asp:Button ID="btnQ17" runat="server" Text="Q17: UpdateProgress" CssClass="menu-btn" OnClick="Menu_Click" CommandArgument="6" />
            <asp:Button ID="btnQ19" runat="server" Text="Q19: List Binding" CssClass="menu-btn" OnClick="Menu_Click" CommandArgument="7" />
            <asp:Button ID="btnQ20" runat="server" Text="Q20: Bullet Binding" CssClass="menu-btn" OnClick="Menu_Click" CommandArgument="8" />
            <asp:Button ID="btnQ21" runat="server" Text="Q21: XML Binding" CssClass="menu-btn" OnClick="Menu_Click" CommandArgument="9" />
            <div style="margin-top: 30px;">
                <asp:Button ID="btnExit" runat="server" Text="← Back to Projects" CssClass="menu-btn" PostBackUrl="~/Projects.aspx" style="background:rgba(255,255,255,0.1); color:white;" />
            </div>
        </div>

        <div class="dash-content">
            <asp:ScriptManager ID="smMain" runat="server"></asp:ScriptManager>
            
            <asp:MultiView ID="mvMod2" runat="server" ActiveViewIndex="0">
                
                <asp:View ID="v11" runat="server">
                    <h2>Q11: ViewState Counter</h2>
                    <div class="demo-box">
                        <asp:Label ID="lblCounter" runat="server" Text="Counter: 0" Font-Bold="true" Font-Size="20pt"></asp:Label><br /><br />
                        <asp:Button ID="btnCount" runat="server" Text="Increment Counter" OnClick="btnCount_Click" CssClass="btn btn-primary" />
                    </div>
                </asp:View>

                <asp:View ID="v12" runat="server">
                    <h2>Q12: Query Strings</h2>
                    <div class="demo-box">
                        <asp:TextBox ID="txtQuery" runat="server" CssClass="form-control" placeholder="Enter message"></asp:TextBox><br />
                        <asp:Button ID="btnQuery" runat="server" Text="Send via URL" OnClick="btnQuery_Click" CssClass="btn btn-info" />
                        <hr />
                        <asp:Label ID="lblQueryResult" runat="server" CssClass="status-msg" Visible="false"></asp:Label>
                    </div>
                </asp:View>

                <asp:View ID="v13" runat="server">
                    <h2>Q13: Session State</h2>
                    <div class="demo-box">
                        Your Name: <asp:TextBox ID="txtSessionName" runat="server" CssClass="form-control"></asp:TextBox><br />
                        <asp:Button ID="btnSetSession" runat="server" Text="Save to Session" OnClick="btnSetSession_Click" CssClass="btn btn-success" />
                        <br /><br />
                        <asp:Label ID="lblSessionResult" runat="server"></asp:Label>
                    </div>
                </asp:View>

                <asp:View ID="v14" runat="server">
                    <h2>Q14: Cookies (Weight Calculator)</h2>
                    <div class="demo-box">
                        Height (cm): <asp:TextBox ID="txtHeight" runat="server" CssClass="form-control"></asp:TextBox><br />
                        <asp:Button ID="btnWeight" runat="server" Text="Store in Cookie" OnClick="btnWeight_Click" CssClass="btn btn-warning" />
                        <br /><br />
                        <asp:Label ID="lblWeightResult" runat="server"></asp:Label>
                    </div>
                </asp:View>

                <asp:View ID="v15" runat="server">
                    <h2>Q15: AJAX Real-Time Clock</h2>
                    <div class="demo-box">
                        <asp:UpdatePanel ID="up1" runat="server">
                            <ContentTemplate>
                                <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick"></asp:Timer>
                                <div style="font-family: 'Courier New'; font-size: 30pt; color: #6C63FF; text-align:center;">
                                    <asp:Label ID="lblTime" runat="server"></asp:Label>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </asp:View>

                <asp:View ID="v16" runat="server">
                    <h2>Q16: AJAX Image Slider</h2>
                    <div class="demo-box" style="text-align:center;">
                        <asp:UpdatePanel ID="up2" runat="server">
                            <ContentTemplate>
                                <asp:Timer ID="Timer2" runat="server" Interval="1000" OnTick="Timer2_Tick"></asp:Timer>
                                <asp:Image ID="imgSlider" runat="server" Height="250px" Width="400px" style="border-radius:10px; border: 1px solid #ddd;" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </asp:View>

                <asp:View ID="v17" runat="server">
                    <h2>Q17: AJAX UpdateProgress</h2>
                    <div class="demo-box">
                        <asp:UpdatePanel ID="up3" runat="server">
                            <ContentTemplate>
                                <asp:Button ID="btnWait" runat="server" Text="Trigger 2-Second Task" OnClick="btnWait_Click" CssClass="btn btn-danger" />
                                <br /><br /><asp:Label ID="lblWaitResult" runat="server"></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <asp:UpdateProgress ID="upg1" runat="server" AssociatedUpdatePanelID="up3">
                            <ProgressTemplate>
                                <div style="background: #fff3cd; padding: 15px; border-radius: 5px; margin-top: 10px;">
                                   ⚡ Communicating with Server... Please Wait.
                                </div>
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                    </div>
                </asp:View>

                <asp:View ID="v19" runat="server">
                    <h2>Q19: List Data Binding</h2>
                    <div class="demo-box">
                        <asp:ListBox ID="lbItems" runat="server" CssClass="form-control" Height="120px"></asp:ListBox><br />
                        <asp:Button ID="btnBindList" runat="server" Text="Bind Tech Array" OnClick="btnBindList_Click" CssClass="btn btn-primary" />
                    </div>
                </asp:View>

                <asp:View ID="v20" runat="server">
                    <h2>Q20: BulletedList Binding</h2>
                    <div class="demo-box">
                        <asp:BulletedList ID="blItems" runat="server" BulletStyle="Disc" DisplayMode="Text"></asp:BulletedList>
                        <asp:Button ID="btnBindBullet" runat="server" Text="Bind Subjects" OnClick="btnBindBullet_Click" CssClass="btn btn-success" />
                    </div>
                </asp:View>

                <asp:View ID="v21" runat="server">
                    <h2>Q21: GridView XML Binding</h2>
                    <div class="demo-box">
                        <asp:GridView ID="gvXml" runat="server" CssClass="table table-bordered table-hover"></asp:GridView>
                        <br />
                        <asp:Button ID="btnBindXml" runat="server" Text="Bind from Ads.xml" OnClick="btnBindXml_Click" CssClass="btn btn-dark" />
                    </div>
                </asp:View>

            </asp:MultiView>
        </div>
    </div>
</asp:Content>
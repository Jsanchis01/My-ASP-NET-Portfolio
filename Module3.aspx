<%@ Page Title="Module 3" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Module3.aspx.cs" Inherits="MyWebResume.Module3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .dash-container { display: flex; min-height: 750px; background: white; border-radius: 15px; box-shadow: 0 5px 20px rgba(0,0,0,0.05); margin: 40px 0; overflow: hidden; border: 1px solid #eee; }
        .dash-sidebar { width: 280px; background: #1a1a2e !important; padding: 20px; overflow-y: auto; height: 750px; }
        .sidebar-title { color: #6C63FF; font-weight: bold; font-size: 1.2rem; margin-bottom: 20px; display: block; text-align: center; text-transform: uppercase; border-bottom: 1px solid #444; padding-bottom: 10px; }
        .menu-btn { display: block; width: 100%; background: #252545 !important; color: #ffffff !important; padding: 12px 15px !important; margin-bottom: 6px !important; border: 1px solid #3f3f6e !important; border-radius: 6px; text-align: left; font-size: 14px !important; cursor: pointer; transition: 0.2s; }
        .menu-btn:hover { background: #6C63FF !important; transform: translateX(5px); }
        .dash-content { flex: 1; padding: 40px; background: #fcfcfc; overflow-y: auto; height: 750px; }
        .demo-box { border: 2px dashed #ddd; padding: 25px; border-radius: 10px; background: white; margin-top: 15px; }
        .grid-view { width: 100%; border-collapse: collapse; margin-top: 15px; }
        .grid-view th { background: #6C63FF; color: white; padding: 10px; }
        .grid-view td { padding: 8px; border: 1px solid #ddd; }
    </style>

    <div class="dash-container">
        <div class="dash-sidebar">
            <span class="sidebar-title">Module 3: Database</span>
            
            <asp:Button ID="btnQ22" runat="server" Text="Q22: Connected CRUD" CssClass="menu-btn" OnClick="Menu_Click" CommandArgument="0" />
            <asp:Button ID="btnQ23" runat="server" Text="Q23: Disconnected DS" CssClass="menu-btn" OnClick="Menu_Click" CommandArgument="1" />
            <asp:Button ID="btnQ24" runat="server" Text="Q24: GridView Manage" CssClass="menu-btn" OnClick="Menu_Click" CommandArgument="2" />
            <asp:Button ID="btnQ25" runat="server" Text="Q25: Data Filtering" CssClass="menu-btn" OnClick="Menu_Click" CommandArgument="3" />
            <asp:Button ID="btnQ26" runat="server" Text="Q26: DetailsView" CssClass="menu-btn" OnClick="Menu_Click" CommandArgument="4" />
            <asp:Button ID="btnQ27" runat="server" Text="Q27: FormView" CssClass="menu-btn" OnClick="Menu_Click" CommandArgument="5" />
            <asp:Button ID="btnQ28" runat="server" Text="Q28: Repeater Cards" CssClass="menu-btn" OnClick="Menu_Click" CommandArgument="6" />
            <asp:Button ID="btnQ29" runat="server" Text="Q29: DataList Gallery" CssClass="menu-btn" OnClick="Menu_Click" CommandArgument="7" />
            <asp:Button ID="btnQ30" runat="server" Text="Q30: ListView" CssClass="menu-btn" OnClick="Menu_Click" CommandArgument="8" />
            <asp:Button ID="btnQ31" runat="server" Text="Q31: Master-Detail" CssClass="menu-btn" OnClick="Menu_Click" CommandArgument="9" />
            <asp:Button ID="btnQ32" runat="server" Text="Q32: Stored Procedure" CssClass="menu-btn" OnClick="Menu_Click" CommandArgument="10" />

            <div style="margin-top: 30px;">
                <asp:Button ID="btnExit" runat="server" Text="← Back to Projects" CssClass="menu-btn" PostBackUrl="~/Projects.aspx" style="background:rgba(255,255,255,0.1); color:white;" />
            </div>
        </div>

        <div class="dash-content">
            <asp:MultiView ID="mvMod3" runat="server" ActiveViewIndex="0">
                
                <asp:View ID="v22" runat="server">
                    <h2>Q22: Insert Student (Connected)</h2>
                    <div class="demo-box">
                        <label>Name:</label> <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                        <label>Course:</label> <asp:TextBox ID="txtCourse" runat="server" CssClass="form-control"></asp:TextBox>
                        <label>Email:</label> <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                        <br />
                        <asp:Button ID="btnInsert" runat="server" Text="Insert Record" OnClick="btnInsert_Click" CssClass="btn btn-success" />
                        <br /><br />
                        <asp:Label ID="lblStatus" runat="server" ForeColor="Green" Font-Bold="true"></asp:Label>
                    </div>
                </asp:View>

                <asp:View ID="v23" runat="server">
                    <h2>Q23: Disconnected Architecture (DataSet)</h2>
                    <div class="demo-box">
                        <p>This grid is populated using a <b>SqlDataAdapter</b> and <b>DataSet</b>.</p>
                        <asp:Button ID="btnFetchDS" runat="server" Text="Load DataSet" OnClick="btnFetchDS_Click" CssClass="btn btn-primary" />
                        <br /><br />
                        <asp:GridView ID="gvDataSet" runat="server" CssClass="grid-view"></asp:GridView>
                    </div>
                </asp:View>

                <asp:View ID="v24" runat="server">
                    <h2>Q24: GridView Management</h2>
                    <div class="demo-box">
                        <asp:GridView ID="gvManage" runat="server" DataKeyNames="Id" 
                            AutoGenerateColumns="false"
                            OnRowEditing="gvManage_RowEditing" OnRowCancelingEdit="gvManage_RowCancelingEdit"
                            OnRowUpdating="gvManage_RowUpdating" OnRowDeleting="gvManage_RowDeleting"
                            CssClass="grid-view">
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="true" />
                                <asp:BoundField DataField="Name" HeaderText="Name" />
                                <asp:BoundField DataField="Course" HeaderText="Course" />
                                <asp:BoundField DataField="Email" HeaderText="Email" />
                                <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" ButtonType="Button" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </asp:View>

                <asp:View ID="v25" runat="server">
                    <h2>Q25: Search Students</h2>
                    <div class="demo-box">
                        <div class="input-group">
                            <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" Placeholder="Enter Name..."></asp:TextBox>
                            <asp:Button ID="btnSearch" runat="server" Text="Filter Data" OnClick="btnSearch_Click" CssClass="btn btn-info" />
                        </div>
                        <br />
                        <asp:GridView ID="gvFilter" runat="server" CssClass="grid-view"></asp:GridView>
                    </div>
                </asp:View>

                <asp:View ID="v26" runat="server">
                    <h2>Q26: DetailsView (Profile Mode)</h2>
                    <div class="demo-box">
                        <asp:DetailsView ID="dvStudent" runat="server" Height="50px" Width="300px" 
                            AllowPaging="True" AutoGenerateRows="True" 
                            OnPageIndexChanging="dvStudent_PageIndexChanging"
                            CssClass="grid-view">
                            <PagerStyle BackColor="#6C63FF" ForeColor="White" HorizontalAlign="Center" />
                        </asp:DetailsView>
                    </div>
                </asp:View>

                <asp:View ID="v27" runat="server">
                    <h2>Q27: FormView (Custom Layout)</h2>
                    <div class="demo-box">
                        <asp:FormView ID="fvStudent" runat="server" AllowPaging="true" OnPageIndexChanging="fvStudent_PageIndexChanging">
                            <ItemTemplate>
                                <div style="border:1px solid #ccc; padding:15px; background:#f9f9f9; border-radius:8px; width: 300px;">
                                    <h3 style="color:#6C63FF; margin-top:0;"><%# Eval("Name") %></h3>
                                    <p><b>ID:</b> <%# Eval("Id") %></p>
                                    <p><b>Course:</b> <%# Eval("Course") %></p>
                                    <p><b>Email:</b> <%# Eval("Email") %></p>
                                </div>
                            </ItemTemplate>
                        </asp:FormView>
                    </div>
                </asp:View>

                <asp:View ID="v28" runat="server">
                    <h2>Q28: Repeater (Card Layout)</h2>
                    <div class="demo-box" style="display:flex; flex-wrap:wrap; gap:15px;">
                        <asp:Repeater ID="rptStudents" runat="server">
                            <ItemTemplate>
                                <div style="background:#fff; border:1px solid #ddd; padding:15px; width:220px; box-shadow:0 2px 5px rgba(0,0,0,0.1); border-radius: 5px;">
                                    <h4 style="margin:0 0 10px 0;"><%# Eval("Name") %></h4>
                                    <span style="background:#eee; padding:3px 8px; border-radius:4px; font-size:12px;"><%# Eval("Course") %></span>
                                    <div style="font-size:11px; color:#666; margin-top:8px;"><%# Eval("Email") %></div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </asp:View>

                <asp:View ID="v29" runat="server">
                    <h2>Q29: DataList (Gallery)</h2>
                    <div class="demo-box">
                        <asp:DataList ID="dlStudents" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" CellPadding="10">
                            <ItemTemplate>
                                <div style="background:#e3f2fd; padding:10px; border:1px solid #90caf9; text-align:center; width:180px; margin:5px;">
                                    <b><%# Eval("Name") %></b><br />
                                    <%# Eval("Course") %>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                    </div>
                </asp:View>

                <asp:View ID="v30" runat="server">
                    <h2>Q30: ListView Control</h2>
                    <div class="demo-box">
                        <asp:ListView ID="lvStudents" runat="server">
                            <LayoutTemplate>
                                <table class="grid-view">
                                    <tr style="background:#444; color:white;"><th>ID</th><th>Name</th><th>Course</th></tr>
                                    <tr runat="server" id="itemPlaceholder"></tr>
                                </table>
                            </LayoutTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("Id") %></td>
                                    <td><b><%# Eval("Name") %></b></td>
                                    <td><%# Eval("Course") %></td>
                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                    </div>
                </asp:View>

                <asp:View ID="v31" runat="server">
                    <h2>Q31: Master-Detail Relationship</h2>
                    <div class="demo-box">
                        Select Course to Filter: 
                        <asp:DropDownList ID="ddlCourses" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCourses_SelectedIndexChanged" CssClass="form-control" style="width:200px; display:inline-block;">
                            <asp:ListItem Text="Select Course..." Value="0"></asp:ListItem>
                            <asp:ListItem Text="BCA" Value="BCA"></asp:ListItem>
                            <asp:ListItem Text="MCA" Value="MCA"></asp:ListItem>
                            <asp:ListItem Text="B.Tech" Value="B.Tech"></asp:ListItem>
                            <asp:ListItem Text="MBA" Value="MBA"></asp:ListItem>
                        </asp:DropDownList>
                        <br /><br />
                        <asp:GridView ID="gvMasterDetail" runat="server" CssClass="grid-view"></asp:GridView>
                    </div>
                </asp:View>

                <asp:View ID="v32" runat="server">
                    <h2>Q32: Stored Procedure Execution</h2>
                    <div class="demo-box">
                        <asp:Button ID="btnSP" runat="server" Text="Execute 'GetStudents' Proc" OnClick="btnSP_Click" CssClass="btn btn-dark" />
                        <br /><br />
                        <asp:GridView ID="gvSP" runat="server" CssClass="grid-view"></asp:GridView>
                    </div>
                </asp:View>

            </asp:MultiView>
        </div>
    </div>
</asp:Content>
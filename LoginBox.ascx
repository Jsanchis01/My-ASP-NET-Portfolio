<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginBox.ascx.cs" Inherits="MyWebResume.LoginBox" %>
<div style="border:1px solid #ccc; padding:20px; border-radius:10px; background:#f8f9fa; width:300px;">
    <h4 style="color:#6C63FF; margin-top:0;">User Login (User Control)</h4>
    Username: <asp:TextBox ID="txtUser" runat="server" CssClass="form-control"></asp:TextBox><br />
    Password: <asp:TextBox ID="txtPass" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox><br />
    <asp:Button ID="btnLogin" runat="server" Text="Sign In" OnClick="btnLogin_Click" CssClass="btn btn-primary" />
    <br /><br />
    <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
</div>
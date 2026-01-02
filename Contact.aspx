<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="MyWebResume.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="max-width: 600px; margin: 0 auto; padding: 40px; background: white; border-radius: 10px; box-shadow: 0 5px 15px rgba(0,0,0,0.1);">
        
        <h2>Get in Touch</h2>
        
        <asp:MultiView ID="mvContact" runat="server" ActiveViewIndex="0">
            
            <asp:View ID="vForm" runat="server">
                <p>Have a question or want to work together? Drop me a message!</p>
                <br />

                <label>Your Name:</label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" style="width:100%; padding:10px; margin-bottom:10px;"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="Name is required" ForeColor="Red" Display="Dynamic" />
                
                <br /><br />

                <label>Your Email:</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" style="width:100%; padding:10px; margin-bottom:10px;"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required" ForeColor="Red" Display="Dynamic" />
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid Email Format" ForeColor="Red" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />

                <br /><br />

                <label>Message:</label>
                <asp:TextBox ID="txtMsg" runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control" style="width:100%; padding:10px; margin-bottom:10px;"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvMsg" runat="server" ControlToValidate="txtMsg" ErrorMessage="Message cannot be empty" ForeColor="Red" Display="Dynamic" />

                <br /><br />

                <asp:Button ID="btnSend" runat="server" Text="Send Message" OnClick="btnSend_Click" style="background:#6C63FF; color:white; border:none; padding:12px 30px; border-radius:5px; cursor:pointer; font-size:16px;" />
                
                <br /><br />
                <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
            </asp:View>

            <asp:View ID="vSuccess" runat="server">
                <div style="text-align:center; padding: 40px;">
                    <h1 style="color:green; font-size: 50px;">✔</h1>
                    <h3>Message Sent!</h3>
                    <p>Thank you for reaching out. I will get back to you shortly.</p>
                    <br />
                    <asp:Button ID="btnBack" runat="server" Text="Send Another Message" OnClick="btnBack_Click" style="background:#ddd; border:none; padding:10px 20px; border-radius:5px; cursor:pointer;" />
                </div>
            </asp:View>

        </asp:MultiView>

    </div>
</asp:Content>
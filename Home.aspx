<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="MyWebResume.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="hero">
        <div>
            <asp:Image ID="Img" runat="server" src ="Images/photo.jpg" Height="150px" Width="150px"/>
            <h1>I'm John Sanchis</h1>
            <p>Full Stack Developer | ASP.NET Specialist | UI/UX Enthusiast</p>
            <br />
            <a href="Contact.aspx" style="background:white; color:#6C63FF; padding:12px 30px; text-decoration:none; border-radius:30px; font-weight:bold;">Hire Me</a>
        </div>
    </div>

    <div class="section" id="education">
        <h2 class="section-title">My Journey</h2>
        <div class="timeline">
            <div class="timeline-item">
                <h3>MCA</h3>
                <span style="color:#888;">University of Mumbai | 2025 - 2027</span>
                <p>Specializing in Web Technologies, Database Management, and Software Engineering.</p>
            </div>
            <div class="timeline-item">
                <h3>BCA (Science)</h3>
                <span style="color:#888;">MGM University | 2020 - 2023</span>
                <p>Specializing in Web Technologies, Database Management, and Software Engineering. Current CGPA: 8.5.</p>
            </div>
            <div class="timeline-item">
                <h3>Higher Secondary (Science)</h3>
                <span style="color:#888;">Maharashtra State Board | 2018 - 2020</span>
                <p>Focused on Mathematics and Computer Science basics.</p>
            </div>
        </div>
    </div>

    <div class="section" style="background:#f9f9f9;" id="services">
        <h2 class="section-title">What I Do</h2>
        <div class="service-grid">
            <div class="service-card">
                <h3>Web Development</h3>
                <p>Building responsive, dynamic websites using ASP.NET WebForms and MVC architecture.</p>
            </div>
            <div class="service-card">
                <h3>Database Design</h3>
                <p>Creating optimized schemas and stored procedures in SQL Server.</p>
            </div>
            <div class="service-card">
                <h3>UI/UX Design</h3>
                <p>Crafting intuitive interfaces with modern CSS3 animations and layouts.</p>
            </div>
        </div>
    </div>

</asp:Content>
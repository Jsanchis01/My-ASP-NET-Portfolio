<%@ Page Title="Projects" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Projects.aspx.cs" Inherits="MyWebResume.Projects" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="section">
        <h2 class="section-title">My Lab Work</h2>
        <p style="text-align:center; max-width:600px; margin:0 auto 40px auto;">
            Explore my practical assignments. Each module below opens a comprehensive interactive dashboard showcasing every question from the syllabus.
        </p>

        <div class="service-grid">
            <div class="service-card" style="border-top: 5px solid #ff7675;">
                <h3>Module 1</h3>
                <p>Intro to ASP.NET Controls<br />(Q1 - Q10.1)</p>
                <a href="Module1.aspx" class="btn" style="background:#ff7675; color:white; padding:8px 20px; text-decoration:none; border-radius:5px;">Launch Dashboard</a>
            </div>

            <div class="service-card" style="border-top: 5px solid #74b9ff;">
                <h3>Module 2</h3>
                <p>State Management & Ajax<br />(Q11 - Q22)</p>
                <a href="Module2.aspx" class="btn" style="background:#74b9ff; color:white; padding:8px 20px; text-decoration:none; border-radius:5px;">Launch Dashboard</a>
            </div>

            <div class="service-card" style="border-top: 5px solid #55efc4;">
                <h3>Module 3</h3>
                <p>ADO.NET & Entity Framework<br />(Q1 - Q12)</p>
                <a href="Module3.aspx" class="btn" style="background:#55efc4; color:white; padding:8px 20px; text-decoration:none; border-radius:5px;">Launch Dashboard</a>
            </div>

             <div class="service-card" style="border-top: 5px solid #a29bfe;">
                <h3>Module 4 & 5</h3>
                <p>Web Services & MVC<br />(Q1 - Q9)</p>
                <a href="Module45.aspx" class="btn" style="background:#a29bfe; color:white; padding:8px 20px; text-decoration:none; border-radius:5px;">Launch Dashboard</a>
            </div>
        </div>
    </div>
</asp:Content>
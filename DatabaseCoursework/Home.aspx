<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="DatabaseCoursework.Home" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="/content/bootstrap.min.css" rel="stylesheet" />
    <style>
    .no-bullets li {
        list-style: none;
    }
</style>
</head>
<body style="font-family: Verdana">
    <nav class="navbar navbar-light bg-light px-4">
        <a class="navbar-brand fw-bold " runat="server" href="~/Home.aspx" style="color: #888A8C"><span style="color: #00CB5B";><</span>ISLINGTON TECHNOLOGIES<span style="color: #00CB5B">></span></a>
        <div class="d-flex w-50 justify-content-around">
            <a href="/EmployeeHistoryMappingForm.aspx" class="btn rounded-5 nav-item nav-link px-3 py-1 text-white" style="background-color: #FF9C00">Job History</a>
            <a href="/EmployeeOfTheMonthForm.aspx" class="btn rounded-5 nav-item nav-link px-3 py-1 text-white" style="background-color: #FF9C00">Employee of the Month</a>
            <a href="/VotingRecordForm.aspx" class="btn nav-item rounded-5 nav-link px-3 py-1 text-white" style="background-color: #FF9C00">Voting Record</a>
            <a class="btn rounded-5 text-white" style="background-color: #2ECC71" href="CC6001NI - Advanced Database Systems Development Y22 Autumn (Main Sit) - CW QP.pdf">User Manual</a>
        </div>
    </nav>
    <nav class="navbar navbar-expand-lg navbar-light bg-light w-100" >
        <div id="navbarNavAltMarkup" class="w-100">
            <div class="navbar-nav d-flex justify-content-around w-100" style="background-color: #102B7B">
                <a runat="server" class="nav-item nav-link text-light" href="~/Home.aspx">Home</a>
                <a runat="server" class="nav-item nav-link text-light" href="~/Employee.aspx">Employee</a>
                <a runat="server" class="nav-item nav-link text-light" href="~/Department.aspx">Department</a>
                <a runat="server" class="nav-item nav-link text-light" href="~/Job.aspx">Job</a>
                <a runat="server" class="nav-item nav-link text-light" href="~/Role.aspx">Role</a>
                <a runat="server" class="nav-item nav-link text-light" href="~/Address.aspx">Address</a>
            </div>
        </div>
    </nav>
    <form id="form1" runat="server">
        <div class="d-flex justify-content-evenly my-5">
            <div class="text-light w-25 d-flex flex-column align-items-center py-4 rounded-3" style="background-color: #01D3A2; font-size: xx-large">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT COUNT(*) FROM department"></asp:SqlDataSource>
                <asp:BulletedList  ID="BulletedList1" runat="server" DataSourceID="Departments" DataTextField="COUNT(*)" DataValueField="COUNT(*)" CssClass="no-bullets">
                </asp:BulletedList>
                <asp:SqlDataSource ID="Departments" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT COUNT(*) FROM department"></asp:SqlDataSource>
                <p>Departments</p>
                <a href="Department.aspx" class="btn bg-light" style="font-size: large; color: #01D3A2;">View Details</a>
            </div>
            <div class="text-light w-25 d-flex flex-column align-items-center py-4 rounded-3" style="background-color: #73a6fa; font-size: xx-large">
                <asp:BulletedList ID="BulletedList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="COUNT(*)" DataValueField="COUNT(*)" CssClass="no-bullets"></asp:BulletedList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT COUNT(*) FROM employee"></asp:SqlDataSource>
                <p>Employees</p>
                <a href="Employee.aspx" class="btn bg-light" style="font-size: large; color: #73a6fa;">View Details</a>
            </div>
            <div class="text-light w-25 d-flex flex-column align-items-center py-4 rounded-3" style="background-color: #C93847; font-size: xx-large">
                <asp:BulletedList ID="BulletedList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="COUNT(*)" DataValueField="COUNT(*)" CssClass="no-bullets"></asp:BulletedList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT COUNT(*) FROM role"></asp:SqlDataSource>
                <p>Roles</p>
                <a href="Role.aspx" class="btn bg-light" style="font-size: large; color: #C93847;">View Details</a>
            </div>
        </div >
        <div class="d-flex justify-content-evenly">
            <div class="text-light w-25 d-flex flex-column align-items-center py-4 rounded-3" style="background-color: #FF8CA6; font-size: xx-large">
                <asp:BulletedList ID="BulletedList4" runat="server" DataSourceID="SqlDataSource4" DataTextField="COUNT(*)" DataValueField="COUNT(*)" CssClass="no-bullets"></asp:BulletedList>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand=" SELECT COUNT(*) FROM job"></asp:SqlDataSource>
                <p>Jobs</p>
                <a href="Job.aspx" class="btn bg-light" style="font-size: large; color: #FF8CA6;">View Details</a>
            </div>
            <div class="text-light w-25 d-flex flex-column align-items-center py-4 rounded-3" style="background-color: #FCC491; font-size: xx-large">
                <asp:BulletedList ID="BulletedList5" runat="server" DataSourceID="SqlDataSource5" DataTextField="COUNT(*)" DataValueField="COUNT(*)" CssClass="no-bullets"></asp:BulletedList>
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT COUNT(*) FROM address"></asp:SqlDataSource>
                <p>Addresses</p>
                <a href="Address.aspx" class="btn bg-light" style="font-size: large; color: #FCC491;">View Details</a>
            </div>
        </div>
        <div>
        </div>
    </form>
    <div class="d-flex flex-column align-items-center mt-5 bg-light py-5">
        <p class="fw-bold" style="font-size:large">DATA VISUALIZATION</p>
        <p>Number of employees in each department</p>
        <asp:Chart runat="server" DataSourceID="SqlDataSource6">
            <Series>
                <asp:Series Name="Series1" ChartType="Bar" XValueMember="Department Name" YValueMembers="No. of Employees"></asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT d.DEPARTMENT_NAME as &quot;Department Name&quot;, COUNT(*) as &quot;No. of Employees&quot; FROM EMPLOYEE e JOIN DEPARTMENT d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID GROUP BY d.DEPARTMENT_NAME, e.DEPARTMENT_ID"></asp:SqlDataSource>
    </div>
    </body>
</html>

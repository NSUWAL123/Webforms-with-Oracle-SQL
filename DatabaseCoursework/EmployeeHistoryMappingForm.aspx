<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeHistoryMappingForm.aspx.cs" Inherits="DatabaseCoursework.EmployeeHistoryMappingForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="/content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <nav class="navbar navbar-light bg-light px-4">
        <a class="navbar-brand fw-bold " runat="server" href="~/Home.aspx" style="color: #888A8C"><span style="color: #00CB5B";><</span>ISLINGTON TECHNOLOGIES<span style="color: #00CB5B">></span></a>
        <div class="d-flex w-50 justify-content-around">
            <a href="/EmployeeHistoryMappingForm.aspx" class="btn rounded-5 nav-item nav-link px-3 py-1 text-white" style="background-color: #FF9C00">Job History</a>
            <a href="/EmployeeOfTheMonthForm.aspx" class="btn rounded-5 nav-item nav-link px-3 py-1 text-white" style="background-color: #FF9C00">Employee of the Month</a>
            <a href="/VotingRecordForm.aspx" class="btn rounded-5 nav-item nav-link px-3 py-1 text-white" style="background-color: #FF9C00">Voting Record</a>
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
        <div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT 
          e.sn,
          e.employee_name,
          d.department_name AS previous_department,
          j.job_name AS previous_job,
          r.role_name AS previous_role,
          jh.start_date AS role_start_date,
          jh.end_date AS role_end_date
        FROM 
          employee e 
          JOIN &quot;Job History&quot; jh ON e.sn = jh.sn
          JOIN department d ON jh.department_id = d.department_id 
          JOIN role r ON jh.role_id = r.role_id
          JOIN job j ON r.job_id = j.job_id
        where e.sn = :employee
        ORDER BY 
          e.sn, jh.start_date DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="employee" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;SN&quot;, &quot;EMPLOYEE_NAME&quot;, &quot;CONTACT_NUMBER&quot;, &quot;DOB&quot;, &quot;GENDER&quot;, &quot;Highest Qualification&quot; AS Highest_Qualification FROM &quot;EMPLOYEE&quot;"></asp:SqlDataSource>
        <h3 class="text-center py-3">Employee Job History</h3>
        <div class="d-flex align-items-center justify-content-center pb-4">
            <p class="fw-bold px-3">Search the record of the employee: </p>
            <asp:DropDownList class="btn btn-secondary dropdown-toggle" ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="EMPLOYEE_NAME" DataValueField="SN">
            </asp:DropDownList>
        </div>
        <asp:GridView HeaderStyle-BackColor="#2ECC71" HeaderStyle-ForeColor="White" class="table " ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="SN" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="SN" HeaderText="SN" ReadOnly="True" SortExpression="SN" />
                <asp:BoundField DataField="EMPLOYEE_NAME" HeaderText="Employee Name" SortExpression="EMPLOYEE_NAME" />
                <asp:BoundField DataField="PREVIOUS_DEPARTMENT" HeaderText="Previous Department" SortExpression="PREVIOUS_DEPARTMENT" />
                <asp:BoundField DataField="PREVIOUS_JOB" HeaderText="Previous Job" SortExpression="PREVIOUS_JOB" />
                <asp:BoundField DataField="PREVIOUS_ROLE" HeaderText="Previous Role" SortExpression="PREVIOUS_ROLE" />
                <asp:BoundField DataField="ROLE_START_DATE" HeaderText="Tenure Start" SortExpression="ROLE_START_DATE" />
                <asp:BoundField DataField="ROLE_END_DATE" HeaderText="Tenure End" SortExpression="ROLE_END_DATE" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>

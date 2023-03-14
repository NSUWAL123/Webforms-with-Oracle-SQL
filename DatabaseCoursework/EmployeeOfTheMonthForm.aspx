<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeOfTheMonthForm.aspx.cs" Inherits="DatabaseCoursework.EmployeeOfTheMonthForm" %>

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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT *
FROM (
  SELECT c.candidate_id, e.employee_name AS candidate_name, COUNT(*) AS vote_count
  FROM &quot;Voting Duration&quot; d
  JOIN candidate c ON d.candidate_id = c.candidate_id
  JOIN employee e ON c.candidate_id = e.sn
  WHERE d.voting_month = :month AND d.voting_year = :year
  GROUP BY c.candidate_id, e.employee_name
  ORDER BY vote_count DESC
)
WHERE ROWNUM &lt;= 3">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList2" Name="month" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DropDownList1" Name="year" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;VOTING_YEAR&quot;, &quot;VOTING_MONTH&quot;, &quot;CANDIDATE_ID&quot; FROM &quot;Voting Duration&quot;"></asp:SqlDataSource>
            <h3 class="text-center py-3">Voting Record</h3>
            <div class="d-flex align-items-center justify-content-center pb-4">
                <p class="fw-bold px-3">Search the record of employee: </p>
                <asp:DropDownList class="btn btn-secondary dropdown-toggle" ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="yearonly" DataTextField="VOTING_YEAR" DataValueField="VOTING_YEAR">
                </asp:DropDownList>
                <asp:SqlDataSource ID="yearonly" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT DISTINCT &quot;VOTING_YEAR&quot; FROM &quot;Voting Duration&quot;"></asp:SqlDataSource>
                <asp:DropDownList class="mx-3 btn btn-secondary dropdown-toggle" ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="monthonly" DataTextField="VOTING_MONTH" DataValueField="VOTING_MONTH">
                </asp:DropDownList>
            </div>
            <asp:SqlDataSource ID="monthonly" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT DISTINCT &quot;VOTING_MONTH&quot; FROM &quot;Voting Duration&quot;"></asp:SqlDataSource>
        </div>
        <asp:GridView HeaderStyle-BackColor="#2ECC71" HeaderStyle-ForeColor="White" class="table " ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CANDIDATE_ID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="CANDIDATE_ID" HeaderText="CANDIDATE_ID" ReadOnly="True" SortExpression="CANDIDATE_ID" />
                <asp:BoundField DataField="CANDIDATE_NAME" HeaderText="CANDIDATE_NAME" SortExpression="CANDIDATE_NAME" />
                <asp:BoundField DataField="VOTE_COUNT" HeaderText="VOTE_COUNT" SortExpression="VOTE_COUNT" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>

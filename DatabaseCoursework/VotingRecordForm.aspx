<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VotingRecordForm.aspx.cs" Inherits="DatabaseCoursework.VotingRecordForm" %>

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
            <a href="/EmployeeHistoryMappingForm.aspx" class="btn nav-item nav-link fw-bold px-3 py-1 text-white" style="background-color: #FF9C00">Job History</a>
            <a href="/EmployeeOfTheMonthForm.aspx" class="btn nav-item nav-link fw-bold px-3 py-1 text-white" style="background-color: #FF9C00">Employee of the Month</a>
            <a href="/VotingRecordForm.aspx" class="btn nav-item nav-link fw-bold px-3 py-1 text-white" style="background-color: #FF9C00">Voting Record</a>
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT 
  v.voter_id,
  v.candidate_id,
  v.voting_month,
  v.voting_year,
  e1.employee_name AS voter_name,
  e2.employee_name AS candidate_name,
  e1.contact_number AS voter_contact,
  e2.contact_number AS candidate_contact
FROM 
  &quot;Voting Duration&quot; v
  JOIN employee e1 ON v.voter_id = e1.sn
  JOIN employee e2 ON v.candidate_id = e2.sn
WHERE e1.sn = :employee
ORDER BY 
  v.voting_year DESC, v.voting_month DESC, v.voter_id ASC">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="employee" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;SN&quot;, &quot;EMPLOYEE_NAME&quot;, &quot;DOB&quot;, &quot;CONTACT_NUMBER&quot;, &quot;GENDER&quot;, &quot;SALARY&quot;, &quot;Highest Qualification&quot; AS Highest_Qualification FROM &quot;EMPLOYEE&quot;"></asp:SqlDataSource>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="EMPLOYEE_NAME" DataValueField="SN">
            </asp:DropDownList>
        </div>
        <asp:GridView class="table " ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="VOTER_ID,VOTING_MONTH,VOTING_YEAR,VOTER_CONTACT" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="VOTER_ID" HeaderText="Voter Id" ReadOnly="True" SortExpression="VOTER_ID" />
                <asp:BoundField DataField="VOTER_NAME" HeaderText="Voter Name" SortExpression="VOTER_NAME" />
                <asp:BoundField DataField="VOTER_CONTACT" HeaderText="Voter Contact" ReadOnly="True" SortExpression="VOTER_CONTACT" />
                <asp:BoundField DataField="CANDIDATE_ID" HeaderText="Candidate Id" SortExpression="CANDIDATE_ID" />
                <asp:BoundField DataField="CANDIDATE_NAME" HeaderText="Candidate Name" SortExpression="CANDIDATE_NAME" />
                <asp:BoundField DataField="CANDIDATE_CONTACT" HeaderText="Candidate Contact" SortExpression="CANDIDATE_CONTACT" />
                <asp:BoundField DataField="VOTING_YEAR" HeaderText="Voting Year" ReadOnly="True" SortExpression="VOTING_YEAR" />
                <asp:BoundField DataField="VOTING_MONTH" HeaderText="Voting Month" ReadOnly="True" SortExpression="VOTING_MONTH" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>

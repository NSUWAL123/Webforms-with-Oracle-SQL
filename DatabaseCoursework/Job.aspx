<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Job.aspx.cs" Inherits="DatabaseCoursework.Job" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="/content/bootstrap.min.css" rel="stylesheet" />
</head>
<body style="font-family: Verdana">
    <nav class="navbar navbar-light bg-light px-4">
        <a class="navbar-brand fw-bold " runat="server" href="~/Home.aspx" style="color: #888A8C"><span style="color: #00CB5B";><</span>ISLINGTON TECHNOLOGIES<span style="color: #00CB5B">></span></a>
        <div class="d-flex w-50 justify-content-around">
            <a href="/EmployeeHistoryMappingForm.aspx" class="btn nav-item nav-link rounded-5 px-3 py-1 text-white" style="background-color: #FF9C00">Job History</a>
            <a href="/EmployeeOfTheMonthForm.aspx" class="btn nav-item nav-link rounded-5 px-3 py-1 text-white" style="background-color: #FF9C00">Employee of the Month</a>
            <a href="/VotingRecordForm.aspx" class="btn nav-item nav-link rounded-5 px-3 py-1 text-white" style="background-color: #FF9C00">Voting Record</a>
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
            
            <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" class="w-100 d-flex justify-content-center">
                <InsertItemTemplate>
                    <div class="w-100 d-flex flex-column align-content-between px-5 py-3 my-3 rounded-3" style="background-color: #F5F8FC">
                        JOB_ID:
                        <asp:TextBox ID="JOB_IDTextBox" runat="server" Text='<%# Bind("JOB_ID") %>' />
                        <br />
                        JOB_NAME:
                        <asp:TextBox ID="JOB_NAMETextBox" runat="server" Text='<%# Bind("JOB_NAME") %>' />
                        <br />
                        <asp:LinkButton  class="btn btn-success" ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:LinkButton  class="btn btn-danger" ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </div>
                </InsertItemTemplate>
                <ItemTemplate>
                    &nbsp;<asp:LinkButton class="btn btn-success my-4" ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Insert" />
                </ItemTemplate>
            </asp:FormView>
            <div class="">
                <asp:GridView class="table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ControlStyle-BackColor="#FF9C00" ControlStyle-CssClass="m-2 text-light text-decoration-none px-2 py-1 rounded-3" >
<ControlStyle BackColor="#FF9C00" CssClass="m-2 text-light text-decoration-none px-2 py-1 rounded-3"></ControlStyle>
                        </asp:CommandField>
                        <asp:BoundField DataField="JOB_ID" HeaderText="Job Id" SortExpression="JOB_ID" />
                        <asp:BoundField DataField="JOB_NAME" HeaderText="Job Name" SortExpression="JOB_NAME" />
                    </Columns>
                </asp:GridView>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" DeleteCommand="DELETE FROM &quot;JOB&quot; WHERE &quot;JOB_ID&quot; = :JOB_ID" InsertCommand="INSERT INTO &quot;JOB&quot; (&quot;JOB_ID&quot;, &quot;JOB_NAME&quot;) VALUES (:JOB_ID, :JOB_NAME)" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;JOB_ID&quot;, &quot;JOB_NAME&quot; FROM &quot;JOB&quot;" UpdateCommand="UPDATE &quot;JOB&quot; SET &quot;JOB_NAME&quot; = :JOB_NAME WHERE &quot;JOB_ID&quot; = :JOB_ID">
                <DeleteParameters>
                    <asp:Parameter Name="JOB_ID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="JOB_ID" Type="String" />
                    <asp:Parameter Name="JOB_NAME" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="JOB_NAME" Type="String" />
                    <asp:Parameter Name="JOB_ID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            
        </div>
    </form>
</body>
</html>

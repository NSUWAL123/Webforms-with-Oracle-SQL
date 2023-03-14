<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Role.aspx.cs" Inherits="DatabaseCoursework.Role" %>

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
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="ROLE_ID" DataSourceID="SqlDataSource1" class="w-100 d-flex justify-content-center">
            <InsertItemTemplate>
                <div class="w-100 d-flex flex-column align-content-between px-5 py-3 my-3 rounded-3" style="background-color: #F5F8FC">
                    ROLE_ID:
                    <asp:TextBox ID="ROLE_IDTextBox" runat="server" Text='<%# Bind("ROLE_ID") %>' />
                    <br />
                    ROLE_NAME:
                    <asp:TextBox ID="ROLE_NAMETextBox" runat="server" Text='<%# Bind("ROLE_NAME") %>' />
                    <br />
                    JOB_ID:
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="Jobname" DataTextField="JOB_NAME" DataValueField="JOB_ID" SelectedValue='<%# Bind("JOB_ID") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="Jobname" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;JOB_ID&quot;, &quot;JOB_NAME&quot; FROM &quot;JOB&quot;"></asp:SqlDataSource>
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
            <asp:GridView class="table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ROLE_ID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ControlStyle-BackColor="#FF9C00" ControlStyle-CssClass="m-2 text-light text-decoration-none px-2 py-1 rounded-3" >
<ControlStyle BackColor="#FF9C00" CssClass="m-2 text-light text-decoration-none px-2 py-1 rounded-3"></ControlStyle>
                    </asp:CommandField>
                    <asp:BoundField DataField="ROLE_ID" HeaderText="Role Id" ReadOnly="True" SortExpression="ROLE_ID" />
                    <asp:BoundField DataField="ROLE_NAME" HeaderText="Role Name" SortExpression="ROLE_NAME" />
                    <asp:BoundField DataField="JOB_ID" HeaderText="Job Id" SortExpression="JOB_ID" />
                    <asp:TemplateField HeaderText="Job Name">
                        <ItemTemplate>
                            <asp:DropDownList Enabled="false" ID="DropDownList1" runat="server" DataSourceID="JobName" DataTextField="JOB_NAME" DataValueField="JOB_ID" SelectedValue='<%# Bind("JOB_ID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="JobName" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;JOB_ID&quot;, &quot;JOB_NAME&quot; FROM &quot;JOB&quot;"></asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" DeleteCommand="DELETE FROM &quot;ROLE&quot; WHERE &quot;ROLE_ID&quot; = :ROLE_ID" InsertCommand="INSERT INTO &quot;ROLE&quot; (&quot;ROLE_ID&quot;, &quot;ROLE_NAME&quot;, &quot;JOB_ID&quot;) VALUES (:ROLE_ID, :ROLE_NAME, :JOB_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;ROLE_ID&quot;, &quot;ROLE_NAME&quot;, &quot;JOB_ID&quot; FROM &quot;ROLE&quot;" UpdateCommand="UPDATE &quot;ROLE&quot; SET &quot;ROLE_NAME&quot; = :ROLE_NAME, &quot;JOB_ID&quot; = :JOB_ID WHERE &quot;ROLE_ID&quot; = :ROLE_ID">
            <DeleteParameters>
                <asp:Parameter Name="ROLE_ID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ROLE_ID" Type="String" />
                <asp:Parameter Name="ROLE_NAME" Type="String" />
                <asp:Parameter Name="JOB_ID" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ROLE_NAME" Type="String" />
                <asp:Parameter Name="JOB_ID" Type="String" />
                <asp:Parameter Name="ROLE_ID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <div>
            
        </div>
    </form>
</body>
</html>

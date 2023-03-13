<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Department.aspx.cs" Inherits="DatabaseCoursework.Department" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="/content/bootstrap.min.css" rel="stylesheet" />
</head>
<body style="font-family: Verdana">
    <nav class="navbar navbar-light bg-light px-4">
        <a class="navbar-brand fw-bold " runat="server" href="~/Home.aspx" style="color: #888A8C"><span style="color: #00CB5B";><</span>ISLINGTON TECHNOLOGIES<span style="color: #00CB5B">></span></a>
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
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="DEPARTMENT_ID" DataSourceID="SqlDataSource1" class="w-100 d-flex justify-content-center">
            <InsertItemTemplate>
                <div class="w-100 d-flex flex-column align-content-between px-5 py-3 my-3 rounded-3" style="background-color: #F5F8FC">
                DEPARTMENT_ID:
                <asp:TextBox ID="DEPARTMENT_IDTextBox" runat="server" Text='<%# Bind("DEPARTMENT_ID") %>' />
                <br />
                DEPARTMENT_NAME:
                <asp:TextBox ID="DEPARTMENT_NAMETextBox" runat="server" Text='<%# Bind("DEPARTMENT_NAME") %>' />
                <br />
                DEPARTMENT_CONTACT:
                <asp:TextBox ID="DEPARTMENT_CONTACTTextBox" runat="server" Text='<%# Bind("DEPARTMENT_CONTACT") %>' />
                <br />
                <asp:LinkButton  class="btn btn-success" ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton  class="btn btn-danger" ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            <div />
            </InsertItemTemplate>
            <ItemTemplate>
                &nbsp;<asp:LinkButton class="btn btn-success my-4" ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Insert" />
            </ItemTemplate>
        </asp:FormView>
        <div class="d-flex w-100 justify-content-center">
            <asp:GridView class="table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="DEPARTMENT_ID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ControlStyle-BackColor="#FF9C00" ControlStyle-CssClass="m-2 text-light text-decoration-none px-2 py-1 rounded-3"/>
                    <asp:BoundField DataField="DEPARTMENT_ID" HeaderText="Id" ReadOnly="True" SortExpression="DEPARTMENT_ID" />
                    <asp:BoundField DataField="DEPARTMENT_NAME" HeaderText="Department Name" SortExpression="DEPARTMENT_NAME" />
                    <asp:BoundField DataField="DEPARTMENT_CONTACT" HeaderText="Contact" SortExpression="DEPARTMENT_CONTACT" />
                </Columns>
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" DeleteCommand="DELETE FROM &quot;DEPARTMENT&quot; WHERE &quot;DEPARTMENT_ID&quot; = :DEPARTMENT_ID" InsertCommand="INSERT INTO &quot;DEPARTMENT&quot; (&quot;DEPARTMENT_ID&quot;, &quot;DEPARTMENT_NAME&quot;, &quot;DEPARTMENT_CONTACT&quot;) VALUES (:DEPARTMENT_ID, :DEPARTMENT_NAME, :DEPARTMENT_CONTACT)" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;DEPARTMENT_ID&quot;, &quot;DEPARTMENT_NAME&quot;, &quot;DEPARTMENT_CONTACT&quot; FROM &quot;DEPARTMENT&quot;" UpdateCommand="UPDATE &quot;DEPARTMENT&quot; SET &quot;DEPARTMENT_NAME&quot; = :DEPARTMENT_NAME, &quot;DEPARTMENT_CONTACT&quot; = :DEPARTMENT_CONTACT WHERE &quot;DEPARTMENT_ID&quot; = :DEPARTMENT_ID">
            <DeleteParameters>
                <asp:Parameter Name="DEPARTMENT_ID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="DEPARTMENT_ID" Type="String" />
                <asp:Parameter Name="DEPARTMENT_NAME" Type="String" />
                <asp:Parameter Name="DEPARTMENT_CONTACT" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="DEPARTMENT_NAME" Type="String" />
                <asp:Parameter Name="DEPARTMENT_CONTACT" Type="Decimal" />
                <asp:Parameter Name="DEPARTMENT_ID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <div>      
        </div>
    </form>
</body>
</html>

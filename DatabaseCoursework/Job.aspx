<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Job.aspx.cs" Inherits="DatabaseCoursework.Job" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="/content/bootstrap.min.css" rel="stylesheet" />
</head>
<body style="font-family: Verdana">
    <nav class="navbar navbar-light bg-light px-4">
        <a class="navbar-brand fw-bold " runat="server" href="~/Home.aspx" style="color: #888A8C"><span style="color: #00CB5B";><</span>TECHNOLOGIES<span style="color: #00CB5B">></span></a>
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
            
            <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1">
                <EditItemTemplate>
                    JOB_ID:
                    <asp:TextBox ID="JOB_IDTextBox" runat="server" Text='<%# Bind("JOB_ID") %>' />
                    <br />
                    JOB_NAME:
                    <asp:TextBox ID="JOB_NAMETextBox" runat="server" Text='<%# Bind("JOB_NAME") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    JOB_ID:
                    <asp:TextBox ID="JOB_IDTextBox" runat="server" Text='<%# Bind("JOB_ID") %>' />
                    <br />
                    JOB_NAME:
                    <asp:TextBox ID="JOB_NAMETextBox" runat="server" Text='<%# Bind("JOB_NAME") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    JOB_ID:
                    <asp:Label ID="JOB_IDLabel" runat="server" Text='<%# Bind("JOB_ID") %>' />
                    <br />
                    JOB_NAME:
                    <asp:Label ID="JOB_NAMELabel" runat="server" Text='<%# Bind("JOB_NAME") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:FormView>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="JOB_ID" HeaderText="JOB_ID" SortExpression="JOB_ID" />
                    <asp:BoundField DataField="JOB_NAME" HeaderText="JOB_NAME" SortExpression="JOB_NAME" />
                </Columns>
            </asp:GridView>
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

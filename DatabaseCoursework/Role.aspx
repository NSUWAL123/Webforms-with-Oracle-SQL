<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Role.aspx.cs" Inherits="DatabaseCoursework.Role" %>

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
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="ROLE_ID" DataSourceID="SqlDataSource1">
            <EditItemTemplate>
                ROLE_ID:
                <asp:Label ID="ROLE_IDLabel1" runat="server" Text='<%# Eval("ROLE_ID") %>' />
                <br />
                ROLE_NAME:
                <asp:TextBox ID="ROLE_NAMETextBox" runat="server" Text='<%# Bind("ROLE_NAME") %>' />
                <br />
                JOB_ID:
                <asp:TextBox ID="JOB_IDTextBox" runat="server" Text='<%# Bind("JOB_ID") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                ROLE_ID:
                <asp:TextBox ID="ROLE_IDTextBox" runat="server" Text='<%# Bind("ROLE_ID") %>' />
                <br />
                ROLE_NAME:
                <asp:TextBox ID="ROLE_NAMETextBox" runat="server" Text='<%# Bind("ROLE_NAME") %>' />
                <br />
                JOB_ID:
                <asp:TextBox ID="JOB_IDTextBox" runat="server" Text='<%# Bind("JOB_ID") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                ROLE_ID:
                <asp:Label ID="ROLE_IDLabel" runat="server" Text='<%# Eval("ROLE_ID") %>' />
                <br />
                ROLE_NAME:
                <asp:Label ID="ROLE_NAMELabel" runat="server" Text='<%# Bind("ROLE_NAME") %>' />
                <br />
                JOB_ID:
                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="JOB_NAME" DataValueField="JOB_ID" SelectedValue='<%# Bind("JOB_ID") %>'>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;JOB_ID&quot;, &quot;JOB_NAME&quot; FROM &quot;JOB&quot;"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
        </asp:FormView>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ROLE_ID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="ROLE_ID" HeaderText="ROLE_ID" ReadOnly="True" SortExpression="ROLE_ID" />
                <asp:BoundField DataField="ROLE_NAME" HeaderText="ROLE_NAME" SortExpression="ROLE_NAME" />
                <asp:BoundField DataField="JOB_ID" HeaderText="JOB_ID" SortExpression="JOB_ID" />
                <asp:TemplateField HeaderText="Job Name">
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="JobName" DataTextField="JOB_NAME" DataValueField="JOB_ID" SelectedValue='<%# Bind("JOB_ID") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="JobName" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;JOB_ID&quot;, &quot;JOB_NAME&quot; FROM &quot;JOB&quot;"></asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
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

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Address.aspx.cs" Inherits="DatabaseCoursework.Address" %>

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
            
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="ADDRESS_ID" DataSourceID="SqlDataSource1" class="w-100 d-flex justify-content-center">
                <InsertItemTemplate>
                    ADDRESS_ID:
                    <asp:TextBox ID="ADDRESS_IDTextBox" runat="server" Text='<%# Bind("ADDRESS_ID") %>' />
                    <br />
                    COUNTRY:
                    <asp:TextBox ID="COUNTRYTextBox" runat="server" Text='<%# Bind("COUNTRY") %>' />
                    <br />
                    PROVINCE:
                    <asp:TextBox ID="PROVINCETextBox" runat="server" Text='<%# Bind("PROVINCE") %>' />
                    <br />
                    CITY:
                    <asp:TextBox ID="CITYTextBox" runat="server" Text='<%# Bind("CITY") %>' />
                    <br />
                    AREA:
                    <asp:TextBox ID="AREATextBox" runat="server" Text='<%# Bind("AREA") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    &nbsp;<asp:LinkButton class="btn btn-success my-4" ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Insert" />
                </ItemTemplate>
            </asp:FormView>
            <div class="d-flex w-100 justify-content-center">
                <asp:GridView class="table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ADDRESS_ID" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="ADDRESS_ID" HeaderText="ADDRESS_ID" ReadOnly="True" SortExpression="ADDRESS_ID" />
                        <asp:BoundField DataField="COUNTRY" HeaderText="COUNTRY" SortExpression="COUNTRY" />
                        <asp:BoundField DataField="PROVINCE" HeaderText="PROVINCE" SortExpression="PROVINCE" />
                        <asp:BoundField DataField="CITY" HeaderText="CITY" SortExpression="CITY" />
                        <asp:BoundField DataField="AREA" HeaderText="AREA" SortExpression="AREA" />
                    </Columns>
                </asp:GridView>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" DeleteCommand="DELETE FROM &quot;ADDRESS&quot; WHERE &quot;ADDRESS_ID&quot; = :ADDRESS_ID" InsertCommand="INSERT INTO &quot;ADDRESS&quot; (&quot;ADDRESS_ID&quot;, &quot;COUNTRY&quot;, &quot;PROVINCE&quot;, &quot;CITY&quot;, &quot;AREA&quot;) VALUES (:ADDRESS_ID, :COUNTRY, :PROVINCE, :CITY, :AREA)" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;ADDRESS_ID&quot;, &quot;COUNTRY&quot;, &quot;PROVINCE&quot;, &quot;CITY&quot;, &quot;AREA&quot; FROM &quot;ADDRESS&quot;" UpdateCommand="UPDATE &quot;ADDRESS&quot; SET &quot;COUNTRY&quot; = :COUNTRY, &quot;PROVINCE&quot; = :PROVINCE, &quot;CITY&quot; = :CITY, &quot;AREA&quot; = :AREA WHERE &quot;ADDRESS_ID&quot; = :ADDRESS_ID">
                <DeleteParameters>
                    <asp:Parameter Name="ADDRESS_ID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ADDRESS_ID" Type="String" />
                    <asp:Parameter Name="COUNTRY" Type="String" />
                    <asp:Parameter Name="PROVINCE" Type="String" />
                    <asp:Parameter Name="CITY" Type="String" />
                    <asp:Parameter Name="AREA" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="COUNTRY" Type="String" />
                    <asp:Parameter Name="PROVINCE" Type="String" />
                    <asp:Parameter Name="CITY" Type="String" />
                    <asp:Parameter Name="AREA" Type="String" />
                    <asp:Parameter Name="ADDRESS_ID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            
        </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="DatabaseCoursework.Employee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="/content/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="SN" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="SN" HeaderText="SN" ReadOnly="True" SortExpression="SN" />
                <asp:BoundField DataField="EMPLOYEE_NAME" HeaderText="EMPLOYEE_NAME" SortExpression="EMPLOYEE_NAME" />
                <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                <asp:BoundField DataField="CONTACT_NUMBER" HeaderText="CONTACT_NUMBER" SortExpression="CONTACT_NUMBER" />
                <asp:BoundField DataField="ROLE_ID" HeaderText="ROLE_ID" SortExpression="ROLE_ID" />
                <asp:BoundField DataField="DEPARTMENT_ID" HeaderText="DEPARTMENT_ID" SortExpression="DEPARTMENT_ID" />
                <asp:BoundField DataField="GENDER" HeaderText="GENDER" SortExpression="GENDER" />
                <asp:BoundField DataField="SALARY" HeaderText="SALARY" SortExpression="SALARY" />
                <asp:BoundField DataField="HIGHEST_QUALIFICATION" HeaderText="HIGHEST_QUALIFICATION" SortExpression="HIGHEST_QUALIFICATION" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" DeleteCommand="DELETE FROM &quot;EMPLOYEE&quot; WHERE &quot;SN&quot; = :SN" InsertCommand="INSERT INTO &quot;EMPLOYEE&quot; (&quot;SN&quot;, &quot;EMPLOYEE_NAME&quot;, &quot;CONTACT_NUMBER&quot;, &quot;DOB&quot;, &quot;ROLE_ID&quot;, &quot;DEPARTMENT_ID&quot;, &quot;GENDER&quot;, &quot;SALARY&quot;, &quot;Highest Qualification&quot;) VALUES (:SN, :EMPLOYEE_NAME, :CONTACT_NUMBER, :DOB, :ROLE_ID, :DEPARTMENT_ID, :GENDER, :SALARY, :Highest_Qualification)" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;SN&quot;, &quot;EMPLOYEE_NAME&quot;, &quot;CONTACT_NUMBER&quot;, &quot;DOB&quot;, &quot;ROLE_ID&quot;, &quot;DEPARTMENT_ID&quot;, &quot;GENDER&quot;, &quot;SALARY&quot;, &quot;Highest Qualification&quot; AS Highest_Qualification FROM &quot;EMPLOYEE&quot;" UpdateCommand="UPDATE &quot;EMPLOYEE&quot; SET &quot;EMPLOYEE_NAME&quot; = :EMPLOYEE_NAME, &quot;CONTACT_NUMBER&quot; = :CONTACT_NUMBER, &quot;DOB&quot; = :DOB, &quot;ROLE_ID&quot; = :ROLE_ID, &quot;DEPARTMENT_ID&quot; = :DEPARTMENT_ID, &quot;GENDER&quot; = :GENDER, &quot;SALARY&quot; = :SALARY, &quot;Highest Qualification&quot; = :Highest_Qualification WHERE &quot;SN&quot; = :SN" OnSelecting="SqlDataSource1_Selecting">
            <DeleteParameters>
                <asp:Parameter Name="SN" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="SN" Type="String" />
                <asp:Parameter Name="EMPLOYEE_NAME" Type="String" />
                <asp:Parameter Name="CONTACT_NUMBER" Type="Decimal" />
                <asp:Parameter Name="DOB" Type="DateTime" />
                <asp:Parameter Name="ROLE_ID" Type="String" />
                <asp:Parameter Name="DEPARTMENT_ID" Type="String" />
                <asp:Parameter Name="GENDER" Type="String" />
                <asp:Parameter Name="SALARY" Type="Decimal" />
                <asp:Parameter Name="Highest_Qualification" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="EMPLOYEE_NAME" Type="String" />
                <asp:Parameter Name="CONTACT_NUMBER" Type="Decimal" />
                <asp:Parameter Name="DOB" Type="DateTime" />
                <asp:Parameter Name="ROLE_ID" Type="String" />
                <asp:Parameter Name="DEPARTMENT_ID" Type="String" />
                <asp:Parameter Name="GENDER" Type="String" />
                <asp:Parameter Name="SALARY" Type="Decimal" />
                <asp:Parameter Name="Highest_Qualification" Type="String" />
                <asp:Parameter Name="SN" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="SN" DataSourceID="SqlDataSource1">
            
            <InsertItemTemplate>
                SN:
                <asp:TextBox ID="SNTextBox" runat="server" Text='<%# Bind("SN") %>' />
                <br />
                EMPLOYEE_NAME:
                <asp:TextBox ID="EMPLOYEE_NAMETextBox" runat="server" Text='<%# Bind("EMPLOYEE_NAME") %>' />
                <br />
                CONTACT_NUMBER:
                <asp:TextBox ID="CONTACT_NUMBERTextBox" runat="server" Text='<%# Bind("CONTACT_NUMBER") %>' />
                <br />
                DOB:
                <asp:TextBox ID="DOBTextBox" runat="server" Text='<%# Bind("DOB") %>' />
                <br />
                ROLE_ID:
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="ROLE_NAME" DataValueField="ROLE_ID" SelectedValue='<%# Bind("ROLE_ID") %>'>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;ROLE_ID&quot;, &quot;ROLE_NAME&quot; FROM &quot;ROLE&quot;"></asp:SqlDataSource>
                <br />
                DEPARTMENT_ID:
                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="DEPARTMENT_NAME" DataValueField="DEPARTMENT_ID" SelectedValue='<%# Bind("DEPARTMENT_ID") %>'>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;DEPARTMENT_ID&quot;, &quot;DEPARTMENT_NAME&quot; FROM &quot;DEPARTMENT&quot;"></asp:SqlDataSource>
                <br />
                GENDER:
                <asp:TextBox ID="GENDERTextBox" runat="server" Text='<%# Bind("GENDER") %>' />
                <br />
                SALARY:
                <asp:TextBox ID="SALARYTextBox" runat="server" Text='<%# Bind("SALARY") %>' />
                <br />
                HIGHEST_QUALIFICATION:
                <asp:TextBox ID="HIGHEST_QUALIFICATIONTextBox" runat="server" Text='<%# Bind("HIGHEST_QUALIFICATION") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Insert" />
            </ItemTemplate>
        </asp:FormView>
    </form>
</body>
</html>

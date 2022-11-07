<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default1.aspx.cs" Inherits="Mini_Project.Default1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up Page</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="Panel1" runat="server" GroupingText="SignUp">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">Go Back to LogIn Page</asp:HyperLink>
                <br />
                <br />
                <asp:TextBox ID="TextBox1" runat="server" Font-Size="XX-Large" placeholder="type username"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Input UserName" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="TextBox2" runat="server" Font-Size="XX-Large" placeholder="type email"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Input Email" ControlToValidate="TextBox2"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid email address" ControlToValidate="TextBox2" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"></asp:RegularExpressionValidator>
                <br />
                <asp:TextBox ID="TextBox3" runat="server" Font-Size="XX-Large" TextMode="Password" placeholder="type password"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Empty Password filed" ControlToValidate="TextBox3"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="TextBox4" runat="server" Font-Size="XX-Large" TextMode="Password" placeholder="type confirm password"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Empty Password filed" EnableViewState="True" ControlToValidate="TextBox4"></asp:RequiredFieldValidator><asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Not Match" ControlToValidate="TextBox4" ControlToCompare="TextBox3"></asp:CompareValidator>
                <br />
                <br />
                <br />
                <asp:Button ID="Button1" runat="server" Font-Size="XX-Large" Text="SignUp" OnClick="Button1_Click" />
            </asp:Panel>
        </div>
    </form>
</body>
</html>

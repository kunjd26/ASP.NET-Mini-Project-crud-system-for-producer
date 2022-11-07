<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Mini_Project.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="Panel1" runat="server" GroupingText="LogIn">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default1.aspx">Create a New Account</asp:HyperLink>
                <br />
                <br />
                <asp:TextBox ID="TextBox1" runat="server" Font-Size="XX-Large" placeholder="type username"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Invalid UserName" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="TextBox2" runat="server" Font-Size="XX-Large" TextMode="Password" placeholder="type password"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Empty Password filed" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                <br />
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Default2.aspx">Forgot Password</asp:HyperLink>
                <br />
                <br />
                <br />
                <asp:Button ID="Button1" runat="server" Text="LogIn" Font-Size="XX-Large" OnClick="Button1_Click" />
            </asp:Panel>
            <br />
        </div>
    </form>
</body>
</html>

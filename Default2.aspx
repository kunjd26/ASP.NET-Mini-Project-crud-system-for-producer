<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default2.aspx.cs" Inherits="Mini_Project.Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forgot Password Page</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="Panel1" runat="server" GroupingText="Forgot Password">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">Go Back to LogIn Page</asp:HyperLink>
                <br />
                <br />
                <asp:TextBox ID="TextBox1" runat="server" Font-Size="XX-Large" placeholder="type username"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Empty username filed" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="TextBox2" runat="server" Font-Size="XX-Large" placeholder="type email"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Empty email filed" ControlToValidate="TextBox2"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid email address" ControlToValidate="TextBox2" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"></asp:RegularExpressionValidator>
                <br />
                <br />
                <br />
                <asp:Button ID="Button1" runat="server" Font-Size="XX-Large" Text="Send OTP" OnClick="Button1_Click" />
            </asp:Panel>
            <asp:Panel ID="Panel2" runat="server" GroupingText="Forgot Password">
                <asp:TextBox ID="TextBox3" runat="server" Font-Size="XX-Large" placeholder="type otp"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Empty filed" ControlToValidate="TextBox3"></asp:RequiredFieldValidator>
                <br />
                <br />
                <br />
                <asp:Button ID="Button2" runat="server" Font-Size="XX-Large" Text="Reset" OnClick="Button2_Click" />
            </asp:Panel>
            <asp:Panel ID="Panel3" runat="server" GroupingText="Forgot Password">
                <asp:TextBox ID="TextBox4" runat="server" Font-Size="XX-Large" TextMode="Password" placeholder="type password"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Empty Password filed" ControlToValidate="TextBox3"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="TextBox5" runat="server" Font-Size="XX-Large" TextMode="Password" placeholder="type confirm password"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Empty Password filed" EnableViewState="True" ControlToValidate="TextBox5"></asp:RequiredFieldValidator><asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Not Match" ControlToValidate="TextBox5" ControlToCompare="TextBox4"></asp:CompareValidator>
                <br />
                <br />
                <br />
                <asp:Button ID="Button3" runat="server" Font-Size="XX-Large" Text="Confirm" OnClick="Button3_Click" />
            </asp:Panel>
        </div>
    </form>
</body>
</html>

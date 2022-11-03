<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Delete.aspx.cs" Inherits="Mini_Project.Delete" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>DELETE PAGE</title>
    <link rel="stylesheet" href="StyleSheet1.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server" CssClass="style1">
        <form id="form1" runat="server">
            <asp:TextBox ID="TextBox1" runat="server" TextMode="Number" placeholder="Input product Id" CssClass="onlyInput"></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Empty field!" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" Text="Search" CssClass="onlyInput" OnClick="Button2_Click" />
            <br />
            <asp:Panel ID="Panel2" runat="server" CssClass="style3">
                <table cssclass="style3">
                    <tr>
                        <td>
                            <asp:TextBox ID="TextBox2" runat="server" placeholder="type confirm to delete" CssClass="onlyInput"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="invalid" ControlToValidate="TextBox2" Type="String" ValueToCompare="confirm"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="Button1" runat="server" Text="Delete product" OnClick="Button1_Click" CssClass="onlyInput" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </form>
    </asp:Panel>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="Mini_Project.Update" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>UPDATE PAGE</title>
    <link rel="stylesheet" href="StyleSheet1.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server" CssClass="style1">
        <form id="form1" runat="server">
            <asp:TextBox ID="TextBox1" runat="server" TextMode="Number" placeholder="Input product Id" CssClass="onlyInput"></asp:TextBox><br /><asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Empty field!" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" CssClass="onlyInput" />
            <br />
            <br />
            <asp:Panel ID="Panel2" runat="server">
                <table>
                    <tr>
                        <th>Product Type: </th>
                        <td>
                            <asp:TextBox ID="TextProductType" runat="server" placeholder="Input type" CssClass="onlyInput"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Empty field!" ControlToValidate="TextProductType"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <th>Product Name: </th>
                        <td>
                            <asp:TextBox ID="TextProductName" runat="server" placeholder="Input name" CssClass="onlyInput"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Empty field!" ControlToValidate="TextProductName"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <th>Product MRP: </th>
                        <td>
                            <asp:TextBox ID="TextProductMrp" runat="server" TextMode="Number" placeholder="Input price" CssClass="onlyInput"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Empty field!" ControlToValidate="TextProductMrp"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <th>Product Manufacture Date: </th>
                        <td>
                            <asp:TextBox ID="TextProductManDate" runat="server" TextMode="Date" CssClass="onlyInput"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Empty field!" ControlToValidate="TextProductManDate"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <th>Product Expire Date: </th>
                        <td textmode="DateTime">
                            <asp:TextBox ID="TextProductExpDate" runat="server" TextMode="Date" CssClass="onlyInput"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Empty field!" ControlToValidate="TextProductExpDate"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <th>Product Image: </th>
                        <td>
                            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="onlyInput" /><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Empty field!" ControlToValidate="FileUpload1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="Button2" runat="server" Text="Update Product" OnClick="Button2_Click" CssClass="onlyInput" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </form>
    </asp:Panel>
</asp:Content>

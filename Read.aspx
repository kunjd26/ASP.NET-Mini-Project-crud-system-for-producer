<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Read.aspx.cs" Inherits="Mini_Project.Read" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>READ PAGE</title>
    <link rel="stylesheet" href="StyleSheet1.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server" CssClass="style2">
        <form id="form1" runat="server">
            <asp:Button ID="Button1" runat="server" Text="Read" OnClick="Button1_Click" CssClass="onlyInput" />
            <br />
            <asp:GridView ID="GridView1" runat="server" CellPadding="1" ForeColor="Black" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" CellSpacing="2" Font-Size="Large" Font-Bold="True">
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                <RowStyle BackColor="White" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
                <Columns>
                    <asp:BoundField DataField="product_id" HeaderText="product_id" />
                    <asp:BoundField DataField="product_type" HeaderText="product_type" />
                    <asp:BoundField DataField="product_name" HeaderText="product_name" />
                    <asp:BoundField DataField="product_mrp" HeaderText="product_mrp" />
                    <asp:BoundField DataField="product_manufacture_date" HeaderText="product_manufacture_date" />
                    <asp:BoundField DataField="product_expire_date" HeaderText="product_expire_date" />
                    <asp:TemplateField HeaderText="product_image">
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" Width="100px" ImageUrl='<%#"data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("product_image")) %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </form>
    </asp:Panel>
</asp:Content>

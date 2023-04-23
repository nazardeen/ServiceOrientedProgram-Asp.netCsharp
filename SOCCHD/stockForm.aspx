<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="stockForm.aspx.cs" Inherits="SOCCHD.stockForm" %>

<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">

    <div class="auto-style1">
            <h2 class="auto-style10"><strong style="text-align: left">Saber Silk Stock Control</h2>
            <div>
                <table class="auto-style2" style="width: 91%">
                    <tr>
                        <td class="auto-style3">Product ID</td>
                        <td style="width: 809px">
                            <asp:TextBox ID="txtID" runat="server"></asp:TextBox>
                            &nbsp;&nbsp;
                            <asp:RequiredFieldValidator ID="RFID" runat="server" ErrorMessage="ID is Must!" ControlToValidate="txtID" ForeColor="#FF3300" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">Product Name</td>
                        <td style="width: 809px">
                            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                        &nbsp;&nbsp;
                            <asp:RequiredFieldValidator ID="RFName" runat="server" ControlToValidate="txtName" Display="Dynamic" ErrorMessage="Name Should not be blank" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr valign ="top">
                        <td class="auto-style3">Product Description</td>
                        <td style="width: 809px">
                            <asp:TextBox ID="txtDes" runat="server" Height="59px" valign="top" Wrap="False"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">Categeory</td>
                        <td style="width: 809px">
                            <asp:DropDownList ID="dlCategory" runat="server" OnSelectedIndexChanged="dlCategory_SelectedIndexChanged">
                            </asp:DropDownList>
                            <strong style="text-align: left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:RequiredFieldValidator ID="RFCategory" runat="server" ControlToValidate="txtName" Display="Dynamic" ErrorMessage="Category Should not be blank" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </strong>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">Quantity</td>
                        <td style="width: 809px">
                            <asp:TextBox ID="txtQty" runat="server" TextMode="Number"></asp:TextBox>
                            <strong style="text-align: left">&nbsp;&nbsp;
                            <asp:RequiredFieldValidator ID="RFQuantity" runat="server" ControlToValidate="txtName" Display="Dynamic" ErrorMessage="Quantity Should not be blank" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </strong>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">Price</td>
                        <td style="width: 809px">
                            <asp:TextBox ID="txtPrice" runat="server" TextMode="Number"></asp:TextBox>
                            <strong style="text-align: left">&nbsp;&nbsp;
                            <asp:RequiredFieldValidator ID="RFPrice" runat="server" ControlToValidate="txtName" Display="Dynamic" ErrorMessage="Price Should not be blank" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </strong>
                        </td>
                    </tr>
                </table>
            </div>
            <table class="auto-style4">
                <tr>
                    <td class="auto-style7"></td>
                    <td class="auto-style8"></td>
                    <td class="auto-style9">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style6">
                        &nbsp;</td>
 
                </tr>
                <tr>
                    <td class="auto-style6">
                        &nbsp;</td>
                    <td class="auto-style5">
                        <strong style="text-align: left">
                        <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_CLick" Text="Add New Product" />
            </strong>
                    </td>
                    <td class="auto-style10">
                        &nbsp;</td>
                </tr>
            </strong><span style="text-align: left">
                <tr>
                    <td class="auto-style10" colspan="3">
                        <asp:Label ID="lblresult" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
            <div>
            </div>
        </div>


</span>


</asp:Content>

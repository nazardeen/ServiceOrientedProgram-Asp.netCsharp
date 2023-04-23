<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="OrderProductForm.aspx.cs" Inherits="SOCCHD.OrderProductForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Body" runat="server">
    <button onclick="myFunction()">Check Product Availability</button>
     <div ID="myDIV" margin:"2" >
        <p style="text-align: center">
            <strong>Check Product Availability</strong></p>
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            Product ID&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;<asp:TextBox ID="txtProductID" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnCheck" runat="server" OnClick="btnCheck_Click" Text="Check" />
            <strong style="text-align: left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:RequiredFieldValidator ID="RFID" runat="server" ErrorMessage="Product ID should be entered" ControlToValidate="txtProductID" ForeColor="#FF3300" Display="Dynamic" ValidationGroup="3"></asp:RequiredFieldValidator>
            &nbsp;</strong></p>
        <p>
            &nbsp;</p>
        &nbsp;<asp:GridView ID="dl2" runat="server">
        </asp:GridView>
            <br />
            <br />
            <br />
            <div style="text-align: center">
                <div style="text-align: center">
                    <strong>Search Product: Please Enter Name</strong><br />&nbsp;&nbsp;&nbsp;&nbsp; <strong style="text-align: left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                <table style="width:100%; height: 77px;">
                    <tr>
                        <td style="width: 102px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                        <td style="width: 437px"><strong style="text-align: left">
                            <asp:TextBox ID="txtName" runat="server" Width="412px"></asp:TextBox>
                            </strong></td>
                        <td style="width: 94px">
                            <asp:Button ID="btnSearchName" runat="server" OnClick="btnSearchName_Click1" Text="Search Name" Width="90px" />
                        </td>
                        <td><strong style="text-align: left">
                            <asp:RequiredFieldValidator ID="RFSearch" runat="server" ErrorMessage="Enter a name to search" ControlToValidate="txtName" ForeColor="#FF3300" Display="Dynamic" ValidationGroup="2"></asp:RequiredFieldValidator>
                            </strong></td>
                    </tr>
                    <tr>
                        <td colspan="4"><strong style="text-align: left">
                            <div style="text-align: center">
                                <asp:GridView ID="dlTable" runat="server">
                                </asp:GridView>
                            </div>
                            </strong></td>
                    </tr>
                </table>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br /></strong>
         </div>
         <br />
         <br />
        <div class="auto-style23" style="height: 469px">
            <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Make your Order</strong><br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Choose the type of fabric&nbsp;
            <asp:DropDownList ID="dlFabric" runat="server" AutoPostBack="true" OnSelectedIndexChanged="dlProducts_SelectedIndexChanged" style="height: 20px">
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp; <strong style="text-align: left">
                            <asp:RequiredFieldValidator ID="RFFabric" runat="server" ErrorMessage="Please Select Fabric" ControlToValidate="dlFabric" ForeColor="#FF3300" ValidationGroup="1"></asp:RequiredFieldValidator>
            </strong>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Products available&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="dlAvailable" runat="server" AutoPostBack="true" OnSelectedIndexChanged="dlAvailable_SelectedIndexChanged">
            </asp:DropDownList>
            &nbsp;&nbsp; <strong style="text-align: left">&nbsp;<asp:RequiredFieldValidator ID="RFProducts" runat="server" ErrorMessage="Please Select the product" ControlToValidate="dlAvailable" ForeColor="#FF3300" ValidationGroup="1"></asp:RequiredFieldValidator>
            </strong>
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Price&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<asp:DropDownList ID="dlPP" runat="server">
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Quantity Buying&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:TextBox ID="txtBuyQty" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp; <strong style="text-align: left">
                            <asp:RequiredFieldValidator ID="RFQty" runat="server" ErrorMessage="Enter Qty" ControlToValidate="txtBuyQty" ForeColor="#FF3300" ValidationGroup="1"></asp:RequiredFieldValidator>
            </strong><br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <br />
            &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnOrder" runat="server" Text="Order Now" OnClick1="btnOrder_Click1" OnClick="btnOrder_Click" />
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblOrderResult" runat="server"></asp:Label>
            <br />
            <br />
            <br />
            <asp:GridView ID="dlOrderss" runat="server">
            </asp:GridView>
            <br />
            <br />
            <br />
            <br />
        </div>
         <br />
        </div>
        <br />
        <br />
</asp:Content>

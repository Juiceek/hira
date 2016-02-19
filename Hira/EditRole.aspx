<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditRole.aspx.cs" Inherits="Hira.EditRole" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="margin-bottom:30px; margin-top:20px; margin-left:30px;">
        <img src="Content/Images/User.png" style="width:40px; height:40px;" />
        <asp:Label ID="lblMain" runat="server" Text="Undefined" CssClass="h3"></asp:Label>
    </div>
    <table class="nav-justified">
        <tr>
            <td style="width: 143px; text-align: right; padding-right: 20px;">
                <asp:Label ID="Label1" runat="server" Text="Role Name:" Font-Bold="True"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtboxRoleName" runat="server" Width="179px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 143px; text-align: right; padding-right: 20px;">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 143px; text-align: right; padding-right: 20px;">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 143px; text-align: right; padding-right: 20px;">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 143px; text-align: right; padding-right: 20px;">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 143px; text-align: right; padding-right: 20px;">&nbsp;</td>
            <td>
                
            </td>
        </tr>
    </table>
    <asp:Button ID="btnSave" runat="server" Text="Save" Width="117px" />
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditUser.aspx.cs" Inherits="Hira.EditUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="margin-bottom:30px; margin-top:20px; margin-left:30px;">
        <img src="Content/Images/User.png" style="width:40px; height:40px;" />
        <asp:Label ID="lblMain" runat="server" Text="Undefined" CssClass="h3"></asp:Label>
        <asp:ValidationSummary runat="server" ShowModelStateErrors="true" CssClass="text-danger" Height="40px" ShowMessageBox="True" />
    </div>
    <table class="nav-justified">
        <tr>
            <td style="width: 207px; text-align: right; padding-right: 20px;">
                <asp:Label ID="Label1" runat="server" Text="Username:" Font-Bold="True"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtboxUsername" runat="server" Width="179px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 207px; text-align: right; padding-right: 20px;">
                <asp:Label ID="Label2" runat="server" Text="Email:" Font-Bold="True"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtboxEmail" runat="server" Width="180px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 207px; text-align: right; padding-right: 20px;">
                <asp:Label ID="Label3" runat="server" Text="Email confirmed:" Font-Bold="True"></asp:Label>
            </td>
            <td>
                <asp:CheckBox ID="checkboxEmailConfirmed" runat="server" />
            </td>
        </tr>
        <tr>
            <td style="width: 207px; text-align: right; padding-right: 20px;">
                <asp:Label ID="Label4" runat="server" Text="Phone Number:" Font-Bold="True"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtboxPhoneNumber" runat="server" Width="179px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 207px; text-align: right; padding-right: 20px;">
                <asp:Label ID="Label5" runat="server" Text="Phone Number confirmed:" Font-Bold="True"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 207px; text-align: right; padding-right: 20px;">
                <asp:Label ID="Label6" runat="server" Text="Two Factor enabled:" Font-Bold="True"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 207px; text-align: right; padding-right: 20px;">&nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 207px; text-align: right; padding-right: 20px;">
                <asp:Label ID="Label7" runat="server" Text="New password:" Font-Bold="True"></asp:Label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtboxNewPassword" TextMode="Password" Width="178px" Enabled="False"/>
            </td>
        </tr>
        <tr>
            <td style="width: 207px; text-align: right; padding-right: 20px;">
                <asp:Label ID="Label8" runat="server" Text="Confirm new password:" Font-Bold="True"></asp:Label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtboxConfirmNewPassword" TextMode="Password" Width="177px" Enabled="False"/>
            </td>
        </tr>
        <tr>
            <td style="width: 207px; text-align: right; padding-right: 20px;">&nbsp;</td>
            <td>
                <asp:CheckBox ID="checkboxChangePassword" runat="server" Text="Change password" AutoPostBack="True" OnCheckedChanged="checkboxChangePassword_CheckedChanged" Font-Bold="False" />
            </td>
        </tr>
        </table>
    <asp:LinkButton ID="btnSave" runat="server" CssClass="btn btn-default" style="display:block; background-color:#D7EBFF; margin:15px 0px 0px 15px;" Height="30px" OnClick="btnSave_Click" Width="175px"> <img src="Content/Images/Save.png" style="width:20px; height:20px;"/> Save </asp:LinkButton>
    </asp:Content>

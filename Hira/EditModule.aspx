<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditModule.aspx.cs" Inherits="Hira.EditModule" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="margin-bottom:30px; margin-top:20px; margin-left:30px;">
        <img src="Content/Images/Module.png" style="width:40px; height:40px;" />
        <asp:Label ID="lblMain" runat="server" Text="Undefined" CssClass="h3"></asp:Label>
        <asp:ValidationSummary runat="server" ShowModelStateErrors="true" CssClass="text-danger" Height="40px"/>
    </div>
    <table class="nav-justified">
        <tr>
            <td style="width: 143px; text-align: right; padding-right: 20px;">
                <asp:Label ID="Label1" runat="server" Text="Module Name:" Font-Bold="True"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtboxModuleName" runat="server" Width="179px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 207px; text-align: right; padding-right: 20px; height: 22px;" colspan="2">
                &nbsp;</td>
            <td style="height: 22px">
                
            </td>
        </tr>
        <tr>
            <td style="width: 207px; text-align: right; padding-right: 20px; vertical-align: top; ">
                &nbsp;</td>
            <td style="padding-left: 20px; ">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 207px; text-align: right; padding-right: 20px; height: 22px;" colspan="2">
                &nbsp;</td>
            <td style="height: 22px">
                
            </td>
        </tr>
    </table>
    <asp:LinkButton ID="btnSave0" runat="server" CssClass="btn btn-default" style="display:block; background-color:#D7EBFF; margin:0px 0px 0px 15px;" Height="30px" OnClick="btnSave_Click" Width="175px"> <img src="Content/Images/Save.png" style="width:20px; height:20px;"/> Save </asp:LinkButton>
    </asp:Content>

﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Roles.aspx.cs" Inherits="Hira.Roles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="margin-bottom:30px; margin-top:20px; margin-left:30px;">
        <img src="Content/Images/User.png" style="width:40px; height:40px;" />
        <asp:Label ID="lblMain" runat="server" Text="Roles Management" CssClass="h3"></asp:Label>
    </div>
        
    <asp:GridView ID="gridRoles" runat="server" AutoGenerateColumns="False" Width="299px" CssClass="table table-hover table-condensed" GridLines="Horizontal" BackColor="#F3F8F8" BorderStyle="None" ShowHeaderWhenEmpty="True" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" DataKeyNames="Id" OnRowDeleting="gridRoles_RowDeleting" OnRowEditing="gridRoles_RowEditing">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Role Name" />
        </Columns>
        <HeaderStyle BackColor="#DAE6EB" />
    </asp:GridView>
    <a href="EditRole.aspx?action=create" class="btn btn-default" style="background-color:#D7EBFF"> <img src="Content/Images/New.png" style="width:20px; height:20px;"/> Create New Role </a>
</asp:Content>

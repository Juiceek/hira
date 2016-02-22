﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="Hira.Users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script>
        $(document).ready(function () {
            jQuery("a").filter(function () {
                return this.innerHTML.indexOf("Delete") == 0;
            }).click(function () {
                return confirm("Are you sure you want to delete this item?");
            });
        });
    </script>

    <div style="margin-bottom:30px; margin-top:20px; margin-left:30px;">
        <img src="Content/Images/User.png" style="width:40px; height:40px;" />
        <asp:Label ID="lblMain" runat="server" Text="User Management" CssClass="h3"></asp:Label>
    </div>
    <div>
        <asp:PlaceHolder runat="server" ID="successMessage" Visible="false" ViewStateMode="Disabled">
            <p class="text-success"><%: SuccessMessage %></p>
        </asp:PlaceHolder>
    </div>    
    <asp:GridView ID="gridUsers" runat="server" AutoGenerateColumns="False" Width="811px" CssClass="table table-hover table-condensed" GridLines="Horizontal" BackColor="#F3F8F8" BorderStyle="None" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" DataKeyNames="Id" OnRowDeleting="gridUsers_RowDeleting" OnRowEditing="gridUsers_RowEditing">
        <Columns>
            <asp:BoundField DataField="UserName" HeaderText="Username" />
            <asp:BoundField DataField="Email" HeaderText="Email" />
            <asp:CheckBoxField DataField="EmailConfirmed" HeaderText="Email Confirmed?" />
            <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" />
            <asp:CheckBoxField DataField="PhoneNumberConfirmed" HeaderText="Phone Number confirmed?" />
            <asp:CheckBoxField DataField="TwoFactorEnabled" HeaderText="Two Factor Enabled?" />
        </Columns>
        <HeaderStyle BackColor="#DAE6EB" />
    </asp:GridView>
    <a href="EditUser.aspx?action=create" class="btn btn-default" style="background-color:#D7EBFF"> <img src="Content/Images/New.png" style="width:20px; height:20px;"/> Create New User </a>
    </asp:Content>

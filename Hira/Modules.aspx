﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Modules.aspx.cs" Inherits="Hira.Modules" %>
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
        <img src="Content/Images/Module.png" style="width:40px; height:40px;" />
        <asp:Label ID="lblMain" runat="server" Text="Modules Management" CssClass="h3"></asp:Label>
    </div>
    <div>
        <asp:PlaceHolder runat="server" ID="successMessage" Visible="false" ViewStateMode="Disabled">
            <p class="text-success"><%: SuccessMessage %></p>
        </asp:PlaceHolder>
    </div>     
    <asp:GridView ID="gridModules" runat="server" AutoGenerateColumns="False" Width="299px" CssClass="table table-hover table-condensed" GridLines="Horizontal" BackColor="#F3F8F8" BorderStyle="None" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" DataKeyNames="Id" OnRowDeleting="gridModules_RowDeleting" OnRowEditing="gridModules_RowEditing">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Module Name" />
        </Columns>
        <HeaderStyle BackColor="#DAE6EB" />
    </asp:GridView>
    <a href="EditModule.aspx?action=create" class="btn btn-default" style="background-color:#D7EBFF"> <img src="Content/Images/New.png" style="width:20px; height:20px;"/> Create New Module </a>
</asp:Content>

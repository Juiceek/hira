﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Hira.Models;
using Hira.DAL;

namespace Hira
{
    public partial class Roles : System.Web.UI.Page
    {
        protected string SuccessMessage { get; private set; }

        private void LoadGridData()
        {
            using (var dbContext = new HiraDbContext())
            {
                var roles = dbContext.Roles.ToList();
                gridRoles.DataSource = roles;
                gridRoles.DataBind();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            LoadGridData();

            var message = Request.QueryString["successMessage"];
            if (message != null)
            {
                // Strip the query string from action
                // Form.Action = ResolveUrl("~/Account/Manage");
                SuccessMessage =
                    message == "RoleCreated" ? "The role was successfully created."
                    : message == "RoleEdited" ? "The role was successfully changed."
                    : String.Empty;
                successMessage.Visible = !String.IsNullOrEmpty(SuccessMessage);
            }
        }

        protected void gridRoles_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var id = this.gridRoles.DataKeys[e.RowIndex].Value.ToString();
            using (var dbContext = new HiraDbContext())
            {
                var role = dbContext.Roles.First(u => u.Id == id);
                dbContext.Roles.Remove(role);
                dbContext.SaveChanges();
            }
            LoadGridData();
        }

        protected void gridRoles_RowEditing(object sender, GridViewEditEventArgs e)
        {
            var id = this.gridRoles.DataKeys[e.NewEditIndex].Value.ToString();
            Response.Redirect("EditRole.aspx?action=edit&RoleId="+id);
        }
    }
}
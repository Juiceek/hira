using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Hira.Models;

namespace Hira
{
    public partial class Users : System.Web.UI.Page
    {
        protected string SuccessMessage { get; private set; }

        private void LoadGridData()
        {
            using (var UsersContext = new ApplicationDbContext())
            {
                var users = UsersContext.Users.ToList();
                gridUsers.DataSource = users;
                gridUsers.DataBind();
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
                    message == "UserCreated" ? "The user was successfully created."
                    : message == "UserEdited" ? "The user was successfully changed."
                    : String.Empty;
                successMessage.Visible = !String.IsNullOrEmpty(SuccessMessage);
            }
        }

        protected void gridUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var id = this.gridUsers.DataKeys[e.RowIndex].Value.ToString();
            using (var dbContext = new ApplicationDbContext())
            {
                var user = dbContext.Users.First(u => u.Id == id);
                dbContext.Users.Remove(user);
                dbContext.SaveChanges();
            }
            LoadGridData();
        }

        protected void gridUsers_RowEditing(object sender, GridViewEditEventArgs e)
        {
            var id = this.gridUsers.DataKeys[e.NewEditIndex].Value.ToString();
            Response.Redirect("EditUser.aspx?action=edit&UserId="+id);
        }
    }
}
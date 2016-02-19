using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Hira.Models;

namespace Hira
{
    public partial class Roles : System.Web.UI.Page
    {
        private void LoadGridData()
        {
            using (var dbContext = new ApplicationDbContext())
            {
                var roles = dbContext.Roles.ToList();
                gridRoles.DataSource = roles;
                gridRoles.DataBind();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            LoadGridData();
        }

        protected void gridRoles_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var id = this.gridRoles.DataKeys[e.RowIndex].Value.ToString();
            using (var dbContext = new ApplicationDbContext())
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
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
        private void LoadGridData()
        {
            using (var UsersContext = new ApplicationDbContext())
            {
                var users = UsersContext.Users.ToList();
                GridView1.DataSource = users;
                GridView1.DataBind();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            LoadGridData();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var id = this.GridView1.DataKeys[e.RowIndex].Value.ToString();
            using (var dbContext = new ApplicationDbContext())
            {
                var user = dbContext.Users.First(u => u.Id == id);
                dbContext.Users.Remove(user);
                dbContext.SaveChanges();
            }
            LoadGridData();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            var id = this.GridView1.DataKeys[e.NewEditIndex].Value.ToString();
            Response.Redirect("EditUser.aspx?action=edit&UserId="+id);
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Hira.Models;
using Hira.DAL;

namespace Hira
{
    public partial class EditRole : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                // Save button pressed 
                if (Request.QueryString["Action"] == "edit")
                {
                    string roleId = Request.QueryString["RoleId"];
                    using (var dbContext = new HiraDbContext())
                    {
                        var role = dbContext.Roles.First(u => u.Id == roleId);

                        role.Name = txtboxRoleName.Text;

                        dbContext.SaveChanges();
                    }
                    Response.Redirect("Roles.aspx");
                }
                else if (Request.QueryString["Action"] == "create")
                {
                    var role = new AppRole();

                    role.Name = txtboxRoleName.Text;

                    using (var dbContext = new HiraDbContext())
                    {
                        dbContext.Roles.Add(role);
                        dbContext.SaveChanges();
                    }
                    Response.Redirect("Roles.aspx");
                }
                else
                    throw new Exception("got unknown action type");
            }
            else
            {
                if (Request.QueryString["Action"] == "edit")
                {
                    string roleId = Request.QueryString["RoleId"];
                    lblMain.Text = "Editing Role";
                    using (var dbContext = new HiraDbContext())
                    {
                        var role = dbContext.Roles.First(u => u.Id == roleId);

                        txtboxRoleName.Text = role.Name;
                    }
                }
                else if (Request.QueryString["Action"] == "create")
                {
                    lblMain.Text = "Creating New Role";
                }
                else
                    throw new Exception("got unknown action type");
            }

        }


    }
}
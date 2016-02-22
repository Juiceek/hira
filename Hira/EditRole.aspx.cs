using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//using Hira.Models;
using Hira.DAL;
using Hira.DAL;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.AspNet.Identity.EntityFramework;

namespace Hira
{
    public partial class EditRole : System.Web.UI.Page
    {
        private void AddErrors(IdentityResult result)
        {
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError("", error);
            }
        }

        private bool FieldsAreValid()
        {
            if (String.IsNullOrEmpty(txtboxRoleName.Text))
            {
                ModelState.AddModelError("", "The name field is required.");
            }

            return !ModelState.Values.Any();
        }


        private void LoadRoleModulesFromControl(AppRole role, HiraDbContext dbContext)
        {
            role.Modules.Clear();
            foreach (ListItem listboxItem in chkboxlistRoleModules.Items)
            {
                if (listboxItem.Selected)
                {
                    var module = dbContext.Modules.First(m => m.Id.ToString() == listboxItem.Value);
                    role.Modules.Add(module);
                }
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["Action"] == "edit")
                {
                    string roleId = Request.QueryString["RoleId"];
                    lblMain.Text = "Editing Role";
                    using (var dbContext = new HiraDbContext())
                    {
                        var role = dbContext.AppRoles.First(u => u.Id == roleId);
                        // Setting fields.
                        txtboxRoleName.Text = role.Name;
                        // Init modules list.
                        chkboxlistRoleModules.Items.Clear();
                        foreach (var module in dbContext.Modules.ToList())
                        {
                            chkboxlistRoleModules.Items.Add(
                                new ListItem()
                                {
                                    Text = module.Name,
                                    Value = module.Id.ToString(),
                                    Selected = role.Modules.Any(m => m.Id == module.Id)
                                });
                        }
                    }
                }
                else if (Request.QueryString["Action"] == "create")
                {
                    lblMain.Text = "Creating New Role";
                    // Init modules list.
                    chkboxlistRoleModules.Items.Clear();
                    using (var dbContext = new HiraDbContext())
                    {
                        foreach (var module in dbContext.Modules.ToList())
                        {
                            chkboxlistRoleModules.Items.Add(
                                new ListItem() { Text = module.Name, Value = module.Id.ToString(), Selected = false });
                        }
                    }
                }
                else
                    throw new Exception("got unknown action type");
            }

        }


        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (!this.FieldsAreValid())
                return;

            if (Request.QueryString["Action"] == "edit")
            {
                string roleId = Request.QueryString["RoleId"];
                using (var dbContext = new HiraDbContext())
                {
                    var role = dbContext.AppRoles.First(u => u.Id == roleId);
                    // Setting fields.
                    role.Name = txtboxRoleName.Text;
                    //
                    LoadRoleModulesFromControl(role, dbContext);
                    dbContext.SaveChanges();
                }
                Response.Redirect("Roles.aspx?successMessage=RoleEdited");
            }
            else if (Request.QueryString["Action"] == "create")
            {
                var role = new AppRole();
                // Setting fields.
                role.Name = txtboxRoleName.Text;
                //
                using (var dbContext = new HiraDbContext())
                {
                    LoadRoleModulesFromControl(role, dbContext);
                    dbContext.Roles.Add(role);
                    dbContext.SaveChanges();
                }
                Response.Redirect("Roles.aspx?successMessage=RoleCreated");
            }
            else
                throw new Exception("got unknown action type");
        }


    }
}
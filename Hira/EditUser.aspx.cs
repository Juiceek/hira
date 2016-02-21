using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Hira.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.AspNet.Identity.EntityFramework;

namespace Hira
{
    public partial class EditUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["Action"] == "edit")
                {
                    string userId = Request.QueryString["UserId"];
                    using (var dbContext = new ApplicationDbContext())
                    {
                        var user = dbContext.Users.First(u => u.Id == userId);
                        // Seting fields.
                        txtboxUsername.Text = user.UserName;
                        txtboxEmail.Text = user.Email;
                        checkboxEmailConfirmed.Checked = user.EmailConfirmed;
                        txtboxPhoneNumber.Text = user.PhoneNumber;
                        // Init controls.
                        lblMain.Text = "Editing User";
                        checkboxChangePassword.Checked = false;
                        txtboxNewPassword.Enabled = checkboxChangePassword.Checked;
                        txtboxConfirmNewPassword.Enabled = checkboxChangePassword.Checked;
                        // Init roles list.
                        chkboxlistUserRoles.Items.Clear();
                        foreach(var role in dbContext.Roles.ToList())
                        {
                            chkboxlistUserRoles.Items.Add(
                                new ListItem()
                                {
                                    Text = role.Name,
                                    Value = role.Id,
                                    Selected = user.Roles.Any(r => r.RoleId == role.Id)
                                });
                        }
                    }
                }
                else if (Request.QueryString["Action"] == "create")
                {
                    // Init controls.
                    lblMain.Text = "Creating New User";
                    checkboxChangePassword.Visible = false;
                    txtboxNewPassword.Enabled = true;
                    txtboxConfirmNewPassword.Enabled = true;
                    // Init roles list.
                    chkboxlistUserRoles.Items.Clear();
                    using (var dbContext = new ApplicationDbContext())
                    {
                        foreach (var role in dbContext.Roles.ToList())
                        {
                            chkboxlistUserRoles.Items.Add(
                                new ListItem() { Text = role.Name, Value = role.Id, Selected = false });
                        }
                    }
                }
                else
                    throw new Exception("got unknown action type");
            }
        }


        private void AddErrors(IdentityResult result)
        {
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError("", error);
            }
        }

        protected void checkboxChangePassword_CheckedChanged(object sender, EventArgs e)
        {
            txtboxNewPassword.Enabled = checkboxChangePassword.Checked;
            txtboxConfirmNewPassword.Enabled = checkboxChangePassword.Checked;
        }


        private bool FieldsAreValid()
        {
            if (txtboxNewPassword.Enabled)
            {
                if (String.IsNullOrEmpty(txtboxNewPassword.Text))
                    ModelState.AddModelError("", "The password field is required.");
                if (String.IsNullOrEmpty(txtboxConfirmNewPassword.Text))
                    ModelState.AddModelError("", "The password confirmation field is required.");
                if (!String.IsNullOrEmpty(txtboxNewPassword.Text)
                    &&
                    !String.IsNullOrEmpty(txtboxConfirmNewPassword.Text)
                    &&
                    txtboxNewPassword.Text != txtboxConfirmNewPassword.Text)
                {
                    ModelState.AddModelError("", "The password and confirmation password do not match.");
                }
            }
            if (String.IsNullOrEmpty(txtboxUsername.Text))
            {
                ModelState.AddModelError("", "The name field is required.");
            }
            
            return !ModelState.Values.Any();
        }


        private void LoadUserRolesFromControl(IdentityUser user, ApplicationDbContext dbContext)
        {
            user.Roles.Clear();
            foreach (ListItem listboxItem in chkboxlistUserRoles.Items)
            {
                if (listboxItem.Selected)
                {
                    var role = dbContext.Roles.First(r => r.Id == listboxItem.Value);
                    user.Roles.Add(new IdentityUserRole() { RoleId = role.Id, UserId = user.Id });
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (!this.FieldsAreValid())
                return;

            if (Request.QueryString["Action"] == "edit")
            {
                string userId = Request.QueryString["UserId"];
                using (var dbContext = new ApplicationDbContext())
                {
                    var user = dbContext.Users.First(u => u.Id == userId);
                    // Set fields.
                    user.UserName = txtboxUsername.Text;
                    user.Email = txtboxEmail.Text;
                    user.EmailConfirmed = checkboxEmailConfirmed.Checked;
                    user.PhoneNumber = txtboxPhoneNumber.Text;
                    LoadUserRolesFromControl(user, dbContext);
                    //
                    if (txtboxNewPassword.Enabled)
                    {
                        UserManager<IdentityUser> userManager = new UserManager<IdentityUser>(new UserStore<IdentityUser>());
                        var result = userManager.RemovePassword(userId);
                        result = userManager.AddPassword(userId, txtboxNewPassword.Text);
                        if (!result.Succeeded)
                        {
                            AddErrors(result);
                            return;
                        }
                    }
                    dbContext.SaveChanges();
                    Response.Redirect("Users.aspx?successMessage=UserEdited");
                }
            }
            else if (Request.QueryString["Action"] == "create")
            {
                var user = new ApplicationUser();
                user.Id = Guid.NewGuid().ToString();
                // Set fields.
                user.UserName = txtboxUsername.Text;
                user.Email = txtboxEmail.Text;
                user.EmailConfirmed = checkboxEmailConfirmed.Checked;
                user.PhoneNumber = txtboxPhoneNumber.Text;
                // 
                using (var dbContext = new ApplicationDbContext())
                {
                    dbContext.Users.Add(user);
                    LoadUserRolesFromControl(user, dbContext);
                    dbContext.SaveChanges();
                        
                    UserManager<IdentityUser> userManager = new UserManager<IdentityUser>(new UserStore<IdentityUser>());
                    var result = userManager.RemovePassword(user.Id);
                    result = userManager.AddPassword(user.Id, txtboxNewPassword.Text);
                    if (result.Succeeded)
                    {
                        Response.Redirect("Users.aspx?successMessage=UserCreated");
                    }
                    else
                    {
                        AddErrors(result);
                        // Rollback.
                        dbContext.Users.Remove(user);
                        dbContext.SaveChanges();
                        return;
                    }
                }
            }
            else
                throw new Exception("got unknown action type");
        }


    }
}
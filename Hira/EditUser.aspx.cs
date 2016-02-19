using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Hira.Models;

namespace Hira
{
    public partial class EditUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                // Save button pressed 
                if (Request.QueryString["Action"] == "edit")
                {
                    string userId = Request.QueryString["UserId"];
                    using (var dbContext = new ApplicationDbContext())
                    {
                        var user = dbContext.Users.First(u => u.Id == userId);

                        user.UserName = txtboxUsername.Text;
                        user.Email = txtboxEmail.Text;
                        user.EmailConfirmed = checkboxEmailConfirmed.Checked;
                        user.PhoneNumber = txtboxPhoneNumber.Text;

                        dbContext.SaveChanges();
                    }
                    Response.Redirect("Users.aspx");
                }
                else if (Request.QueryString["Action"] == "create")
                {
                    var user = new ApplicationUser();
                    
                    user.UserName = txtboxUsername.Text;
                    user.Email = txtboxEmail.Text;
                    user.EmailConfirmed = checkboxEmailConfirmed.Checked;
                    user.PhoneNumber = txtboxPhoneNumber.Text;

                    using (var dbContext = new ApplicationDbContext())
                    {
                        dbContext.Users.Add(user);
                        dbContext.SaveChanges();
                    }
                    Response.Redirect("Users.aspx");
                }
                else
                    throw new Exception("got unknown action type");
            }
            else
            {
                if (Request.QueryString["Action"] == "edit")
                {
                    string userId = Request.QueryString["UserId"];
                    lblMain.Text = "Editing User";
                    using (var dbContext = new ApplicationDbContext())
                    {
                        var user = dbContext.Users.First(u => u.Id == userId);

                        txtboxUsername.Text = user.UserName;
                        txtboxEmail.Text = user.Email;
                        checkboxEmailConfirmed.Checked = user.EmailConfirmed;
                        txtboxPhoneNumber.Text = user.PhoneNumber;
                    }
                }
                else if (Request.QueryString["Action"] == "create")
                {
                    lblMain.Text = "Creating New User";
                }
                else
                    throw new Exception("got unknown action type");
            }

        }


    }
}
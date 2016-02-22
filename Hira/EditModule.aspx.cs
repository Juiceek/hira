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
    public partial class EditModule : System.Web.UI.Page
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
            if (String.IsNullOrEmpty(txtboxModuleName.Text))
            {
                ModelState.AddModelError("", "The name field is required.");
            }

            return !ModelState.Values.Any();
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["Action"] == "edit")
                {
                    string moduleId = Request.QueryString["ModuleId"];
                    lblMain.Text = "Editing Module";
                    using (var dbContext = new HiraDbContext())
                    {
                        var module = dbContext.Modules.First(m => m.Id.ToString() == moduleId);

                        txtboxModuleName.Text = module.Name;
                    }
                }
                else if (Request.QueryString["Action"] == "create")
                {
                    lblMain.Text = "Creating New Module";
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
                string moduleId = Request.QueryString["ModuleId"];
                using (var dbContext = new HiraDbContext())
                {
                    var module = dbContext.Modules.First(m => m.Id.ToString() == moduleId);

                    module.Name = txtboxModuleName.Text;

                    dbContext.SaveChanges();
                }
                Response.Redirect("Modules.aspx?successMessage=ModuleEdited");
            }
            else if (Request.QueryString["Action"] == "create")
            {
                var module = new AppModule();

                module.Id = Guid.NewGuid();
                module.Name = txtboxModuleName.Text;

                using (var dbContext = new HiraDbContext())
                {
                    dbContext.Modules.Add(module);
                    dbContext.SaveChanges();
                }
                Response.Redirect("Modules.aspx?successMessage=ModuleCreated");
            }
            else
                throw new Exception("got unknown action type");
        }


    }
}
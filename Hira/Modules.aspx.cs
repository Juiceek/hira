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
    public partial class Modules : System.Web.UI.Page
    {
        protected string SuccessMessage { get; private set; }

        private void LoadGridData()
        {
            using (var dbContext = new HiraDbContext())
            {
                var modules = dbContext.Modules.ToList();
                gridModules.DataSource = modules;
                gridModules.DataBind();
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
                    message == "ModuleCreated" ? "The module was successfully created."
                    : message == "ModuleEdited" ? "The module was successfully changed."
                    : String.Empty;
                successMessage.Visible = !String.IsNullOrEmpty(SuccessMessage);
            }
        }

        protected void gridModules_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var id = this.gridModules.DataKeys[e.RowIndex].Value.ToString();
            using (var dbContext = new HiraDbContext())
            {
                var module = dbContext.Modules.First(m => m.Id.ToString() == id);
                dbContext.Modules.Remove(module);
                dbContext.SaveChanges();
            }
            LoadGridData();
        }

        protected void gridModules_RowEditing(object sender, GridViewEditEventArgs e)
        {
            var id = this.gridModules.DataKeys[e.NewEditIndex].Value.ToString();
            Response.Redirect("EditModule.aspx?action=edit&ModuleId="+id);
        }
    }
}
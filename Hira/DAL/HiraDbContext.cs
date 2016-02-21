namespace Hira.DAL
{
    using System;
    using System.Data.Entity;
    using System.Linq;

    using System.Collections.Generic;
    using System.Security.Claims;
    using System.Threading.Tasks;
    using System.Web;
    using Microsoft.AspNet.Identity;
    using Microsoft.AspNet.Identity.EntityFramework;
    using Microsoft.AspNet.Identity.Owin;
    using Microsoft.Owin.Security;



    public class HiraDbContext : IdentityDbContext<AppUser, AppRole, string, IdentityUserLogin, IdentityUserRole, IdentityUserClaim>
    {

        public HiraDbContext()
            : base("name=DefaultConnection")
        {
        }

        public static HiraDbContext Create()
        {
            return new HiraDbContext();
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            //
            modelBuilder.Entity<AppRole>()
            .HasMany(r => r.Modules)
            .WithMany( m => m.Roles)
            .Map(x =>
            {
                x.MapLeftKey("Role_Id");
                x.MapRightKey("Module_Id");
                x.ToTable("RoleModules");
            });

        }

        // Add a DbSet for each entity type that you want to include in your model. For more information 
        // on configuring and using a Code First model, see http://go.microsoft.com/fwlink/?LinkId=390109.

        public virtual DbSet<AppModule> AppModules { get; set; }
    }


    public class AppUser : IdentityUser
    {
        public ClaimsIdentity GenerateUserIdentity(ApplicationUserManager manager)
        {
            // Note the authenticationType must match the one defined in CookieAuthenticationOptions.AuthenticationType
            var userIdentity = manager.CreateIdentity(this, DefaultAuthenticationTypes.ApplicationCookie);
            // Add custom user claims here
            return userIdentity;
        }

        public Task<ClaimsIdentity> GenerateUserIdentityAsync(ApplicationUserManager manager)
        {
            return Task.FromResult(GenerateUserIdentity(manager));
        }
    }

    public class AppModule
    {
         public AppModule()
        {
            this.Roles = new List<AppRole>();
        }

        public Guid Id { get; set; }
        public string Name { get; set; }

        public virtual ICollection<AppRole> Roles { get; set; }
    }

    public class AppRole : IdentityRole
    {
        public AppRole() : base() 
        {
            this.Modules = new List<AppModule>();
        }

        public AppRole(string name) : base(name) { }

        public virtual ICollection<AppModule> Modules { get; set; }
    }
}
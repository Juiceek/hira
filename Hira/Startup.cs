using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Hira.Startup))]
namespace Hira
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}

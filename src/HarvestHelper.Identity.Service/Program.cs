using HarvestHelper.Common.Configuration;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Hosting;

namespace HarvestHelper.Identity.Service
{
    public class Program
    {
        public static void Main(string[] args)
        {
            CreateHostBuilder(args).Build().Run();
        }

        public static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
                .ConfigureAzureKeyVault()
                .ConfigureWebHostDefaults(webBuilder =>
                {
                    webBuilder.UseStartup<Startup>();
                });
    }
}

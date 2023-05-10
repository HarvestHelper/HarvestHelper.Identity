using System;
using System.IO;
using System.Reflection;
using GreenPipes;
using HarvestHelper.Common.HealthChecks;
using HarvestHelper.Common.MassTransit;
using HarvestHelper.Common.Settings;
using HarvestHelper.Identity.Service.Entities;
using HarvestHelper.Identity.Service.HostedServices;
using HarvestHelper.Identity.Service.Settings;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.HttpOverrides;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.OpenApi.Models;
using MongoDB.Bson;
using MongoDB.Bson.Serialization;
using MongoDB.Bson.Serialization.Serializers;

namespace HarvestHelper.Identity.Service
{
    public class Startup
    {
        private const string AllowedOriginSetting = "AllowedOrigin";
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            BsonSerializer.RegisterSerializer(new GuidSerializer(BsonType.String));
            var serviceSettings = Configuration.GetSection(nameof(ServiceSettings)).Get<ServiceSettings>();
            var mongoDbSettings = Configuration.GetSection(nameof(MongoDbSettings)).Get<MongoDbSettings>();
            var identityServerSettings = Configuration.GetSection(nameof(IdentityServerSettings)).Get<IdentityServerSettings>();

            services.Configure<IdentitySettings>(Configuration.GetSection(nameof(IdentitySettings)))
                .AddDefaultIdentity<ApplicationUser>()
                .AddRoles<ApplicationRole>()
                .AddMongoDbStores<ApplicationUser, ApplicationRole, Guid>
                (
                    mongoDbSettings.ConnectionString,
                    serviceSettings.ServiceName
                );

            services.AddMassTransitWithMessageBroker(Configuration, retryConfigurator =>
                    {
                        retryConfigurator.Interval(3, TimeSpan.FromSeconds(5));
                    });


            services.AddIdentityServer(options =>
            {
                options.Events.RaiseSuccessEvents = true;
                options.Events.RaiseFailureEvents = true;
                options.Events.RaiseErrorEvents = true;
                options.KeyManagement.KeyPath = Path.GetDirectoryName(Assembly.GetEntryAssembly().Location);
            })
                .AddAspNetIdentity<ApplicationUser>()
                .AddInMemoryApiScopes(identityServerSettings.ApiScopes)
                .AddInMemoryApiResources(identityServerSettings.ApiResources)
                .AddInMemoryClients(identityServerSettings.Clients)
                .AddInMemoryIdentityResources(identityServerSettings.IdentityResources)
                .AddDeveloperSigningCredential();

            services.AddLocalApiAuthentication();

            services.AddControllers();
            services.AddHostedService<IdentitySeedHostedServices>();
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "HarvestHelper.Identity.Service", Version = "v1" });
            });

            services.AddHealthChecks()
                    .AddMongoDb();

            services.Configure<ForwardedHeadersOptions>(options =>
            {
                options.ForwardedHeaders = ForwardedHeaders.XForwardedFor | ForwardedHeaders.XForwardedProto;
                options.KnownNetworks.Clear();
                options.KnownProxies.Clear();
            });
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            app.UseForwardedHeaders();

            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseSwagger();
                app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "HarvestHelper.Identity.Service v1"));

                 app.UseCors(builder =>
                {
                    builder.WithOrigins(Configuration[AllowedOriginSetting])
                        .AllowAnyHeader()
                        .AllowAnyMethod();
                });
            }

            app.UseHttpsRedirection();

            app.Use((context, next) => 
            {
                var identitySettings = Configuration.GetSection(nameof(IdentitySettings)).Get<IdentitySettings>();
                context.Request.PathBase = new Microsoft.AspNetCore.Http.PathString(identitySettings.PathBase);
                return next();
            });

            app.UseStaticFiles();

            app.UseRouting();

            app.UseIdentityServer();
            app.UseAuthorization();

            app.UseCookiePolicy(new CookiePolicyOptions
            {
                MinimumSameSitePolicy = SameSiteMode.Lax
            });

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
                endpoints.MapRazorPages();
                endpoints.MapHarvestHelperHealthChecks();
            });
        }
    }
}

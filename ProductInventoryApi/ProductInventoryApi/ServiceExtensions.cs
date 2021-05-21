using Microsoft.Extensions.DependencyInjection;
using ProductInventoryApi.Logging;

namespace ProductInventoryApi
{
    public static class ServiceExtensions
    {
        public static void ConfigureLoggerService(this IServiceCollection services)
        {
            services.AddSingleton<ILoggerManager, LoggerManager>();
        }
    }
}

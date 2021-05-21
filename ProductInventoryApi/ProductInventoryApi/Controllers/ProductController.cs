using System;
using System.Linq;
using System.Net;
using System.Text.Json;

using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Localization;

using ProductInventoryApi.Logging;
using ProductInventoryApi.Localization;
using ProductInventoryApi.Models;
using ProductInventoryApi.Models.RequestObjects;

namespace ProductInventoryApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductController : ControllerBase
    {
        private readonly ProductInventoryApi_dbContext context;
        private readonly IStringLocalizer<Resource> localizer;
        private readonly ILoggerManager logger;

        public ProductController(IStringLocalizer<Resource> localizer, ILoggerManager logger, ProductInventoryApi_dbContext context)
        {
            this.context = context;
            this.localizer = localizer;
            this.logger = logger;
        }

        /// <summary>
        /// Insert company and product data into database
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Post([FromBody] RequestProduct value)
        {
            try
            {
                InsertProduct(value);

                var responseData = new { Message = localizer["ProductInserted"].Value };
                var result = new ContentResult()
                {
                    StatusCode = (int)HttpStatusCode.OK,
                    ContentType = "application/json",
                    Content = JsonSerializer.Serialize(responseData)
                };

                return result;
            }
            catch (Exception ex)
            {
                logger.LogError(ex);
                throw;
            }
        }

        private void InsertProduct(RequestProduct value)
        {
            var company = (from c in context.Companies
                           where c.CompanyPrefix == value.CompanyPrefix
                           select c)
                           .SingleOrDefault();

            if (company == null)
            {
                // Insert company if it doesn't already exist
                company = new Company
                {
                    CompanyPrefix = value.CompanyPrefix,
                    CompanyName = value.CompanyName,
                };
                context.Companies.Add(company);
            }

            var product = (from p in context.Products
                           where p.CompanyId == company.Id && p.ItemReference == value.ItemReference
                           select p)
                           .SingleOrDefault();

            if (product == null)
            {
                // Insert product
                product = new Product
                {
                    Company = company,
                    ItemReference = value.ItemReference,
                    ProductName = value.ProductName
                };
                context.Products.Add(product);
            }
            else
                // Throw error if product already exists
                throw new InvalidOperationException(localizer["Error_ProductExists"]);

            context.SaveChanges();
        }
    }
}

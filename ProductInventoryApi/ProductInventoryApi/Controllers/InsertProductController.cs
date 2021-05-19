using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Localization;
using Microsoft.Extensions.Logging;
using ProductInventoryApi.Localize;
using ProductInventoryApi.Models;
using ProductInventoryApi.Models.PostedObjects;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace ProductInventoryApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class InsertProductController : ControllerBase
    {
        private readonly MyCompanyContext context;
        private readonly IStringLocalizer<Resource> localizer;
        private readonly ILoggerManager logger;

        public InsertProductController(IStringLocalizer<Resource> localizer, ILoggerManager logger, MyCompanyContext context)
        {
            this.context = context;
            this.localizer = localizer;
            this.logger = logger;
        }

        // POST api/<InsertProductController>
        [HttpPost]
        public ActionResult Post([FromBody] PostedProduct value)
        {
            try
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

                var responseData = new { Message = localizer["ProductInserted"].Value };
                string jsonString = JsonSerializer.Serialize(responseData);

                var result = new ContentResult()
                {
                    StatusCode = (int)HttpStatusCode.OK,
                    ContentType = "application/json",
                    Content = jsonString
                };

                return result;
            }
            catch (Exception ex)
            {
                logger.LogError(ex);
                throw;
            }
        }
    }
}

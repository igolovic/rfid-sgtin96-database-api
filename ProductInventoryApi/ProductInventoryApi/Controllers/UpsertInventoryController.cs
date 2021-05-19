using Microsoft.AspNetCore.Mvc;
using ProductInventoryApi.Models;
using ProductInventoryApi.Models.PostedObjects;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ProductInventoryApi.Sgtin;
using System.Net.Http;
using System.Net;
using System.Text;
using System.Text.Json;
using Microsoft.Extensions.Localization;
using ProductInventoryApi.Localize;

namespace ProductInventoryApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UpsertInventoryController : ControllerBase
    {
        private readonly MyCompanyContext context;
        private readonly IStringLocalizer<Resource> localizer;
        private readonly ILoggerManager logger;

        public UpsertInventoryController(IStringLocalizer<Resource> localizer, ILoggerManager logger, MyCompanyContext context)
        {
            this.context = context;
            this.localizer = localizer;
            this.logger = logger;
        }

        // POST api/<UpsertInventoryController>
        [HttpPost]
        public ActionResult Post([FromBody] PostedInventory value)
        {
            try
            {
                int countSgtinRecordsReceived = 0;
                int countSgtinRecordsParsedError = 0;
                int countProductItemsProductDefinitionInvalid = 0;
                int countProductItemsDuplicated = 0;
                int countProductItemsAddedToDatabase = 0;

                var inventoryLocation = (from il in context.InventoryLocations
                                         where il.InventoryLocationName == value.InventoryLocation
                                         select il)
                                         .SingleOrDefault();

                if (inventoryLocation == null)
                {
                    // Insert new inventory location if it doesn't exist
                    inventoryLocation = new InventoryLocation() { InventoryLocationName = value.InventoryLocation };
                    context.InventoryLocations.Add(inventoryLocation);
                }

                var inventory = (from i in context.Inventories
                                 where i.InventoryId == value.InventoryId
                                 select i)
                                 .SingleOrDefault();

                if (inventory == null)
                {
                    // Insert new inventory location if it doesn't exist
                    inventory = new Inventory() { InventoryId = value.InventoryId };
                    context.Inventories.Add(inventory);
                }


                var inventoryDateLocation = (from i in context.Inventories
                                             join idl in context.InventoryDateLocations on i.Id equals idl.InventoryId
                                             where i.InventoryId == value.InventoryId && idl.InventoryDate == value.InventoryDate && idl.InventoryLocationId == inventoryLocation.Id
                                             select idl)
                                             .SingleOrDefault();

                Func<long, long, string> makeCompanyPrefixItemReferenceIdentifier = (companyPrefix, itemReference) => $"{companyPrefix}-{itemReference}";
                Func<long, long, long, string> makeCompanyPrefixItemReferenceSerialNumberIdentifier = (companyPrefix, itemReference, serialNumber) => $"{companyPrefix}-{itemReference}-{serialNumber}";

                var companyPrefixItemReferenceIdentifiers = (from c in context.Companies
                                                             join p in context.Products on c.Id equals p.CompanyId
                                                             select new
                                                             {
                                                                 c.CompanyPrefix,
                                                                 p.ItemReference,
                                                                 Product_Id = p.Id
                                                             })
                                                             .ToList()
                                                             .Select(o => new
                                                             {
                                                                 CompanyPrefixItemReferenceIdentifier = makeCompanyPrefixItemReferenceIdentifier(o.CompanyPrefix, o.ItemReference),
                                                                 Product_Id = o.Product_Id
                                                             })
                                                             .ToDictionary(k => k.CompanyPrefixItemReferenceIdentifier, v => v.Product_Id);

                var companyPrefixItemReferenceSerialNumberIdentifiers = new HashSet<string>();
                List<string> errorSgtinItems = new List<string>();
                Func<string, string, string> errorFormatter = (sgtin, message) => $"{sgtin} - {message}";

                if (inventoryDateLocation == null)
                {
                    // Insert new inventory-date-location and product items
                    inventoryDateLocation = new InventoryDateLocation()
                    {
                        Inventory = inventory,
                        InventoryDate = value.InventoryDate,
                        InventoryLocation = inventoryLocation
                    };

                    countSgtinRecordsReceived = value.SgtinItems.Count();
                    foreach (var sgtinItem in value.SgtinItems)
                    {
                        if (sgtinItem.TryParseSgtin96Item(out EnumHeader header, out EnumFilter filter, out EnumPartition partition, out long companyPrefix, out long itemReference, out long serialNumber, out string errorMessage))
                        {
                            // Check if company owns product
                            var companyPrefixItemReferenceIdentifier = makeCompanyPrefixItemReferenceIdentifier(companyPrefix, itemReference);
                            if (companyPrefixItemReferenceIdentifiers.ContainsKey(companyPrefixItemReferenceIdentifier))
                            {
                                // Check if product item is duplicated in this SGTIN list
                                var uniqueIdentifier = makeCompanyPrefixItemReferenceSerialNumberIdentifier(companyPrefix, itemReference, serialNumber);
                                if (companyPrefixItemReferenceSerialNumberIdentifiers.Contains(uniqueIdentifier) == false)
                                {
                                    // Add product item to cache and database
                                    companyPrefixItemReferenceSerialNumberIdentifiers.Add(uniqueIdentifier);

                                    var productItem = new ProductItem()
                                    {
                                        InventoryDateLocation = inventoryDateLocation,
                                        ProductId = companyPrefixItemReferenceIdentifiers[companyPrefixItemReferenceIdentifier],
                                        SerialNumber = serialNumber
                                    };
                                    context.ProductItems.Add(productItem);
                                    countProductItemsAddedToDatabase++;
                                }
                                else
                                {
                                    errorSgtinItems.Add(errorFormatter(sgtinItem, $"duplicate item"));
                                    countProductItemsDuplicated++;
                                }
                            }
                            else
                            {
                                errorSgtinItems.Add(errorFormatter(sgtinItem, $"[company prefix]-[item reference] '{companyPrefixItemReferenceIdentifier}' not found in database"));
                                countProductItemsProductDefinitionInvalid++;
                            }
                        }
                        else
                        {
                            errorSgtinItems.Add(errorFormatter(sgtinItem, errorMessage));
                            countSgtinRecordsParsedError++;
                        }
                    }

                    context.InventoryDateLocations.Add(inventoryDateLocation);
                }
                else
                {
                    // Update product items for existing inventory-date-location
                }

                context.SaveChanges();

                var resultData = new
                {
                    CountSgtinRecordsReceived = countSgtinRecordsReceived,
                    CountParsedSgtinRecordsError = countSgtinRecordsParsedError,
                    CountProductItemsProductDefinitionInvalid = countProductItemsProductDefinitionInvalid,
                    CountProductItemsDuplicated = countProductItemsDuplicated,
                    CountProductItemsAddedToDatabase = countProductItemsAddedToDatabase,
                    ErrorSgtinItems = errorSgtinItems
                };
                string jsonString = JsonSerializer.Serialize(resultData);

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

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

        private Func<long, long, string> createCompanyProductIdentifier = (companyPrefix, itemReference) => $"{companyPrefix}-{itemReference}";
        private Func<long, long, long, string> createCompanyProductSerialIdentifier = (companyPrefix, itemReference, serialNumber) => $"{companyPrefix}-{itemReference}-{serialNumber}";
        private Func<string, string, string> createErrorMessage = (sgtin, message) => $"{sgtin} - {message}";

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
                int countProductItemsReceived = 0;
                int countProductItemsParseError = 0;
                int countProductItemsNotInDatabase = 0;
                int countProductItemsDuplicated = 0;

                // Find inventory location by name
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

                // Find inventory by id
                var inventory = (from i in context.Inventories
                                 where i.InventoryId == value.InventoryId
                                 select i)
                                 .SingleOrDefault();

                if (inventory == null)
                {
                    // Insert new inventory if it doesn't exist
                    inventory = new Inventory() { InventoryId = value.InventoryId };
                    context.Inventories.Add(inventory);
                }

                // Find inventory-date-location combination (by inventory-id, date, inventory-location-name)
                var inventoryDateLocation = (from i in context.Inventories
                                             join idl in context.InventoryDateLocations on i.Id equals idl.InventoryId
                                             where i.InventoryId == value.InventoryId && idl.InventoryDate == value.InventoryDate && idl.InventoryLocationId == inventoryLocation.Id
                                             select idl)
                                             .SingleOrDefault();

                EnumOperationType operationType = inventoryDateLocation == null ? EnumOperationType.Insert : EnumOperationType.Update;

                Dictionary<string, ProductItem> createdProductItems = null;
                List<string> errorItems = new List<string>(), updateInsertedItems = new List<string>(), updateDeletedItems = new List<string>();
                if (operationType == EnumOperationType.Insert)
                    CreateInventoryDateLocation(EnumOperationType.Insert, value, out countProductItemsReceived, ref countProductItemsParseError, ref countProductItemsNotInDatabase, ref countProductItemsDuplicated, inventoryLocation, inventory, ref inventoryDateLocation, out createdProductItems, errorItems);
                else
                {
                    CreateInventoryDateLocation(EnumOperationType.Update, value, out countProductItemsReceived, ref countProductItemsParseError, ref countProductItemsNotInDatabase, ref countProductItemsDuplicated, inventoryLocation, inventory, ref inventoryDateLocation, out createdProductItems, errorItems);

                    var existingProductItems = (from idl in context.InventoryDateLocations
                                                join pi in context.ProductItems on idl.Id equals pi.InventoryDateLocationId
                                                join p in context.Products on pi.ProductId equals p.Id
                                                join c in context.Companies on p.CompanyId equals c.Id
                                                where idl.Id == inventoryDateLocation.Id
                                                select new { c.CompanyPrefix, p.ItemReference, pi.SerialNumber, ProductItem = pi })
                                                .ToList()
                                                .ToDictionary(k => createCompanyProductSerialIdentifier(k.CompanyPrefix, k.ItemReference, k.SerialNumber), v => v.ProductItem);

                    // Add sent items that don't exist in database items
                    foreach (var createdProductItem in createdProductItems)
                        if (existingProductItems.ContainsKey(createdProductItem.Key) == false)
                        {
                            updateInsertedItems.Add(createdProductItem.Key);
                            context.ProductItems.Add(createdProductItem.Value);
                        }

                    // Remove database items not in sent items
                    foreach (var existingProductItem in existingProductItems)
                        if (createdProductItems.ContainsKey(existingProductItem.Key) == false)
                        {
                            updateDeletedItems.Add(existingProductItem.Key);
                            context.ProductItems.Remove(existingProductItem.Value);
                        }
                }

                context.SaveChanges();

                var resultData = new
                {
                    OperationType = Enum.GetName(operationType),
                    CountProductItemsReceived = countProductItemsReceived,
                    CountProductItemsParseError = countProductItemsParseError,
                    CountProductItemsNotInDatabase = countProductItemsNotInDatabase,
                    CountProductItemsDuplicated = countProductItemsDuplicated,
                    CountProductItemsCorrect = createdProductItems.Count,
                    ErrorProductItems = errorItems,
                    UpdateInsertedItems = updateInsertedItems,
                    UpdateDeletedItems = updateDeletedItems
                };

                var result = new ContentResult()
                {
                    StatusCode = (int)HttpStatusCode.OK,
                    ContentType = "application/json",
                    Content = JsonSerializer.Serialize(resultData)
                };

                return result;
            }
            catch (Exception ex)
            {
                logger.LogError(ex);
                throw;
            }
        }

        private void CreateInventoryDateLocation(EnumOperationType operationType, PostedInventory value, out int countProductItemsReceived, ref int countProductItemsParseError, ref int countProductItemsNotInDatabase, ref int countProductItemsDuplicated, InventoryLocation inventoryLocation, Inventory inventory, ref InventoryDateLocation inventoryDateLocation, out Dictionary<string, ProductItem> createdProductItems, List<string> errorItems)
        {
            createdProductItems = new Dictionary<string, ProductItem>();

            var companyProductIdentifiers = (from c in context.Companies
                                             join p in context.Products on c.Id equals p.CompanyId
                                             select new
                                             {
                                                 c.CompanyPrefix,
                                                 p.ItemReference,
                                                 Product_Id = p.Id
                                             })
                        .ToList()
                        .ToDictionary(k => createCompanyProductIdentifier(k.CompanyPrefix, k.ItemReference), v => v.Product_Id);

            if (operationType == EnumOperationType.Insert)
            {
                // Insert new inventory-date-location and product items
                inventoryDateLocation = new InventoryDateLocation()
                {
                    Inventory = inventory,
                    InventoryDate = value.InventoryDate,
                    InventoryLocation = inventoryLocation
                };
                context.InventoryDateLocations.Add(inventoryDateLocation);
            }

            countProductItemsReceived = value.SgtinItems.Count();
            foreach (var sgtinItem in value.SgtinItems)
            {
                if (sgtinItem.TryParseSgtin96Item(out EnumHeader header, out EnumFilter filter, out EnumPartition partition, out long companyPrefix, out long itemReference, out long serialNumber, out string errorMessage))
                {
                    // Check if company owns product
                    var companyPrefixItemReferenceIdentifier = createCompanyProductIdentifier(companyPrefix, itemReference);
                    if (companyProductIdentifiers.ContainsKey(companyPrefixItemReferenceIdentifier))
                    {
                        // Check if product item is duplicated in this SGTIN-96 list
                        var identifier = createCompanyProductSerialIdentifier(companyPrefix, itemReference, serialNumber);
                        if (createdProductItems.ContainsKey(identifier) == false)
                        {
                            var productItem = new ProductItem()
                            {
                                InventoryDateLocation = inventoryDateLocation,
                                ProductId = companyProductIdentifiers[companyPrefixItemReferenceIdentifier],
                                SerialNumber = serialNumber
                            };

                            // Add product item to cache and database
                            createdProductItems.Add(identifier, productItem);

                            if (operationType == EnumOperationType.Insert)
                                context.ProductItems.Add(productItem);   
                        }
                        else
                        {
                            errorItems.Add(createErrorMessage(sgtinItem, $"duplicate item"));
                            countProductItemsDuplicated++;
                        }
                    }
                    else
                    {
                        errorItems.Add(createErrorMessage(sgtinItem, $"[company prefix]-[item reference] '{companyPrefixItemReferenceIdentifier}' not found in database"));
                        countProductItemsNotInDatabase++;
                    }
                }
                else
                {
                    errorItems.Add(createErrorMessage(sgtinItem, errorMessage));
                    countProductItemsParseError++;
                }
            }
        }
    }
}

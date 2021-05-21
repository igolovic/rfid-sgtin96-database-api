using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text.Json;

using ProductInventoryApi.Localization;
using ProductInventoryApi.Logging;
using ProductInventoryApi.Models;
using ProductInventoryApi.Models.RequestObjects;
using ProductInventoryApi.Models.ResponseObjects;
using ProductInventoryApi.Sgtin;

using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Localization;

namespace ProductInventoryApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class InventoryController : ControllerBase
    {
        private readonly ProductInventoryApi_dbContext context;
        private readonly IStringLocalizer<Resource> localizer;
        private readonly ILoggerManager logger;

        private Func<long, long, string> createCompanyProductIdentifier = (companyPrefix, itemReference) => $"{companyPrefix}-{itemReference}";
        private Func<long, long, long, string> createCompanyProductSerialIdentifier = (companyPrefix, itemReference, serialNumber) => $"{companyPrefix}-{itemReference}-{serialNumber}";
        private Func<string, string, string> createErrorMessage = (sgtin, message) => $"{sgtin} - {message}";

        public InventoryController(IStringLocalizer<Resource> localizer, ILoggerManager logger, ProductInventoryApi_dbContext context)
        {
            this.context = context;
            this.localizer = localizer;
            this.logger = logger;
        }

        /// <summary>
        /// Return report data which consists of counts of product items grouped according to various criteria
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ResponseReport Get()
        {
            try
            {
                var itemsGroupedBySpecificProductForSpecificInventories = from row in context.VCountOfInventoriedItemsGroupedBySpecificProductForSpecificInventories
                                                                          orderby row.InventoryId, row.CountOfProductItems descending, row.ProductName 
                                                                          select row;

                var itemsGroupedBySpecificProductPerDays = from row in context.VCountOfInventoriedItemsGroupedBySpecificProductPerDays
                                                           orderby row.InventoryDate, row.CountOfProductItems descending, row.ProductName 
                                                           select row;

                var itemsGroupedBySpecificCompanies = from row in context.VCountOfInventoriedItemsGroupedBySpecificCompanies
                                                      orderby row.CountOfProductItems descending
                                                      select row;

                var resultData = new ResponseReport
                {
                    ItemsGroupedBySpecificProductForSpecificInventories = itemsGroupedBySpecificProductForSpecificInventories.ToList(),
                    ItemsGroupedBySpecificProductPerDays = itemsGroupedBySpecificProductPerDays.ToList(),
                    ItemsGroupedBySpecificCompanies = itemsGroupedBySpecificCompanies.ToList()
                };

                return resultData;
            }
            catch (Exception ex)
            {
                logger.LogError(ex);
                throw;
            }
        }

        /// <summary>
        /// Insert or update inventory and inventory-related data, and product items into database
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Post([FromBody] RequestInventory value)
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

                EnumDataMode dataMode = inventoryDateLocation == null ? EnumDataMode.InsertAndReturnData : EnumDataMode.ReturnData;
                EnumOperationType operationType;

                Dictionary<string, ProductItem> createdProductItems = null;
                List<string> errorItems = new List<string>(), updateInsertedItems = new List<string>(), updateDeletedItems = new List<string>();
                if (dataMode == EnumDataMode.InsertAndReturnData)
                {
                    // Insert new inventory-date-location record and product items into database
                    operationType = EnumOperationType.InsertNewInventoryDateLocationWithProductItems;
                    CreateInventoryDateLocation(EnumDataMode.InsertAndReturnData, value, out countProductItemsReceived, ref countProductItemsParseError, ref countProductItemsNotInDatabase, ref countProductItemsDuplicated, inventoryLocation, inventory, ref inventoryDateLocation, out createdProductItems, errorItems);
                }
                else
                {
                    // Inventory-date-location record already exists, only update product items (add/delete existing product items) related to inventory-date-location record
                    operationType = EnumOperationType.InsertNewInventoryDateLocationWithProductItems;
                    CreateInventoryDateLocation(EnumDataMode.ReturnData, value, out countProductItemsReceived, ref countProductItemsParseError, ref countProductItemsNotInDatabase, ref countProductItemsDuplicated, inventoryLocation, inventory, ref inventoryDateLocation, out createdProductItems, errorItems);

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

        /// <summary>
        /// Creates product items from RFID tags which contain SGTIN-96 encoded product item data.
        /// Method can:
        /// 1 - create inventory-date-location and product items, insert them into database and return product items
        /// 2 - create product items and return them, don't create inventory-date-location and don't insert anything into database
        /// </summary>
        /// <param name="dataMode"></param>
        /// <param name="value"></param>
        /// <param name="countProductItemsReceived"></param>
        /// <param name="countProductItemsParseError"></param>
        /// <param name="countProductItemsNotInDatabase"></param>
        /// <param name="countProductItemsDuplicated"></param>
        /// <param name="inventoryLocation"></param>
        /// <param name="inventory"></param>
        /// <param name="inventoryDateLocation"></param>
        /// <param name="createdProductItems"></param>
        /// <param name="errorItems"></param>
        private void CreateInventoryDateLocation(EnumDataMode dataMode, RequestInventory value, out int countProductItemsReceived, ref int countProductItemsParseError, ref int countProductItemsNotInDatabase, ref int countProductItemsDuplicated, InventoryLocation inventoryLocation, Inventory inventory, ref InventoryDateLocation inventoryDateLocation, out Dictionary<string, ProductItem> createdProductItems, List<string> errorItems)
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

            if (dataMode == EnumDataMode.InsertAndReturnData)
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

            countProductItemsReceived = value.HexRfidTags.Count();
            foreach (var hexRfidTag in value.HexRfidTags)
            {
                if (hexRfidTag.TryParseSgtin96(out EnumHeader header, out EnumFilter filter, out EnumPartition partition, out long companyPrefix, out long itemReference, out long serialNumber, out string errorMessage))
                {
                    // Check if company owns product
                    var companyPrefixItemReferenceIdentifier = createCompanyProductIdentifier(companyPrefix, itemReference);
                    if (companyProductIdentifiers.ContainsKey(companyPrefixItemReferenceIdentifier))
                    {
                        // Check if product item represented by tag is duplicated in tag list
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

                            if (dataMode == EnumDataMode.InsertAndReturnData)
                                context.ProductItems.Add(productItem);   
                        }
                        else
                        {
                            errorItems.Add(createErrorMessage(hexRfidTag, $"duplicate item"));
                            countProductItemsDuplicated++;
                        }
                    }
                    else
                    {
                        errorItems.Add(createErrorMessage(hexRfidTag, $"[company prefix]-[item reference] '{companyPrefixItemReferenceIdentifier}' not found in database"));
                        countProductItemsNotInDatabase++;
                    }
                }
                else
                {
                    errorItems.Add(createErrorMessage(hexRfidTag, errorMessage));
                    countProductItemsParseError++;
                }
            }
        }
    }
}

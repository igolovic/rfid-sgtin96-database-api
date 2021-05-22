using ProductInventoryApi.Models.ResponseObjects.Reports;
using System.Collections.Generic;

namespace ProductInventoryApi.Models.ResponseObjects
{
    public class ResponseReport
    {
        public List<InventoriedItemsGroupedBySpecificProductForSpecificInventory> InventoriedItemsGroupedBySpecificProductForSpecificInventoryList { get; set; }

        public List<InventoriedItemsGroupedBySpecificProductPerDay> InventoriedItemsGroupedBySpecificProductPerDayList { get; set; }

        public List<CompanyWithProductItemsCount> InventoriedItemsGroupedBySpecificCompanyList { get; set; }
    }
}

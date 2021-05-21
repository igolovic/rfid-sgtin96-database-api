using System.Collections.Generic;

namespace ProductInventoryApi.Models.ResponseObjects
{
    public class ResponseReport
    {
        public List<VCountOfInventoriedItemsGroupedBySpecificProductForSpecificInventory> ItemsGroupedBySpecificProductForSpecificInventories { get; set; }

        public List<VCountOfInventoriedItemsGroupedBySpecificProductPerDay> ItemsGroupedBySpecificProductPerDays { get; set; }

        public List<VCountOfInventoriedItemsGroupedBySpecificCompany> ItemsGroupedBySpecificCompanies { get; set; }
    }
}

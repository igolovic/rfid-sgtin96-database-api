using System.Collections.Generic;

namespace ProductInventoryApi.Models.ResponseObjects.Reports
{
    public class InventoriedItemsGroupedBySpecificProductForSpecificInventory
    {
        public string InventoryId { get; set; }

        public List<ProductWithProductItemsCount> ProductWithProductItemsCountList { get; set; }
    }
}

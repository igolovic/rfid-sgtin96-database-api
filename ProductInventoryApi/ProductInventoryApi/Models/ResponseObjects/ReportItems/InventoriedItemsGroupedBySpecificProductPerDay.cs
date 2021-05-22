using System;
using System.Collections.Generic;

namespace ProductInventoryApi.Models.ResponseObjects.Reports
{
    public class InventoriedItemsGroupedBySpecificProductPerDay
    {
        public DateTime Date { get; set; }

        public List<ProductWithProductItemsCount> ProductWithProductItemsCountList { get; set; }
    }
}

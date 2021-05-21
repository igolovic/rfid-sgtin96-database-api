using System;
using System.Collections.Generic;

#nullable disable

namespace ProductInventoryApi.Models
{
    public partial class VCountOfInventoriedItemsGroupedBySpecificProductForSpecificInventory
    {
        public string InventoryId { get; set; }
        public int? CountOfProductItems { get; set; }
        public string ProductName { get; set; }
    }
}

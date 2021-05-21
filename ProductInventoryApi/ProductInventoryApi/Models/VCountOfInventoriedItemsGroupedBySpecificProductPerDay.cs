using System;
using System.Collections.Generic;

#nullable disable

namespace ProductInventoryApi.Models
{
    public partial class VCountOfInventoriedItemsGroupedBySpecificProductPerDay
    {
        public DateTime InventoryDate { get; set; }
        public int? CountOfProductItems { get; set; }
        public string ProductName { get; set; }
    }
}

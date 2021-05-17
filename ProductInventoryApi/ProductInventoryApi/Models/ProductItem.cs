using System;
using System.Collections.Generic;

#nullable disable

namespace ProductInventoryApi.Models
{
    public partial class ProductItem
    {
        public int Id { get; set; }
        public int ProductDateId { get; set; }
        public int InventoryId { get; set; }
        public string SerialNumber { get; set; }

        public virtual InventoryDate Inventory { get; set; }
        public virtual Product ProductDate { get; set; }
    }
}

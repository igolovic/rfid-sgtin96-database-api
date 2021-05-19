using System;
using System.Collections.Generic;

#nullable disable

namespace ProductInventoryApi.Models
{
    public partial class ProductItem
    {
        public int Id { get; set; }
        public int ProductId { get; set; }
        public int InventoryDateLocationId { get; set; }
        public long SerialNumber { get; set; }

        public virtual InventoryDateLocation InventoryDateLocation { get; set; }
        public virtual Product Product { get; set; }
    }
}

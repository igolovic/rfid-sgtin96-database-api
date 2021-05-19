using System;
using System.Collections.Generic;

#nullable disable

namespace ProductInventoryApi.Models
{
    public partial class InventoryDateLocation
    {
        public InventoryDateLocation()
        {
            ProductItems = new HashSet<ProductItem>();
        }

        public int Id { get; set; }
        public int InventoryId { get; set; }
        public DateTime InventoryDate { get; set; }
        public int InventoryLocationId { get; set; }

        public virtual Inventory Inventory { get; set; }
        public virtual InventoryLocation InventoryLocation { get; set; }
        public virtual ICollection<ProductItem> ProductItems { get; set; }
    }
}

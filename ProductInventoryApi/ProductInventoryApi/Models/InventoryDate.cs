using System;
using System.Collections.Generic;

#nullable disable

namespace ProductInventoryApi.Models
{
    public partial class InventoryDate
    {
        public InventoryDate()
        {
            ProductItems = new HashSet<ProductItem>();
        }

        public int Id { get; set; }
        public int InventoryId { get; set; }
        public DateTime InventoryDate1 { get; set; }

        public virtual Inventory Inventory { get; set; }
        public virtual ICollection<ProductItem> ProductItems { get; set; }
    }
}

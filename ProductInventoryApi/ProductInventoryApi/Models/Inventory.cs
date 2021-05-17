using System;
using System.Collections.Generic;

#nullable disable

namespace ProductInventoryApi.Models
{
    public partial class Inventory
    {
        public Inventory()
        {
            InventoryDates = new HashSet<InventoryDate>();
        }

        public int Id { get; set; }
        public string InventoryId { get; set; }
        public int InventoryLocationId { get; set; }

        public virtual InventoryLocation InventoryLocation { get; set; }
        public virtual ICollection<InventoryDate> InventoryDates { get; set; }
    }
}

using System;
using System.Collections.Generic;

#nullable disable

namespace ProductInventoryApi.Models
{
    public partial class InventoryLocation
    {
        public InventoryLocation()
        {
            Inventories = new HashSet<Inventory>();
        }

        public int Id { get; set; }
        public string InventoryLocation1 { get; set; }

        public virtual ICollection<Inventory> Inventories { get; set; }
    }
}

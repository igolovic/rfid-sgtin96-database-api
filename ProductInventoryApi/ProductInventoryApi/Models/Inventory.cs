using System;
using System.Collections.Generic;

#nullable disable

namespace ProductInventoryApi.Models
{
    public partial class Inventory
    {
        public Inventory()
        {
            InventoryDateLocations = new HashSet<InventoryDateLocation>();
        }

        public int Id { get; set; }
        public string InventoryId { get; set; }

        public virtual ICollection<InventoryDateLocation> InventoryDateLocations { get; set; }
    }
}

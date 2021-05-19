using System;
using System.Collections.Generic;

#nullable disable

namespace ProductInventoryApi.Models
{
    public partial class InventoryLocation
    {
        public InventoryLocation()
        {
            InventoryDateLocations = new HashSet<InventoryDateLocation>();
        }

        public int Id { get; set; }
        public string InventoryLocationName { get; set; }

        public virtual ICollection<InventoryDateLocation> InventoryDateLocations { get; set; }
    }
}

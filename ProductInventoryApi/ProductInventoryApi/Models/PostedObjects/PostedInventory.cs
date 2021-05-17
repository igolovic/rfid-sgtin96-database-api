using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProductInventoryApi.Models.PostedObjects
{
    public class PostedInventory
    {
        public string InventoryId { get; set; }

        public string InventoryLocation { get; set; }
        
        public DateTime InventoryDate { get; set; }
        
        /// <summary>
        /// SGTIN-96 item list
        /// </summary>
        public List<string> SgtinItems { get; set; }
    }
}

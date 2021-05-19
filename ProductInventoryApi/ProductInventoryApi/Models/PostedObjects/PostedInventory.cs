using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ProductInventoryApi.Models.PostedObjects
{
    public class PostedInventory
    {
        [RegularExpression("([a-zA-Z0-9]{1,32})", ErrorMessage = "Information must be 32 characters which can be letters or numbers")]
        public string InventoryId { get; set; }

        [Required]  
        [StringLength(512)]
        public string InventoryLocation { get; set; }

        [Required]
        [DataType(DataType.Date)]
        public DateTime InventoryDate { get; set; }
        
        /// <summary>
        /// SGTIN-96 item list
        /// </summary>
        public List<string> SgtinItems { get; set; }
    }
}

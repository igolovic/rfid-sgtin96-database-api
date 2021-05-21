using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace ProductInventoryApi.Models.RequestObjects
{
    public class RequestInventory
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
        /// Hexadecimal RFID tags list. Tags should contain SGTIN-96 data which represents product items.
        /// </summary>
        [Required]
        public List<string> HexRfidTags { get; set; }
    }
}

using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ProductInventoryApi.Models.PostedObjects
{
    public class PostedProduct
    {
        [Required]
        public long CompanyPrefix { get; set; }

        [RequiredNotEmpty]
        [StringLength(512)]
        public string CompanyName { get; set; }

        [Required]
        public long ItemReference { get; set; }

        [RequiredNotEmpty]
        [StringLength(512)]
        public string ProductName { get; set; }
    }
}

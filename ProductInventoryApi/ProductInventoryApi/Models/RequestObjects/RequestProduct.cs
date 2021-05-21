using System.ComponentModel.DataAnnotations;
using ProductInventoryApi.Models.Attributes;

namespace ProductInventoryApi.Models.RequestObjects
{
    public class RequestProduct
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

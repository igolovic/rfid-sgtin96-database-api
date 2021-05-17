using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProductInventoryApi.Models.PostedObjects
{
    public class PostedProduct
    {
        public int CompanyPrefix { get; set; }

        public string CompanyName { get; set; }
        
        public int ItemReference { get; set; }
        
        public string ProductName { get; set; }
    }
}

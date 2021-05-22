using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProductInventoryApi.Models.ResponseObjects.Reports
{
    public class ProductWithProductItemsCount
    {
        public string ProductName { get; set; }

        public long ProductItemsCount { get; set; }
    }
}

using System;
using System.Collections.Generic;

#nullable disable

namespace ProductInventoryApi.Models
{
    public partial class Product
    {
        public Product()
        {
            ProductItems = new HashSet<ProductItem>();
        }

        public int Id { get; set; }
        public int CompanyId { get; set; }
        public long ItemReference { get; set; }
        public string ProductName { get; set; }

        public virtual Company Company { get; set; }
        public virtual ICollection<ProductItem> ProductItems { get; set; }
    }
}

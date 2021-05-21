using System.Collections.Generic;

#nullable disable

namespace ProductInventoryApi.Models
{
    public partial class Company
    {
        public Company()
        {
            Products = new HashSet<Product>();
        }

        public int Id { get; set; }
        public long CompanyPrefix { get; set; }
        public string CompanyName { get; set; }

        public virtual ICollection<Product> Products { get; set; }
    }
}

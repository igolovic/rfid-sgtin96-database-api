using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProductInventoryApi.Models.ResponseObjects.Reports
{
    public class CompanyWithProductItemsCount
    {
        public string CountryName { get; set; }

        public long ProdcutItemsCount { get; set; }
    }
}

using System;
using System.Collections.Generic;

#nullable disable

namespace ProductInventoryApi.Models
{
    public partial class VCountOfInventoriedItemsGroupedBySpecificCompany
    {
        public string CompanyName { get; set; }
        public int? CountOfProductItems { get; set; }
    }
}

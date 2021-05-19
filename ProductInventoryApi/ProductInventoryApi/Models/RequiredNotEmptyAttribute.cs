using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ProductInventoryApi.Models
{
    public class RequiredNotEmptyAttribute : RequiredAttribute
    {
        public override bool IsValid(object value)
        {
            if (value is string) return !String.IsNullOrEmpty((string)value);

            return base.IsValid(value);
        }
    }
}

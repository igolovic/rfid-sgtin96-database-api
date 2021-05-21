using System;
using System.ComponentModel.DataAnnotations;

namespace ProductInventoryApi.Models.Attributes
{
    public class RequiredNotEmptyAttribute : RequiredAttribute
    {
        public override bool IsValid(object value)
        {
            if (value is string) 
                return !String.IsNullOrEmpty((string)value);

            return base.IsValid(value);
        }
    }
}

//using Microsoft.VisualStudio.TestTools.UnitTesting;
using ProductInventoryApi.Sgtin;
using System;
using Xunit;

namespace ProductInventoryApi.Tests
{
    public class Sgtin_Test
    {
        [Theory]
        [InlineData("3074257BF7194E4000001A85", (EnumHeader)48, (EnumFilter)3, (EnumPartition)5, 614141, 812345, 6789, null)]
        public void RfidIsParsedToSgtin96(string hexRfidTag, 
            EnumHeader expectedHeader, 
            EnumFilter expectedFilter, 
            EnumPartition expectedPartition, 
            long expectedCompanyPrefix, 
            long expectedItemReference, 
            long expectedSerialNumber, 
            string expectedErrorMessage)
        {
            if (hexRfidTag.TryParseSgtin96(out EnumHeader header, out EnumFilter filter, out EnumPartition partition, out long companyPrefix, out long itemReference, out long serialNumber, out string errorMessage))
            {
                Assert.True(expectedHeader == header 
                    && expectedFilter == filter
                    && expectedPartition == partition
                    && expectedCompanyPrefix == companyPrefix
                    && expectedItemReference == itemReference
                    && expectedSerialNumber == serialNumber
                    && (expectedErrorMessage != null || expectedErrorMessage == errorMessage)
                    );
            }
        }
    }
}

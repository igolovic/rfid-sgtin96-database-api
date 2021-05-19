using System;
using System.Collections;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace ProductInventoryApi.Sgtin
{
    public static class StringExtensions
    {
        public static bool TryParseSgtin96Item(this string sgtin, out EnumHeader header, out EnumFilter filter, out EnumPartition partition, out long companyPrefix, out long itemReference, out long serialNumber, out string errorMessage)
        {
            header = default(EnumHeader);
            filter = default(EnumFilter);
            partition = default(EnumPartition);
            companyPrefix = default(long);
            itemReference = default(long);
            serialNumber = default(long);
            errorMessage = null;

            // 2 hex digits = 1 byte, 24 hex digits = 12 bytes = 96 bits
            if (sgtin.Length != 24)
            {
                errorMessage = "SGTIN-96 length not 96 bits";
                return false;
            }

            if (IsHex(sgtin) == false)
            {
                errorMessage = "SGTIN-96 not valid hexadecimal";
                return false;
            }

            BitArray sgtinBitArr = HexStringToBitArray(sgtin);
            int bitsRead = 0;

            BitArray headerBitArr = new BitArray(sgtinBitArr.Cast<bool>().Take(8).ToArray());
            header = (EnumHeader)headerBitArr.Reverse().ToInt();
            bitsRead = 8;

            if (header == EnumHeader.Sgtin96)
            {
                BitArray filterBitArr = new BitArray(sgtinBitArr.Cast<bool>().Skip(bitsRead).Take(3).ToArray());
                filter = (EnumFilter)filterBitArr.Reverse().ToInt();
                bitsRead += 3;

                if (Enum.IsDefined(filter) == false)
                {
                    errorMessage = $"'filter' value {(int)filter} not valid";
                    return false;
                }

                BitArray partitionBitArr = new BitArray(sgtinBitArr.Cast<bool>().Skip(bitsRead).Take(3).ToArray());
                partition = (EnumPartition)partitionBitArr.Reverse().ToInt();
                bitsRead += 3;

                const int companyPrefixAndItemReferenceLength = 44;
                int companyPrefixLength = 0;
                switch (partition)
                {
                    case EnumPartition.Value0:
                        companyPrefixLength = 40;
                        break;

                    case EnumPartition.Value1:
                        companyPrefixLength = 37;
                        break;
                    case EnumPartition.Value2:
                        companyPrefixLength = 34;
                        break;

                    case EnumPartition.Value3:
                        companyPrefixLength = 30;
                        break;
                    case EnumPartition.Value4:
                        companyPrefixLength = 27;
                        break;

                    case EnumPartition.Value5:
                        companyPrefixLength = 24;
                        break;

                    case EnumPartition.Value6:
                        companyPrefixLength = 20;
                        break;

                    default:
                        errorMessage = $"'partition' value {partition} not valid";
                        return false;
                }

                BitArray companyPrefixBitArr = new BitArray(sgtinBitArr.Cast<bool>().Skip(bitsRead).Take(companyPrefixLength).ToArray());
                companyPrefix = companyPrefixBitArr.Reverse().ToLong();
                bitsRead += companyPrefixLength;

                var itemReferenceLength = companyPrefixAndItemReferenceLength - companyPrefixLength;

                BitArray itemReferenceBitArr = new BitArray(sgtinBitArr.Cast<bool>().Skip(bitsRead).Take(itemReferenceLength).ToArray());
                itemReference = itemReferenceBitArr.Reverse().ToLong();
                bitsRead += itemReferenceLength;

                BitArray serialNumberBitArr = new BitArray(sgtinBitArr.Cast<bool>().Skip(bitsRead).Take(38).ToArray());
                serialNumber = serialNumberBitArr.Reverse().ToLong();
            }
            else
            {
                errorMessage = $"'header' value {(int)header} not valid or not SGTIN-96";
                return false;
            }

            return true;
        }

        private static BitArray HexStringToBitArray(string hexData)
        {
            BitArray ba = new BitArray(4 * hexData.Length);
            for (int i = 0; i < hexData.Length; i++)
            {
                byte b = byte.Parse(hexData[i].ToString(), NumberStyles.HexNumber);
                for (int j = 0; j < 4; j++)
                    ba.Set(i * 4 + j, (b & (1 << (3 - j))) != 0);
            }
            return ba;
        }

        private static bool IsHex(IEnumerable<char> chars)
        {
            bool isHex;
            foreach (var c in chars)
            {
                isHex = ((c >= '0' && c <= '9') ||
                         (c >= 'a' && c <= 'f') ||
                         (c >= 'A' && c <= 'F'));

                if (!isHex)
                    return false;
            }
            return true;
        }
    }
}
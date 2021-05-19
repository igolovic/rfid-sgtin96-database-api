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
    public static class BitArrayExtensions
    {
        public static int ToInt(this BitArray bitArray)
        {
            if (bitArray.Length > sizeof(int) * 8)
                throw new ArgumentException($"Argument length must be at most {sizeof(int) * 8} bits.");

            int[] array = new int[1];
            bitArray.CopyTo(array, 0);
            return array[0];
        }

        public static long ToLong(this BitArray bitArray)
        {
            if (bitArray.Length > sizeof(long) * 8)
                throw new ArgumentException($"Argument length must be at most {sizeof(long) * 8} bits.");

            var array = new byte[8];
            bitArray.CopyTo(array, 0);
            return BitConverter.ToInt64(array, 0);
        }

        public static BitArray Reverse(this BitArray bitArray)
        {
            int length = bitArray.Length;
            int mid = (length / 2);

            for (int i = 0; i < mid; i++)
            {
                bool bit = bitArray[i];
                bitArray[i] = bitArray[length - i - 1];
                bitArray[length - i - 1] = bit;
            }

            return bitArray;
        }
    }
}

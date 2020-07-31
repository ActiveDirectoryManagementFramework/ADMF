using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ADMF
{
    [Flags]
    public enum UpdateDCOptions
    {
        Share = 1,
        FSAccessRule = 2,

        Default = Share | FSAccessRule,
        All = Share | FSAccessRule
    }
}
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
        Share,
        FSAccessRule,

        Default = Share | FSAccessRule,
        All = Share | FSAccessRule
    }
}
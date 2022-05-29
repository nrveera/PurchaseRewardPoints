using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Reward.Data.Model
{
    public class UserDetails
    {
        public string ctype { get; set; }
        public string usermobile { get; set; }
        public string purchaseamount { get; set; }

        public UserDetails()
        {
            ctype = "";
            usermobile = "";
            purchaseamount = "";
        }
    }
}

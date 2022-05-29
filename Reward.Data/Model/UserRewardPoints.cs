using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Reward.Data.Model
{
   public class UserRewardPoints
    {
        public string usermobile { get; set; }
        public string totalpurchase { get; set; }
        public string totalrewards { get; set; }
        public string expiredrewards { get; set; }
        public string activerewards { get; set; }
        public string currentreward { get; set; }
    }
}

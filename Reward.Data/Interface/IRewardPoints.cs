using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Reward.Data.Model;
namespace Reward.Data.Interface
{
    /// <summary>
    /// Interface class for rewardpoints.
    /// </summary>
    public interface IRewardPoints
    {
        RewardPoints GetRewardPoints(float PurchaseAmount);
        UserRewardPoints GetUserRewardDetails(UserDetails obj);
        List<RewardPointsHistory> GetRewardHistory(UserDetails obj);
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Web;
using Reward.Data.Model;
using Reward.Data.Interface;
namespace Reward.Data.Repository
{
    /// <summary>
    /// Class <c>RewardPointsRepository</c> class for Reward Point calculation.
    /// </summary>
    public class RewardPointsRepository:IRewardPoints
    {
        /// <summary>
        /// This method calculate the reward points.
        /// <param name="PurchaseAmount">Amount in float value</param>
        /// <returns>
        /// returns the rewardpoint with purchase amount,
        /// </returns>
        /// </summary>
        public RewardPoints GetRewardPoints(float PurchaseAmount)
        {
            RewardPoints reward = new RewardPoints();
            try {
            reward.PurchaseAmount = PurchaseAmount;
            reward.RewardsPoint = 0;
            reward.RewardsPoint = PurchaseAmount >= 50 ? ((Convert.ToInt32(Math.Floor(PurchaseAmount))-50)*1) : reward.RewardsPoint;
            reward.RewardsPoint = PurchaseAmount >= 100 ? reward.RewardsPoint+((Convert.ToInt32(Math.Floor(PurchaseAmount)) - 100) * 1) : reward.RewardsPoint;
            
            }
            catch(Exception ex)
            {
                LogSet(ex.ToString());
            }
            return reward;
        }
        /// <summary>
        /// This method write the log file.
        /// <param name="clearText">string to write in log file</param>
        /// </summary>
        public void LogSet(string clearText)
        {
            string fmsg = "\r\n" + DateTime.Now.ToString() + "   ---   " + clearText;
            string sYear = DateTime.Now.Year.ToString();
            string sMonth = DateTime.Now.Month.ToString();
            string sDay = DateTime.Now.Day.ToString();
            string fpath = "~/Files/Log/" + sYear + "-" + sMonth + ".txt";
            if (File.Exists(HttpContext.Current.Server.MapPath(fpath)))
            {
                File.AppendAllText(HttpContext.Current.Server.MapPath(fpath), fmsg);
            }
            else
            {
                File.WriteAllText(HttpContext.Current.Server.MapPath(fpath), fmsg);
            }
        }

    }
}

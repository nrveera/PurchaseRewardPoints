using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Web;
using System.Data;
using System.Data.SqlClient;
//using Microsoft.Data.SqlClient;
using Reward.Data.Model;
using Reward.Data.Interface;
namespace Reward.Data.Repository
{
    /// <summary>
    /// Class <c>RewardPointsRepository</c> class for Reward Point calculation.
    /// </summary>
    public class RewardPointsRepository:IRewardPoints
    {
        MSQL cobj = new MSQL();
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

        public UserRewardPoints GetUserRewardDetails(UserDetails obj)
        {
            SqlParameter[] paras = new SqlParameter[]
            {
                new SqlParameter("@ctype",obj.ctype),
                new SqlParameter("@usermobile",obj.usermobile),
                new SqlParameter("@purchaseamount",obj.purchaseamount),
                
            };
            DataTable dt = cobj.GetDataTable("sp_userrewards", paras);
            UserRewardPoints uobj = new UserRewardPoints();
            if (dt.Rows.Count > 0)
            {
                uobj.usermobile =dt.Rows[0]["usermobile"].ToString();
                uobj.totalpurchase= dt.Rows[0]["totalpurchase"].ToString();
                uobj.totalrewards = dt.Rows[0]["totalrewards"].ToString();
                uobj.expiredrewards = dt.Rows[0]["expiredrewards"].ToString();
                uobj.activerewards = dt.Rows[0]["activerewards"].ToString();
                uobj.currentreward = dt.Rows[0]["currentreward"].ToString();
            }


            return uobj;

        }

        public List<RewardPointsHistory> GetRewardHistory(UserDetails obj)
        {
            SqlParameter[] paras = new SqlParameter[]
            {
                new SqlParameter("@ctype",obj.ctype),
                new SqlParameter("@usermobile",obj.usermobile),
                new SqlParameter("@purchaseamount",obj.purchaseamount),

            };
            DataTable dt = cobj.GetDataTable("sp_userrewards", paras);
            List<RewardPointsHistory> lobj = new List<RewardPointsHistory>();
            
            if (dt.Rows.Count > 0)
            {
                foreach(DataRow row in dt.Rows)
                {
                    RewardPointsHistory uobj = new RewardPointsHistory();
                    uobj.usermobile = row["usermobile"].ToString();
                    uobj.purchaseamount = row["purchaseamount"].ToString();
                    uobj.rewardpoint = row["rewardpoint"].ToString();
                    uobj.expirydate = row["expirydate"].ToString();
                    uobj.createddate = row["createddate"].ToString();
                    lobj.Add(uobj);
                }
            }
            return lobj;
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

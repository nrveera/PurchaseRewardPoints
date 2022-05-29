using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Reward.Data.Model;
using Reward.Data.Interface;
using Reward.Data.Repository;
namespace PurchaseRewardPoints.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class PurchaseRewardPointsController : Controller
    {
        private IRewardPoints rpoints = new RewardPointsRepository();
        /// <summary>
        /// This method calculate the reward points.
        /// <param name="PurchaseAmount">Amount in float value</param>
        /// <returns>
        /// returns the rewardpoint with purchase amount,
        /// </returns>
        /// </summary>
        [HttpGet]
        [Route("api/[controller]/GetRewardPointsByAmount")]
        public ActionResult<RewardPoints> GetRewardPointsByAmount(float PurchaseAmount)
        {
            return rpoints.GetRewardPoints(PurchaseAmount);
        }
        [HttpGet]
        [Route("api/[controller]/AddUserRewardDetails")]
        public ActionResult<UserRewardPoints> AddUserRewardDetails(string MobileNo, string PurchaseAmount)
        {
            UserDetails cobj = new UserDetails();
            cobj.ctype = "addpurchase";
            cobj.usermobile = MobileNo;
            cobj.purchaseamount = PurchaseAmount;
           // UserRewardPoints aa = rpoints.GetUserRewardDetails(cobj);
           return rpoints.GetUserRewardDetails(cobj);
        }
        [HttpGet]
        [Route("api/[controller]/GetUserRewardDetails")]
        public ActionResult<UserRewardPoints> GetUserRewardDetails(string MobileNo)
        {
            UserDetails cobj = new UserDetails();
            cobj.ctype = "getbymobile";
            cobj.usermobile = MobileNo;
            return rpoints.GetUserRewardDetails(cobj); ;
        }
        [HttpGet]
        [Route("api/[controller]/GetRewardPointsHistory")]
        public ActionResult<List<RewardPointsHistory>> GetRewardPointsHistory(string MobileNo)
        {
            UserDetails cobj = new UserDetails();
            cobj.ctype = "gethistorybymobile";
            cobj.usermobile = MobileNo;
            return rpoints.GetRewardHistory(cobj); ;
        }


    }
}

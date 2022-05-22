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
        public ActionResult<RewardPoints> GetRewardPointsByAmount(float PurchaseAmount)
        {
            return rpoints.GetRewardPoints(PurchaseAmount);
        }
    }
}

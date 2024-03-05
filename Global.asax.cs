using Dtm.Framework.ClientSites.Web;
using Dtm.Framework.Models;
using System;

namespace CDDAHDS
{
    public class MvcApplication : ClientSiteApplication
    {
        protected override void OnAppStart()
        {
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("SAVE15", PromoCodeRuleType.AddDiscountPercent, "SAVE15", .15m, 1));
        }
    }
}
//------------------------------------------------------------------------------
// The contents of this file are subject to the nopCommerce Public License Version 1.0 ("License"); you may not use this file except in compliance with the License.
// You may obtain a copy of the License at  http://www.nopCommerce.com/License.aspx. 
// 
// Software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. 
// See the License for the specific language governing rights and limitations under the License.
// 
// The Original Code is nopCommerce.
// The Initial Developer of the Original Code is NopSolutions.
// All Rights Reserved.
// 
// Contributor(s): _______. 
//------------------------------------------------------------------------------

using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Globalization;
using System.Text;
using System.Threading;
using System.Web;
using System.Web.Caching;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using AjaxControlToolkit;
using NopSolutions.NopCommerce.BusinessLogic;
using NopSolutions.NopCommerce.BusinessLogic.Configuration.Settings;
using NopSolutions.NopCommerce.BusinessLogic.Content.NewsManagement;
using NopSolutions.NopCommerce.BusinessLogic.Content.Polls;
using NopSolutions.NopCommerce.Common.Utils;
using NopSolutions.NopCommerce.BusinessLogic.Banner;

namespace NopSolutions.NopCommerce.Web
{
    public partial class Default : BaseNopPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindData();
            }
        }

        protected void BindData()
        {
            //bool showCategoriesOnMainPage = SettingManager.GetSettingValueBoolean("Display.ShowCategoriesOnMainPage");
            //if (showCategoriesOnMainPage)
            //    ctrlHomePageCategories.ParentCategoryID = 0;
            //else
            //    ctrlHomePageCategories.Visible = false;

            //bool showBestSellersOnMainPage = SettingManager.GetSettingValueBoolean("Display.ShowBestsellersOnMainPage");
            //ctrlBestSellers.Visible = showBestSellersOnMainPage;

            //if (NewsManager.NewsEnabled && NewsManager.ShowNewsOnMainPage)
            //{
            //    ctrlNewsList.NewsCount = NewsManager.MainPageNewsCount;
            //}
            //else
            //{
            //    ctrlNewsList.Visible = false;
            //}

            //bool showPollsOnMainPage = SettingManager.GetSettingValueBoolean("Display.ShowPollsOnMainPage");
            //ctrlTodaysPoll.Visible = showPollsOnMainPage;

            //bool showWelcomeMessageOnMainPage = SettingManager.GetSettingValueBoolean("Display.ShowWelcomeMessageOnMainPage");
            //if (!showWelcomeMessageOnMainPage)
            //{
            //    topicHomePageText.Visible = false;
            //}
            BannerCollection collection = BannerManager.GetAllBanner();

            bool showBannerOnMainPage = SettingManager.GetSettingValueBoolean("Media.Banner.EnableHomepageBanner") && (collection.FindAll(IsPublished).FindAll(IsHomepage).Count >= 1);           
            
            HomePageBanner.Visible = showBannerOnMainPage;
        }

        static bool IsPublished(Banner x)
        {
            return x.IsPublish;
        }

        static bool IsHomepage(Banner x)
        {
            return x.Position == 2;
        }
    }
}
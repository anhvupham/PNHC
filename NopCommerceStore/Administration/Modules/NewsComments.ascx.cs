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
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using NopSolutions.NopCommerce.BusinessLogic.Content.NewsManagement;
using NopSolutions.NopCommerce.BusinessLogic.CustomerManagement;
using NopSolutions.NopCommerce.Common.Utils;
 
namespace NopSolutions.NopCommerce.Web.Administration.Modules
{
    public partial class NewsCommentsControl : BaseNopAdministrationUserControl
    {
        protected void btnEditNewsComment_Click(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                int newsCommentID = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("NewsCommentDetails.aspx?NewsCommentID=" + newsCommentID.ToString());
            }
        }

        protected void btnDeleteNewsComment_Click(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                int newsCommentID = Convert.ToInt32(e.CommandArgument);
                NewsManager.DeleteNewsComment(newsCommentID);
                BindData();
            }
        }

        protected void lvNewsComments_OnPagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            this.pagerNewsComments.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            BindData();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                BindData();
        }

        protected string GetCustomerInfo(int CustomerID)
        {
            string customerInfo = string.Empty;
            Customer customer = CustomerManager.GetCustomerByID(CustomerID);
            if (customer != null)
            {
                if (customer.IsGuest)
                {
                    customerInfo = string.Format("<a href=\"CustomerDetails.aspx?CustomerID={0}\">{1}</a>", customer.CustomerID, GetLocaleResourceString("Admin.NewsComments.Customer.Guest"));
                }
                else
                {
                    customerInfo = string.Format("<a href=\"CustomerDetails.aspx?CustomerID={0}\">{1}</a>", customer.CustomerID, Server.HtmlEncode(customer.Email));
                }
            }
            return customerInfo;
        }

        protected void BindData()
        {
            NewsCommentCollection newsCommentCollection = null;
            if (this.NewsID > 0)
                newsCommentCollection = NewsManager.GetNewsCommentsByNewsID(NewsID);
            else
                newsCommentCollection = NewsManager.GetAllNewsComments();
            lvNewsComments.DataSource = newsCommentCollection;
            lvNewsComments.DataBind();
        }

        public int NewsID
        {
            get
            {
                return CommonHelper.QueryStringInt("NewsID");
            }
        }
    }
}
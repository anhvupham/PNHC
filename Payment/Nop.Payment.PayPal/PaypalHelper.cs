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
using System.Collections.Generic;
using System.Text;
using NopSolutions.NopCommerce.BusinessLogic.Directory;
using NopSolutions.NopCommerce.Payment.Methods.PayPal.PayPalSvc;
using NopSolutions.NopCommerce.BusinessLogic.Orders;

namespace NopSolutions.NopCommerce.Payment.Methods.PayPal
{
    /// <summary>
    /// Represents paypal helper
    /// </summary>
    public class PaypalHelper
    {
        /// <summary>
        /// Get Paypal currency code
        /// </summary>
        /// <param name="currency">Currency</param>
        /// <returns>Paypal currency code</returns>
        public static CurrencyCodeType GetPaypalCurrency(Currency currency)
        {
            CurrencyCodeType currencyCodeType = CurrencyCodeType.USD;
            try
            {
                currencyCodeType = (CurrencyCodeType)Enum.Parse(typeof(CurrencyCodeType), currency.CurrencyCode, true);
            }
            catch 
            {
            }
            return currencyCodeType;
        }

        /// <summary>
        /// Checks response
        /// </summary>
        /// <param name="abstractResponse">response</param>
        /// <param name="errorMsg">Error message if exists</param>
        /// <returns>True - response OK; otherwise, false</returns>
        public static bool CheckSuccess(AbstractResponseType abstractResponse, out string errorMsg)
        {
            bool success = false;
            StringBuilder sb = new StringBuilder();
            switch (abstractResponse.Ack)
            {
                case AckCodeType.Success:
                case AckCodeType.SuccessWithWarning:
                    success = true;
                    break;
                default:
                    break;
            }
            if (null != abstractResponse.Errors)
            {
                foreach (ErrorType errorType in abstractResponse.Errors)
                {
                    if (sb.Length <= 0)
                    {
                        sb.Append(Environment.NewLine);
                    }
                    sb.Append("LongMessage: ").Append(errorType.LongMessage).Append(Environment.NewLine);
                    sb.Append("ShortMessage: ").Append(errorType.ShortMessage).Append(Environment.NewLine);
                    sb.Append("ErrorCode: ").Append(errorType.ErrorCode).Append(Environment.NewLine);
                }
            }
            errorMsg = sb.ToString();
            return success;
        }
    }
}


<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.ProductEmailAFriend"
    CodeBehind="ProductEmailAFriend.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="EmailTextBox" Src="~/Modules/EmailTextBox.ascx" %>
<div class="emailafriendBox">
    <div class="title">
        <%=GetLocaleResourceString("Products.EmailAFriend")%>
    </div>
    <div class="clear">
    </div>
    <div class="sendEmail">
        <p>
            <asp:HyperLink ID="hlProduct" runat="server" CssClass="product" />
        </p>
        <p>
            <asp:Label ID="lShortDescription" runat="server" CssClass="description" />
        </p>
        <p>
            <asp:Label runat="server" ID="lblEmailAFriend" CssClass="confirm" />
        </p>
        <table>
            <tr>
                <td style="width: 100px; text-align: left; vertical-align: middle;">
                    <%=GetLocaleResourceString("Products.FriendEmail")%>:
                </td>
                <td>
                    <nopCommerce:EmailTextBox runat="server" ID="txtFriendsEmail" ValidationGroup="ProductEmail"
                        Width="250px"></nopCommerce:EmailTextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 100px; text-align: left; vertical-align: middle;">
                    <%=GetLocaleResourceString("Products.EmailAFriend.YourEmailAddress")%>:
                </td>
                <td>
                    <asp:Label runat="server" ID="lblFrom"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 100px; text-align: left; vertical-align: middle;">
                    <%=GetLocaleResourceString("Products.EmailAFriend.PersonalMessage")%>:
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtPersonalMessage" TextMode="MultiLine" Height="150px"
                        Width="250px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td style="text-align: left; vertical-align: middle;">
                    <asp:Button runat="server" ID="btnEmail" Text="<% $NopResources:Products.EmailAFriendButton %>"
                        ValidationGroup="ProductEmail" OnClick="btnEmail_Click"  />
                </td>
            </tr>
        </table>
    </div>
</div>

<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Administration.Modules.ProductsControl"
    CodeBehind="Products.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="ToolTipLabel" Src="ToolTipLabelControl.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="SelectCategoryControl" Src="SelectCategoryControl.ascx" %>
<div class="section-header">
    <div class="title">
        <img src="Common/ico-catalog.png" alt="<%=GetLocaleResourceString("Admin.Products.ManageProducts")%>" />
        <%=GetLocaleResourceString("Admin.Products.ManageProducts")%>
    </div>
    <div class="options">
        <asp:Button ID="SearchButton" runat="server" Text="<% $NopResources:Admin.Products.SearchButton.Text %>"
            CssClass="adminButtonBlue" OnClick="SearchButton_Click" ToolTip="<% $NopResources:Admin.Products.SearchButton.Tooltip %>" />
        <asp:Button runat="server" Text="<% $NopResources:Admin.Products.ExportXMLButton.Text %>"
            CssClass="adminButtonBlue" ID="btnExportXML" OnClick="btnExportXML_Click" ValidationGroup="ExportXML"
            ToolTip="<% $NopResources:Admin.Products.ExportXMLButton.Tooltip %>" Visible="false" />
        <asp:Button runat="server" Text="<% $NopResources:Admin.Products.ExportXLSButton.Text %>"
            CssClass="adminButtonBlue" ID="btnExportXLS" OnClick="btnExportXLS_Click" ValidationGroup="ExportXLS"
            ToolTip="<% $NopResources:Admin.Products.ExportXLSButton.Tooltip %>" Visible="false" />
        <asp:Button runat="server" Text="<% $NopResources:Admin.Products.ImportXLSButton.Text %>"
            CssClass="adminButtonBlue" ID="btnImportXLS" OnClick="btnImportXLS_Click" ToolTip="<% $NopResources:Admin.Products.ImportXLSButton.Tooltip %>" Visible="false" />
        <input type="button" onclick="location.href='ProductAdd.aspx'" value="<%=GetLocaleResourceString("Admin.Products.AddButton.Text")%>"
            id="btnAddNew" class="adminButtonBlue" title="<%=GetLocaleResourceString("Admin.Products.AddButton.Tooltip")%>" />
    </div>
</div>
<table width="100%">
    <tr>
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="lblProductName" Text="<% $NopResources:Admin.Products.ProductName %>"
                ToolTip="<% $NopResources:Admin.Products.ProductName.Tooltip %>" ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox ID="txtProductName" CssClass="adminInput" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="lblCategory" Text="<% $NopResources:Admin.Products.Category %>"
                ToolTip="<% $NopResources:Admin.Products.Category.Tooltip %>" ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <nopCommerce:SelectCategoryControl ID="ParentCategory" CssClass="adminInput" runat="server">
            </nopCommerce:SelectCategoryControl>
        </td>
    </tr>
    <tr style="display:none">
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="lblManufacturer" Text="<% $NopResources:Admin.Products.Manufacturer %>"
                ToolTip="<% $NopResources:Admin.Products.Manufacturer.Tooltip %>" ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:DropDownList ID="ddlManufacturer" runat="server" CssClass="adminInput">
            </asp:DropDownList>
        </td>
    </tr>
</table>
<p>
</p>
<asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="False" Width="100%"
    OnPageIndexChanging="gvProducts_PageIndexChanging" AllowPaging="true" PageSize="15">
    <Columns>
        <asp:BoundField DataField="ProductID" HeaderText="Product ID" Visible="False"></asp:BoundField>
        <asp:TemplateField HeaderText="<% $NopResources:Admin.Products.Name %>" ItemStyle-Width="70%">
            <ItemTemplate>
                <%#Server.HtmlEncode(Eval("Name").ToString())%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="<% $NopResources:Admin.Products.Published %>" HeaderStyle-HorizontalAlign="Center"
            ItemStyle-Width="15%" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <nopCommerce:ImageCheckBox runat="server" ID="cbPublished" Checked='<%# Eval("Published") %>'>
                </nopCommerce:ImageCheckBox>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="<% $NopResources:Admin.Products.Edit %>" HeaderStyle-HorizontalAlign="Center"
            ItemStyle-Width="15%" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <a href="ProductDetails.aspx?ProductID=<%#Eval("ProductID")%>" title="<%#GetLocaleResourceString("Admin.Products.Edit.Tooltip")%>">
                    <%#GetLocaleResourceString("Admin.Products.Edit")%>
                </a>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
<br />
<asp:Label runat="server" ID="lblNoProductsFound" Text="<% $NopResources: Admin.Products.NoProductsFound%>"
    Visible="false"></asp:Label>
<ajaxToolkit:ConfirmButtonExtender ID="cbeImportXLS" runat="server" TargetControlID="btnImportXLS"
    DisplayModalPopupID="mpeImportXLS" />
<ajaxToolkit:ModalPopupExtender runat="server" ID="mpeImportXLS" TargetControlID="btnImportXLS"
    OkControlID="btnImportXLSOk" CancelControlID="btnImportXLSCancel" PopupControlID="pnlImportXLSPopupPanel"
    BackgroundCssClass="modalBackground" />
<asp:Panel runat="server" ID="pnlImportXLSPopupPanel" Style="display: none; width: 250px;
    background-color: White; border-width: 2px; border-color: Black; border-style: solid;
    padding: 20px;">
    <div style="text-align: center;">
        <%=GetLocaleResourceString("Admin.Products.ImportXLS.ExcelFile")%>
        <asp:FileUpload runat="server" ID="fuXlsFile" />
        <asp:Button ID="btnImportXLSOk" runat="server" Text="<% $NopResources:Admin.Common.OK %>"
            CssClass="adminButton" CausesValidation="false" />
        <asp:Button ID="btnImportXLSCancel" runat="server" Text="<% $NopResources:Admin.Common.Cancel %>"
            CssClass="adminButton" CausesValidation="false" />
    </div>
</asp:Panel>

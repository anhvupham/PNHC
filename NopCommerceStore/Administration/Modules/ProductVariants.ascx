<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Administration.Modules.ProductVariantsControl"
    CodeBehind="ProductVariants.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="NumericTextBox" Src="NumericTextBox.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="SimpleTextBox" Src="SimpleTextBox.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="ToolTipLabel" Src="ToolTipLabelControl.ascx" %>
<table class="adminContent">
    <tr>
        <td width="100%">
            <asp:GridView ID="gvProductVariants" runat="server" AutoGenerateColumns="false" Width="100%">
                <Columns>
                    <asp:TemplateField HeaderText="<% $NopResources:Admin.Product.ProductVariants.Name %>"
                        ItemStyle-Width="35%">
                        <ItemTemplate>
                            <%#Server.HtmlEncode(GetProductVariantName(Container.DataItem as ProductVariant))%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField Visible="false" DataField="SKU" HeaderText="<% $NopResources:Admin.Product.ProductVariants.SKU %>"
                        HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="15%" ItemStyle-HorizontalAlign="Center">
                    </asp:BoundField>
                    <asp:BoundField DataField="Price" HeaderText="<% $NopResources:Admin.Product.ProductVariants.Price %>"
                        HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
                    </asp:BoundField>
                    <asp:BoundField Visible="false" DataField="StockQuantity" HeaderText="<% $NopResources:Admin.Product.ProductVariants.StockQuantity %>"
                        HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
                    </asp:BoundField>
                    <asp:BoundField Visible="false" DataField="DisplayOrder" HeaderText="<% $NopResources:Admin.Product.ProductVariants.DisplayOrder %>"
                        HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="<% $NopResources:Admin.Product.ProductVariants.Published %>"
                        HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <nopCommerce:ImageCheckBox runat="server" ID="cbPublished" Checked='<%# Eval("Published") %>'>
                            </nopCommerce:ImageCheckBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="<% $NopResources:Admin.Product.ProductVariants.View %>"
                        HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <a href='ProductVariantDetails.aspx?ProductVariantID=<%#Eval("ProductVariantID")%>'
                                title="<%#GetLocaleResourceString("Admin.Product.ProductVariants.View")%>">
                                <%#GetLocaleResourceString("Admin.Product.ProductVariants.View")%></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </td>
    </tr>
</table>
<p>
    <input style="display:none" type="button" onclick="location.href='ProductVariantAdd.aspx?ProductID=<%=ProductID%>'"
        value="<%=GetLocaleResourceString("Admin.Product.ProductVariants.AddButton.Text")%>"
        id="btnAddNewVariant" class="adminButton" title="<%=GetLocaleResourceString("Admin.Product.ProductVariants.AddButton.Tooltip")%>" />
</p>

<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="CDDAHDS.Navigation" %>

<%
    string productName = SettingsManager.ContextSettings["Label.ProductName"];

    NavigationList sitemap = (ViewData["Sitemap"] as Sitemap ?? new Sitemap()).SitemapList;
    NavigationItem index = sitemap.GetItemById("index");
%>

<footer id="footer" aria-label="Social media, shop, help and special offers" class="view footer section @print-only-hide">
    <div class="view__in footer__in section__in">
        <div class="footer__group">
			<div class="footer__logo-product-name">
				<div class="section__block">
					<div class="footer footer--logo-product-name">
						<div class="footer__group">
							<a href="<%= index.Page %>" class="footer__logo">
								<img src="/images/Site1/logo.svg" alt="<%= productName %>" />
							</a>
							<div class="footer__product-name">
								<b><span>Power</span><span>Sheets<sup>&trade;</sup></span></b>
								<span>laundry detergent</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="footer__nav">
				<%= Html.Partial("SitemapList") %>
			</div>
        </div>
    </div>  
</footer>

<svg hidden>

</svg>

<% 
	if (DtmContext.Page.IsStartPageType) 
	{ 
		Html.RenderPartial("Scripts");
		Html.RenderSnippet("ORDERFORMSCRIPT");
		%>
		<script>
			const setBraintreeHostedFieldsStyles = function () {
				return {
					'font-size': 'max(16px, 1.1875rem)',
					'font-family': 'Helvetica, Arial, sans-serif',
					'font-weight': 'normal',
					'line-height': 'normal',
					'color': '#333',
				};
			};
		</script>
		<%
	}
%>

<%= Model.FrameworkVersion %>

<div hidden>
  <% 
	  Html.RenderSiteControls(SiteControlLocation.ContentTop);
	  Html.RenderSiteControls(SiteControlLocation.ContentBottom);
	  Html.RenderSiteControls(SiteControlLocation.PageBottom);
  %>
</div>
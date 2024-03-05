<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="CDDAHDS.Navigation" %>
<%@ Import Namespace="CDDAHDS.UIComponents" %>

<%
    bool isStartPage = DtmContext.Page.IsStartPageType && DtmContext.PageCode != "PaymentForm";

    string productAttributeName = SettingsManager.ContextSettings["Label.ProductName"];
    string productName = productAttributeName;

    NavigationList sitemap = (ViewData["Sitemap"] as Sitemap ?? new Sitemap()).SitemapList;
    NavigationItem index = sitemap.GetItemById("home");

    string logo = string.Format(@"<img src=""/images/Site1/logo.svg"" alt=""{0}"" width=""251"" height=""247"">", productAttributeName);

    if (isStartPage)
    {
        logo = string.Format(@"
            <a 
                href=""{0}"" 
                id=""navbar-logo"" 
                class=""nav__logo"" 
                aria-label=""{1}"">
                {2}
            </a>
        ", index.Page, productAttributeName, logo);
    }
    else
    {
        logo = string.Format(@"
            <div class=""nav__logo"">{0}</div>
        ", logo);
    }

    string logoTagline = string.Format(@"
        <div class=""nav__logo-tagline"">
            {0}
        </div>
    ", logo);

    string navClassList = string.Format(@"section nav {0}", isStartPage ? "nav--is-start-page" : "nav--is-end-page");

	var promoHeader = false;
%>

<% if (isStartPage) { %>
	<div data-nav-tracker></div>
<% } %>
	
<nav id="nav" aria-label="Website page links" class="<%= navClassList %>">
	<span class="skip-link delay-render">
		<a href="#main" class="skip-link__button" id="skip-link"><span>Skip To Main Content?</span></a>
	</span>

	<% if (isStartPage) { %>
	<div class="promo-banner">
		<% if (promoHeader) { %>
		<div class="promo-banner__group">
			<div class="promo-banner__promo">
				<div class="promo-banner__offer">
					Special Offer <b>Get 15% Off</b>
				</div>
			</div>
			<div class="promo-banner__callout">Your Order Today With Promo Code: <b>SAVE15</b></div>
		</div>
		<% } else { %>
		<div class="promo-banner__callout">ONLINE EXCLUSIVE OFFER WITH <b>FREE SHIPPING</b></div>
		<% } %>
	</div>

	<template data-modal-dialog-template>
		<section id="first-order-disclaimer-container" aria-labelledby="first-order-disclaimer-title" data-modal-dialog-title="10% Off First Order Disclaimer" data-modal-dialog-container class="view content content--modal section">
			<div id="first-order-disclaimer" class="view__anchor"></div>
			<div class="view__in content__text section__in">
				<h2 id="first-order-disclaimer-title">Disclaimer</h2>
				<div class="content__text">
					
				</div>
			</div>
		</section>
	</template>
	<% } %>

	<div class="section__in nav__in nav__group">
		<%= logo %>

		<% if (isStartPage) { %>
		<%
			OrderButton orderButton = new OrderButton();

			Response.Write(orderButton.CreateHTML(orderButton.Text, string.Format("{0} nav__order", orderButton.ClassList)));
		%>
		<button type="button" class="nav__label" aria-label="Toggle Menu">
			<span></span>
		</button>
		<div class="nav__underlay"></div>
		<div class="nav__pane">
			<div class="nav__list">
				<%
					Response.Write(logo.Replace("navbar-logo", "navbar-header-logo"));

					Func<List<string>, string> renderNavigationLinks = ((List<string> ids) =>
					{
						string HTML = string.Empty;

						List<NavigationItem> candidates = sitemap.GetItemsByIdRange(ids);

						candidates.ForEach(candidate =>
						{
							if (candidate.IsExternal)
							{
								HTML += string.Format(@"<a class=""nav__link link"" href=""{0}"" target=""_blank"">{1}<span class=""link__advisal""> <span class=""link__container"">Opens in a new window</span></span></a>", candidate.Page, candidate.Name);
							}
							else
							{
								HTML += string.Format(@"<a href=""{0}"" class=""nav__link""><span>{1}</span></a>", candidate.Page, candidate.Name);
							}
						});

						return HTML;
					});
					
					Response.Write(renderNavigationLinks(new List<string> {
						"home",
						"products",
						"buy",
						"mission",
						"faq",
						"reviews",
						"terms",
						"privacy-policy",
						"customer-service",
						"sitemap"
                    }));
				%>
			</div>
		</div>
		<% } %>
	</div>
</nav>
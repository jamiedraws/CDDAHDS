<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="CDDAHDS.Navigation" %>

<%
	var isStartPage = DtmContext.Page.IsStartPageType;

	var productAttributeName = SettingsManager.ContextSettings["Label.ProductName"];
	var productName = productAttributeName;

	var sitemap = new Sitemap();
	var sitemapList = sitemap.SitemapList;
	var homeLink = sitemapList.GetItemById("home");

	string logoLink = isStartPage ? homeLink.Page : "";

	// define the HTML template for the logo
	string logoTemplate = @"<a href=""{0}"" aria-label=""{1}"" class=""logo-text__group"">
		<img class=""logo-text__logo"" src=""/images/Site1/logo.svg"" alt=""{1}"" width=""283"" height=""102"">
	</a>";

	// merge the HTML template with the appropriate link and the product name
	string logo = string.Format(logoTemplate, logoLink, productName);

	var navClassList = "view nav section @print-only-hide";

	if (DtmContext.PageCode.Equals("Index"))
    {
		navClassList = String.Format("{0} nav--index", navClassList);
    }
%>

<nav id="nav" aria-label="Website pages links" class="<%= navClassList %>">
	<div class="view__in nav__group nav__in section__in">
		<div class="nav__logo">
			<%= logo %>
		</div>
		<% if (isStartPage) { %>
		<button type="button" class="nav__label" aria-label="Toggle Menu">
			<span></span>
		</button>
		<div class="nav__underlay nav__underlay--for-drawer" role="presentation"></div>
		<div class="nav__pane">
			<div class="nav__group">
				<div class="nav__list nav__tier-first">
					<div class="nav__logo">
						<%= logo.Replace("navbar-logo", "navbar-header-logo") %>
					</div>
					<%
						var navLinks = sitemapList.GetItemsByIdRange(new List<string> { 
							"home",
							"reviews",
							"customer-service",
                            "order-now"
						});

						foreach (var navLink in navLinks)
						{
							var name = string.IsNullOrEmpty(navLink.Label) ? navLink.Name : navLink.Label;
							%>
							<a class="nav__link" href="<%= navLink.Page %>" id="nav-<%= navLink.Id %>">
								<span><%= name %></span>
							</a>
							<%
						}
					%>
				</div>
			</div>
		</div>
		<% } %>
	</div>
</nav>
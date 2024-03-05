<%@ Page Language="C#" MasterPageFile="~/VersionViews/99.0000/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="CDDAHDS.Models" %>
<%@ Import Namespace="CDDAHDS.UIComponents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<%
	string productName = SettingsManager.ContextSettings["Label.ProductName"];

	OrderButton orderButton = ViewData["OrderButton"] as OrderButton ?? new OrderButton();
%>

<main aria-labelledby="main-title" class="view main-offer section">
	<div id="main" class="view__anchor"></div>
	<picture class="main-offer__bkg">
		<source srcset="/images/Site1/bkg-water-splash.webp" type="image/webp">
		<img src="/images/Site1/bkg-water-splash.png" alt="" role="presentation">
	</picture>
	<div class="view__in main-offer__in section__in">
		<div class="main-offer__grid">
			<h1 id="main-title" class="main-offer__title">
				<span>Introducing</span>
				<b>
					<span>Power</span>
					<span>Sheets<sup>&trade;</sup></span>
				</b>
				<span>laundry detergent</span>
			</h1>

			<div class="main-offer__text">
				<p class="main-offer__desc">A powerful, deep clean without the plastic laundry bottle mess and waste</p>
				<b class="main-offer__callout">Includes 50 Pre-Measured Sheets.</b>
			</div>

			<div class="main-offer__price-button">
				<div class="main-offer__group">
					<div class="main-offer__price">$11.99</div>
					<div class="main-offer__price-info">
						<b>($0.24/load)</b>
						<span>Free Shipping</span>
					</div>
					<div class="main-offer__button">
						<%= orderButton.CreateHTML() %>
					</div>
				</div>
			</div>

			<picture class="main-offer__picture">
				<source srcset="/images/Site1/product.webp" type="image/webp">
				<img src="/images/Site1/product.png" alt="<%= productName %> beauty shot" width="621" height="1098">
			</picture>
		</div>
	</div>
</main>

<div class="bkg container">
	<section aria-labelledby="product-features-title" class="view product-features section">
		<div id="product-features" class="view__anchor"></div>
		<picture class="product-features__bkg">
			<source srcset="/images/Site1/bkg-product-water-splash.webp" type="image/webp">
			<img src="/images/Site1/bkg-product-water-splash.png" alt="" role="presentation">
		</picture>
		<div class="view__in product-features__in section__in">
			<div class="product-features__grid">
				<h2 id="product-features-title" class="product-features__title"><span>Say goodbye</span> to mess, hello to convenience</h2>
				<div class="product-features__image-text">
					<picture class="product-features__image">
						<img src="/images/Site1/water-drop-badge.svg" alt="Quick Dissolve Technology" loading="lazy" width="240" height="240">
					</picture>
					<p class="product-features__text"><b>Quick Dissolve Technology</b> to melt instantly and fully, even in cold water and deliver a deep clean in high efficiency washing machines</p>
				</div>
				<ul class="product-features__list">
					<li>No Drips, No Spills</li>
					<li>Plastic Free Package</li>
					<li>50 Pre-measured Sheets</li>
					<li>Works With All Wash Temperatures</li>
				</ul>
			</div>
		</div>
	</section>
</div>

<section aria-labelledby="use-title" class="view use section">
	<div id="use" class="view__anchor"></div>
	<div class="view__in section__in">
		<div class="use__grid">
			<h2 id="use-title" class="use__title">Easy To Use:</h2>
			<p class="use__desc">Simply drop 1 sheet in for medium loads, or 2 sheets for large or heavily soiled loads. Then add in laundry, wash as normal, and get the deep clean you deserve.</p>
			<div class="use__carousel">
				<ul class="use__list">
					<li>
						<img src="/images/Site1/step-1.svg" alt="Place 1 sheet into the washing machine" width="458" height="390" loading="lazy">
					</li>
					<li>
						<img src="/images/Site1/step-2.svg" alt="Washing the laundry" width="458" height="390" loading="lazy">
					</li>
					<li>
						<img src="/images/Site1/step-3.svg" alt="Spinning the load inside the laundry machine" width="458" height="390" loading="lazy">
					</li>
				</ul>
			</div>
		</div>
	</div>
</section>

<section aria-label="Arm & Hammer" class="view brand-desc section">
	<div class="view__anchor" id="brand-desc"></div>
	<div class="brand-desc">
		<div class="brand-desc__group">
			<div class="brand-desc__logo">
				<img src="/images/Site1/logo.svg" alt="Power Sheets™" width="464" height="456">
			</div>
			<div class="brand-desc__text">
				<div class="brand-desc__desc">
					<p>Made with the same type of powerful cleaning ingredients as our liquid detergent for the trusted clean you expect from ARM & HAMMER<sup>&trade;</sup> Laundry.</p>
				</div>
			</div>
		</div>
	</div>
</section>

</asp:Content>
<%@ Page Language="C#" MasterPageFile="~/VersionViews/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="CDDAHDS.Models" %>
<%@ Import Namespace="CDDAHDS.Text" %>
<%@ Import Namespace="CDDAHDS.UIComponents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<%
	string productName = SettingsManager.ContextSettings["Label.ProductName"];

	OrderButton orderButton = ViewData["OrderButton"] as OrderButton ?? new OrderButton();

	string price = "$12.99";
	string loadPrice = "$0.26";
	bool hasPromo = false;

	if (DtmContext.Version == 2 || DtmContext.Version == 4) {
		price = "$14.99";
		loadPrice = "$0.30";	
	}

	if (DtmContext.Version == 3) {
		price = "$11.99";
		loadPrice = "$0.24";	
	}
	
	if (DtmContext.Version == 4) {
		hasPromo = true;	
	}

%>

<main aria-labelledby="main-title" class="view main-offer section">
	<div id="main" class="view__anchor"></div>
	<picture class="main-offer__bkg main-offer__bkg--fade">
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
				<b class="main-offer__callout">Includes 50 Pre-Measured Sheets</b>
				<b class="main-offer__callout">With a fresh linen scent</b>
			</div>

			<div class="main-offer__price-button">
				<div class="main-offer__group">
					<div class="main-offer__price"><%= price %></div>
					<div class="main-offer__price-info">
						<b>(<%= loadPrice %>/load)</b>
						<span>Free Shipping</span>
					</div>
					<div class="main-offer__button">
						<%= orderButton.CreateHTML() %>
					</div>
				</div>
			</div>

			<% if (hasPromo) { %>
			<small class="main-offer__promo-disclaimer">Clip our <b>$2 digital coupon</b> at checkout to save more today!</small>
			<% } %>

			<picture class="main-offer__picture main-offer__picture--with-pop">
				<source srcset="/images/Site1/product-with-pop.webp" type="image/webp">
				<img src="/images/Site1/product-with-pop.png" alt="<%= productName %> beauty shot" width="663" height="972">
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
		<div class="view__in section__in">
			<div class="product-features__grid">
				<h2 id="product-features-title" class="product-features__title"><span>Say goodbye</span> to mess, hello to convenience</h2>
				<div class="product-features__image-text">
					<picture class="product-features__image">
						<img src="/images/Site1/water-drop-badge.svg" alt="Quick Dissolve Technology" loading="lazy" width="240" height="240">
					</picture>
					<p class="product-features__text"><b>Quick Dissolve Technology</b> delivers a reliable, deep clean in both standard and high efficiency washing machines, even in cold water!</p>
				</div>
				<ul class="product-features__list">
					<li>No Drips, No Spills</li>
					<li>Recyclable Packaging</li>
					<li>50 Pre-measured Sheets</li>
					<li>Works With All Wash Temperatures</li>
					<li>Free from Phosphates, Bleach, &amp; Brighteners</li>
				</ul>
			</div>
		</div>
	</section>
		
	<section aria-labelledby="product-video-title" class="view product-video section">
		<div id="product-video" class="view__anchor"></div>
		<div class="view__in section__in">
			<div class="section__block">
				<h2 id="product-video-title" class="product-video__title">See it in Action</h2>
			</div>
			<div class="section__block">
				<div class="contain contain--video">
					<iframe loading="lazy" src="https://player.vimeo.com/video/819969281?autopause=0" frameborder="0" allow="fullscreen" title="<%= productName %> video" allowfullscreen></iframe>
				</div>
			</div>
		</div>
	</section>
	
	<!-- <section aria-labelledby="beauty-shot-title" class="view product-beauty-shot section">
		<div id="beauty-shot" class="view__anchor"></div>
		<div class="view__in section__in">
			<div class="section__block">
				<div class="product-beauty-shot__grid">
					<h2 id="beauty-shot-title" class="product-beauty-shot__title">2 Clean Scents</h2>
					<div class="product-beauty-shot__text">
						<ul class="product-beauty-shot__list">
							<li>
								<picture>
									<source srcset="/images/Site1/tab-fresh-linen.webp" type="image/webp">
									<img src="/images/Site1/tab-fresh-linen.png" alt="Fresh Linen" width="467" height="149" loading="lazy">
								</picture>
							</li>
							<li>
								<picture>
									<source srcset="/images/Site1/tab-spring-rain.webp" type="image/webp">
									<img src="/images/Site1/tab-spring-rain.png" alt="Spring Rain" width="438" height="152" loading="lazy">
								</picture>
							</li>
						</ul>
						<div class="product-beauty-shot__button">
							<%= orderButton.CreateHTML() %>
						</div>
					</div>
					<picture class="product-beauty-shot__picture">
						<source srcset="/images/Site1/product-packages.webp">
						<img src="/images/Site1/product-packages.png" alt="">
					</picture>
				</div>
			</div>
		</div>
	</section> -->
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

<%
	List<Review> reviews = Reviews.SubmittedCustomerReviews
		.Where(scr => scr.Location != ReviewLocation.SubPage)
		.Concat(Reviews.CustomerReviews.Where(cr => cr.Location != ReviewLocation.SubPage && cr.Stars == 5))
		.ToList();	

	if (reviews.Count > 0) {
%>
<section aria-labelledby="customer-reviews-title" class="view customer-reviews section">
	<div class="view__anchor" id="customer-reviews"></div>
	<div class="view__in section__in">
		<div class="section__block">
			<h2 id="customer-reviews-title" class="customer-reviews__title">The Power in the Sheet</h2>
		</div>
		<div class="section__block">
			<div class="customer-reviews__reviews slide slide--carousel">
				<div class="slide__into" tabindex="0" id="customer-review-carousel">
					<% reviews.ForEach(review => { %>
					<div class="slide__item">
						<figure class="customer-reviews__review">
							<blockquote><%= review.Blockquote %></blockquote>
							<picture class="customer-reviews__rating">
								<img src="/images/Site1/5-stars.svg" alt="5 Stars" width="399" height="54">
							</picture>
							<figcaption><%= review.Name %></figcaption>
							<small class="customer-reviews__customer-type"><%= Reviews.GetCustomerType(review) %></small>
						</figure>
					</div>
					<% }); %>
				</div>
				<div class="slide__nav">
					<button aria-label="Previous" class="slide__prev" type="button">
						<svg class="icon">
							<use href="#icon-carousel-chevron"></use>
						</svg>
					</button>
					<button aria-label="Next" class="slide__next" type="button">
						<svg class="icon">
							<use href="#icon-carousel-chevron"></use>
						</svg>
					</button>
				</div>
				<svg hidden>
					<symbol id="icon-carousel-chevron" x="0px" y="0px" viewBox="0 0 43 86">
						<polygon points="0,43 43,86 43,0"/>
					</symbol>
				</svg>
			</div>
		</div>
		<div class="section__block">
			<div class="customer-reviews__footer">
				<%= orderButton.CreateHTML() %>
			</div>
		</div>
	</div>
</section>
<% } %>

<section aria-label="Arm &amp; Hammer" class="view brand-desc section">
	<div class="view__anchor" id="brand-desc"></div>
	<div class="brand-desc">
		<div class="brand-desc__group">
			<div class="brand-desc__logo">
				<img src="/images/Site1/logo.svg" alt="Power Sheets&trade;" width="464" height="456">
			</div>
			<div class="brand-desc__text">
				<div class="brand-desc__desc">
					<p>Made with the same type of powerful cleaning ingredients as our liquid detergent for the trusted clean you expect from ARM &amp; HAMMER<sup>&trade;</sup> Laundry.</p>
				</div>
			</div>
		</div>
	</div>
</section>

</asp:Content>
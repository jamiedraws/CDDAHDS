<%@ Page Language="C#" MasterPageFile="~/VersionViews/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="CDDAHDS.Models" %>
<%@ Import Namespace="CDDAHDS.Text" %>
    
    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <%

    var productName = SettingsManager.ContextSettings["Label.ProductName"];

    List<Review> submittedCustomerReviews = Reviews.SubmittedCustomerReviews;

    List<Review> reviews = submittedCustomerReviews
            .Concat(Reviews.CustomerReviews.Where(cr => cr.Location != ReviewLocation.LandingPage))
            .ToList();

    %>

    <main id="main" aria-labelledby="main-title" class="view content content--sub-page content--reviews section">
        <article class="view__in content__in section__in">
            <div class="section__block content__text">

                <h1 id="main-title" class="content__title">Customer Reviews</h1>
       
                <% if (reviews.Count > 0) { %>
                    <% foreach (Review review in reviews) { 
                        int index = reviews.IndexOf(review);
                        bool showMoreContent = review.Blockquote.Contains("{{ShowMore}}");		
                    %>
                    <div class="content__review" itemscope itemtype="http://schema.org/Review">
                        <h3 itemprop="name"><%= review.Title %></h3>
                        <div itemprop="reviewRating" itemscope itemtype="http://schema.org/Rating">
                            <span itemprop="ratingValue"><%= review.Stars %></span> out of <span itemprop="bestRating">5</span>
                        </div>
                        <div class="content__stars content__stars--<%= review.Stars %>">
                            <img src="/images/Site1/5-stars.svg" alt="<%= review.Stars %> out of 5 stars" loading="lazy" width="300" height="52">
                        </div>
                        <p itemprop="reviewBody">
                            <%= review.Blockquote.Replace("{{ShowMore}}", string.Format(@"id=""review-content-{0}"" class=""element-controller__element""", index)) %>
                            <% if (showMoreContent) { %>
                            <!-- <button class="disclosure" id="review-content-button-<%= index %>" aria-controls="review-content-<%= index %>" aria-expanded="false">
                                <span class="disclosure__text-collapsed">Show More</span>
                                <span class="disclosure__text-expanded">Show Less</span>
                            </button> -->
                            <% } %>
                        </p>
                        <p><span itemprop="author"><%= review.Name %></span></p>
                        <div itemprop="itemReviewed" itemscope itemtype="http://schema.org/Product">
                            <h4 itemprop="name"><%= productName %></h4>
                        </div>
                        <small><%= Reviews.GetCustomerType(review) %></small>
                    </div>
                    <% } %>
                <% } %>
                
            </div>
        </article>
    </main>
    
    </asp:Content>
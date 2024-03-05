<%@ Page Language="C#" MasterPageFile="~/VersionViews/99.0000/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="CDDAHDS.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<main aria-labelledby="main-title" class="view content content--sub-page section">
    <div id="main" class="view__anchor"></div>
    <article class="view__in content__in section__in">
        <div class="section__block content__text">
            <h1 id="main-title" class="content__title">Frequently Asked Questions</h1>
            <%
                string productName = SettingsManager.ContextSettings["Label.ProductName"];

                List<FAQ> faqs = new List<FAQ>
                {
                    new FAQ
                    {
                        Question = @"How much product should I use?",
                        Answer = @"<p>1 sheet for medium loads; 2 sheets for large or heavily soiled loads.</p>"
                    },
                    new FAQ
                    {
                        Question = @"Can I put this into my tray/dispenser?",
                        Answer = @"
                            <p>This is designed to be used in the washer drum.</p>
                        "
                    },
                    new FAQ
                    {
                        Question = @"What is Quick Dissolve Technology? ",
                        Answer = @"<p>Laundry detergent sheet dissolves quickly and completely for a deep clean.</p>"
                    },
                    new FAQ
                    {
                        Question = @"What type of water can this be used in?",
                        Answer = @"<p>Dissolves in all temperatures. Use in warm or cold water.</p>"
                    }
                };

            if (faqs.Count > 0) { %>
            <div id="accordion" class="accordion" data-accordion-toggle data-accordion-many-containers itemscope itemtype="https://schema.org/FAQPage">
                <% foreach (FAQ faq in faqs) { 
                    int index = faqs.IndexOf(faq);      
                %>     
                <div class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
                    <div class="accordion__header card__header" itemprop="name">
                        <button type="button" class="accordion__button card__button" aria-controls="faq-section-<%= index %>" id="faq-controller-<%= index %>">
                            <span><%= faq.Question.Replace("{{ProductName}}", productName) %></span>
                            <span class="accordion__icon"></span>
                        </button>
                    </div>
                    <section aria-labelledby="faq-controller-<%= index %>" id="faq-section-<%= index %>" class="card__section accordion__section" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
                        <div class="card__content" itemprop="text">
                            <%= faq.Answer.Replace("{{ProductName}}", productName) %>		
                        </div>
                    </section>
                </div>
                <% } %>
            </div>
           <% } %>
        </div>
    </article>
</main>

</asp:Content>
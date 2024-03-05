<%@ Page Language="C#" MasterPageFile="~/VersionViews/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="Dtm.Framework.Base.Models" %>
<%@ Import Namespace="Dtm.Framework.ClientSites.Web.Models" %>
<%@ Import Namespace="CDDAHDS.Models" %>
<%@ Import Namespace="CDDAHDS.Utils" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<%
    ResourceWriter resourceWriter = new ResourceWriter();

    Response.Write(resourceWriter.WriteStylePreload("css/Site1/review.css"));
%>

<main aria-labelledby="main-title" class="view content content--sub-page section">
    <div id="main" class="view__anchor"></div>
    <div class="view__in section__in">
        <div class="section__block content__text">
            <%
                // Load Group Code
                var groupCode = "REVIEW";

                //Get survey load type
                var loadType = (ViewData["LoadType"] as string ?? "OnLoad");

                CampaignOfferQuestionGroupViewData surveyGroup = Model.QuestionGroups
                    .FirstOrDefault(q => q.Code.Equals(groupCode, StringComparison.InvariantCultureIgnoreCase)) ?? new CampaignOfferQuestionGroupViewData();

                bool hasSurveyGroup = surveyGroup.Id != 0;

                if (hasSurveyGroup)
                {
                    int idleThreshold;
                    int.TryParse(ViewData["IdleThreshold"] as string ?? string.Empty, out idleThreshold);

                    Response.Write(resourceWriter.WriteLink("css/Site1/review.css"));
            %>
            <script
                defer
                src="<%= resourceWriter.AddQueryStringParameterToRelativePathOrDefault("js/Site1/review.es5.js") %>"
                data-context='{ "loadType": "<%= loadType %>", "groupCode": "<%= groupCode %>", "idleThreshold": <%= idleThreshold %>, "visitorSessionId": "<%= DtmContext.VisitorSessionId.ToString() %>", "refire" : true }'></script>

            <form id="product-review-form-group" aria-labelledby="product-review-form-title" class="product-review-form">
                <div class="product-review-form__in">
                    <header class="product-review-form__header">
                        <h1 id="product-review-form-title" class="product-review-form__title"><%= surveyGroup.Title %></h1>
                        <p class="product-review-form__desc"><%= surveyGroup.Description %></p>
                    </header>
                    <fieldset class="product-review-form__fieldset">
                    <%
                        CampaignOfferQuestionViewData rating = surveyGroup.Questions.FirstOrDefault(q => q.Code.Equals("RATING")) ?? new CampaignOfferQuestionViewData();

                        if (rating.Answers.Any())
                        {
                            %>
                            <div class="product-review-form__take-all">
                                <div class="form form--radio-rate">
                                    <div class="form__radio-label message__select">
                                        <div class="form__label"><%= rating.Text %></div>
                                        <%
                                            rating.Answers.ForEach(answer =>
                                            {
                                                string attributeList = string.Format(@"type=""radio"" id=""{0}"" name=""{1}"" value=""{2}"" class=""form__radio""", answer.Code, rating.Details, answer.Text);

                                                if (answer == rating.Answers.First())
                                                {
                                                    attributeList = string.Format(@"{0} required", attributeList);
                                                }
                                                %>
                                                <input <%= attributeList %>>
                                                <%
                                            });
                                        %>
                                        <div class="form__rates">
                                            <%
                                                rating.Answers.ForEach(answer =>
                                                {
                                                    %>
                                                    <label for="<%= answer.Code %>" class="form__rate" aria-label="<%= answer.Text %>"></label>
                                                    <%
                                                });  
                                            %>
                                        </div>
                                    </div>
                                    <div class="message__group" role="alert">
                                        <span class="message__invalid"><%= rating.ErrorMessage %></span>
                                    </div>
                                </div>
                            </div>
                            <%
                        }

                        CampaignOfferQuestionViewData title = surveyGroup.Questions.FirstOrDefault(q => q.Code.Equals("TITLE")) ?? new CampaignOfferQuestionViewData();

                        if (title.Answers.Any())
                        {
                            %>
                            <div class="product-review-form__take-all">
                                <div class="form message">
                                    <div class="form__field-label message__select">
                                        <input type="text" name="<%= title.Details %>" id="<%= title.Code %>" placeholder="<%= title.Placeholder %>" maxlength="100" class="form__field" required>
                                        <label for="<%= title.Code %>" class="message__label"><%= title.Text %></label>
                                    </div>
                                    <span class="message__group" role="alert">
                                        <span class="message__invalid"><%= title.ErrorMessage %></span>
                                    </span>
                                </div>
                            </div>
                            <%
                        }

                        CampaignOfferQuestionViewData review = surveyGroup.Questions.FirstOrDefault(q => q.Code.Equals("REVIEW")) ?? new CampaignOfferQuestionViewData();

                        if (review.Answers.Any())
                        {
                            %>
                            <div class="product-review-form__take-all">
                                <div class="form message">
                                    <div class="form__field-label message__select">
                                        <textarea name="<%= review.Details %>" id="<%= review.Code %>" placeholder="<%= review.Placeholder %>" maxlength="4000" class="form__field" required></textarea>
                                        <label for="<%= review.Code %>" class="message__label"><%= review.Text %></label>
                                    </div>
                                    <span class="message__group" role="alert">
                                        <span class="message__invalid"><%= review.ErrorMessage %></span>
                                    </span>
                                </div>
                            </div>
                            <%
                        }

                        CampaignOfferQuestionViewData email = surveyGroup.Questions.FirstOrDefault(q => q.Code.Equals("EMAIL")) ?? new CampaignOfferQuestionViewData();

                        if (email.Answers.Any())
                        {
                            %>
                            <div class="product-review-form__take-all">
                                <div class="form message">
                                    <div class="form__field-label message__select">
                                        <input type="email" name="<%= email.Details %>" id="<%= email.Code %>" placeholder="<%= email.Placeholder %>" class="form__field">
                                        <label for="<%= email.Code %>" class="message__label"><%= email.Text %></label>
                                    </div>
                                    <span class="message__group" role="alert">
                                        <span class="message__invalid"><%= email.ErrorMessage %></span>
                                    </span>
                                </div>
                            </div>
                            <%
                        }

                        CampaignOfferQuestionViewData firstname = surveyGroup.Questions.FirstOrDefault(q => q.Code.Equals("FIRSTNAME")) ?? new CampaignOfferQuestionViewData();

                        if (firstname.Answers.Any())
                        {
                            %>
                            <div class="product-review-form__take-some">
                                <div class="form message">
                                    <div class="form__field-label message__select">
                                        <input type="text" name="<%= firstname.Details %>" id="<%= firstname.Code %>" placeholder="<%= firstname.Placeholder %>" class="form__field">
                                        <label for="<%= firstname.Code %>" class="message__label"><%= firstname.Text %></label>
                                    </div>
                                    <span class="message__group" role="alert">
                                        <span class="message__invalid"><%= firstname.ErrorMessage %></span>
                                    </span>
                                </div>
                            </div>
                            <%
                        }

                        CampaignOfferQuestionViewData lastname = surveyGroup.Questions.FirstOrDefault(q => q.Code.Equals("LASTNAME")) ?? new CampaignOfferQuestionViewData();

                        if (lastname.Answers.Any())
                        {
                            %>
                            <div class="product-review-form__take-some">
                                <div class="form message">
                                    <div class="form__field-label message__select">
                                        <input type="text" name="<%= lastname.Details %>" id="<%= lastname.Code %>" placeholder="<%= lastname.Placeholder %>" class="form__field">
                                        <label for="<%= lastname.Code %>" class="message__label"><%= lastname.Text %></label>
                                    </div>
                                    <span class="message__group" role="alert">
                                        <span class="message__invalid"><%= lastname.ErrorMessage %></span>
                                    </span>
                                </div>
                            </div>
                            <%
                        }

                    %>
                        <div class="product-review-form__take-all product-review-form__button">
                            <button type="button" id="submit" class="button">
                                <span>Submit</span>
                            </button>
                        </div>
                    </fieldset>
                </div>
            </form>
            <%
                }
                else
                {
                    new SiteExceptionHandler("No SurveyGroup found");
                }
            %>
        </div>
    </div>
</main>
    
</asp:Content>
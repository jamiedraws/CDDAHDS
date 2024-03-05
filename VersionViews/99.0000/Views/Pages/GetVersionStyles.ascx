<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="CDDAHDS.Utils" %>

<link rel="preconnect" href="https://use.typekit.net/" crossorigin>
<link rel="dns-prefetch" href="https://use.typekit.net/">
<link rel="stylesheet" href="https://use.typekit.net/qwl5wmf.css">
<%
    ResourceWriter resourceWriter = new ResourceWriter();

    Response.Write(resourceWriter.WriteStylePreload("hco_fonts/hco_fonts.css"));
    Response.Write(resourceWriter.WriteStylePreload("css/Site99/style.css"));

    Response.Write(resourceWriter.WriteLink("hco_fonts/hco_fonts.css"));
    Response.Write(resourceWriter.WriteLink("css/Site99/style.css"));

    Response.Write(resourceWriter.WriteScript("js/Site1/app.es5.js"));
%>
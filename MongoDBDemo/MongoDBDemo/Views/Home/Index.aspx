<%@ Page Language="C#" MasterPageFile="~/Views/Shared/MainSite.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="indexTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Home Page 
</asp:Content>

<asp:Content ID="indexFeatured" ContentPlaceHolderID="FeaturedContent" runat="server">
 
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContent" runat="server">
  <section class="panel">
      <div class="panel-body">
      <div class="alert alert-success ">
   <h1>   Welcome to Demo MongoDB and C# MVC </h1>
     </div>
          </div>
      </section>
</asp:Content>

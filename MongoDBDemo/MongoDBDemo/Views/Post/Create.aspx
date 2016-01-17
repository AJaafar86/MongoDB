<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MainSite.Master" Inherits="System.Web.Mvc.ViewPage<Core.Domain.Post>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
     Add New Post
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <section class="panel">
        <header class="panel-heading">
              Add New Post
            
        </header>
      <div class="panel-body">
          
     
    <% using (Html.BeginForm()) { %>
   

    <%=Html.EditorForModel() %>

    <p>
        <input type="submit" value="Create" />
    </p>


<% } %>
     </div>

    </section>



</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>

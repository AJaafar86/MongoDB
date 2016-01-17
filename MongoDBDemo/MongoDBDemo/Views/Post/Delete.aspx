<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MainSite.Master" Inherits="System.Web.Mvc.ViewPage<Core.Domain.Post>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <section class="panel">
        <header class="panel-heading">
             Delete
            
        </header>
      <div class="panel-body">
         Are you sure you want to delete this post?  
     
          <h2><%=Model.Title %></h2>
    <% using (Html.BeginForm()) { %>
   
    
       <% Html.HiddenFor(m => m.PostId);%>
   <p>
        <input type="submit" value="Delete" />
    </p>


<% } %>
     </div>

    </section>
  








</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>

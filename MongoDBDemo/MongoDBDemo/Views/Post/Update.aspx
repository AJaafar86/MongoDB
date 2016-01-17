<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MainSite.Master" Inherits="System.Web.Mvc.ViewPage<Core.Domain.Post>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Update
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% using (Html.BeginForm()) { %>
        <section class="panel">
        <header class="panel-heading">
        Update
            
        </header>
      <div class="panel-body">
          
       <% Html.HiddenFor(m => m.PostId);%>
    <%:Html.EditorForModel() %>

    <p>
        <input type="submit" value="Update" />
    </p>
 </div>
 </section>
<% } %>
    

   


</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>

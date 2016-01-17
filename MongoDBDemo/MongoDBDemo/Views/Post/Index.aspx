<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MainSite.Master" Inherits="System.Web.Mvc.ViewPage<IList<Core.Domain.Post>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Posts
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <section class="panel">
    <header class="panel-heading">
              Posts
            <div class="fa fa-plus pull-right">
        <%=Html.ActionLink("New Post", "Create",new{@calss="blue"}) %>
 
       </div>
        </header>
      <div class="panel-body">
         
     
      <%:Html.DisplayForModel() %>
     </div>
        </section>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>

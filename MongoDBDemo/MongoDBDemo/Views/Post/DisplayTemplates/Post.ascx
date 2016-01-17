<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Core.Domain.Post>" %>

<div class="alert alert-info clearfix">
    <h3><%=Html.ActionLink(Model.Title, "Detail", new { id = Model.Url }) %> </h3>
        
    <p>
        <em>Posted at <%=Model.Date.ToLocalTime().ToString()%> by  <%=Model.Author%></em>
    </p>

    <p>
         <%=Model.Summary%>
    </p>

    <p>
        ( <%=Model.TotalComments %>comments)
    </p>

  <div>
      
        <div class="fa fa-edit">  <%=Html.ActionLink("Edit Post", "Update", new { id = Model.Url })%>  </div>
  |
        <div class="fa fa-trash-o"> <%=Html.ActionLink("Delete Post", "Delete", new { id = Model.PostId })%>     </div>
 
       
   
     </div>
         
      
</div>
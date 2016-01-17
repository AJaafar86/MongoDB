<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Core.Domain.Comment>" %>

<div>
    
  
<div id="<%:Model.CommentId %>">
    <strong>By <%=Model.Author %> at <%=Model.Date.ToLocalTime().ToString() %></strong>
   <div class="fa fa-trash-o" style=" cursor: pointer" onclick="RemoveComment('<%=Model.CommentId %>')">  (<a class="remove-comment" onclick="RemoveComment('<%=Model.CommentId %>')" >Remove</a>)
    </div>
    <p>
     <%=Model.Detail %>
    </p>
</div> 
    

</div>
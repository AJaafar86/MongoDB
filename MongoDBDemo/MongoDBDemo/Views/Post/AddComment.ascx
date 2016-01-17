<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Core.Domain.Comment>" %>

<section class="panel">
        <header class="panel-heading">
             Add Comment
            
        </header>
      <div class="panel-body">
             <% using (Ajax.BeginForm("AddComment", null, new AjaxOptions
       {
           OnSuccess = "AddComment",
           OnFailure = "",
           OnBegin = "",
           UpdateTargetId = ""
       }, new { Id = "AddComment" }))
       { %>
      
    <input name="postId" type="hidden" value=" <%:ViewBag.PostId%> " />
    <div>
        Add Comment
        <br />
        <%=Html.TextAreaFor(m => m.Detail)%>
        <%=Html.ValidationMessageFor(m => m.Detail)%>
        <br />
        <input type="submit" value="Add Comment"  />
    </div>
<%}%> 
     </div>

    </section>
  
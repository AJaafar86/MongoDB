<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Core.Domain.Comment>" %>


    <section class="panel">
        <header class="panel-heading">
             Add Comment
            
        </header>
      <div class="panel-body">
       <% using (Html.BeginForm("AddComment", "Post", FormMethod.Post))
{  %> 
    <input name="postId" type="hidden" value=" <%= ViewBag.PostId%> " />
    <div>
        Add Comment
        <br />
        <%=Html.TextAreaFor(m => m.Detail)%>
        <%=Html.ValidationMessageFor(m => m.Detail)%>
        <br />
        <input type="submit" value="Add Comment" />
    </div>
<%}%> 
     </div>

    </section>
  


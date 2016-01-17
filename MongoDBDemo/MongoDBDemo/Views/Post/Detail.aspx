<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MainSite.Master" Inherits="System.Web.Mvc.ViewPage<Core.Domain.Post>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Detail
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <script type="text/javascript">
         
        
         function AddComment(response) {
            
                 if (response.Result == "ok") {
                            
                     $(response.CommentHtml).hide().prependTo("#comment-list").fadeIn(1000);
                     $("#add-comment").html(response.FormHtml);
                     $("#Detail").val("");
                 }
                 else {
                     $("#add-comment").html(response.FormHtml);
                 }
             }
         function RemoveComment(commentId) {
             var comment = $("#" + commentId).parent();
             $.post(
                 '<%:Url.Action("RemoveComment")%>',
                     {
                         postId: '<%=Model.PostId%>',
                         commentId: commentId
                     },
                     function () {
                      
                         comment.fadeOut(1000, function () { $("#" + commentId).remove(); });
                     }
                 );
         }
         
         function LoadMore( ) {
           
             $.ajax({
                 type: "POST",
                 url: '<%:Url.Action("CommentList")%>',
                 data: {
                     postId: '<%:Model.PostId.ToString()%>',
                     skip:' <%=ViewBag.LoadedComments%>',
                     limit: 5,
                     totalComments: '<%:ViewBag.TotalComments%>'
                 },
                success: function (response) {
                   
                     $("#comment-list").find("#load-more").parent().replaceWith($(response).fadeIn(1000));

                 },
                 error: function() {
                     alert("error");

                 }
             });

             
         }
       

         
     </script>
    <section class="panel">
        <header class="panel-heading">
            Details
            
        </header>
        <div class="panel-body">
            <h2><%=Model.Title %></h2>

            <p>
                <em>Posted at <%=Model.Date.ToLocalTime().ToString()%> by <%=Model.Author %></em>
            </p>

            <p>
                <%=Html.Raw(Model.Details)%>
            </p>

            <div id="add-comment">
                <%:Html.Partial("AddComment", new Core.Domain.Comment())%>
            </div>

            <h3>Comments</h3>
   <section class="panel">
        <header class="panel-heading">
            Comments List
            
        </header>
        <div class="panel-body">
            <div id="comment-list">
                
                <% if (Model.Comments != null)
                   {
                       Html.RenderPartial("CommentList", Model.Comments);
                   }%>
            </div>
        </div>

        </section>
            </div>
    </section>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">

   
</asp:Content>

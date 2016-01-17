<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Core.Domain.Comment>>" %>

  

            <% foreach (var mcomment in Model)
               {
                   Html.RenderPartial("Comment", mcomment);
               } %>
      
        <div>
            <% if (ViewBag.TotalComments > ViewBag.LoadedComments)
               {
            %>
            <div style="margin-bottom: 20px; cursor: pointer">
              <div class="fa fa-chevron-circle-down" onclick="LoadMore()"> <a id="load-more"  onclick="LoadMore()">Load more...</a>
            </div> </div> 
            <%
       }
            %>
        </div>
 

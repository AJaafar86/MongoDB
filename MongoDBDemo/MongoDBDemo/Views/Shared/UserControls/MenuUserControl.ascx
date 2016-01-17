<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<aside>
    <div id="sidebar" class="nav-collapse">
        <!-- sidebar menu start-->            <div class="leftside-navigation">
            <ul class="sidebar-menu" id="nav-accordion">
               <li class="sub-menu">
                <a href="javascript:;" class="active" onclick="siteMasterModule.changeLocation('<%: Url.Action("index", "Post") %>',true)">
                    <i class="fa fa-th"></i>
                    <span>Posts</span>
                </a>
               
            </li>
          
         
           <%-- <li class="sub-menu">
                <a href="javascript:;"  onclick="siteMasterModule.changeLocation('<%: Url.Action("index", "Post") %>',true)">
                    <i class="fa fa-tasks"></i>
                    <span>Posts</span>
                </a>
            
            </li>--%>
      
        </ul></div>        
<!-- sidebar menu end-->
    </div>
</aside>
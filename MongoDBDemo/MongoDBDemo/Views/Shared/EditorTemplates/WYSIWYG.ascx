﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%=Html.TextArea("", ViewData.TemplateInfo.FormattedModelValue.ToString(), 0, 0, new { @class = "text-box multi-line wysiwyg" })%>

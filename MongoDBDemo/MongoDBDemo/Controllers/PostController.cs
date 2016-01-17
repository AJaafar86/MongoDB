using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Core.Domain;
using Core.Services;
using MongoDBDemo.Helpers;
using MongoDB.Bson;

namespace MongoDBDemo.Controllers
{
    public class PostController : Controller
    {
        #region Private Variable . . . 

        private readonly PostService _postService;
        private readonly CommentService _commentService;
       
        #endregion 
    
        #region constructor . . . 
       public PostController()
        {
            _postService = new PostService();
            _commentService = new CommentService();
        }
        #endregion

        #region List,Add,Edit and Delete Posts . . .
        public ActionResult Index()
        {
            try
            {
                Session["UserName"] = User.Identity.Name;
                IList<Core.Domain.Post> Posts = _postService.GetPosts();
                return View(Posts);
            }
            catch (Exception ex)
            {
                // log the error
                return View("Error");

            }

        }

        [HttpGet]
        public ActionResult Create()
        {
            try
            {
                return View(new Post());
            }
            catch (Exception ex)
            {
                //todo : log the error
                return View("Error");

            }

        }

        [HttpPost]
        public ActionResult Create(Post post)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    post.Url = post.Title.GenerateSlug();
                    post.Author = User.Identity.Name;
                    post.Date = DateTime.Now;

                    _postService.Create(post);

                    return RedirectToAction("Index");
                }

                return View();
            }
            catch (Exception ex)
            {
                //todo : log the error
                return View("Error");

            }

        }

        [HttpGet]
        public ActionResult Update(string id)
        {
            try
            {
                Post post = _postService.GetPost(id);
                return View(_postService.GetPost(id));
            }
            catch (Exception ex)
            {
                //todo : log the error
                return View("Error");
            }

        }

        [HttpGet]
        public ActionResult Delete(string id)
        {
            try
            {
                var obId = new ObjectId(id);
                return View(_postService.GetPost(obId));
            }
            catch (Exception ex)
            {
                //todo : log the error
                return View("Error");
            }

        }

        [HttpPost, ActionName("Delete")]
        public ActionResult ConfirmDelete(string id)
        {
            try
            {
                var obId = new ObjectId(id);
                _postService.Delete(obId);

                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                //todo : log the error
                return View("Error");
            }

        }

        [HttpPost]
        public ActionResult Update(Post post)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    post.Url = post.Title.GenerateSlug();

                    _postService.Edit(post);

                    return RedirectToAction("Index");
                }

                return View();
            }
            catch (Exception ex)
            {
                //todo : log the error
                return View("Error");
            }

        }
        #endregion
        
        # region Detail and Comments . . . 
    
        [HttpGet]
        public ActionResult Detail(string id)
        {
            try
            {
                var post = _postService.GetPost(id);
                ViewBag.PostId = post.PostId.ToString();

                ViewBag.TotalComments = post.TotalComments;
                ViewBag.LoadedComments = 5;

                return View(post);
            }
            catch (Exception ex)
            {
                //todo : log the error
                return View("Error");
            }

        }

        [HttpPost]
        public ActionResult AddComment(string postId, Comment comment)
        {
            try
            {


                if (ModelState.IsValid)
                {
                    var newComment = new Comment()
                                            {
                                                CommentId = ObjectId.GenerateNewId(),
                                                Author = User.Identity.Name,
                                                Date = DateTime.Now,
                                                Detail = comment.Detail
                                            };
                    var obId = new ObjectId(postId.Trim());
                    _commentService.AddComment(obId, newComment);

                    ViewBag.PostId = postId;
                    return Json(
                        new
                            {
                                Result = "ok",
                                CommentHtml = RenderPartialViewToString("Comment", newComment),
                                FormHtml = RenderPartialViewToString("AddComment", new Comment())
                            });
                }

                ViewBag.PostId = postId;
                return Json(
                    new
                        {
                            Result = "fail",
                            FormHtml = RenderPartialViewToString("AddComment", comment)
                        });
            }
            catch (Exception ex)
            {
                //todo : log the error
                return View("Error");
            }
        }

        public ActionResult RemoveComment(string postId, string commentId)
        {
            try
            {
                var obId = new ObjectId(postId.Trim());
                var obCommentId = new ObjectId(commentId.Trim());
                _commentService.RemoveComment(obId, obCommentId);
                return new EmptyResult();
            }
            catch (Exception ex)
            {
                //todo : log the error
                return View("Error");
            }
        }

        [HttpPost]
        public ActionResult CommentList(string postId, int skip, int limit, int totalComments)
        {
            try
            {
                var obId = new ObjectId(postId);
                ViewBag.TotalComments = totalComments;
                ViewBag.LoadedComments = skip + limit;
                return PartialView(_commentService.GetComments(obId, ViewBag.LoadedComments, limit, totalComments));
            }
            catch (Exception ex)
            {
                //todo : log the error
                return View("Error");
            }
        }


        #endregion
        
        #region Helpers . . . 

        /// <summary>
        /// http://craftycodeblog.com/2010/05/15/asp-net-mvc-render-partial-view-to-string/
        /// </summary>
        /// <param name="viewName"></param>
        /// <param name="model"></param>
        /// <returns></returns>
        protected string RenderPartialViewToString(string viewName, object model)
        {
            try
            {
                if (string.IsNullOrEmpty(viewName))
                    viewName = ControllerContext.RouteData.GetRequiredString("action");

                ViewData.Model = model;

                using (StringWriter sw = new StringWriter())
                {
                    ViewEngineResult viewResult = ViewEngines.Engines.FindPartialView(ControllerContext, viewName);
                    ViewContext viewContext = new ViewContext(ControllerContext, viewResult.View, ViewData, TempData, sw);
                    viewResult.View.Render(viewContext, sw);

                    return sw.GetStringBuilder().ToString();
                }
            }
            catch (Exception ex)
            {
                //todo: log the error 
                return string.Empty;

            }

        }
        #endregion 
    }
}
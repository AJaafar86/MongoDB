using System;
using System.Collections.Generic;
using System.Configuration;
using System.Globalization;
using System.Linq;
using System.Text;
using MongoDB.Driver;
using Core.Domain;
using MongoDB.Driver.Builders;
using MongoDB.Bson;
using System.Text.RegularExpressions;
using System.Web;
using Core.Helpers;
using System.Diagnostics;

namespace Core.Services
{
    public class PostService
    {
        private readonly MongoHelper<Post> _posts;

        public PostService()
        {
            _posts = new MongoHelper<Post>();
        }

        public void Create(Post post)
        {
            post.Comments = new List<Comment>();
            _posts.Collection.Save(post);
        }

        public void Edit(Post post)
        {
            _posts.Collection.Update(
                Query.EQ("_id", post.PostId), 
                Update.Set("Title", post.Title)
                    .Set("Url", post.Url)
                    .Set("Summary", post.Summary)
                    .Set("Details", post.Details));
        }

        public void Delete(ObjectId postId)
        {
            _posts.Collection.Remove(Query.EQ("_id", postId));
        }

        public IList<Post> GetPosts()
        {
            return _posts.Collection.FindAll().SetFields(Fields.Exclude("Comments")).SetSortOrder(SortBy.Descending("Date")).ToList();
        }

        public Post GetPost(ObjectId id)
        {
            var post = _posts.Collection.Find(Query.EQ("_id", id)).SetFields(Fields.Slice("Comments", -5)).Single();
            post.Comments = post.Comments.OrderByDescending(c => c.Date).ToList();
            return post;
        }

        public Post GetPost(string url)
        {
            var post = _posts.Collection.Find(Query.EQ("Url", url)).SetFields(Fields.Slice("Comments", -5)).Single();
            post.Comments = post.Comments.OrderByDescending(c => c.Date).ToList();
            return post;
        }
    }
}
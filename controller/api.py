import json
import markdown2
from controller.base import BaseHandler
import dao
from tool.jsonencoder import DatetimeEncoder
from interceptor.comments_i import CommentsInterceptor

class Article(BaseHandler):
    def get(self,url):
        article = dao.getArticle(url)
        comments = dao.getComments(article['aid'])
        r = {'article':article,'comments':comments}
        self.write(json.dumps(r,cls=DatetimeEncoder,ensure_ascii=False))

class Comment(BaseHandler):
    def post(self):
        aid = self.get_argument("aid")
        username = self.get_argument("username")
        email = self.get_argument("email")
        url = self.get_argument("url")
        content = self.get_argument("content")
        msg = CommentsInterceptor.validator(username,email,content)
        if(msg['status'] is "good"):
            content = markdown2.unicode(markdown2.markdown(content))
            data = (aid,username,email,url,content)
            dao.addComment(data)
            comments = dao.getComments(aid)
            r = {'comments':comments,"msg":msg}
            self.write(json.dumps(r,cls=DatetimeEncoder,ensure_ascii=False))
        else:
            r = {"msg":msg}
            self.write(json.dumps(r,cls=DatetimeEncoder,ensure_ascii=False))
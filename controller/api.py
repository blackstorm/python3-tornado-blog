import json
from controller.base import BaseHandler
import dao
from tool.jsonencoder import DatetimeEncoder


class Article(BaseHandler):
    def get(self,url):
        article = dao.getArticle(url)
        comments = dao.getComments(article['aid'])
        r = {'article':article,'comments':comments}
        self.write(json.dumps(r,cls=DatetimeEncoder,ensure_ascii=False))

class Comment(BaseHandler):
    def post(self):
        print(self.get_argument("username"))
        self.write(json.dumps("OK",cls=DatetimeEncoder,ensure_ascii=False))
# -*- coding: utf-8 -*-
import markdown2
import tornado
from controller.UserHandler import UserHandler
import dao
class Write(UserHandler):
    @tornado.web.authenticated
    def get(self):
        self.render("user/new_article.html")
    @tornado.web.authenticated
    def post(self):
        title = self.get_argument('title')
        content = self.get_argument('content')
        url = self.get_argument('url')
        content = markdown2.unicode(markdown2.markdown(content))
        dao.addArticle(title,content,url)
        self.redirect('/article/'+url)
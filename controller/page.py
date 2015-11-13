from controller.base import BaseHandler
import dao


class About(BaseHandler):
    def get(self):
        self.render("page/about.html")

class Type(BaseHandler):
    def get(self):
        lifedc = dao.selectTypeArticle("life")
        codedc = dao.selectTypeArticle("code")
        otherdc = dao.selectTypeArticle("post")
        self.render("page/type.html",life = lifedc,code = codedc,other = otherdc)
from controller.base import BaseHandler


class About(BaseHandler):
    def get(self):
        self.render("user/about.html")
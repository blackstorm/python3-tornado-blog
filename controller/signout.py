from controller.base import BaseHandler
class Signout(BaseHandler):
    def get(self):
        self.clear_cookie("dmrs")
        self.redirect("/")
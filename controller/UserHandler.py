from controller.base import BaseHandler

class UserHandler(BaseHandler):
    def get_current_user(self):
        return self.get_secure_cookie("dmrs")
from controller.UserHandler import UserHandler
import bcrypt
import dao
class Signin(UserHandler):
    def get(self):
        title = '登陆'
        self.render('user/signin.html',title = title)

    def post(self):
        username = self.get_argument('username')
        password = self.get_argument('password').encode('utf8')
        author = dao.findUserNameReturnPassWord(username)
        if not author:
            self.render('user/signin.html',title = '登陆',err="用户名或密码错误")
            return
        dbpass = author['password']
        has = bcrypt.hashpw(password,bcrypt.gensalt())
        if bcrypt.hashpw(password, has) == has:
            self.set_secure_cookie("dmrs",username)
            self.redirect("/")
        else:
            self.render('user/signin.html',title = '登陆',err="用户名或密码错误")
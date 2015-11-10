import os.path
import tornado.httpserver
import tornado.ioloop
import tornado.options
import tornado.web
from tornado.options import define,options
from mydb import TornaDB
from urls import urls
import cfg
from tool import UUID
define("port", default=8081, help="run on the given port", type=int)

class Application(tornado.web.Application):
	def __init__(self):
		handlers = urls
		settings = dict(
			template_path = os.path.join(os.path.dirname(__file__), "templates"),
			static_path = os.path.join(os.path.dirname(__file__), "static"),
			blog_title = u"我的博客",
			cookie_secret = UUID.get_uuid(),
			login_url = "/signin",
			debug = options.debug,
			autoescape=None,
			compress_whitespace=False,
		)
		tornado.web.Application.__init__(self, handlers, **settings)
		self.db = TornaDB.Connection(host=options.db_host,
									 port=options.db_port,
									 database=options.db_database,
									 user=options.db_user,
									 password=options.db_pass
									 )
if __name__ == "__main__":
	cfg.set_define()
	tornado.options.parse_command_line()
	http_server = tornado.httpserver.HTTPServer(Application())
	http_server.listen(options.port)
	tornado.ioloop.IOLoop.current().start()
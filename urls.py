#coding:utf-8

from controller.index import Index
from controller.article import Article
from controller.signin import Signin
from controller.write import Write
from controller.signout import Signout
from controller.page import About
from controller.api import Article as ART
from controller.api import Comment as com
urls = [
	#首页
	(r'/', Index),
	#文章
	(r'/article/([^\n]*)',Article),
	#登录
	(r'/signin',Signin),
	#发表
	(r'/write',Write),
	#API文章
	(r'/api/article/([^\n]*)',ART),
	(r'/api/comment',com),
	#退出
	(r'/signout',Signout),
	#关于
	(r'/about',About)
]
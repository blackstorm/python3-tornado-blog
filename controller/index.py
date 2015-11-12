from controller.base import BaseHandler
from tornado.options import options
from tool import blog
from tool.jsonencoder import DatetimeEncoder
import json
class Index(BaseHandler):
    def get(self):
        list = self.db.only_sql('select * from article ORDER BY aid DESC LIMIT 10')#返回值为一个list list保存字典
        #一个json
        # jsonlist = json.dumps(list,cls=DatetimeEncoder,ensure_ascii=False)
        # print(jsonlist)
        if options.summary == "y":
            try:
                summary_list = blog.summary(list)
                self.render("index.html",list = summary_list)
            except:
                self.write("抱歉，截取首页概述出现错误，请检查正文M语法是否正确")
        else:
            self.render("index.html",list = list)
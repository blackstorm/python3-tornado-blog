import configparser
from tornado.options import define
conf = configparser.ConfigParser()
conf.read("config/blog.conf")

def set_define():
    define("db_host",default=get_db_host())
    define("db_port",default=int(getPort()),type=int)
    define("db_database",default=get_db_database())
    define("db_user",default=get_db_user())
    define("db_pass",default=get_db_pass())
    define("summary",default=get_index_summary())
    define("debug",default=bool(get_blog_debug()),type=bool)

def get_blog_debug():
    return conf.get("blog","debug")

def get_db_database():
    return conf.get("db","database")

def getPort():
    return conf.getint("db","port")

def get_db_user():
    return conf.get("db","user")

def get_db_host():
    return conf.get("db","host")
def get_db_pass():
    return conf.get("db","pass")

def get_db_pool_size():
    return conf.get("db","pool_size")

def get_index_summary():
    return conf.get("index","summary")
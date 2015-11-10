from datetime import date, datetime
import json
"""
解决python自带解析不能解析DATE类型数据
参考http://stackoverflow.com/questions/23285558/datetime-date2014-4-25-is-not-json-serializable-in-django
"""
class DatetimeEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, datetime):
            return obj.strftime('%Y-%m-%d %H:%M:%S')
        elif isinstance(obj,date):
            return obj.strftime('%Y-%m-%d')
        # Let the base class default method raise the TypeError
        return json.JSONEncoder.default(self, obj)

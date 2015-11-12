class CommentsInterceptor():
    def validator(name,email,content):
        msg = {'msg':'','status':'good'}
        if email == "":
            msg['msg'] = "请填写邮箱，方便我与您联系"
            msg['status'] = "bad"
        if name == "":
            msg['msg'] = "您是不是忘了填昵称？"
            msg['status'] = "bad"
        if content == "":
            msg['msg'] = "评论还是要写的嘛"
            msg['status'] = "bad"
        return msg
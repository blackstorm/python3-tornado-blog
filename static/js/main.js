$(document).ready(function(){
    $('.i_title').click(function(){
        url = this.attributes["u"].value;
        art.ajax(url);
        ld.layout(true);
    });
});
var art = {};
art.ajax = function(url){
    //alert("ajax"+url);
    $.ajax({
        url:"/api/article/"+url,
        type:"get",
        dataType: "json",
        success:function(data){
            //alert(data);
            art.data(data);
        },
        error:function(){
            alert("发生未知错误");
        }
    });
};
art.data = function(data){
    //文章标题和日期
    var section = document.createElement('section');
    var div = document.createElement('div');
    var h1 = document.createElement('h1');
    $("#content").empty().append(section);
    section.className="post";
    div.className = "date";
    div.innerHTML = data.article['created'];
    h1.innerHTML = data.article['title'];
    $("#content>section").append(div,h1,data.article['content']);
    //评论列表
    if(data.comments.length>0){
        $(".main").append(comments.listlayout(data.comments))
    }
    //评论表单
    var comment = $("<div id='comm' class='block'>");
    $(".main").append(comment);
    $('#comm').append(comments.getlayout(data.article['aid']));
    ld.layout(false);
};

/*loader动画*/
var ld = {};
ld.layout = function(bool){
    if(bool == true){
        var lodediv = document.createElement('div');
        var div = document.createElement('div');
        lodediv.appendChild(div);
        lodediv.className="ball-scale";
        $('.main').append(lodediv);
    }else{
        $('.ball-scale').remove();
    }
};

var comments = {};
comments.getlayout = function(aid){
    form = $("<form id='commentform'></form>");
    aidinput = $("<input type='hidden' name='aid' />");
    aidinput.attr('value',aid);
    nameinput = $("<input type='text' name='username' placeholder='昵称'/>");
    emailinput = $("<input type='email' name='email' placeholder='Email'/>");
    urlinput = $("<input type='url' name='url' placeholder='如果您想留下您的个人地址'/>");
    content = $("<textarea type='text' name='content' placeholder='支持markdown语法，不可为空'></textarea>");
    submitbtn = $("<button type='button' class='btn' onclick='comments.submit();'>发表</button>");
    form.append(aidinput);
    form.append(nameinput);
    form.append(emailinput);
    form.append(urlinput);
    form.append(content);
    form.append(submitbtn);
    return form;
};
comments.submit = function(){
    from = $("#commentform").serialize();
    $.ajax({
        url:"/api/comment",
        data:$("#commentform").serialize(),
        type:"post",
        dataType: "json",
        success:function(data){
            alert(data);
        },
        error:function(){
            alert("发生未知错误");
        }
    });
};
comments.listlayout = function(comlist){
    var llayout = $("<div id='commentslist' class='block'>");
    for(var item in comlist){
        var c_item = $("<div class='c_item'></div>");
        var c_info = $("<div class='c_info'></div>");
        var c_content = $("<div class='c_content'></div>");
        var author = $("<span class='uname'></span>");
        var timestamp = $("<span class='timestamp'></span>");
        author.html(comlist[item].author);
        timestamp.html(comlist[item].created);
        c_info.append(author,timestamp);
        var c_content = $("<div class='c_content'></div>");
        c_content.html(comlist[item].content);
        c_item.append(c_info);
        c_item.append(c_content);
        llayout.append(c_item);
    }
    return llayout;
};
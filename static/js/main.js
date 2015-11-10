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
}
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
    //评论
    var comment = document.createElement('div');
    comment.className = 'block';
    $(".main").append(comment);
    $('.main>.block').append(comments.getlayout(data.article['aid']));
    ld.layout(false);
}

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
}

var comments = {};
comments.getlayout = function(aid){
    form = $("<form id='commentform'></form>");
    aidinput = $("<input type='hidden' name='aid' />");
    aidinput.attr('value',aid);
    nameinput = $("<input type='text' name='username' placeholder='昵称'/>");
    emailinput = $("<input type='email' name='email' placeholder='Email'/>");
    urlinput = $("<input type='url' name='url' placeholder='个人网址'/>");
    content = $("<textarea type='text' name='content' placeholder='支持M语法，不可为空'></textarea>");
    submitbtn = $("<button type='button' class='btn' onclick='comments.submit();'>发表</button>");
    form.append(aidinput);
    form.append(nameinput);
    form.append(emailinput);
    form.append(urlinput);
    form.append(content);
    form.append(submitbtn);
    return form;
}
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
}
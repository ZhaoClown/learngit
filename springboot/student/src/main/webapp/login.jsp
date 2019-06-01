<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登陆</title>
<script type="text/javascript" src="/static/jquery-3.3.1.min.js"></script>
</head>
<body>
<form  id="userForm" action="login" method="post">
	<div id="message">
	</div>
	用户账号：<input type="text" name="username" /><br>
	用户密码 ：<input type="password" name="password" /><br>
	<input type="submit" value="登陆"/>
</form>
<script type="text/javascript">
$("form").submit(function(e){
	e.preventDefault();  //阻止默认提交
    var username = $("[name='username']").val(); // 注意，jquery筛选一定加引号，否则报错uncaught
    var password = $("[name='password']").val();
    $.ajax({
        url: "login",
        type: "POST",
        dataType:"json",//注意使用的是打他dataType，而不是Content-Type
        async: true,
        data: {
            "username": username,
            "password": password,
        },
        success:function(data) {
        	if(data!=null){
        		location.href = "scoreList.jsp?username="+username;
        	}
        },
        error: function(error){
        	$("#message").html("用户名或密码错误，请重新输入");
         }
    })
})

</script>
</body>
</html>
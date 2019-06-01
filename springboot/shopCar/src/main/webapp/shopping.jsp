<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>购物首页</title>
		<script type="text/javascript" src="/static/js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="/static/jqueryUI/jquery-ui.js"></script>
		<link rel="stylesheet" href="/static/jqueryUI/jquery-ui.css" />
		<link rel="stylesheet" href="/static/jqueryUI/style.css">
		<style type="text/css">
			ul li {
				list-style-type: none;
				margin: 0px;
			}
			
			.div-inline {
				float: left;
			}
			
			.wrapper {
				width: 1000px;
				margin: 0 auto;
				position: relative;
			}
			
			.wrapper div {
				border-bottom: 50px solid #FFFFFF;
			}
			
			.goods_request li {
				float: left;
				width: 300px;
				border-left: 20px solid #FFFFFF;
			}
			
			.more-mod {
				position: absolute;
				top: 6px;
				right: -80px;
				padding: 0px 30px 0px 20px;
				height: 20px;
				line-height: 20px;
				display: block;
				font-family: simsun;
				color: #333;
			}
			
			.more-mod_1 {
				position: absolute;
				top: 6px;
				right: 0px;
				padding: 0px 30px 0px 20px;
				height: 20px;
				line-height: 20px;
				display: block;
				font-family: simsun;
				color: #333;
			}
			
			.more-mod_2 {
				position: absolute;
				top: 6px;
				right: 100px;
				padding: 0px 30px 0px 20px;
				height: 20px;
				line-height: 20px;
				display: block;
				font-family: simsun;
				color: #333;
			}
			
			.error {
				color: red;
			}
			
			.ok {
				color: green;
			}
		</style>
	</head>

	<body>
		<div class="wrapper">
			<div>
				<h3>购物网站</h3>
				<div class="more-mod_2">
					<input type="button" id="shop_car" value="购物车" onclick="shopCar()"/>
				</div>
				<div class="more-mod_1" id="login">
					<input type="button" id="login_button" value="登录" onclick="userLogin()"/>
				</div>
				<div class="more-mod" id="register">
					<input type="button" id="#register_button" value="注册" onclick="userRegister()"/>
				</div>
				<div class="more-mod_1" id="user" style="display: none;"></div>
				<div class="more-mod" id="exit" style="display: none;">
					<input type="button" id="exit_button" value="退出" onclick="exit()"/>
				</div>
			</div>
			<div align="center">
				<input type="text" size="60" id="find_goods" style="font-size: 16px;" />
				<input type="button" value="搜索一下" onclick="findGoods()" />
			</div>
		</div>
		<div>
			<ul class="goods_request" id="goods">
			</ul>
		</div>
		<div id="login_dialog" title="登录" style="display: none;">
			<form action="user/login" method="post" id="login_form">
			<div id="login_message"></div>
				<table border="0" align="center">
					<tr>
						<td><label for="tags">用户名</label></td>
						<td><input type="text" id="username" /></td>
					</tr>
					<tr>
						<td>密码</td>
						<td><input type="password" id="password" /></td>
					</tr>
					<tr>
						<td align="center"><input type="submit" id="login_submit" value="登录" /></td>
					</tr>
				</table>
			</form>
		</div>
		<div id="register_dialog" title="注册" style="display: none;">
			<form action="" method="post" id="register_form">
				<table border="0" align="center">
					<tr>
						<td><label for="tags">用户名</label></td>
						<td><input type="text" id="username_1" /></td>
					</tr>
					<tr>
						<td>密码</td>
						<td><input type="password" id="password_1" /></td>
					</tr>
					<tr>
						<td>确认密码</td>
						<td><input type="password" id="password_2" /></td>
					</tr>
					<tr>
						<td align="center"><input type="submit" id="register_submit" value="登录" /></td>
					</tr>
				</table>
			</form>
		</div>
<script type="text/javascript">

$(function(){
        $.ajax({
            url: "user/user",
            type: "POST",
            dataType:"json",//注意使用的是dataType，而不是Content-Type
            async: true,
            data: {
            },
            success:function(data) {
                if(data!=null){
                    $("#login").css("display","none");
                    $("#register").css("display","none");
                    $("#user").css("display","block");
                    $("#exit").css("display","block");
                    $("#user").html(data.username);
                }
            },
            error: function(error){
                $("#login_dialog").dialog("close");
                alert('登录失败，用户名或密码错误！');
            }
        })
})
$(function(){
        var name=null;
        $.ajax({
            url: " goods/queryGoods",
            type: "POST",
            dataType:"json",//注意使用的是dataType，而不是Content-Type
            async: true,
            data: {
                "goodsCustom.name": name,
            },
            success:function(data) {
                if(data!=null){
                    $("#goods li").remove();
                    $.each(data, function(index, goods){
                        $("#goods").append("<li>"
                            +"<a href="+'showGoods.jsp?id='+goods.id+" target="+'_blank'+">"
                            +"<img width="+'100%'+" height="+'100%'+" src="+'/static/img/'+goods.picture+"></a>"
                            +"<div align="+'center'+">"
                            +"<a href="+'showGoods.jsp?id='+goods.id+" target="+'_blank'+">"+goods.name+"</a>"
                            +"</div>"
                            +"</li>");
                    })
                }
            }
        })
})

$(function(){
	var name=null;
    $.ajax({
        url: " goods/queryGoods",
        type: "POST",
        dataType:"json",//注意使用的是dataType，而不是Content-Type
        async: true,
        data: {
            "goodsCustom.name": name,
        },
        success:function(data) {
        	if(data!=null){
        		$("#goods li").remove();
        		$.each(data, function(index, goods){
 				   $("#goods").append("<li>"
 						   +"<a href="+'showGoods.jsp?id='+goods.id+" target="+'_blank'+">"
 						   +"<img width="+'100%'+" height="+'100%'+" src="+'/static/img/'+goods.picture+"></a>"
 						   +"<div align="+'center'+">"
 						   +"<a href="+'showGoods.jsp?id='+goods.id+" target="+'_blank'+">"+goods.name+"</a>"
 						   +"</div>"
 						   +"</li>");
 			})
        	}
        }
    })
})
function findGoods() {
	var name = $("#find_goods").val();
	$.ajax({
        url: "goods/queryGoods",
        type: "POST",
        dataType:"json",//注意使用的是dataType，而不是Content-Type
        async: true,
        data: {
            "goodsCustom.name": name,
        },
        success:function(data) {
        	if(data!=null){
        		$("#goods li").remove();
        		$.each(data, function(index, goods){
 				   $("#goods").append("<li>"
 						   +"<a href="+'showGoods.jsp?id='+goods.id+" target="+'_blank'+">"
						   +"<img width="+'100%'+" height="+'100%'+" src="+'/static/img/'+goods.picture+"></a>"
						   +"<div align="+'center'+">"
						   +"<a href="+'showGoods.jsp?id='+goods.id+" target="+'_blank'+">"+goods.name+"</a>"
						   +"</div>"
						   +"</li>");
 			})
        	}
        },
        error: function(error){
            alert('查找不到');
        }
    })
}
function userLogin() {
	$("#login_dialog").dialog();
}
function userRegister() {
	$("#register_dialog").dialog();
}
$("#login_form").submit(function(e){
	e.preventDefault();  //阻止默认提交
    var username = $("#username").val(); // 注意，jquery筛选一定加引号，否则报错uncaught
    var password = $("#password").val();
    $.ajax({
        url: "user/login",
        type: "POST",
        dataType:"json",//注意使用的是dataType，而不是Content-Type
        async: true,
        data: {
            "username": username,
            "password": password,
        },
        success:function(data) {
        	if(data!=null){
        		$("#login").css("display","none");
        		$("#register").css("display","none");
        		$("#user").css("display","block");
        		$("#exit").css("display","block");
                $("#login_dialog").dialog("close");
        		$("#user").html(username);
        	}
        },
        error: function(error){
            $("#login_dialog").dialog("close");
            alert('登录失败，用户名或密码错误！');
         }
    })
})
function exit() {
	$.ajax({
        url: "user/exit",
        type: "POST",
        dataType:"json",//注意使用的是dataType，而不是Content-Type
        async: true,
        data: {
        },
        success:function(data) {
        	if(data!=null){
        		$("#login").css("display","block");
        		$("#register").css("display","block");
        		$("#user").css("display","none");
        		$("#exit").css("display","none");
        		$("#user").html("");
        	}
        }
	})
}
function shopCar() {
	$.ajax({
        url: "shopCar/openShopCar",
        type: "POST",
        dataType:"json",//注意使用的是dataType，而不是Content-Type
        async: true,
        data: {
        },
        success:function(data) {
        	if(data==true){
        		location.href = "shopCar.jsp";
        	}else{
                alert('请登录！');
        	}
        }
	})
}
</script>
	</body>

</html>
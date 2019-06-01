<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>成绩管理</title>
<script type="text/javascript" src="/static/jquery-3.3.1.min.js"></script>
</head>
<body>  
当前用户：<div id="username"></div>
<form id="scoreForm" action="score/queryScore" method="post">
姓名查询：
<table width="100%" border=1>
	<tr>
		<td>
			<input type="text" name="studentCustom.name"/>
		</td>
		<td>
			<input type="submit" value="查询"/>
		</td>
	</tr>
</table>
<div id="message">
</div>
成绩列表：
<table width="100%" border=1 id="score">
	<tr>	
		<td>姓名</td>
		<td>语文</td>
		<td>数学</td>
		<td>英语</td>
		<td colspan="3" align="center">操作</td>
	</tr>
</table>
</form>
<script type="text/javascript">
function getQueryString(name) {
	var reg = new RegExp('(^|&)' + name + '=([^&]*)(&|$)', 'i');
	var r = window.location.search.substr(1).match(reg);
	if(r != null) {
		return unescape(r[2]);
	}
	return null;
}
$(function(){
	$("#username").html(getQueryString("username"));
    var name = null;
    $.ajax({
        url: "score/queryScore",
        type: "POST",
        dataType:"json",//注意使用的是打他dataType，而不是Content-Type
        async: true,
        data: {
            "studentCustom.name": name,
        },
        success:function(data) {
        	if(data!=null){
        		$("#score tr:not(:first)").remove();
        		$.each(data, function(index, ScoreCustom){
 				   $("#score").append("<tr>"
 						   +"<td>"+ScoreCustom.name+"</td>"
 						   +"<td>"+ScoreCustom.chinese+"</td>"
 						   +"<td>"+ScoreCustom.math+"</td>"
 						   +"<td>"+ScoreCustom.english+"</td>"
 						   +"<td><a href="+'editScore.jsp?id='+ScoreCustom.id+">修改</a></td>"
 						   +"<td><input type="+'button'+" value="+'删除'+" onclick="+'deleteScore('+ScoreCustom.id+')'+"></td>"
 						   +"<td><a href="+'student.jsp?number='+ScoreCustom.number+">查看信息</a></td>"
 						   +"</tr>");
 			})
        	}
        }
    })
})
$("form").submit(function(e){
	e.preventDefault();  //阻止默认提交
    var name = $("[name='studentCustom.name']").val(); // 注意，jquery筛选一定加引号，否则报错uncaught
    $.ajax({
        url: "score/queryScore",
        type: "POST",
        dataType:"json",//注意使用的是打他dataType，而不是Content-Type
        async: true,
        data: {
            "studentCustom.name": name,
        },
        success:function(data) {
        	if(data!=null){
        		$("#score tr:not(:first)").remove();
        		$.each(data, function(index, ScoreCustom){
 				   $("#score").append("<tr>"
 						   +"<td>"+ScoreCustom.name+"</td>"
 						   +"<td>"+ScoreCustom.chinese+"</td>"
 						   +"<td>"+ScoreCustom.math+"</td>"
 						   +"<td>"+ScoreCustom.english+"</td>"
					       +"<td><a href="+'editScore.jsp?id='+ScoreCustom.id+">修改</a></td>"
                           +"<td><input type="+'button'+" value="+'删除'+" onclick="+'deleteScore('+ScoreCustom.id+')'+"></td>"
                           +"<td><a href="+'student.jsp?number='+ScoreCustom.number+">查看信息</a></td>"
 						   +"</tr>");
 			})
        	}
        },
        error: function(error){
        	$("#message").html("查无此人");
         }
    })
})
function deleteScore(id){
    $.ajax({
        url: "score/deleteScore",
        type: "POST",
        dataType:"json",//注意使用的是打他dataType，而不是Content-Type
        async: true,
        data: {
            "id": id,
        },
        success:function(data) {
        	if(data=="ok"){
        		location.href = "scoreList.jsp";
        	}
        },
        error: function(error){
        	location.href = "scoreList.jsp";
         }
    })
}


</script>
</body>

</html>
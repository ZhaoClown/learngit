<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改学生</title>
<script type="text/javascript" src="/static/jquery-3.3.1.min.js"></script>
</head>
<body> 
<form id="scoreForm" action="score/editScoreSubmit" method="post" >
修改学生成绩：
<table width="100%" border=1 id="score">

	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="提交"/>
		</td>
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
$("form").submit(function(e){
	e.preventDefault();  //阻止默认提交
    var id = $("[name='id']").val(); // 注意，jquery筛选一定加引号，否则报错uncaught
    var chinese = $("[name='chinese']").val();
    var math = $("[name='math']").val();
    var english = $("[name='english']").val();
    $.ajax({
        url: "score/editScoreSubmit",
        type: "POST",
        dataType:"json",//注意使用的是打他dataType，而不是Content-Type
        async: true,
        data: {
            "id": id,
            "chinese": chinese,
            "math": math,
            "english": english,
        },
        success:function(date) {
        	if(data=="ok"){
        		location.href = "scoreList.jsp";
        	}
        },
        error: function(error){
        	location.href = "scoreList.jsp";
         }
    })
})

$(function(){
    var id = getQueryString("id");
    $.ajax({
        url: "score/editScore",
        type: "POST",
        dataType:"json",//注意使用的是打他dataType，而不是Content-Type
        async: true,
        data: {
            "id": id,
        },
        success:function(data) {
        	if(data!=null){
 				   $("#score").append("<tr><td><input type="+'hidden'+" name="+'id'+" value="+data.id+"></td></tr>"
 						   +"<tr><td>语文</td>"
 						   +"<td><input type="+'text'+" name="+'chinese'+" value="+data.chinese+"></td></tr>"
 						   +"<tr><td>数学</td>"
						   +"<td><input type="+'text'+" name="+'math'+" value="+data.math+"></td></tr>"
						   +"<tr><td>英语</td>"
 						   +"<td><input type="+'text'+" name="+'english'+" value="+data.english+"></td></tr>");
        	}
        }
    })
})


</script>
</body>

</html>
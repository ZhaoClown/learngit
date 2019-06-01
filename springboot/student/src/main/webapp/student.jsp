<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生信息</title>
<script type="text/javascript" src="/static/jquery-3.3.1.min.js"></script>
</head>
<body> 
<form id="studentForm" action="scoreList.jsp" method="post" >
学生信息
<table width="100%" border=1 id="student">
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="返回"/>
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
$(function(){
    var number = getQueryString("number");
    $.ajax({
        url: "viewStudent",
        type: "POST",
        dataType:"json",//注意使用的是打他dataType，而不是Content-Type
        async: true,
        data: {
            "number": number,
        },
        success:function(data) {
        	if(data!=null){
 				   $("#student").append("<tr><td>学号</td>"
 						   +"<td>"+data.number+"</td></tr>"
 						   +"<tr><td>姓名</td>"
 						   +"<td>"+data.name+"</td></tr>"
 						   +"<tr><td>性别</td>"
						   +"<td>"+data.sex+"</td></tr>"
						   +"<tr><td>生日</td>"
 						   +"<td>"+data.birthday+"</td></tr>"
 						   +"<tr><td>电话</td>"
						   +"<td>"+data.callphone+"</td></tr>"
						   +"<tr><td>住址</td>"
						   +"<td>"+data.address+"</td></tr>");
        	}
        }
    })
})



</script>
</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品展示</title>
</head>
<script type="text/javascript" src="/static/js/jquery-3.3.1.min.js"></script>
<style type="text/css">
		.table {
			border-top: 100px solid #FFFFFF;
		}
		
		.table input {
			border-right: 8px solid #FFFFFF;
			border-left: 8px solid #FFFFFF;
		}
	</style>
<body>
<center>
		<table class="table" width="800" height="800" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td width="70%" valign="top">
					<table id="show_goods">
						<tr>
							<td>
								<button onclick="calc(this)">-</button>
								<input type="text" id="goods_num" size="1" value="1" />
								<button onclick="calc(this)">+</button>
								<input type="button" id="bug_goods"  value="立即购买" onclick="buyGoods(this)"/>
								<input type="button" id="shop_car" value="加入购物车" onclick="shopChar(this)" />
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</center>
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
    var id = getQueryString("id");
    $.ajax({
        url: "goods/viewGoods",
        type: "POST",
        dataType:"json",//注意使用的是dataType，而不是Content-Type
        async: true,
        data: {
            "id": id,
        },
        success:function(data) {
        	if(data!=null){
 				   $("#show_goods").prepend("<tr>"
 						   +"<td rowspan="+'5'+"><img src="+'/static/img/'+data.picture+" width="+'400'+" height="+'400'+"/></td>"
 						   +"</tr><tr>"
 						   +"<td><B>"+data.name+"</B></td>"
 						   +"</tr><tr>"
						   +"<td>介绍："+data.introduce+"</td>"
						   +"</tr><tr>"
 						   +"<td>价格："+data.price+"￥</td>"
 						   +"</tr>");
        	}
        }
    })
})
function shopChar(btn) {
	var goods_id = getQueryString("id");
	var num= $("#goods_num").val();
	$.ajax({
        url: "shopCar/addShopCar",
        type: "POST",
        dataType:"json",//注意使用的是dataType，而不是Content-Type
        async: true,
        data: {
        	"goodsId": goods_id,
            "num": num,
        },
        success:function(data) {
        	if(data!=null){
        		location.href = "shopCar.jsp";
        	}
        },
        error: function(error){
            alert('请登录！');
        	location.href = "shopping.jsp";
        }
    })
}
function calc(btn) {
			var text = btn.parentElement.children[1];
			var n = Number(text.value);
			n += btn.innerHTML == "+" ? 1 : n > 1 ? -1 : 0;
			text.value = n;
		}
function buyGoods(btn) {
		var text = btn.parentElement.children[1];
		var n = Number(text.value);
		var str = "";
		window.location.href = str;
}

</script>
</body>

</html>
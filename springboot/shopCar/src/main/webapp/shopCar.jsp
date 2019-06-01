<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购物车</title>
<script type="text/javascript" src="/static/js/jquery-3.3.1.min.js"></script>
<style type="text/css">
		.table {
			border-top: 100px solid #FFFFFF;
		}
		
		table {
			width: 600px;
			text-align: center;
			border-collapse: collapse;
		}
		
		td,th {
			border: 1px;
		}
	</style>
</head>
<body>
<center>
		<table class="table" width="800" height="800" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td width="70%" valign="top">
					<table>
						<thead>
							<tr>
								<th><input type="checkbox" onclick="checkAll(this)" id="adminAll" />全选</th>
								<th></th>
								<th>商品名称</th>
								<th>单价</th>
								<th>数量</th>
								<th>小计</th>
							</tr>
						</thead>
						<tbody id="shop_car">
						</tbody>
						<tfoot>
							<tr>
								<th></th>
								<th></th>
								<th><input type="button" id="delete" name="delete" value="删除商品" onclick="deleteSel()"/></th>
								<th><input type="button" id="bug" name="bug" value="购买商品" onclick=""/></th>
								<th>总价: </th>
								<th>&yen;0.00</th>
							</tr>
						</tfoot>
					</table>
				</td>
			</tr>
		</table>
	</center>
<script type="text/javascript">
$(function(){
    $.ajax({
        url: "shopCar/showShopCar",
        type: "POST",
        dataType:"json",//注意使用的是dataType，而不是Content-Type
        async: true,
        data: {
        },
        success:function(data) {
        	if(data!=null){
        		$.each(data, function(index, shopCar){
        		  $("#shop_car").append("<tr>"
        				   +"<td><input type="+'checkbox'+" name="+'adminID'+" value="+shopCar.id+" onclick="+'checkSel(this)'+"/></td>"
        		           +"<td><img src="+'/static/img/'+shopCar.picture+" width="+'50'+" height="+'50'+"></td>"
        				   +"<td>"+shopCar.name+"</td>"
						   +"<td>&yen;"+shopCar.price+"</td>"
						   +"<td>"
						   +"<button onclick="+'calc(this)'+">-</button>"
						   +"<input type="+'text'+" size="+'1'+" value="+shopCar.num+" onblur="+'text(this)'+" />"
						   +"<button onclick="+'calc(this)'+">+</button>"
						   +"</td>"
						   +"<td>&yen;"+shopCar.price*shopCar.num+"</td>"
						   +"</tr>");
        		})
        	}
        }, 
        error: function(error){
            alert('购物车为空');
            location.href = "shopping.jsp";

        }
        
    })
})
function deleteSel() {
	var chbs = document.getElementsByName("adminID");
	var id=new Array();
	var n=0;
	for(var i = 0; i < chbs.length; i++) {
		if(chbs[i].checked == true)
		id[n++]=chbs[i].value;
	}
	$.ajax({
        url: "shopCar/deleteShopCar",
        type: "POST",
        dataType:"json",//注意使用的是dataType，而不是Content-Type
        async: true,
        traditional:true,
        data: {
        	"id":id,
        },
        success:function(data) {
        	if(data!=null){
        		location.href = "shopCar.jsp";
        	}
        }
	})	
}
function calc(btn) {
			var text = btn.parentElement.children[1];
			var n = Number(text.value);
			n += btn.innerHTML == "+" ? 1 : n > 1 ? -1 : 0;
			text.value = n;
			var price = parseFloat(btn.parentNode.previousElementSibling.innerHTML.slice(1));
			var total = n * price;
			btn.parentNode.nextElementSibling.innerHTML = "&yen" + total.toFixed(1);
			allPrice();
		}

		function text(num) {
			var price = parseFloat(num.parentNode.previousElementSibling.innerHTML.slice(1));
			var total = Number(num.value) * price;
			num.parentNode.nextElementSibling.innerHTML = "&yen" + total.toFixed(1);
			allPrice();
		}

		function allPrice() {
			var totals = document.querySelectorAll("table tr td tbody tr td:last-child");
			var alltotal = document.querySelector("tfoot tr th:last-child");
			var chbs = document.getElementsByName("adminID");
			var allprice = 0;
			for(var i = 0; i < chbs.length; i++) {
				if(chbs[i].checked == true)
					allprice += parseFloat(totals[i].innerHTML.slice(1));
			}
			alltotal.innerHTML = "&yen" + allprice.toFixed(1);
		}

		function checkAll(chb) {
			var chbs = document.getElementsByName("adminID");
			for(var i = 0; i < chbs.length; i++) {
				chbs[i].checked = chb.checked;
			}
			allPrice();
		}

		function checkSel(chb) {
			var chbAll = document.getElementById("adminAll");
			var unchb = document.querySelectorAll("table>tbody tr td:first-child>input:not(:checked)");
			if(unchb.length == 0) {
				chbAll.checked = true;
			} else {
				chbAll.checked = false;
			}
			allPrice();
		}
</script>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style type="text/css">
/* event:list */
.mystoreCTR_list {
	margin: 0 0 30px;
}

.mystoreCTR_list li {
	padding: 25px 0;
	border-bottom: 1px solid #e0e0e0;
}

.mystoreCTR_list li .info {
	position: relative;
}

.mystoreCTR_list li .info dt {
	padding: 10px 0 10px;
	font-size: 16px;
	color: #333;
}

.mystoreCTR_list li .info dd {
	margin: 0 0 3px;
	color: #898989;
	font-size: 14px;
}

.mystoreCTR_list li .info dd span {
	display: inline-block;
}

.mystoreCTR_list li .ic_tag {
	position: absolute;
	right: 0px;
	top: 30px;
	width: 110px;
	height: 40px;
	line-height: 40px;
	font-size: 14px;
	background: #ccc;
	text-align: center;
	color: white;
}

.mystoreCTR_list li .thumb {
	position: absolute;
	left: 0;
	top: 0;
	display: block;
	width: 217px;
	height: 98px;
	border: 1px solid #e0e0e0;
}

.mystoreCTR_list li .thumb img {
	width: 217px;
	height: 98px;
}

dl, ul, ol, menu, li {
	list-style: none;
}

.total-pay {
	color: black;
	font-size: 16px;
	font-weight:900;
	width: 100%;
	text-align: right;
}


</style>

<script type="text/javascript">
$(function(){
	storeCTRlist();
}); 

function storeCTRlist(){
	$(function(){
		//처음 들어왔을때 월 선택 쿼리
		var url = "<%=cp%>/store/jumunControllList";
			$.ajax({
				type : "post",
				url : url,
				dataType : "json",
				success : function(data) {
					console.log(data);
					printList(data);
				},
				error : function(e) {
					console.log(e.responseText);
				}
			});
		});
	}

	function printList(data) {
		var s = "";
		var list = data.list;
		var jumunNum,overlapCount,dataCount = 0;
		var totalPay = 0;
		
		s += "<ul class='mystoreCTR_list'>";
		for (var i = 0; i < list.length; i++) {
			totalPay += list[i].menu_pay;
			
			if (jumunNum != list[i].jumun_num) {
				s += "<li><a style='text-decoration: none;' onclick='updateList("+list[i].jumun_num+");'>";
				s += "<dl class='info'><dt>주문시간 : " + list[i].jumun_created
						+ "<span class='ic_tag end'>" + list[i].orders_state
						+ "</span></dt></dl>";
				s += "<dd><span>" + list[i].menuct_title + "</span> : <span>"
						+ list[i].menu_title + "</span> => <span>"
						+ list[i].menu_count.toLocaleString() + "개 </span><span>"
						+ list[i].menu_pay.toLocaleString() + "원</span></dd>";
			}
			
			if (jumunNum == list[i].jumun_num) {
				s += "<dd><span>" + list[i].menuct_title + "</span> : <span>"
						+ list[i].menu_title + "</span> => <span>"
						+ list[i].menu_count.toLocaleString() + "개 </span><span>"
						+ list[i].menu_pay.toLocaleString() + "원</span></dd>";
			}
			
			//console.log(i + '+' + list.length);
			//console.log(list[i].jumun_num + ':' + list[i+1].jumun_num);
			//console.log(jumunNum + ':' +list[i].jumun_num);
			if (i<list.length-1 && jumunNum == list[i].jumun_num
				&& list[i].jumun_num != list[i+1].jumun_num) {
				s += "<br><span class='total-pay'>총액 : "+ totalPay.toLocaleString() + "원</span></a></li>";
				totalPay=0;
			} else if (i<list.length-1 && list[i].jumun_num != list[i+1].jumun_num) {
				s += "<br><span class='total-pay'>총액 : "+ totalPay.toLocaleString() + "원</span></a></li>";
				totalPay=0;	
			} else if (i==list.length-1 && jumunNum != list[i].jumun_num) {
				s += "<br><span class='total-pay'>총액 : "+ totalPay.toLocaleString() + "원</span></a></li>";
				totalPay=0;	
			}
			
			jumunNum = list[i].jumun_num;
		}
		s += "</ul>";
		$("#jumun3").html(s);
	}
	
	function updateList(listNum){
		$(function(){
			//처음 들어왔을때 월 선택 쿼리
			var url = "<%=cp%>/store/jumunStateUpdate";
			var listUrl = "<%=cp%>/store/jumunControllList";
			var orders_num=4;
			var data = {listUrl:listUrl, listNum:listNum, orders_num:orders_num};
				$.ajax({
					type : "post",
					url : url,
					data : data,
					dataType : "json",
					success : function(data) {
						console.log(data);
						printList(data);
					},
					error : function(e) {
						console.log(e.responseText);
					}
				});
			});
	}
</script>

<div class="storeBodyFrame2">

	<div class="body-title">
		<h3>
			<span class="glyphicon glyphicon-tower"></span> 주문현황
		</h3>
	</div>



	<!-- Tab panes -->
	<div role="tabpanel">

		<!-- Nav tabs -->
		<ul class="nav nav-tabs" role="tablist">
			<li role="presentation" class="active"><a href="#jumun3"
				aria-controls="jumun3" role="tab" data-toggle="tab">주문완료</a></li>
			<li role="presentation"><a href="#jumun4" aria-controls="jumun4"
				role="tab" data-toggle="tab">주문승인</a></li>
			<li role="presentation"><a href="#jumun5" aria-controls="jumun5"
				role="tab" data-toggle="tab">취소</a></li>
			<li role="presentation"><a href="#jumunTotal"
				aria-controls="jumunTotal" role="tab" data-toggle="tab">전체</a></li>
		</ul>

		<!-- Tab panes -->
		<div class="tab-content">
			<div role="tabpanel" class="tab-pane active" id="jumun3"></div>
			<div role="tabpanel" class="tab-pane" id="jumun4">주문승인</div>
			<div role="tabpanel" class="tab-pane" id="jumun5">주문취소</div>
			<div role="tabpanel" class="tab-pane" id="jumunTotal">주문전체</div>
		</div>

	</div>
</div>
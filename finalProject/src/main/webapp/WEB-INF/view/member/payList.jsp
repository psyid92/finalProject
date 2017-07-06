<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>


<script>
function getDetail(data){
	//주문 상세 가져오는 위치
	
	var url = "<%=cp%>/member/getDetail";
	var mydata = "mydata="+data;
	
	$.ajax ({
		type:"post"
		, url : url
		, data : mydata
		, dataType : "json"
		, success : function(data){
			//여기서 tr에 내용 넣어줘야 함
			var td = document.getElemenyByName("detail${dto.jumun_num}");
			alert(td);
		}
	, error :function(e){
		console.log(e.responseText);
	}
	});
	
}

</script>

<style>
	th {
		font-size: 18px;
	}
</style>


<br>
<div align="center">
<h3>주문 내역</h3>
</div>
<br>
<br>
<div style="border-radius: 5px; border: 1px double black; min-height: 500px;" align="center">
<br><br>

		<br>
		<table style="border: none; border-collapse: collapse; width: 90%;">
		<tr>
			<th style="text-align: center;">기업</th>
			<th>입력한 주소</th>
			<th>전화번호</th>
			<th>총 금액</th>
			<th>주문 상태</th>
			<th>결제 상태</th>
		</tr>
		<tr><td colspan="6"><hr></td></tr>
		<c:forEach var="dto" items="${list }">
			<tr style="height: 40px;" onclick="getDetail(${dto.jumun_num})">
			<td>${dto.g1_name }</td>
			<td>${dto.jumun_addr }</td>
			<td>${dto.jumun_tel }</td>
			<td>${dto.jumun_pay }</td>
			<td>${dto.orders_state }</td>
				<c:if test="${dto.pay_pay ne 0}"><td>결제완료</td>
				</c:if>
				
				<c:if test="${dto.pay_pay eq 0}"><td>미결제</td>
				</c:if>
				
			
			</tr>
			<tr name="detail${dto.jumun_num }" >
			</tr>
		</c:forEach>
	</table>

</div>
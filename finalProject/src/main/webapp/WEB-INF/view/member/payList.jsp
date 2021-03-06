<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>


<script>
	function goWriteForm (data){
		location.href="<%=cp%>/member/writeReview?jumun_num="+data;
	}
	function goReadForm(data){
		location.href= "<%=cp%>/member/seeGiupReview?jumun_num="+data;
	}
</script>


<script>
function getDetail(data){
	//주문 상세 가져오는 위치
	
	var url = "<%=cp%>/member/getDetail";
	var mydata = "mydata="+data;
	
	var detail = "#detail"+data;
	var realD = "#realDetail" + data;

	if(!$(realD).show()){
	}
	
	if($(realD).html() != ""){
		$(realD).html("");
		$(realD).hide();
		
	} else {
		
		$.ajax ({
			type:"post"
			, url : url
			, data : mydata
			, dataType : "json"
			, success : function(data){
				var myJumun = data.myJumun;
				
				$(realD).html( myJumun);
				$(detail).show();
			}
		, error :function(e){
			console.log(e.responseText);
		}
		});
	}

}
	function refund(jumun_Num) {
		location.href="<%=cp%>/jumun/refund?jumun_Num="+jumun_Num;
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
<div style="border-radius: 5px; border: 1px double black; min-height: 300px;" align="center">
<br><br>

		<br>
		<table style="border: none; border-collapse: collapse; width: 90%;">
		<tr  style="font-family: arial; font-size: 10px;">
			<th width="8%">가게</th>
			<th width="11%">가게 전화</th>
			<th width="*">입력한 주소</th>
			<th width="13%">전화번호</th>
			<th width="10%">총 금액</th>
			<th width="10%">주문 상태</th>
			<th width="10%">결제 상태</th>
		</tr>
		<tr><td colspan="7"><hr></td></tr>
		<c:forEach var="dto" items="${list }">
			<tr style="height: 40px; font-family: arial; font-size: 13px;" onclick="getDetail(${dto.jumun_num})">
				<td width="8%">${dto.g1_name }</td>
				<td width="8%">${dto.g2_tel }</td>
				<td width="*">${dto.jumun_addr }</td>
				<td width="13%">${dto.jumun_tel }</td>
				<td width="10%">${dto.jumun_pay }</td>
				<td width="10%">${dto.orders_state }</td>
				<c:if test="${dto.pay_pay ne 0}"><td width="10%">결제완료</td>
				</c:if>
				
				<c:if test="${dto.pay_pay eq 0}"><td width="10%">미결제</td>
				</c:if>
				
			
			</tr>
			<tr style="display: none;" id="detail${dto.jumun_num }" >
				<td colspan="7" style="background-color: #f1f1f1; font-family: arial; font-size: 14px;">
					<div id="realDetail${dto.jumun_num }"></div>
				</td>
			</tr>
		</c:forEach>
		<c:if test="${empty list }">
			<tr><td colspan="7" align="center" valign="middle"><h4>주문 내역이 없습니다.</h4><td></tr>
		</c:if>
		<tr>
			<td><div style="min-height: 50px;"></div></td>
		</tr>
	</table>
	
</div>
<div style="min-height: 40px;"></div>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();
%>
<script>
	function check() {
		var memo = $("#refund_Memo").val().trim();
		$("#refund_Memo").val(memo);
		if (memo == "") {
			alert("내용을 입력 해 주세요")
			$("#refund_Memo").val("");
			$("#refund_Memo").focus();
		}
		var url = "<%=cp%>/jumun/refund";
		var query = "jumun_Num=${jumun_Num}&refund_Memo="+memo;
		$.ajax({
			type:"post"
			,url:url
			,data:query
			,success:function(data) {
				alert("환불 신청에 성공하셨습니다.\n메인 페이지로 돌아갑니다.");
				location.href="<%=cp%>/main";
			}
			,error:function(e) {
				console.log(e.responseText);
			}
		});
	}
</script>
<div align="center" style="margin: 100px 0 200px;">
	<div style="width:500px; border: 1px solid black; border-radius: 5px;">
		<div style="font-size: 30px; font-weight: 900; border-bottom: 1px solid black;">결제 내역</div>
		<div style="padding: 10px;">
			<c:forEach var="ddto" items="${list}">
				<div style="float: left;">${ddto.MAINMENU_TITLE} : ${ddto.mainmenu_pay}원</div><div style="float: left;"><c:if test="${not empty ddto.SUBMENU_TITLE}">&nbsp;+&nbsp;${ddto.SUBMENU_TITLE} : ${ddto.submenu_pay}원</c:if></div><br>
			</c:forEach>
			<br><div style="float: right;">총액 : ${dto.jumun_pay}원</div><br>
		</div>
	</div><br>
	<div style="width:500px; border: 1px solid black; border-radius: 5px;">
		<div style="font-size: 30px; font-weight: 900; border-bottom: 1px solid black;">환불 사유</div>
		<div style="padding: 10px;">
			<textarea id="refund_Memo" style="width: 100%; height: 300px; resize:none; border: 0;"></textarea>
		</div>
	</div><br>
	<div style="width:500px;">
		<button type="button" class="btn" style="float: left; font-size: 20px;" onclick="javascript:location.href='<%=cp%>/member/payList'">결제 내역으로 돌아가기</button>
		<button type="button" class="btn" style="float: right; font-size: 20px;" onclick="check();">환불 신청하기</button>
	</div>
</div>

	<%-- 환불 폼!!!!!<br>
	주문넘버 : ${jumun_Num}
	<table>
		<tr>
			<td>${dto.g1_name}</td>
			<td>${dto.g2_tel}</td>
			<td>${dto.jumun_addr}</td>
			<td>${dto.jumun_tel}</td>
			<td>${dto.jumun_pay}</td>
			<td>${dto.orders_state}</td>
		</tr>
	</table> --%>
	

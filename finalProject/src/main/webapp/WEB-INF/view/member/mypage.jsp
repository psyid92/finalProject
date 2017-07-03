<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<style>
<!--
body {
	width: 1000px;
	margin: 0 auto;
}

#mypage_menu {
	display: inline-block;
	width: 200px;
	border : 1px solid black;
	height: 100px;
	text-align: center;
	line-height: 100px;
	margin: 20px;
	background-color: white;
}
-->
</style>


<div style="" align="center">
<br>
<div>
<h3>내 마일리지 : 10000 점</h3>
<c:if test="${not empty msg }">
<p style="color: blue;">${msg }</p>
</c:if>
</div>
<br>
<br>

<div id="mypage_menu" onclick="javascript:location.href='<%=cp%>/member/update'">정보 수정</div>
<div id="mypage_menu" onclick="javascript:location.href='<%=cp%>/member/ilike'">찜한 가게</div>
<div id="mypage_menu" onclick="javascript:location.href='#'">결제 내역</div><br>
<div id="mypage_menu" onclick="javascript:location.href='<%=cp%>/member/mileage'">마일리지 내역</div>
<div id="mypage_menu" onclick="javascript:location.href='#'">내 리뷰</div>
<div id="mypage_menu" onclick="javascript:location.href='<%=cp%>/member/memberAccount'">비밀번호 변경/탈퇴</div>
<div id="mypage_menu" onclick="javascript:location.href='#'">1대1 문의</div>

</div>
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
<h3>�� ���ϸ��� : 10000 ��</h3>
<c:if test="${not empty msg }">
<p style="color: blue;">${msg }</p>
</c:if>
</div>
<br>
<br>

<div id="mypage_menu" onclick="javascript:location.href='<%=cp%>/member/update'">���� ����</div>
<div id="mypage_menu" onclick="javascript:location.href='<%=cp%>/member/ilike'">���� ����</div>
<div id="mypage_menu" onclick="javascript:location.href='#'">���� ����</div><br>
<div id="mypage_menu" onclick="javascript:location.href='<%=cp%>/member/mileage'">���ϸ��� ����</div>
<div id="mypage_menu" onclick="javascript:location.href='#'">�� ����</div>
<div id="mypage_menu" onclick="javascript:location.href='<%=cp%>/member/memberAccount'">��й�ȣ ����/Ż��</div>
<div id="mypage_menu" onclick="javascript:location.href='#'">1��1 ����</div>

</div>
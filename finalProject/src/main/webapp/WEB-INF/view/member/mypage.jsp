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
	line-height: 20px;
	vertical-align: middle;
}
-->
</style>


<div style="" align="center">
<div id="mypage_menu" onclick="javascript:location.href='#'">정보 수정</div>
<div id="mypage_menu" onclick="javascript:location.href='#'">찜한 가게</div>
<div id="mypage_menu" onclick="javascript:location.href='#'">결제 내역</div><br>

</div>
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

#one_pack{
	max-width:600px;
	min-width: 200px; 
	
}
-->
</style>


<div style="" align="center">
	<div class=".col-xs-6 .col-md-4">주문일자</div>
	<div class=".col-xs-6 .col-md-4">용도</div>
	<div class=".col-xs-6 .col-md-4">포인트</div>

	<c:forEach var="dto" items="${list }">
		<div id="one_pack">
			<div class=".col-md-4" style="float: left; font-size: 18px; line-height: 30px;">주문<br>${dto.mil_created }</div>
			<div class=".col-md-4" align="center" style="vertical-align: middle; font-size: 20px; line-height: 40px; ">${dto.mil_state }</div>
			<div class=".col-md-4" style="float:right; font-size: 24px;"><p style="color: pink;">
				+ ${dto.mil_point }
				</p></div>
		</div>
	</c:forEach>
</div>
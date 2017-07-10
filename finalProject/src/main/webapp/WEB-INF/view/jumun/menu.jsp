<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();
%>
<script>
$(function(){
	$("#giup").children().click(function(){
		var g1_Num = $(this).attr("id").substring(4);
		var g1_Name = $(this).next().val();
		location.href = "<%=cp%>/jumun/article?g1_Num=" + g1_Num + "&g1_Name=" + g1_Name;
	});
});

</script>
<style>
#giup td {
	cursor:pointer;
	text-align:center;
	width: 300px;
	float: left;
	margin: 0 12.5px 15px;
	border-radius: 8px;
	background-color: #eeeeee;
	transition: all 0.2s, transform 0.2s;
}
#giup td:hover {
	width: 310px;
}
</style>
<div id="payLayout">
<table style="margin-bottom: 100px; width: 1000px;">
	<tr id="giup" style="width: 310px; height: 195px;">
		<c:forEach var="dto" items="${list}">
			<c:if test="${dto.giupAd_Num ne 0}">
				<td id="giup${dto.g1_Num}" rowspan="2" style="height: 190px; line-height: 190px; background-image: url('<%=cp%>/resource/img/background2.png'); background-repeat: no-repeat; background-position: center center; background-size: 105% 105%;">${dto.g1_Name}
				광고구매기업</td>
				<input type="hidden" name="g1_Name" value="${dto.g1_Name}">
				
			</c:if>
			<c:if test="${dto.giupAd_Num eq 0}">
				<td id="giup${dto.g1_Num}" style="height: 95px; line-height: 95px;">${dto.g1_Name}<br></td>
				<input type="hidden" name="g1_Name" value="${dto.g1_Name}">
			</c:if>
		</c:forEach>
	</tr>

</table>		
</div>
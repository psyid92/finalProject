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
		location.href = "<%=cp%>/pay/article?g1_Num=" + g1_Num;
	});
});

</script>
<div id="payLayout">
<table style="margin-bottom: 100px; width: 1000px;">
	<tr id="giup">
		<c:forEach var="dto" items="${list}">
			<c:if test="${dto.giupAd_Num ne 0}">
				<td id="giup${dto.g1_Num}" rowspan="2" style="cursor:pointer; text-align:center; width: 300px; height: 190px; border: 1px solid black; float: left; margin: 0 12.5px 15px;">${dto.g1_Name}<br>
					광고 구매 기업
				</td>
			</c:if>
			<c:if test="${dto.giupAd_Num eq 0}">
				<td id="giup${dto.g1_Num}" style="cursor:pointer; text-align:center; width: 300px; height: 92.5px; border: 1px solid black; float: left; margin: 0 12.5px 10px;">${dto.g1_Name}<br>
					광고 비구매 기업
				</td>
			</c:if>
		</c:forEach>
	</tr>

</table>		
</div>
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
	margin: 7.5px 12.5px;
	border-radius: 8px;
	transition: all 0.2s, transform 0.2s;
}
#giup td:hover {
	width: 310px;
}
</style>
<c:if test="${count > 0}">
	<div style="width: 1000px; margin: 50px auto;"><div id="where" style="float: left;"></div><div>에서 5km반경 내 총 ${count}곳을 찾았습니다.</div></div>
</c:if>
<c:if test="${count == 0}">
	<div style="width: 1000px; margin: 50px auto;"><div id="where" style="float: left;"></div><div>에서 5km반경 내에 음식점이 없습니다.</div></div>
</c:if>
<div id="payLayout">
<table style="margin-bottom: 100px; width: 1000px;">
	<tr id="giup" style="width: 310px; height: 195px;">
		<c:forEach var="dto" items="${list}">
			<c:if test="${dto.giupAd_State >= 1}">
				<td id="giup${dto.g1_Num}" rowspan="2" style="display:none; height: 205px; line-height: 205px; background-image: url('<%=cp%>/resource/img/div_background.png'); background-repeat: no-repeat; background-position: center center; background-size: 105% 105%;">${dto.g1_Name}</td>
				<input type="hidden" name="g1_Name" value="${dto.g1_Name}">
			</c:if>
			
			<c:if test="${dto.giupAd_State == 0}">
				<td id="giup${dto.g1_Num}" rowspan="2" style="display:none; height: 205px; line-height: 205px; background-image: url('<%=cp%>/resource/img/div_background.png'); background-repeat: no-repeat; background-position: center center; background-size: 105% 105%;">${dto.g1_Name}</td>
				<input type="hidden" name="g1_Name" value="${dto.g1_Name}">
			</c:if>
		</c:forEach>
	</tr>
</table>		
</div>
<script>
$(function(){
	var n = 1;
	for (var i = 0; i < 10; i++) {
		$('#giup td:nth-child('+n+')').show();
		n+=2;
	}
	$(window).scroll(function(){
		if ($(window).scrollTop() == $(document).height() - $(window).height()) {
			for (var i = 0; i < 10; i++ ){
	   		 	$('#giup td:nth-child('+n+')').show();
	   		 	n+=2;
			}
		}
	});
});
</script>
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
	/* var n = 0;
    $(window).scroll(function(){
    	if ($(window).scrollTop() == $(document).height() - $(window).height()) {
    		n++;
    		for (var i = 0; i < 10; i++) {
        		 	$('body').append(n + "<br>");
    		}
    	}
    }); */
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
				<td id="giup${dto.g1_Num}" rowspan="2" style="display:none; height: 190px; line-height: 190px; background-image: url('<%=cp%>/resource/img/background2.png'); background-repeat: no-repeat; background-position: center center; background-size: 105% 105%;">${dto.g1_Name}
				광고구매기업</td>
				<input type="hidden" name="g1_Name" value="${dto.g1_Name}">
				
			</c:if>
			<c:if test="${dto.giupAd_Num eq 0}">
				<td id="giup${dto.g1_Num}" style="display:none; height: 95px; line-height: 95px;">${dto.g1_Name}<br></td>
				<input type="hidden" name="g1_Name" value="${dto.g1_Name}">
			</c:if>
		</c:forEach>
	</tr>
</table>		
</div>
<script>
$(function(){
	var n = 1;
	for (var i = 0; i < 3; i++) {
		$('#giup td:nth-child('+n+')').show();
		n+=2;
	}
	$(window).scroll(function(){
		if ($(window).scrollTop() == $(document).height() - $(window).height()) {
			for (var i = 0; i < 3; i++ ){
	   		 	$('#giup td:nth-child('+n+')').show();
	   		 	n+=2;
			}
		}
	});
});
</script>
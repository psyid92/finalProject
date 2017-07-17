<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
	Calendar cal=Calendar.getInstance();
%>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>

<script type="text/javascript">
$(function(){
	//처음 들어왔을때 월 선택 쿼리
	$("#cur_Month").val("${cur_Month }").prop("select", true);
	sendDateData();
});

function sendDateData() {
	$(function(){
		//alert($("#cur_Year").val());
		//alert($("#cur_Month").val());
		//$("#cur_Year").val($("#cur_Year").val()).prop("select", true);
		$("#cur_Month").val($("#cur_Month").val()).prop("select", true);
		
		var lastDay = ( new Date('${cur_Year}', '${cur_Month }', 0) ).getDate();
		var target_days=new Array();
	
		for(var i=0; i<lastDay; i++){
			target_days.push((i+1)+'일');
		}
		
		var url="<%=cp%>/store/storeSales";
		var data={ cur_Year: $("#cur_Year").val(), cur_Month: $("#cur_Month").val() };
			$.getJSON(url, data, function(csv) {
				$('#lineContainer1').highcharts(
						{
							title : {
								text : $("#cur_Year").val()+'년도 '+ $("#cur_Month").val()+'월 매출', 
							},
							xAxis : {
								categories : target_days
							},
							yAxis : {
								title : {
									text : '매출액'
								},
							},
							series : csv
							
				});
				//console.log(csv[0].ajaxMonth+1);
				//console.log(csv[0].ajaxYear);
				//$("#cur_Year").children().text(csv[0].ajaxYear);
				
		});
			
	});
}
</script>

<div class="storeBodyFrame2">
	
	<div class="body-title">
		<h3>
			<span class="glyphicon glyphicon-tower"></span> 매출현황
		</h3>
	</div>
	
	<form id="curDateForm" name="curDateForm" >
		<input type="number" id="cur_Year" maxlength="4" style="width: 60px; height: 22px;" value="${cur_Year }">년
	
		<%-- <select id="cur_Year" name="cur_Year">
			<c:forEach var="i" begin="1" end="5" step="1">
				<option value="${cur_Year-6+i}">${cur_Year-6+i}년</option>
			</c:forEach>
			<option value="${cur_Year }" selected="selected">${cur_Year }년</option>
			<c:forEach var="i" begin="1" end="5" step="1">
				<option value="${cur_Year+i}">${cur_Year+i}년</option>
			</c:forEach>
		</select> --%>
	
		<select id="cur_Month" name="cur_Month">
			<c:forEach var="i" begin="1" end="12" step="1">
				<option value=${i }>${i }월</option>
			</c:forEach>
		</select>
		<input type="button" onclick="sendDateData();" value="검색">
	</form>
	
	<div style="clear: both;">
		<div id="lineContainer1"
			style="width: 100%; height: 100%; float: left; margin: 10px;"></div>
	</div>
	
	<div>
		매출현황<br>
		<c:forEach var="dto" items="${list }">
			<span>${dto.g1_num }</span>
			<br>
			<span>${dto.g1_name }</span>
			<br>
			<span>${dto.pay_created }</span>
			<br>
			<span>${dto.pay_pay}</span>
			<br>
			<br>
		</c:forEach>
	</div>
</div>
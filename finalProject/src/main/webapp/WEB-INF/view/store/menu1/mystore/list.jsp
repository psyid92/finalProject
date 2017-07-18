<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
	Calendar cal=Calendar.getInstance();
%>
<style type="text/css">
table{
	width: 100%;
	border-collapse: collapse;
    text-align: right;
    line-height: 1.5;
    border-left: 1px solid #ccc;
    margin: 20px 10px;
}
th{
	padding: 10px;
    font-weight: bold;
    border-top: 1px solid #ccc;
    border-right: 1px solid #ccc;
    border-bottom: 2px solid #aaa;
    background: #eee;
    text-align: center;
}
td{
	padding: 10px;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}
</style>
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
							series:csv.series
				console.log(csv.list);
				console.log(csv.daySalesMonth);
				console.log(csv.totalDaySalesMonth);
				monthList(csv.list, csv.daySalesMonth, csv.totalDaySalesMonth);
				//console.log(csv [0].ajaxMonth+1);
				//console.log(csv[0].ajaxYear);
				//$("#cur_Year").children().text(csv[0].ajaxYear);
			});
			
				monthList(csv.list, csv.daySalesMonth, csv.totalDaySalesMonth);
			});
	});
}

function monthList(list, daySalesMonth, totalDaySalesMonth){
	var s = "";
	s+="<table>";
	s += "<tr>";
	s += "<th>결제일</th>";
	s += "<th>메뉴카테고리</th>";
	s += "<th>메뉴이름</th>";
	s += "<th>메뉴개수</th>";
	s += "<th>판매액</th>";
	s += "</tr>";
	for (var i = 0; i < list.length; i++) {
		s += "<tr>";
		s += "<td style='text-align: center;'>"+list[i].pay_created+"</td>";
		s += "<td style='text-align: center;'>"+list[i].menuct_title+"</td>";
		s += "<td style='text-align: center;'>"+list[i].mainmenu_title+"</td>";
		s += "<td style='text-align: center;'>"+list[i].menuct_count+"</td>";
		s += "<td>"+list[i].menuTotalPay+"원</td>";
		s += "</tr>";
	} 
	s += "<tr style='background: #eee;'>";
	s += "<td colspan='4'>총 판매액</td>";
	s += "<td>"+totalDaySalesMonth+"원</td>";
	s += "</tr>";
	s+="</table>";
	
	$("#totalList").html(s);
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
		<div id="totalList">매출현황</div><br>
		
		<div id="totalList"></div><br>
	</div>
</div>
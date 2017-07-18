<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>

<div id="container"
	style="min-width: 310px; height: 400px; margin: 0 auto"></div>

<script type="text/javascript">

/* 기본으로 불러올 데이터 : 오늘로부터 7일 */

$(function (){
	var url = "<%=cp%>/stats/visitCounter";
	var mydata = "mydata=" + 7;
	$.ajax({
		type : "get",
		url : url,
		data : mydata,
		dataType : "json",
		success : function(data) {

			var count = [];
			var date = [];
			for (var x = 0; x < data.visitList.length; x++) {
				count.push(data.visitList[x].visit_count);
				date.push(data.visitList[x].visit_date);
			}

			visitHighchart(count, date);
		},
		error : function(e) {
			console.log(e.responseText);
		}
	});
});

	function getVisit(mycount){
		var url = "<%=cp%>/stats/visitCounter";
		var mydata = "mydata=" + mycount;
		$.ajax({
			type : "get",
			url : url,
			data : mydata,
			dataType : "json",
			success : function(data) {

				var count = [];
				var date = [];
				for (var x = 0; x < data.visitList.length; x++) {
					count.push(data.visitList[x].visit_count);
					date.push(data.visitList[x].visit_date);
				}

				visitHighchart(count, date);
			},
			error : function(e) {
				console.log(e.responseText);
			}
		});
	}//getVisit end
	
	
	
	function visitHighchart(count, date) {
		var myCount = [ count ];
		/* alert("mycount :" + myCount); */
		/*
		alert("date : "+ date); */

		Highcharts.chart('container', {

			title : {
				text : '방문자 통계'
			},

			xAxis : {
				categories : date
			},

			yAxis : {
				type : 'logarithmic',
				/* minorTickInterval: 0.1 */
				title : {
					text : '방문자 수'
				}
			},

			tooltip : {
				headerFormat : '<b>날짜 : {point.x}</b><br />',
				pointFormat : '방문자 수 : {point.y}'
			},

			series : [ {
				name : [ '날짜별' ],
				data : count,
			} ]
		});

	}
</script>


<div style="min-width: 310px; height: 100px; margin: 0 auto">
	<button type="button" onclick="getVisit(7);" class="btn btn-info">기본값 보기</button>
	<button type="button" onclick="getVisit(15);" class="btn btn-info">15일 보기</button>
	<button type="button" onclick="getVisit(30);" class="btn btn-info">30일 보기</button>
</div>

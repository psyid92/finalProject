<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>

<br><br>
<div style="margin: 0px auto;" align="center">
<h3>�湮�� �� ��ȸ</h3>
</div>
<br><br>

<div id="allVisitor" style="float: left;"></div>
<div id="container"
	style="min-width: 310px; height: 400px; margin: 0 auto"></div>

<script type="text/javascript">

/* �⺻���� �ҷ��� ������ : ���÷κ��� 7�� */
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
			var total = data.totalCount;
			visitHighchart(count, date, total);
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
				var total = data.totalCount;
				visitHighchart(count, date, total);
				
			},
			error : function(e) {
				console.log(e.responseText);
			}
		});
	}//getVisit end
	
	
	
	function visitHighchart(count, date, total) {
		var myCount = [ count ];

		Highcharts.chart('container', {

			title : {
				text : '�湮�� ���'
			},

			xAxis : {
				categories : date
			},

			yAxis : {
				type : 'logarithmic',
				/* minorTickInterval: 1,  */
				title : {
					text : '�湮�� ��'
				}
			},

			tooltip : {
				headerFormat : '<b>��¥ : {point.x}</b><br />',
				pointFormat : '�湮�� �� : {point.y}'
			},

			series : [ {
				name : [ '��¥��' ],
				data : count,
			} ]
		});

		$('#allVisitor').html("�� �湮�� �� : " + total);
		
	}
	
</script>

<br><br><br>
<div style="min-width: 310px; height: 100px; margin: 0 auto;" align="center">
	<button type="button" onclick="getVisit(7);" class="btn btn-info">�⺻�� ����</button>
	<button type="button" onclick="getVisit(15);" class="btn btn-info">15�� ����</button>
	<button type="button" onclick="getVisit(30);" class="btn btn-info">30�� ����</button>
</div>

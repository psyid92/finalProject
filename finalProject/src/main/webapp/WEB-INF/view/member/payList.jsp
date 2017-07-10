<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>


<script>
function getDetail(data){
	//�ֹ� �� �������� ��ġ
	
	var url = "<%=cp%>/member/getDetail";
	var mydata = "mydata="+data;
	
	var detail = "#detail"+data;
	var realD = "#realDetail" + data;

	if(!$(realD).show()){
	}
	
	if($(realD).html() != ""){
		$(realD).html("");
		$(realD).hide();
		
	} else {
		
		$.ajax ({
			type:"post"
			, url : url
			, data : mydata
			, dataType : "json"
			, success : function(data){
				var myJumun = data.myJumun;
				
				$(realD).html(myJumun);
				$(detail).show();
			}
		, error :function(e){
			console.log(e.responseText);
		}
		});
	}

}

</script>

<style>
	th {
		font-size: 18px;
	}
</style>


<br>
<div align="center">
<h3>�ֹ� ����</h3>
</div>
<br>
<br>
<div style="border-radius: 5px; border: 1px double black; min-height: 300px;" align="center">
<br><br>

		<br>
		<table style="border: none; border-collapse: collapse; width: 90%;">
		<tr>
			<th width="8%" style="text-align: center;">����</th>
			<th width="*">�Է��� �ּ�</th>
			<th width="13%">��ȭ��ȣ</th>
			<th width="10%">�� �ݾ�</th>
			<th width="10%">�ֹ� ����</th>
			<th width="10%">���� ����</th>
		</tr>
		<tr><td colspan="6"><hr></td></tr>
		<c:forEach var="dto" items="${list }">
			<tr style="height: 40px;" onclick="getDetail(${dto.jumun_num})">
				<td width="8%">${dto.g1_name }</td>
				<td width="*">${dto.jumun_addr }</td>
				<td width="13%">${dto.jumun_tel }</td>
				<td width="10%">${dto.jumun_pay }</td>
				<td width="10%">${dto.orders_state }</td>
				<c:if test="${dto.pay_pay ne 0}"><td width="10%">�����Ϸ�</td>
				</c:if>
				
				<c:if test="${dto.pay_pay eq 0}"><td width="10%">�̰���</td>
				</c:if>
				
			
			</tr>
			<tr style="display: none;" id="detail${dto.jumun_num }" >
				<td colspan="6" style="background-color: #f1f1f1;">
					<div id="realDetail${dto.jumun_num }"></div>
				</td>
			</tr>
		</c:forEach>
		<c:if test="${empty list }">
			<tr><td colspan="6" align="center" valign="middle"><h4>�ֹ� ������ �����ϴ�.</h4><td></tr>
		</c:if>
	</table>
	
</div>
<div style="min-height: 40px;"></div>
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
	
	$.ajax ({
		type:"post"
		, url : url
		, data : mydata
		, dataType : "json"
		, success : function(data){
			//���⼭ tr�� ���� �־���� ��
			var td = document.getElemenyByName("detail${dto.jumun_num}");
			alert(td);
		}
	, error :function(e){
		console.log(e.responseText);
	}
	});
	
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
<div style="border-radius: 5px; border: 1px double black; min-height: 500px;" align="center">
<br><br>

		<br>
		<table style="border: none; border-collapse: collapse; width: 90%;">
		<tr>
			<th style="text-align: center;">���</th>
			<th>�Է��� �ּ�</th>
			<th>��ȭ��ȣ</th>
			<th>�� �ݾ�</th>
			<th>�ֹ� ����</th>
			<th>���� ����</th>
		</tr>
		<tr><td colspan="6"><hr></td></tr>
		<c:forEach var="dto" items="${list }">
			<tr style="height: 40px;" onclick="getDetail(${dto.jumun_num})">
			<td>${dto.g1_name }</td>
			<td>${dto.jumun_addr }</td>
			<td>${dto.jumun_tel }</td>
			<td>${dto.jumun_pay }</td>
			<td>${dto.orders_state }</td>
				<c:if test="${dto.pay_pay ne 0}"><td>�����Ϸ�</td>
				</c:if>
				
				<c:if test="${dto.pay_pay eq 0}"><td>�̰���</td>
				</c:if>
				
			
			</tr>
			<tr name="detail${dto.jumun_num }" >
			</tr>
		</c:forEach>
	</table>

</div>
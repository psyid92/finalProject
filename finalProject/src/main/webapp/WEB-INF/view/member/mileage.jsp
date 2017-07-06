<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script>
	function deleteThisList(data){
		//��ġ �Űܾ� ��
		var url = "<%=cp%>/";
	}
</script>

<style>
<!--

#one_pack{
	max-width:800px;
	min-width: 600px; 
	
}

#myTop{
	width: 200px;
}

td {
	font-size: 23px;
}

-->
</style>


<br><br>
<div align="center">
<h3>�� ���ϸ��� : ${mileage } ��</h3>
<c:if test="${not empty msg }">
<p style="color: blue;">${msg }</p>
</c:if>
</div>
<br>
<br>


<div style="border-radius: 5px; border: 1px double black; min-height: 600px;" align="center">
<br><br>



	<table style="border: none; border-collapse: collapse; width: 600px;">
		<tr style="height: 40px;">
			<td width="50%">����</td>
			<td width="18%">����</td>
			<td width="18%" align="right">����Ʈ</td>
			<td width="*"></td>
		</tr>
		</table>
		<br>
		<hr>
		<br>
		<table style="border: none; border-collapse: collapse; width: 600px;">
		<c:forEach var="dto" items="${list }">
			<tr style="height: 40px;">
				<td width="50%">${dto.mil_created }</td>
				<td width="18%">${dto.mil_state }</td>
				<td align="right" width="18%">
						<c:if test="${dto.mil_state eq '����' }"><p style="color: pink;">+ ${dto.mil_point }</p></c:if>
						<c:if test="${dto.mil_state eq '���' }"><p style="color: pink;">- ${dto.mil_point }</p></c:if>
						<c:if test="${dto.mil_state eq '���� ���' || dto.mil_state eq '��� ���'}"><p style="color: red;">${dto.mil_point }</p></c:if>
				 </td>
				 <td width="*" align="right"> <a onclick="deleteThisList(${dto.mil_num});" class="btn btn-sm btn-danger"><span class="glyphicon glyphicon-remove"></span> ����</a></td>
			</tr>
		</c:forEach>
	</table>

</div>
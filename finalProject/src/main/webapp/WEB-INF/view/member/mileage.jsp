<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>


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

<div style="" align="center">
<br><br><br>


	<table style="border: none; border-collapse: collapse; width: 600px;">
		<tr style="height: 40px;">
			<td>����</td>
			<td>����</td>
			<td align="right">����Ʈ</td>
		</tr>
		<c:forEach var="dto" items="${list }">
			<tr style="height: 40px;">
				<td>${dto.mil_created }</td>
				<td>${dto.mil_state }</td>
				<td align="right">
						<c:if test="${dto.mil_state eq '����' }"><p style="color: pink;">+ ${dto.mil_point }</p></c:if>
						<c:if test="${dto.mil_state eq '���' }"><p style="color: pink;">- ${dto.mil_point }</p></c:if>
						<c:if test="${dto.mil_state eq '���� ���' || dto.mil_state eq '��� ���'}"><p style="color: red;">${dto.mil_point }</p></c:if>
				 </td>
			</tr>
		</c:forEach>
	</table>

</div>
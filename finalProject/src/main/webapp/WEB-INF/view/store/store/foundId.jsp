<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<div align="center">
<div style="margin: auto;">
	${message }
	
	<c:if test="${state eq 'g1_Id' }">
		<br>
		<p style="font-size: 22px;">������� ���̵�� <span style="color: blue;">${g1_Id} </span> �Դϴ�.</p><br>
		<button type="button"
		 onclick="javascript:location.href='<%=cp %>/store/login'"
		  class="btn btn-default">
		�α����Ϸ� ����</button>
	</c:if>
</div>
</div>
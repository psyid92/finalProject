<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<div align="center">
<div style="margin: auto;">
	${msg }
	
	<c:if test="${state eq 'email' }">
		
		<br>
		<p style="font-size: 22px;">�̸����� ${m1_email } �Դϴ�.</p><br><br><br>
		<button type="button" onclick="javascript:location.href='<%=cp %>/main';" class="btn btn-default">Ȩ������ ����</button>
		<button type="button" onclick="javascript:location.href='<%=cp %>/member/login'" class="btn btn-default">�α����Ϸ� ����</button>
		
	</c:if>
	
	<c:if test="${state eq 'password' }">
	
	</c:if>
</div>
</div>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>


<div>
	${msg }
	
	<c:if test="${state eq 'email' }">
		�̸����� ${m1_email } �Դϴ�.<br>
		<button type="button" class="btn btn-default">Ȩ������ ����</button>
		<button type="button" class="btn btn-default">�α����Ϸ� ����</button>
		
	</c:if>
	
	<c:if test="${state eq 'password' }">
	
	</c:if>
</div>
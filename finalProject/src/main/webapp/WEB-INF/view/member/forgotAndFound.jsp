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
		이메일은 ${m1_email } 입니다.<br>
		<button type="button" class="btn btn-default">홈페이지 가기</button>
		<button type="button" class="btn btn-default">로그인하러 가기</button>
		
	</c:if>
	
	<c:if test="${state eq 'password' }">
	
	</c:if>
</div>
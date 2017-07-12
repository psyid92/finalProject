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
		<p style="font-size: 22px;">이메일은 ${m1_email } 입니다.</p><br><br><br>
		<button type="button" onclick="javascript:location.href='<%=cp %>/main';" class="btn btn-default">홈페이지 가기</button>
		<button type="button" onclick="javascript:location.href='<%=cp %>/member/login'" class="btn btn-default">로그인하러 가기</button>
		
	</c:if>
	
	<c:if test="${state eq 'password' }">
	
	</c:if>
</div>
</div>
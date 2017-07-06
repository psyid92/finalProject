<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();
%>


<div style='width: 100%; height: 500px;'>
<div align="center" style='line-height: 500px;'>결제가 완료되었습니다.<br>
<h1><a href='<%=cp%>/main'>메인페이지로 돌아가기</a></h1></div>
</div>
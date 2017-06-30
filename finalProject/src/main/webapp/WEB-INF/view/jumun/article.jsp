<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();
%>
<div>
	<c:forEach var="cateDto" items="${cateList}">
		<div style="width: 500px; height: 50px; background-color: #cccccc">${cateDto.menuct_Title}</div>
		<c:forEach var="menuDto" items="${menuList}">
			<div id="mainmenu" style="cursor: pointer;">${cateDto.mainmenu_Title}</div>
		</c:forEach>
	</c:forEach>
</div>
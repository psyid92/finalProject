<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("utf-8");
	String cp=request.getContextPath();
	
	Cookie c1=new Cookie("cur_Loc", null);
	c1.setMaxAge(0);
	c1.setPath("/");
	response.addCookie(c1);
	
	Cookie c2=new Cookie("lat", null);
	c2.setMaxAge(0);
	c2.setPath("/");
	response.addCookie(c2);
	
	Cookie c3=new Cookie("lng", null);
	c3.setPath("/");
	c3.setMaxAge(0);
	response.addCookie(c3);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
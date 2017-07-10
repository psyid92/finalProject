<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Cookie[] cc = request.getCookies();

	if (cc != null) {
		for (Cookie c : cc) {
			String name = c.getName();
			String value = c.getValue();

			if (name.equals("cur_Loc")) {
				value = URLDecoder.decode(value, "UTF-8");
			}

			out.print(name + ":" + value + "<br>");
		}
	}
%>
</body>
</html>
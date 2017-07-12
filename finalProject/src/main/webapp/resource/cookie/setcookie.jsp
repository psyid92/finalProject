<%@ page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("utf-8");
	String cp=request.getContextPath();
	
	String cur_Loc=request.getParameter("location");
	String lat=request.getParameter("lat");
	String lng=request.getParameter("lng");
	
	// 쿠키 설정
	Cookie c1=new Cookie("cur_Loc", URLEncoder.encode(cur_Loc, "UTF-8"));
	c1.setMaxAge(60*60); // 쿠키 유지시간(단위: 초)
	c1.setPath("/");
	response.addCookie(c1);
	
	Cookie c2=new Cookie("lat", lat);
	c2.setMaxAge(60*60); // 쿠키 유지시간(단위: 초)
	c2.setPath("/");
	response.addCookie(c2);

	Cookie c3=new Cookie("lng", lng);
	c3.setMaxAge(60*60); // 쿠키 유지시간(단위: 초)
	c3.setPath("/");
	response.addCookie(c3);
	
%>

location:<%=cur_Loc%><br>
lat:<%=lat%><br>
lng:<%=lng%>
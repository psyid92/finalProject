<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
   String cp = request.getContextPath();
// String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+cp;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>spring</title>

<link rel="stylesheet" href="<%=cp%>/resource/jquery/css/smoothness/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/resource/bootswatch/bootstrap.min.css">

<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=cp%>/resource/css/css.css">
<link rel="stylesheet" href="<%=cp%>/resource/alertify/alertify.core.css" />
<link rel="stylesheet" href="<%=cp%>/resource/alertify/alertify.default.css" id="toggleCSS" />
<style type="text/css">
@font-face {
	font-family: 'ice';
	src: url("<%=cp%>/resource/fonts/ice.ttf");
}

body {
	font-family: ice;
	font-size: 20px;
}
</style>
</head>

<body>
<div id="header">
	<tiles:insertAttribute name="header"/>
	</div>
	
	<div id="body" style="overflow:hidden;">
	 <tiles:insertAttribute  name="body"/>
	</div>
	
	<div id="footer">
	<tiles:insertAttribute name="footer"/>
	</div>

<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.ui.datepicker-ko.js"></script>


</body>
</html>
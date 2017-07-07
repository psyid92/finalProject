<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style type="text/css">
	* {
    margin: 0;
    padding: 0;
}


[class*="btn-"] {
    position: relative;
    display: inline-block;
    width: 100%;
    color: black;
    font-size: 16px;
    line-height: 45px;
    margin-right:3em;
    max-width: 100px;
    text-decoration: none;
    text-transform: uppercase;
    vertical-align: middle;
}

.btn-1 {
    -webkit-transition: all .28s ease-in-out;
    transition: all .28s ease-in-out;
}
.btn-1:after,
.btn-1:before {
    border: 1px solid rgba(255, 255, 255, 0);
    bottom: 0;
    content: " ";
    display: block;
    margin: 0 auto;
    position: relative;
    -webkit-transition: all .28s ease-in-out;
    transition: all .28s ease-in-out;
    width: 0;
}
.btn-1:hover:after,
.btn-1:hover:before {
    border-color: black;
    -webkit-transition: width 350ms ease-in-out;
    transition: width 350ms ease-in-out;
    width: 70%;
}
.btn-1:hover:before {
    bottom: auto;
    top: 0;
}
</style>
</head>
<body>

    <div class="buttons">
        <!-- Start of Button 1 -->
        <a href="#none" class="btn-1">Hover</a>
    </div>

</body>
</html>
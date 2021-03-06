<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();
%>

<script>
	$(function() {
		$(".dropdown-toggle").click(function() {
			if ($(".dropdown-menu").is(":visible") == false) { 
				$(".dropdown-menu").show();
			} else {
				$(".dropdown-menu").hide();
			};
		});
		$(".dropdown-toggle").change(function() {
			$(".dropdown-menu").hide();
		});
	});
</script>

<style type="text/css">
html, body {
	background-color: #ffffff;
	width: 1000px;
	margin: 0 auto;
}
#headerMenutr {
	background-color: #f7f2e2;
}
#header th {
	width: 195.8px;
}

#header a {
	color: gray;
	font-size: 12px;
}

#mainMenu ul li {
	float: left; padding: 0 20px; height: 100%;
}
#mainMenu ul li a {
	line-height: 100px;
	color: black;
	font-size: 20px;
	text-decoration: none;
}
#mainMenu ul li a:HOVER {
	color: #e36b0c;	
}

</style>
<div style="padding-bottom: 30px;" id="header">
	<div align="right" id="headerMember">
	<c:if test="${empty sessionScope.member}"><a href="<%=cp%>/member/login">로그인</a> | <a href="<%=cp%>/member/member">회원가입</a> | <a href="<%=cp%>/notice/list">고객센터</a></c:if>
	<c:if test="${not empty sessionScope.member}"><a href="<%=cp%>/member/logout">로그아웃</a> | <a href="<%=cp%>/member/mypage">마이페이지</a> | <a href="<%=cp%>/notice/list">고객센터</a></c:if>
	</div>
	<div align="center">
		<div id="title" onclick="javascript:location.href='<%=cp %>/main'" style="width: 400px; height: 130px; background: url('<%=cp%>/resource/img/titleBase.png') no-repeat; background-size: contain; background-position: center center;"></div>
	</div>
</div>
 	

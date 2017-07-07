<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>spring</title>

<script type="text/javascript">
	function sendLogin() {
		var f = document.loginForm;
		f.action = "<%=cp%>/member/login"
		f.submit();
	}
	
	
</script>
<link rel="stylesheet" type="text/css" href="<%=cp%>/resource/bootswatch/bootstrap.css">
</head>
<body>
<div style="width:340px; height:300px; position: absolute; left: 50%; top: 50%; margin: -150px 0 0 -170px;">
	<div style="width:340px; height:230px; position: absolute; left: 50%; top: 50%; margin: -120px 0 0 -170px;" class="progress">
		<div style="width: 300px; height: 140px; position: absolute; left: 50%; top: 50%; margin: -90px 0 0 -150px;">
			<form class="form-horizontal" method="post" action="<%=cp%>/member/login">
  				<fieldset>
    				<legend>로그인</legend>
    				<div class="form-group">
      					<div class="col-lg-10">
        					<input type="text" class="form-control" name="m1_email" placeholder="아이디">
      					</div>
    				</div>
    				<div class="form-group">
      					<div class="col-lg-10">
        					<input type="password" class="form-control" name="m1_pwd" placeholder="비밀번호">
        				</div>
        			</div>
       			</fieldset>
       			<nav style="width: 300px; height: 80px; display: inline-block;">
       				<div style="line-height: 38px; float: left;"><a href="#">아이디 찾기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">비밀번호 찾기</a></div>
       				&nbsp;&nbsp;&nbsp;<button type="submit" class="btn btn-default">로그인</button><br>
<%--        				<p>${msg }</p> --%>
       			</nav>
    		</form>
		</div>
       				
	</div>
	<div style="float: right;">
	<a href="<%=cp %>/member/member" style="size: 8px;">회원가입 하기</a>
	</div>
	
	<div align="center">
			<p style="size: 8px; position: absolute; bottom: 0px; color: red; text-align: center;">${msg }</p>
	</div>

</div>
</body>
</html>
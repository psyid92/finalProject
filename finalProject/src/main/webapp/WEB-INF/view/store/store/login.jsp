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
		
		var str = f.g1_Id.value;
	    if(!str) {
	        alert("아이디를 입력하세요. ");
	        f.g1_Id.focus();
	        return;
	    }

	    str = f.g1_Pwd.value;
	    if(!str) {
	        alert("패스워드를 입력하세요. ");
	        f.g1_Pwd.focus();
	        return;
	    }
		
		f.action = "<%=cp%>/store/login_check";
		f.submit();
	}
</script>
<link rel="stylesheet" type="text/css" href="<%=cp%>/resource/bootswatch/bootstrap.css">
<style type="text/css">
html, body {
	background-color: #f4efe1;
	width: 100%; height: 100%;
}
</style>
</head>
<body>
<div style="width:340px; height:300px; position: absolute; left: 50%; top: 50%; margin: -150px 0 0 -170px;">
	<div style="width:340px; height:230px; position: absolute; left: 50%; top: 50%; margin: -120px 0 0 -170px;" class="progress">
		<div style="width: 300px; height: 140px; position: absolute; left: 50%; top: 50%; margin: -90px 0 0 -150px;">
			<form class="form-horizontal" name="loginForm" method="post">
  				<fieldset>
    				<legend>사장님 로그인</legend>
    				<div class="form-group">
      					<div class="col-lg-10">
        					<input type="text" class="form-control" id="g1_Id" placeholder="아이디">
      					</div>
    				</div>
    				<div class="form-group">
      					<div class="col-lg-10">
        					<input type="password" class="form-control" id="g1_Pwd" placeholder="비밀번호">
        				</div>
        			</div>
       			</fieldset>
       			<nav style="width: 300px; height: 38px; display: inline-block;">
       				<div style="line-height: 38px; float: left;"><a href="#">아이디 찾기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">비밀번호 찾기</a></div>
       				<button type="button" class="btn btn-default" onclick="sendLogin();" style="float: right;">로그인</button>
       			</nav>
    		</form>
		</div>
	</div>
	<div style="float: right;">
	<a href="<%=cp%>/store/join" style="size: 8px;">회원가입</a>
	</div>
</div>
</body>
</html>
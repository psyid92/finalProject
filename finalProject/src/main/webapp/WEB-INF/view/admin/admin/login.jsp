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
		f.action = "<%=cp%>/admin/login_check";
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
	<a href="<%=cp%>/">�������������</a>
	<div style="width:340px; height:230px; position: absolute; left: 50%; top: 50%; margin: -120px 0 0 -170px;" class="progress">
		<div style="width: 300px; height: 140px; position: absolute; left: 50%; top: 50%; margin: -90px 0 0 -150px;">
			<form class="form-horizontal" name="loginForm" method="post">
  				<fieldset>
    				<legend>������ �α���</legend>
    				<div  class="form-group">
      					<div style="width: 100%;" class="col-lg-10">
        					<input type="text" class="form-control" id="userId" name="userId" placeholder="���̵�">
      					</div>
    				</div>
    				<div class="form-group">
      					<div style="width: 100%;" class="col-lg-10">
        					<input style="width: 100%;" type="password" class="form-control" id="userPwd" name="userPwd" placeholder="��й�ȣ">
        				</div>
        			</div>
       			</fieldset>
       			<nav style="width: 300px; height: 38px; display: inline-block;">
       				<button style="width: 100%;" type="button" class="btn btn-default" onclick="sendLogin();" style="float: right;">�α���</button>
       			</nav>
    		</form>
		</div>
	</div>
</div>
</body>
</html>
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
	        alert("���̵� �Է��ϼ���. ");
	        f.g1_Id.focus();
	        return;
	    }

	    str = f.g1_Pwd.value;
	    if(!str) {
	        alert("�н����带 �Է��ϼ���. ");
	        f.g1_Pwd.focus();
	        return;
	    }
		
		f.action = "<%=cp%>/store/login";
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
<div style="width:340px; height:200px; position: absolute; left: 50%; top: 50%; margin: -150px 0 0 -170px;">
	<div style="width:340px; height:300px; position: absolute; left: 50%; top: 50%; margin: -120px 0 0 -170px;" class="progress">
		<a href="<%=cp%>/" style="float: right;">�������������</a>
		<div style="width: 300px; height: 140px; position: absolute; left: 50%; top: 50%; margin: -120px 0 0 -150px;">
			<form class="form-horizontal" name="loginForm" method="post">
  				<fieldset>
    				<legend>����� �α���</legend>
    				<div class="form-group">
      					<div class="col-lg-10" style="width: 100%;">
        					<input type="text" class="form-control" id="g1_Id" name="g1_Id" placeholder="���̵�">
      					</div>
    				</div>
    				<div class="form-group">
      					<div class="col-lg-10" style="width: 100%;">
        					<input type="password" class="form-control" id="g1_Pwd" name="g1_Pwd" placeholder="��й�ȣ">
        				</div>
        			</div>
       			</fieldset> 
       			<nav style="width: 300px; height: 38px; display: inline-block;">
       				<button type="button" class="btn btn-default" onclick="sendLogin();" style="width: 100%;">�α���</button>
       				<div style="line-height: 38px; float: left;">
       				<a href="#">���̵� ã��</a>
       				&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
       				<a href="#">��й�ȣ ã��</a>
       				&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
       				<a href="<%=cp%>/store/join">ȸ������</a></div>
       				<span style="color: red;">${message}</span>
       			</nav>
    		</form>
		</div>
	</div>
</div>
</body>
</html>
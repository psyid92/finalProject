<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>


<script type="text/javascript">

function changePass(){
	
	var f = document.memberForm;
	
	var str = f.m1_pwd.value;
	str = str.trim();
	if(!str) {
		alert("�н����带 �Է��ϼ���. ");
		f.m1_pwd.focus();
		return;
	}
	
	
	f.action = "<%=cp%>/member/memberAccount";
	f.submit();
}

function removeAccount(){
	if(confirm("������ Ż���Ͻðڽ��ϱ�?") == true){
		alert("������ 30�ϰ� ������ �� �����˴ϴ�.");
		var f = document.memberForm;
		
		var str = f.m1_pwd.value;
		str = str.trim();
		if(!str) {
			alert("�н����带 �Է��ϼ���. ");
			f.m1_pwd.focus();
			return;
		} else {
			
		f.action = "<%=cp%>/member/remove";
			f.submit();
		}
		
		
	} else {
		return;
	}
	}
</script>



<style>
.body-container {
	width: 500px;
	margin: auto;
}

#m1_pwd {
	
}
</style>

<div id="box">
	<div class="body-container" style="width: 700px;" align="center">
		<form name="memberForm" method="post">

				<label class="control-label">&nbsp;&nbsp; ��й�ȣ :&nbsp;&nbsp;&nbsp; </label> 	<input id="m1_pwd" name="m1_pwd" type="password" placeholder="��й�ȣ"
						class="input-md">
			<br><br><br><br>
			<!-- Button -->
				<div align="center">
					<button class="btn btn-inverse" onclick="changePass();">��й�ȣ
						����</button>
					<button class="btn btn-default"
						onclick="javascript:history.go(-1);">���</button>
					<button class="btn btn-inverse" onclick="removeAccount();">ȸ��Ż��
						����</button>
				</div>


		</form>
	</div>
</div>
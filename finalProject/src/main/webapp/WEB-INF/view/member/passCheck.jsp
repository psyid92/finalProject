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
	}else {
	f.action = "<%=cp%>/member/memberAccount";
	f.submit();
		
	}
	
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

input {
	border-radius: 5px;
}
</style>

<div id="box">
<br><br>
	<div class="body-container" style="width: 700px;" align="center">
		<form name="memberForm" method="post">


<div class="form-group">
  <label class="col-md-4 control-label" for="m1_pwd">��й�ȣ</label>  
  <div class="col-md-5">
  <input id="m1_pwd" name="m1_pwd" type="text" placeholder="��й�ȣ" type="password" class="form-control input-md" >
    
  </div>
</div>
			<br><br><br><br>
			<!-- Button -->
				<div align="center">
					<button class="btn btn-default" onclick="changePass();">��й�ȣ
						����</button>
					<button class="btn btn-inverse" type="button"
						onclick="javascript:location.href='<%=cp%>/member/mypage';">���</button>
					<button type="button" class="btn btn-default" onclick="removeAccount();">ȸ��Ż��
						����</button>
				</div>


		</form>
	</div>
</div>
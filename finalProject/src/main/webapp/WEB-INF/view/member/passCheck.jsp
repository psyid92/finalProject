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
		alert("패스워드를 입력하세요. ");
		f.m1_pwd.focus();
		return;
	}else {
	f.action = "<%=cp%>/member/memberAccount";
	f.submit();
		
	}
	
}

function removeAccount(){
	if(!str) {
		alert("패스워드를 입력하세요. ");
		f.m1_pwd.focus();
		return;
	} else {
	if(confirm("정말로 탈퇴하시겠습니까?") == true){
		alert("계정은 30일간 보관된 후 삭제됩니다.");
		var f = document.memberForm;
		
		var str = f.m1_pwd.value;
		str = str.trim();
			
		f.action = "<%=cp%>/member/remove";
			f.submit();
		
	} else {
		return;
	}
		
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
  <label class="col-md-4 control-label" for="m1_pwd">비밀번호</label>  
  <div class="col-md-5">
  <input id="m1_pwd" name="m1_pwd" type="text" placeholder="비밀번호" type="password" class="form-control input-md" >
    
  </div>
</div>
			<br><br><br><br>
			<!-- Button -->
				<div align="center">
					<button class="btn btn-default" onclick="changePass();">비밀번호
						변경</button>
					<button class="btn btn-inverse" type="button"
						onclick="javascript:location.href='<%=cp%>/member/mypage';">취소</button>
					<button type="button" class="btn btn-default" onclick="removeAccount();">회원탈퇴
						변경</button>
				</div>


		</form>
	</div>
</div>
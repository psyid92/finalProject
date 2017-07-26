<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>


<script type="text/javascript">

function cancle(){
	var f = document.giupForm;
	f.action="<%=cp%>/store/login";
	f.submit();
}

<c:if test="${empty result}">	

function memberOk() {
	var f = document.giupForm;
	var str;
	
	str = f.m1_pwd.value;
	str = str.trim();
	if(!str) {
		alert("패스워드를 입력하세요. ");
		f.m1_pwd.focus();
		return;
	}
	
	if(!/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{5,10}$/i.test(str)) { 
		alert("패스워드는 5~10자이며 하나 이상의 숫자나 특수문자가 포함되어야 합니다.");
		f.m1_pwd.focus();
		return;
	}
	f.m1_pwd.value = str;
	

	if(str!= f.userPwdCheck.value) {
        alert("패스워드가 일치하지 않습니다. ");
        f.userPwdCheck.focus();
        return;
	}
	f.action = "<%=cp%>/store/pwdChangSubmit";
	
	f.submit();
}

</c:if>


</script>
<style>
.body-container {
	width: 500px;
	margin: auto;
}
</style>


<div id="box">
<div class="body-container" style="width: 700px;" align="center">
	<form name="giupForm" method="post">
		<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
			<tr>
			      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">패스워드</label>
			      </td>
			      <td style="padding: 0 0 15px 15px;">
			        <p style="margin-top: 1px; margin-bottom: 5px;">
			            <input type="password" name="m1_pwd" maxlength="15" class="boxTF"
			                       style="width:95%;" placeholder="패스워드">
			        </p>
			        <p class="help-block">패스워드는 5~10자 이내이며, 하나 이상의 숫자나 특수문자가 포함되어야 합니다.</p>
			      </td>
			  </tr>
			  
			   <tr>
			      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">패스워드 확인</label>
			      </td>
			      <td style="padding: 0 0 15px 15px;">
			        <p style="margin-top: 1px; margin-bottom: 5px;">
			            <input type="password" name="userPwdCheck" maxlength="15" class="boxTF"
			                       style="width: 95%;" placeholder="패스워드 확인">
			        </p>
			        <p class="help-block">패스워드를 한번 더 입력해주세요.</p>
			      </td>
			  </tr>
		</table>
		<c:if test="${not empty g1_Id }">
			<input type="hidden" name="g1_Id" value="${g1_Id }">
		</c:if>
			<button type="button" class="btn btn-default"  onclick="memberOk();">변경하기</button>
			<button type="button" class="btn btn-inverse"  onclick="cancle();">변경 취소</button>
		</form>
</div>
</div>
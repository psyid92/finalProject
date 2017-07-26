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
		alert("�н����带 �Է��ϼ���. ");
		f.m1_pwd.focus();
		return;
	}
	
	if(!/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{5,10}$/i.test(str)) { 
		alert("�н������ 5~10���̸� �ϳ� �̻��� ���ڳ� Ư�����ڰ� ���ԵǾ�� �մϴ�.");
		f.m1_pwd.focus();
		return;
	}
	f.m1_pwd.value = str;
	

	if(str!= f.userPwdCheck.value) {
        alert("�н����尡 ��ġ���� �ʽ��ϴ�. ");
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
			            <label style="font-weight: 900;">�н�����</label>
			      </td>
			      <td style="padding: 0 0 15px 15px;">
			        <p style="margin-top: 1px; margin-bottom: 5px;">
			            <input type="password" name="m1_pwd" maxlength="15" class="boxTF"
			                       style="width:95%;" placeholder="�н�����">
			        </p>
			        <p class="help-block">�н������ 5~10�� �̳��̸�, �ϳ� �̻��� ���ڳ� Ư�����ڰ� ���ԵǾ�� �մϴ�.</p>
			      </td>
			  </tr>
			  
			   <tr>
			      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">�н����� Ȯ��</label>
			      </td>
			      <td style="padding: 0 0 15px 15px;">
			        <p style="margin-top: 1px; margin-bottom: 5px;">
			            <input type="password" name="userPwdCheck" maxlength="15" class="boxTF"
			                       style="width: 95%;" placeholder="�н����� Ȯ��">
			        </p>
			        <p class="help-block">�н����带 �ѹ� �� �Է����ּ���.</p>
			      </td>
			  </tr>
		</table>
		<c:if test="${not empty g1_Id }">
			<input type="hidden" name="g1_Id" value="${g1_Id }">
		</c:if>
			<button type="button" class="btn btn-default"  onclick="memberOk();">�����ϱ�</button>
			<button type="button" class="btn btn-inverse"  onclick="cancle();">���� ���</button>
		</form>
</div>
</div>
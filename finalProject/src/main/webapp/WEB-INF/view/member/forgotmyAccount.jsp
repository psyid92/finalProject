<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>


<script type="text/javascript">
<c:if test="${state eq 'email' }">
	function myAccountId(){
		var f=document.memberForm;
		if($('#m1_nickname').val()== null || $('#m1_nickname').val() == ""){
			alert("�г����� �Է��� �ּ���.");
			$('#m1_nickname').focus();
			return;
		}
		if($('#m2_tel').val() == null || $('#m2_tel').val() == ""){
			alert("��ȭ��ȣ�� �Է��� �ּ���.");
			$('#m2_tel').focus();
			return;
		}
		f.action="<%=cp%>/member/forgotEmail";
		f.submit();
	}
</c:if>

<c:if test="${state eq 'password' }">
	function myAccountPw(){
		var f=document.memberForm;
		if($('#"m1_email"').val()== null || $('#"m1_email"').val() == ""){
			alert("���̵� �Է��� �ּ���.");
			$('#"m1_email"').focus();
			return;
		}
		if($('#m2_tel').val() == null || $('#m2_tel').val() == ""){
			alert("��ȭ��ȣ�� �Է��� �ּ���.");
			$('#m2_tel').focus();
			return;
		}
		f.action="<%=cp%>/main";
		f.submit();
	}
</c:if>
</script>

<style>
.body-container {
	width: 500px;
	margin: auto;
}

table {
	border-collapse: collapse;
	width: 450px;
	height: 100px;
	font-size: 15px;
}
input {
	/* border: none; */
	width: 100%;
	height: 100%;
}

</style>

<div id="box">
<br><br>
	<div class="body-container" style="width: 700px;" align="center">
	<div align="center">
		${msg }
	</div>
	
		<form name="memberForm" method="post">
		<c:if test="${state eq 'email' }">
		<table>
			<tr>
			<td><label class="control-label">�г���</label></td>
			<td>	<input id="m1_nickname" name="m1_nickname" type="text" placeholder="�г���" class="input-md"></td>
			</tr>
			<tr height="10px">
			<td colspan="2"></td>
			</tr>
			<tr>
			<td><label class="control-label">��ȭ��ȣ</label></td><td><input id="m2_tel" name="m2_tel" type="text" placeholder="��ȭ��ȣ" class="input-md"></td>
			</tr>
		</table>
		<br><br>
			<!-- Button -->
				<div align="center">
					<button class="btn btn-inverse" type="button"
						onclick="javascript:location.href='<%=cp%>/member/login';">���</button>
					<button type="button" class="btn btn-default" onclick="myAccountId();">���̵� ã��</button>
				</div>
		</c:if>
		
		<c:if test="${state eq 'password' }">
		
		<table>
			<tr>
			<td><label class="control-label">���̵�</label></td>
			<td>	<input id="m1_email" name="m1_email" type="text" placeholder="�̸���" class="input-md"></td>
			</tr>
			<tr height="10px">
			<td colspan="2"></td>
			</tr>
			<tr>
			<td><label class="control-label">��ȭ��ȣ</label></td><td><input id="m2_tel" name="m2_tel" type="text" placeholder="��ȭ��ȣ" class="input-md"></td>
			</tr>
		</table>
		<br><br>
		
		<!-- Button -->
				<div align="center">
					<button class="btn btn-inverse" type="button"
						onclick="javascript:location.href='<%=cp%>/member/login';">���</button>
					<button type="button" class="btn btn-default" onclick="myAccountPw();">��й�ȣ ����</button>
				</div>
		</c:if>


		</form>
	</div>
</div>
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
			alert("닉네임을 입력해 주세요.");
			$('#m1_nickname').focus();
			return;
		}
		if($('#m2_tel').val() == null || $('#m2_tel').val() == ""){
			alert("전화번호를 입력해 주세요.");
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
			alert("아이디를 입력해 주세요.");
			$('#"m1_email"').focus();
			return;
		}
		if($('#m2_tel').val() == null || $('#m2_tel').val() == ""){
			alert("전화번호를 입력해 주세요.");
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
			<td><label class="control-label">닉네임</label></td>
			<td>	<input id="m1_nickname" name="m1_nickname" type="text" placeholder="닉네임" class="input-md"></td>
			</tr>
			<tr height="10px">
			<td colspan="2"></td>
			</tr>
			<tr>
			<td><label class="control-label">전화번호</label></td><td><input id="m2_tel" name="m2_tel" type="text" placeholder="전화번호" class="input-md"></td>
			</tr>
		</table>
		<br><br>
			<!-- Button -->
				<div align="center">
					<button class="btn btn-inverse" type="button"
						onclick="javascript:location.href='<%=cp%>/member/login';">취소</button>
					<button type="button" class="btn btn-default" onclick="myAccountId();">아이디 찾기</button>
				</div>
		</c:if>
		
		<c:if test="${state eq 'password' }">
		
		<table>
			<tr>
			<td><label class="control-label">아이디</label></td>
			<td>	<input id="m1_email" name="m1_email" type="text" placeholder="이메일" class="input-md"></td>
			</tr>
			<tr height="10px">
			<td colspan="2"></td>
			</tr>
			<tr>
			<td><label class="control-label">전화번호</label></td><td><input id="m2_tel" name="m2_tel" type="text" placeholder="전화번호" class="input-md"></td>
			</tr>
		</table>
		<br><br>
		
		<!-- Button -->
				<div align="center">
					<button class="btn btn-inverse" type="button"
						onclick="javascript:location.href='<%=cp%>/member/login';">취소</button>
					<button type="button" class="btn btn-default" onclick="myAccountPw();">비밀번호 변경</button>
				</div>
		</c:if>


		</form>
	</div>
</div>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>


<script type="text/javascript">
<c:if test="${state eq 'g1_Id' }">
	function myAccountId(){
		var f=document.memberForm;
		if($('#g2_Giupnum').val()== null || $('#g2_Giupnum').val() == ""){
			alert("기업번호를 입력해 주세요.");
			$('#g2_Giupnum').focus();
			return;
		}
		if($('#g1_Name').val() == null || $('#g1_Name').val() == ""){
			alert("전화번호를 입력해 주세요.");
			$('#g1_Name').focus();
			return;
		}
		f.action="<%=cp%>/store/getId";
		f.submit();
	}
</c:if>

<c:if test="${state eq 'g1_Pwd'}">
	function myAccountPw(){
		var f=document.memberForm;
		if($('#g1_Id').val()== null || $('#g1_Id').val() == ""){
			alert("아이디를 입력해 주세요.");
			$('#g1_Id').focus();
			return;
		}
		if($('#g2_Giupnum').val() == null || $('#g2_Giupnum').val() == ""){
			alert("기업번호 입력해 주세요.");
			$('#g2_Giupnum').focus();
			return;
		}
		f.action="<%=cp%>/store/foudPwd";
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
		${message }
	</div>
	
		<form name="memberForm" method="post">
		<c:if test="${state eq 'g1_Id' }">
		<table>
			<tr>
			<td><label class="control-label">기업번호</label></td>
			<td><input id="g2_Giupnum" name="g2_Giupnum" type="text" placeholder="기업번호를 입력하세요" class="input-md"></td>
			</tr>
			<tr height="10px">
			<td colspan="2"></td>
			</tr>
			<tr>
			<td><label class="control-label">가게명</label></td>
			<td><input id="g1_Name" name="g1_Name" type="text" placeholder="가게명 입력하세요" class="input-md"></td>
			</tr>
		</table>
		<br><br>
			<!-- Button -->
				<div align="center">
					<button class="btn btn-inverse" type="button"
						onclick="javascript:location.href='<%=cp%>/store/login';">취소</button>
					<button type="button" class="btn btn-default" onclick="myAccountId();">아이디 찾기</button>
				</div>
		</c:if>
		
		<c:if test="${state eq 'g1_Pwd' }">
		
		<table>
			<tr>
			<td><label class="control-label">아이디</label></td>
			<td><input id="g1_Id" name="g1_Id" type="text" placeholder="아이디를 입력하세요" class="input-md"></td>
			</tr>
			<tr height="10px">
			<td colspan="2"></td>
			</tr>
			<tr>
			<td><label class="control-label">기업번호</label></td>
			<td><input id="g2_Giupnum" name="g2_Giupnum" type="text" placeholder="기업번호를 입력하세요" class="input-md"></td>
			</tr>
		</table>
		<br><br>
		
		<!-- Button -->
				<div align="center">
					<button class="btn btn-inverse" type="button"
						onclick="javascript:location.href='<%=cp%>/store/login';">취소</button>
					<button type="button" class="btn btn-default" onclick="myAccountPw();">비밀번호 변경</button>
				</div>
		</c:if>


		</form>
	</div>
</div>
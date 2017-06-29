<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<script type="text/javascript">
function memberOk() {
	var f = document.memberForm;
	var str;

	 str = f.m1_email.value;
	str = str.trim();
	if(!str) {
		alert("아이디를 입력하세요. ");
		f.m1_email.focus();
		return;
	}
	if(!/^[a-z][a-z0-9_]{4,9}$/i.test(str)) { 
		alert("아이디는 5~10자이며 첫글자는 영문자이어야 합니다.");
		f.m1_email.focus();
		return;
	}
	f.m1_email.value = str;

	
	
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
	
    str = f.m1_nickname.value;
	str = str.trim();
    if(!str) {
        alert("닉네임을 입력하세요. ");
        f.m1_nickname.focus();
        return;
    }
    f.m1_nickname.value = str;

    /* 
    str = f.m2_birth.value;
	str = str.trim();
    if(!str || !isValidDateFormat(str)) {
        alert("생년월일를 입력하세요[YYYY-MM-DD]. ");
        f.m2_birth.focus();
        return;
    }
 */
    
    str = f.m2_tel.value;
	str = str.trim();
    if(!str) {
        alert("전화번호를 입력하세요. ");
        f.m2_tel.focus();
        return;
    }
    if(!/^(\d+)$/.test(str)) {
        alert("숫자만 가능합니다. ");
        f.m2_tel.focus();
        return;
    }
 
    
    
    
    var mode="${mode}";
    if(mode=="created") {
    	f.action = "<%=cp%>/member/member";
    } else if(mode=="update") {
    	f.action = "<%=cp%>
	/member/update";
		}

		f.submit();
	}

	function changeEmail() {
		var f = document.memberForm;

		var str = f.selectEmail.value;
		if (str != "direct") {
			f.email2.value = str;
			f.email2.readOnly = true;
			f.email1.focus();
		} else {
			f.email2.value = "";
			f.email2.readOnly = false;
			f.email1.focus();
		}
	}
</script>
<div class="body-container" style="width: 700px;">
	<div class="body-title">
		<h3>
			<span style="font-family: Webdings">4</span> ${mode=="created"?"회원 가입":"회원 정보 수정"}
		</h3>
	</div>
	<div>
		<form name="giupForm" method="post">
			<table
				style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
				<tr>
					<td width="100" valign="top"
						style="text-align: right; padding-top: 5px;"><label
						style="font-weight: 900;">사업자 등록번호</label></td>
					<td style="padding: 0 0 15px 15px;">
						<p style="margin-top: 1px; margin-bottom: 5px;">
							<input type="text" name="g2_giupNum" id="g2_giupNum"
								value="${dto.g2_giupNum}" style="width: 95%;"
								${mode=="update" ? "readonly='readonly' ":""} maxlength="15"
								class="boxTF" placeholder="사업자 등록번호를 입력해주세요">
						</p>
						<p class="help-block">본인가게의 사업자 등록번호를 입력해주세요</p>
					</td>
				</tr>

				<tr>
					<td width="100" valign="top"
						style="text-align: right; padding-top: 5px;"><label
						style="font-weight: 900;">내 가게 이름</label></td>
					<td style="padding: 0 0 15px 15px;">
						<p style="margin-top: 1px; margin-bottom: 5px;">
							<input type="text" name="giup1_name" id="giup1_name"
								value="${dto.g1_name}" style="width: 95%;"
								${mode=="update" ? "readonly='readonly' ":""} maxlength="15"
								class="boxTF" placeholder="가게의 이름을 적어주세요">
						</p>
						<p class="help-block">가게이름을 입력해주세요</p>
					</td>
				</tr>

				<!-- 닉네임 -->
				<tr>
					<td width="100" valign="top"
						style="text-align: right; padding-top: 5px;"><label
						style="font-weight: 900;">아이디</label></td>
					<td style="padding: 0 0 15px 15px;">
						<p style="margin-top: 1px; margin-bottom: 5px;">
							<input type="text" name="g1_Id" id="g1_Id" value="${dto.g1_Id}"
								style="width: 95%;" maxlength="15" class="boxTF"
								placeholder="아이디는 5~10자로 입력해주세요">
						</p>
						<p class="help-block">아이디는 5~10자로 입력해주세요</p>
					</td>
				</tr>



				<tr>
					<td width="100" valign="top"
						style="text-align: right; padding-top: 5px;"><label
						style="font-weight: 900;">비밀번호</label></td>
					<td style="padding: 0 0 15px 15px;">
						<p style="margin-top: 1px; margin-bottom: 5px;">
							<input type="password" name="g1_Pwd" maxlength="15" class="boxTF"
								style="width: 95%;" placeholder="비밀번호는 5~10자 이내로 입력해주세요">
						</p>
						<p class="help-block">
							패스워드는 5~10자 이내로 입력해주세요<br> 하나 이상의 숫자나 특수문자가 포함되어야 합니다.
						</p>
					</td>
				</tr>

				<tr>
					<td width="100" valign="top"
						style="text-align: right; padding-top: 5px;"><label
						style="font-weight: 900;">패스워드 확인</label></td>
					<td style="padding: 0 0 15px 15px;">
						<p style="margin-top: 1px; margin-bottom: 5px;">
							<input type="password" name="g1PwdCheck" maxlength="15"
								class="boxTF" style="width: 95%;" placeholder="다시 한 번 더 입력해주세요">
						</p>
						<p class="help-block">계정 혹은 전화번호와 같거나 연속된 문자열을 사용한 비밀번호는 권장하지
							않습니다</p>
					</td>
				</tr>

				<tr align="left" height="40"
					style="border-bottom: 1px solid #cccccc;">
					<td width="100" bgcolor="#eeeeee" style="text-align: center;">카테고리</td>
					<td style="padding-left: 10px;"><select name="category"
						class="selectField">
							<option value="">:::선택:::</option>
							<option value="chicken">치킨</option>
							<option value="china">중국집</option>
							<option value="pizza">피자</option>
							<option value="bunsik">분식</option>
							<option value="bossam">족발,보쌈</option>
							<option value="ya">야식</option>
							<option value="zzim">찜,탕</option>
							<option value="don">돈까스</option>

					</select></td>
				</tr>

				<tr>
		     <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
		           <label style="font-weight: 900;">전화번호</label>
		     </td>
		     <td style="padding: 0 0 15px 15px;">
		       <p style="margin-bottom: 5px;">
		           <select class="selectField" id="tel1" name="tel1" >
		               <option value="">선 택</option>
		               <option value="010" ${dto.tel1=="010" ? "selected='selected'" : ""}>010</option>
		               <option value="011" ${dto.tel1=="011" ? "selected='selected'" : ""}>011</option>
		               <option value="016" ${dto.tel1=="016" ? "selected='selected'" : ""}>016</option>
		               <option value="017" ${dto.tel1=="017" ? "selected='selected'" : ""}>017</option>
		               <option value="018" ${dto.tel1=="018" ? "selected='selected'" : ""}>018</option>
		               <option value="019" ${dto.tel1=="019" ? "selected='selected'" : ""}>019</option>
		           </select>
		           -
		           <input type="text" name="tel2" value="${dto.tel2}" class="boxTF" maxlength="4">
		           -
		           <input type="text" name="tel3" value="${dto.tel3}" class="boxTF" maxlength="4">
		       </p>
		     </td>
		 </tr>




































			</table>

			<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
				<tr height="45">
					<td align="center">
						<button type="button" name="sendButton" class="btn"
							onclick="memberOk();">${mode=="created"?"회원가입":"정보수정"}</button>
						<button type="reset" class="btn">다시입력</button>
						<button type="button" class="btn"
							onclick="javascript:location.href='<%=cp%>/store/login';">${mode=="created"?"가입취소":"수정취소"}</button>
					</td>
				</tr>
				<tr height="30">
					<td align="center" style="color: blue;">${msg}</td>
				</tr>
			</table>
		</form>
	</div>

</div>
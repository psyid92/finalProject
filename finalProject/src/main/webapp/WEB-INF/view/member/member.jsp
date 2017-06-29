<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
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
	

	<c:if test="${mode eq 'created'}">
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
	</c:if>
	
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
    	f.action = "<%=cp%>/member/update";
    }

    f.submit();
}

function changeEmail() {
    var f = document.memberForm;
	    
    var str = f.selectEmail.value;
    if(str!="direct") {
        f.email2.value=str; 
        f.email2.readOnly = true;
        f.email1.focus(); 
    }
    else {
        f.email2.value="";
        f.email2.readOnly = false;
        f.email1.focus();
    }
}


</script>
<div class="body-container" style="width: 700px;" align="center">
    <div class="body-title">
        <h3><span style="font-family: Webdings">2</span> ${mode=="created"?"회원 가입":"회원 정보 수정"} </h3>
    </div>
    
        <div>
			<form name="memberForm" method="post">
			  <table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
			  <tr>
			      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">아이디</label>
			      </td>
			      <td style="padding: 0 0 15px 15px;">
			        <p style="margin-top: 1px; margin-bottom: 5px;">
			            <input type="text" name="m1_email" id="m1_email" value="${dto.m1_email}"
                         style="width: 95%;"
                         ${mode=="update" ? "readonly='readonly' ":""}
                         maxlength="15" class="boxTF" placeholder="아이디">
			        </p>
			        <p class="help-block">아이디는 이메일입니다. ooo@ppp.qq 형식을 지켜 주세요.</p>
			      </td>
			  </tr>
			  
			  
			  <!-- 닉네임 -->
			  <tr>
			      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">닉네임</label>
			      </td>
			      <td style="padding: 0 0 15px 15px;">
			        <p style="margin-top: 1px; margin-bottom: 5px;">
			            <input type="text" name="m1_nickname" id="usernick" value="${dto.m1_nickname}"
                   		 style="width: 95%;"
                         maxlength="15" class="boxTF" placeholder="닉네임">
			        </p>
			      </td>
			  </tr>
			  
			  
			<c:choose>
				<c:when test="${mode == 'created' }">
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
				</c:when>
				
				<c:otherwise>
				  <tr>
				      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
				            <label style="font-weight: 900;">패스워드</label>
				      </td>
				      <td style="padding: 0 0 15px 15px;">
				        <p style="margin-top: 1px; margin-bottom: 5px;">
				            <input type="password" name="m1_pwd" maxlength="15" class="boxTF"
				                       style="width: 95%;" placeholder="">
				        </p>
				        <p class="help-block">비밀번호를 입력해 주세요.</p>
				      </td>
				  </tr>
				</c:otherwise>
			</c:choose>
			  
			
			  <tr>
			      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">생년월일</label>
			      </td>
			      <td style="padding: 0 0 15px 15px;">
			        <p style="margin-top: 1px; margin-bottom: 5px;">
			            <input type="text" name="m2_birth" value="${dto.m2_birth}" maxlength="10" 
			                       class="boxTF" style="width: 95%;" placeholder="생년월일">
			        </p>
			        <p class="help-block">생년월일은 2000-01-01 형식으로 입력 합니다.</p>
			      </td>
			  </tr>
			  
			  
			  <!-- 성별 -->
			  <tr>
			      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">성별</label>
			      </td>
			      <td style="padding: 0 0 15px 15px;">
			        <p style="margin-top: 1px; margin-bottom: 5px;">
			        	<input type="radio" name= "m2_gender" value="M" checked="checked">남&nbsp;&nbsp;&nbsp;&nbsp;
			        	<input type="radio" name= "m2_gender" value="F">여
			        
			        </p>
			      </td>
			  </tr>
			  
			  
			  
			  
			  <tr>
			      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">전화번호</label>
			      </td>
			      <td style="padding: 0 0 15px 15px;">
			        <p style="margin-top: 1px; margin-bottom: 5px;">
			            <input type="text" name="m2_tel" id="userId" value="${dto.m2_tel}"
                         style="width: 95%;"
                         ${mode=="update" ? "readonly='readonly' ":""}
                         maxlength="15" class="boxTF" placeholder="전화번호">
			        </p>
				             <input type="hidden" name="m1_num" value="${dto.m1_num }">
			        <p class="help-block"> - 를 빼고 입력해 주세요. 예) 00011119999</p>
			      </td>
			  </tr>



			  <c:if test="${mode=='created'}">
				  <tr>
				      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
				            <label style="font-weight: 900;">약관동의</label>
				      </td>
				      <td style="padding: 0 0 15px 15px;">
				        <p style="margin-top: 7px; margin-bottom: 5px;">
				             <label>
				                 <input id="agree" name="agree" type="checkbox" checked="checked"
				                      onchange="form.sendButton.disabled = !checked"> <a href="#">이용약관</a>에 동의합니다.
				             </label>
				        </p>
				      </td>
				  </tr>
			  </c:if>
			  </table>
			
			  <table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			     <tr height="45"> 
			      <td align="center" >
			        <button type="button" name="sendButton" class="btn" onclick="memberOk();">${mode=="created"?"회원가입":"정보수정"}</button>
			        <button type="reset" class="btn">다시입력</button>
			        <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/';">${mode=="created"?"가입취소":"수정취소"}</button>
			      </td>
			    </tr>
			    <tr height="30">
			        <td align="center" style="color: blue;">${msg}</td>
			    </tr>
			  </table>
			</form>
        </div>
    
</div>
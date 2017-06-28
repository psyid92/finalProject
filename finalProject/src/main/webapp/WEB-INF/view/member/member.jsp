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

	/* str = f.userId.value;
	str = str.trim();
	if(!str) {
		alert("아이디를 입력하세요. ");
		f.userId.focus();
		return;
	}
	if(!/^[a-z][a-z0-9_]{4,9}$/i.test(str)) { 
		alert("아이디는 5~10자이며 첫글자는 영문자이어야 합니다.");
		f.userId.focus();
		return;
	}
	f.userId.value = str;

	str = f.userPwd.value;
	str = str.trim();
	if(!str) {
		alert("패스워드를 입력하세요. ");
		f.userPwd.focus();
		return;
	}
	if(!/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{5,10}$/i.test(str)) { 
		alert("패스워드는 5~10자이며 하나 이상의 숫자나 특수문자가 포함되어야 합니다.");
		f.userPwd.focus();
		return;
	}
	f.userPwd.value = str;

	if(str!= f.userPwdCheck.value) {
        alert("패스워드가 일치하지 않습니다. ");
        f.userPwdCheck.focus();
        return;
	}
	
    str = f.userName.value;
	str = str.trim();
    if(!str) {
        alert("이름을 입력하세요. ");
        f.userName.focus();
        return;
    }
    f.userName.value = str;

    str = f.birth.value;
	str = str.trim();
    if(!str || !isValidDateFormat(str)) {
        alert("생년월일를 입력하세요[YYYY-MM-DD]. ");
        f.birth.focus();
        return;
    }
    
    str = f.tel1.value;
	str = str.trim();
    if(!str) {
        alert("전화번호를 입력하세요. ");
        f.tel1.focus();
        return;
    }

    str = f.tel2.value;
	str = str.trim();
    if(!str) {
        alert("전화번호를 입력하세요. ");
        f.tel2.focus();
        return;
    }
    if(!/^(\d+)$/.test(str)) {
        alert("숫자만 가능합니다. ");
        f.tel2.focus();
        return;
    }

    str = f.tel3.value;
	str = str.trim();
    if(!str) {
        alert("전화번호를 입력하세요. ");
        f.tel3.focus();
        return;
    }
    if(!/^(\d+)$/.test(str)) {
        alert("숫자만 가능합니다. ");
        f.tel3.focus();
        return;
    }
    
    str = f.email1.value;
	str = str.trim();
    if(!str) {
        alert("이메일을 입력하세요. ");
        f.email1.focus();
        return;
    }

    str = f.email2.value;
	str = str.trim();
    if(!str) {
        alert("이메일을 입력하세요. ");
        f.email2.focus();
        return;
    } */

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

function userIdCheck() {
var userid = $("#userId").val();
if(!/^[a-z][a-z0-9_]{4,9}$/i.test(str)) { 
	alert("아이디는 5~10자이며 첫글자는 영문자이어야 합니다.");
	$("#userId").focus();
	$("#userId").parent().next(".help-block").html(s);
	return;
}

var url = "<%=cp%>/member/usrIdCheck";
var query = "userId"+userid;
$.ajax({
	type:"post"
	, url : url
	, data : query
	, dataType : "json"
	, success:function(data){
		var passed = data.passed;
		if(passsed = "true"){
			var s = "<span style='color:blue; font-weight : bold;'>"+userid+"</span>아이디는 사용 가능합니다.";
			$("#userId").parent().next(".help-block").html(s);
		}else {
			var s = "<span style='color:red; font-weight : bold;'>"+userid+"</span>아이디는 사용 불가합니다.";
			$("#userId").parent().next(".help-block").html(s);
		}
	}
	, error : function(e){
		console.log(e.responseText);
	}
});
}

</script>
<div class="body-container" style="width: 700px;">
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
			            <input type="text" name="m1_email" id="userId" value="${dto.m1_email}"
                         onchange="userIdCheck();" style="width: 95%;"
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
			        	<input type="radio" name= "m2_gender" value="M">남&nbsp;&nbsp;&nbsp;&nbsp;
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
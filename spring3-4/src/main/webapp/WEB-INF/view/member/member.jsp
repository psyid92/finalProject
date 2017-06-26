<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript" src="<%=cp%>/resource/js/util.js"></script>
<script type="text/javascript">
// 아이디 중복 검사
function userIdCheck() {
	var userId=$("#userId").val();
	if(!/^[a-z][a-z0-9_]{4,9}$/i.test(userId)) { 
		var str="아이디는 5~10자 이내이며, 첫글자는 영문자로 시작해야 합니다.";
		$("#userId").focus();
		$("#userId + .help-block").html(str);
		return false;
	}
	
	var url="<%=cp%>/member/userIdCheck";
	var query="userId="+userId;
	$.ajax({
		type:"POST"
		,url:url
		,data:query
		,dataType:"JSON"
		,success:function(data) {
			var passed=data.passed;
			if(passed=="true") {
				var str="<span style='color:blue;font-weight: bold;'>"+userId+"</span> 아이디는 사용가능 합니다.";
				$("#userId + .help-block").html(str);
			} else {
				var str="<span style='color:red;font-weight: bold;'>"+userId+"</span> 아이디는 사용할수 없습니다.";
				$("#userId + .help-block").html(str);
				$("#userId").val("");
				$("#userId").focus();
			}
		}
	});
}

function check() {
	var f = document.memberForm;
	var str;
	
	str=f.userId.value;
	if(!/^[a-z][a-z0-9_]{4,9}$/i.test(str)) { 
		f.userId.focus();
		return false;
	}
	
	str = f.userPwd.value;
	if(!/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{5,10}$/i.test(str)) { 
		f.userPwd.focus();
		return false;
	}
	
	if(f.userPwdCheck.value != str) {
		$("#userPwdCheck + .help-block").html("패스워드가 일치하지 않습니다.");
		f.userPwdCheck.focus();
		return false;
	} else {
		$("#userPwdCheck + .help-block").html("패스워드를 한번 더 입력해주세요.");
	}
	
    str = f.userName.value;
	str = $.trim(str);
    if(!str) {
        f.userName.focus();
        return false;
    }
    f.userName.value = str;
	
    str = f.birth.value;
    if(!isValidDateFormat(str)) {
        f.birth.focus();
        return false;
    }

    str = f.email.value;
    if(!isValidEmail) {
        f.email.focus();
        return false;
    }
    
    str = f.tel1.value;
    if(!str) {
        f.tel1.focus();
        return false;
    }

    str = f.tel2.value;
    if(!/^(\d+)$/.test(str)) {
        f.tel2.focus();
        return false;
    }

    str = f.tel3.value;
    if(!/^(\d+)$/.test(str)) {
        f.tel3.focus();
        return false;
    }
    
    var mode="${mode}";
    if(mode=="created") {
    	f.action = "<%=cp%>/member/member";
    } else if(mode=="update") {
    	f.action = "<%=cp%>/member/update";
    }
    
    return true;
}
</script>

<div class="jumbotron">
    <h1><span class="glyphicon glyphicon-user"></span> ${mode=="created"?"회원 가입":"회원 정보 수정"}</h1>
    <p>SPRING의 회원이 되시면 회원님만의 유익한 정보를 만날수 있습니다.</p>
</div>

<div class="bodyFrame">
 
 <form class="form-horizontal" name="memberForm" method="post" onsubmit="return check();">
    <div class="form-group">
        <label class="col-sm-2 control-label" for="userId">아이디</label>
        <div class="col-sm-7">
            <input class="form-control" id="userId" name="userId" type="text" placeholder="아이디"
                       onchange="userIdCheck();"
                       value="${dto.userId}"
                       ${mode=="update" ? "readonly='readonly' style='border:none;'":""}>
            <p class="help-block">아이디는 5~10자 이내이며, 첫글자는 영문자로 시작해야 합니다.</p>
        </div>
    </div>
 
    <div class="form-group">
        <label class="col-sm-2 control-label" for="userPwd">패스워드</label>
        <div class="col-sm-7">
            <input class="form-control" id="userPwd" name="userPwd" type="password" placeholder="비밀번호">
            <p class="help-block">패스워드는 5~10자이며 하나 이상의 숫자나 특수문자가 포함되어야 합니다.</p>
        </div>
    </div>
    
    <div class="form-group">
        <label class="col-sm-2 control-label" for="userPwdCheck">패스워드 확인</label>
        <div class="col-sm-7">
            <input class="form-control" id="userPwdCheck" name="userPwdCheck" type="password" placeholder="비밀번호 확인">
            <p class="help-block">패스워드를 한번 더 입력해주세요.</p>
        </div>
    </div>
 
    <div class="form-group">
        <label class="col-sm-2 control-label" for="userName">이름</label>
        <div class="col-sm-7">
            <input class="form-control" id="userName" name="userName" type="text" placeholder="이름"
                       value="${dto.userName}" ${mode=="update" ? "readonly='readonly' style='border:none;' ":""}>
        </div>
    </div>
 
    <div class="form-group">
        <label class="col-sm-2 control-label" for="birth">생년월일</label>
        <div class="col-sm-7">
            <input class="form-control" id="birth" name="birth" type="text" placeholder="생년월일" value="${dto.birth}">
            <p class="help-block">생년월일은 2000-01-01 형식으로 입력 합니다.</p>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label" for="email">이메일</label>
        <div class="col-sm-7">
            <input class="form-control" id="email" name="email" type="email" placeholder="이메일" value="${dto.email}">
        </div>
    </div>
    
    <div class="form-group">
        <label class="col-sm-2 control-label" for="tel1">전화번호</label>
        <div class="col-sm-7">
             <div class="row">
                  <div class="col-sm-3" style="padding-right: 5px;">
						  <select class="form-control" id="tel1" name="tel1" >
								<option value="">선 택</option>
								<option value="010" ${dto.tel1=="010" ? "selected='selected'" : ""}>010</option>
								<option value="011" ${dto.tel1=="011" ? "selected='selected'" : ""}>011</option>
								<option value="016" ${dto.tel1=="016" ? "selected='selected'" : ""}>016</option>
								<option value="017" ${dto.tel1=="017" ? "selected='selected'" : ""}>017</option>
								<option value="018" ${dto.tel1=="018" ? "selected='selected'" : ""}>018</option>
								<option value="019" ${dto.tel1=="019" ? "selected='selected'" : ""}>019</option>
						  </select>
                  </div>

                  <div class="col-sm-1" style="width: 1%; padding-left: 5px; padding-right: 10px;">
                         <p class="form-control-static">-</p>
                  </div>
                 <div class="col-sm-2" style="padding-left: 5px; padding-right: 5px;">
 						  <input class="form-control" id="tel2" name="tel2" type="text" value="${dto.tel2}" maxlength="4">
                  </div>
                  <div class="col-sm-1" style="width: 1%; padding-left: 5px; padding-right: 10px;">
                         <p class="form-control-static">-</p>
                  </div>
                  <div class="col-sm-2" style="padding-left: 5px; padding-right: 5px;">
						  <input class="form-control" id="tel3" name="tel3" type="text" value="${dto.tel3}" maxlength="4">
                  </div>
             </div>
        </div>
    </div>

<c:if test="${mode=='created'}">
    <div class="form-group">
        <label class="col-sm-2 control-label" for="agree">약관 동의</label>
        <div class="col-sm-7 checkbox">
            <label>
                <input id="agree" name="agree" type="checkbox" checked="checked"
                         onchange="form.sendButton.disabled = !checked"> <a href="#">이용약관</a>에 동의합니다.
            </label>
        </div>
    </div>
</c:if>
     
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
<c:if test="${mode=='created'}">
            <button type="submit" name="sendButton" class="btn btn-primary">회원가입 <span class="glyphicon glyphicon-ok"></span></button>
            <button type="button" class="btn btn-danger" onclick="javascript:location.href='<%=cp%>/';">가입취소 <span class="glyphicon glyphicon-remove"></span></button>
</c:if>            
<c:if test="${mode=='update'}">
            <button type="submit" class="btn btn-primary">정보수정 <span class="glyphicon glyphicon-ok"></span></button>
            <button type="button" class="btn btn-danger" onclick="javascript:location.href='<%=cp%>/';">수정취소 <span class="glyphicon glyphicon-remove"></span></button>
</c:if>            
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
                <p class="form-control-static">${message}</p>
        </div>
    </div>
     
  </form>
 
</div>
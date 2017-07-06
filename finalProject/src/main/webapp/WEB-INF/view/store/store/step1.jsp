<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<script type="text/javascript">
function g1_IdCheck(){
	var g1_Id=$("#g1_Id").val();
	if(!/^[a-z][a-z0-9_]{4,9}$/i.test(g1_Id)) { 
		var str="아이디는 5~10자 이내이며, 첫글자는 영문자로 시작해야 합니다.";
		$("#g1_Id").focus();
		$("#g1_Id").parent().next(".help-block").html(str);
		
		return false;
	}
	
	var url="<%=cp%>/store/g1_IdCheck";
	var query="g1_Id="+g1_Id;
	$.ajax({
		type:"POST"
		,url:url
		,data:query
		,dataType:"JSON"
		,success:function(data) {
			var passed=data.passed;
			if(passed=="true") {
				var str="<span style='color:blue;font-weight: bold;'>"+g1_Id+" 아이디는 사용가능 합니다.</span>";
				$("#g1_Id").parent().next(".help-block").html(str);
			} else {
				var str="<span style='color:red;font-weight: bold;'>"+g1_Id+" 아이디는 사용할수 없습니다.</span>";
				$("#g1_Id").parent().next(".help-block").html(str);
				$("#g1_Id").val("");
				$("#g1_Id").focus();
			}
		}
	});
}

function g2_GiupNumCheck(){
	var g2_GiupNum=$("#g2_GiupNum").val();
	if(!/^(\d+){10}$/i.test(g2_GiupNum)) { 
		var str="사업자 등록번호는 10자리 숫자만 가능합니다.";
		$("#g2_GiupNum").focus();
		$("#g2_GiupNum + .help-block").html(str);
		return false;
	}
	
	var url="<%=cp%>/store/g2_GiupNumCheck";
	var query="g2_GiupNum="+g2_GiupNum;
	$.ajax({
		type:"POST"
		,url:url
		,data:query
		,dataType:"JSON"
		,success:function(data) {
			var passed=data.passed;
			if(passed=="true") {
				var str="<span style='color:blue;font-weight: bold;'> 사용가능한 사업자 등록번호입니다. </span>";
				$("#g2_GiupNum").parent().next(".help-block").html(str);
			} else {
				var str="<span style='color:red;font-weight: bold;'> 이미 등록된 사업자 등록번호입니다.</span>";
				$("#g2_GiupNum").parent().next(".help-block").html(str);
				$("#g2_GiupNum").val("");
				$("#g2_GiupNum").focus();
			}
		}
	});
}
function memberOk() {
	var f = document.giupForm;
	var str;
	
	/* str = f.g2_GiupNum.value;
	str = str.trim();
 	if(!str) {
		alert("사업자 등록번호를 입력하세요. ");
		f.g2_GiupNum.focus();
		return;
	}
	
	if(!/^(\d+){10}$/.test(str)) {
        alert("사업자 등록번호는 10자리 숫자만 가능합니다. ");
        f.g2_GiupNum.focus();
        return;
    } */
	str = f.g1_Name.value;
	str = str.trim();
	if(!str) {
		alert("가게이름을 입력하세요. ");
		f.g1_Name.focus();
		return;
	}
	
	/* str = f.g1_Id.value;
	str = str.trim();
	if(!str) {
		alert("아이디를 입력하세요. ");
		f.g1_Id.focus();
		return;
	}
	if(!/^[a-z][a-z0-9_]{4,9}$/i.test(str)) { 
		alert("아이디는 5~10자이며 첫글자는 영문자이어야 합니다.");
		f.g1_Id.focus();
		return;
	}
	f.g1_Id.value = str; */
	 
	str = f.g1_Pwd.value;
	str = str.trim();
	if(!str) {
		alert("패스워드를 입력하세요. ");
		f.g1_Pwd.focus();
		return;
	}
	if(!/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{5,10}$/i.test(str)) { 
		//alert("패스워드는 5~10자이며 하나 이상의 숫자나 특수문자가 포함되어야 합니다.");
		var str="<span style='color:red;font-weight: bold;'> 패스워드는 5~10자이며 하나 이상의 숫자나 특수문자가 포함되어야 합니다. </span>";
		$("#g1_Pwd").parent().next(".help-block").html(str);
		f.g1_Pwd.focus();
		return;
	}
	
	f.g1_Pwd.value = str;
	if(str!= f.g1PwdCheck.value) {
       // alert("패스워드가 일치하지 않습니다. ");
        var str="<span style='color:red;font-weight: bold;'> 패스워드가 일치하지 않습니다. </span>";
		$("#g1PwdCheck").parent().next(".help-block").html(str);
        f.g1PwdCheck.focus();
        return;
	}
	
    str = f.tel1.value;
	str = str.trim();
    if(!str) {
        alert("전화번호를 입력하세요. ");
        f.tel1.focus();
        return;
    }
    if(!/^(\d+)$/.test(str)) {
        alert("숫자만 가능합니다. ");
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
    str = f.category.value;
	str = str.trim();
    if(!str) {
        alert("카테고리를 선택해주세요. ");
        f.category.focus();
        return;
    }
    
    var mode="${mode}";
    if(mode=="created") {
    	f.action = "<%=cp%>/store/step2";
    } else if(mode=="update") {
    	f.action = "<%=cp%>/store/step2";
		}
		f.submit();
	}

</script>

<style type="text/css">

.body-container {
	width: 500px;
	margin: auto;
}

</style>
<div class="body-container" style="width: 700px;">
	<div class="body-giup1">
		<h3>
			<span style="font-family: Webdings">4</span> ${mode=="created"?"회원 가입 1단계":"회원 정보 수정"}
		</h3>
	</div>
	<div>
		<form name="giupForm" method="post" action="<%=cp%>/store/step1">
			<table
				style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
				<tr>
					<td width="120" valign="top"
						style="text-align: right; padding-top: 5px;"><label
						style="font-weight: 900;">사업자 등록번호</label></td>
					<td style="padding: 0 0 15px 15px;">
						<p style="margin-top: 1px; margin-bottom: 5px;">
							<input type="text" name="g2_GiupNum" id="g2_GiupNum"
								value="${dto.g2_GiupNum}" style="width: 95%;"
								${mode=="update" ? "readonly='readonly' ":""} maxlength="15"
								class="boxTF" onchange="g2_GiupNumCheck()" placeholder="사업자 등록번호를 입력해주세요">
						</p>
						<p class="help-block">본인가게의 사업자 등록번호를 입력해주세요</p>
					</td>
				</tr>

				<tr>
					<td width="100" valign="top" style="text-align: right; padding-top: 5px;">
						<label style="font-weight: 900;">내 가게 이름</label>
					</td>
					<td style="padding: 0 0 15px 15px;">
						<p style="margin-top: 1px; margin-bottom: 5px;">
							<input type="text" name="g1_Name" id="g1_Name" value="${dto.g1_Name}" style="width: 95%;"
							 ${mode=="update" ? "readonly='readonly' ":""} maxlength="15" class="boxTF" placeholder="가게의 이름을 적어주세요">
						</p>
						<p class="help-block">가게이름을 입력해주세요</p>
					</td>
				</tr>

				<tr>
					<td width="100" valign="top" style="text-align: right; padding-top: 5px;">
						<label style="font-weight: 900;">아이디</label>
					</td>
					<td style="padding: 0 0 15px 15px;">
						<p style="margin-top: 1px; margin-bottom: 5px;">
							<input type="text" name="g1_Id" id="g1_Id" value="${dto.g1_Id}" style="width: 95%;"
							 maxlength="15" class="boxTF" onchange="g1_IdCheck()" placeholder="아이디는 5~10자로 입력해주세요">
						</p>
						<p class="help-block">아이디는 5~10자로 입력해주세요</p>
					</td>
				</tr>

				<tr>
					<td width="100" valign="top" style="text-align: right; padding-top: 5px;">
						<label style="font-weight: 900;">비밀번호</label>
					</td>
					<td style="padding: 0 0 15px 15px;">
						<p style="margin-top: 1px; margin-bottom: 5px;">
							<input type="password" id="g1_Pwd" name="g1_Pwd" maxlength="15" class="boxTF"
								style="width: 95%;" placeholder="비밀번호를 입력해주세요">
						</p>
						<p class="help-block">
							패스워드는 5~10자 이내로 입력해주세요<br>하나 이상의 숫자나 특수문자가 포함되어야 합니다.
						</p>
					</td>
				</tr>

				<tr>
					<td width="100" valign="top"style="text-align: right; padding-top: 5px;">
						<label style="font-weight: 900;">비밀번호 확인</label></td>
					<td style="padding: 0 0 15px 15px;">
						<p style="margin-top: 1px; margin-bottom: 5px;">
							<input type="password" id="g1PwdCheck" name="g1PwdCheck" maxlength="15"
								class="boxTF" style="width: 95%;" placeholder="다시 한 번 더 입력해주세요">
						</p>
						<p class="help-block">계정 혹은 전화번호와 같거나 연속된 문자열을 사용한 비밀번호는 권장하지
							않습니다</p>
					</td>
				</tr>


				<tr>
		    		<td width="100" valign="top" style="text-align: right; padding-top: 5px;">
		           		<label style="font-weight: 900;">전화번호</label>
		     		</td>
		     		<td style="padding: 0 0 15px 15px;">
		      		<p style="margin-bottom: 5px;">
		           		<select class="selectField" id="tel1" name="tel1" >
			               <option value="">선 택</option>
			               <option value=02 ${dto.tel1=="02" ? "selected='selected'" : ""}>02</option>
			               <option value="031" ${dto.tel1=="031" ? "selected='selected'" : ""}>031</option>
			               <option value="032" ${dto.tel1=="032" ? "selected='selected'" : ""}>032</option>
			               <option value="051" ${dto.tel1=="051" ? "selected='selected'" : ""}>051</option>
			               <option value="033" ${dto.tel1=="033" ? "selected='selected'" : ""}>033</option>
			               <option value="053" ${dto.tel1=="053" ? "selected='selected'" : ""}>053</option>
			               <option value="054" ${dto.tel1=="054" ? "selected='selected'" : ""}>054</option>
			               <option value="055" ${dto.tel1=="055" ? "selected='selected'" : ""}>055</option>
			               <option value="052" ${dto.tel1=="052" ? "selected='selected'" : ""}>052</option>
			               <option value="042" ${dto.tel1=="042" ? "selected='selected'" : ""}>042</option>
			               <option value="041" ${dto.tel1=="041" ? "selected='selected'" : ""}>041</option>
			               <option value="043" ${dto.tel1=="043" ? "selected='selected'" : ""}>043</option>
			               <option value="062" ${dto.tel1=="062" ? "selected='selected'" : ""}>062</option>
			               <option value="061" ${dto.tel1=="061" ? "selected='selected'" : ""}>061</option>
			               <option value="063" ${dto.tel1=="063" ? "selected='selected'" : ""}>063</option>
			           </select>
		           			-
		           	   <input type="text" name="tel2" value="${dto.tel2}" class="boxTF" maxlength="4">
		          			-
		           	   <input type="text" name="tel3" value="${dto.tel3}" class="boxTF" maxlength="4">
		      	 	</p>
		     	  </td>
		 		</tr>
		 		
		 		<tr>
					<td width="100" valign="top" style="text-align: right; padding-top: 5px;">
						<label style="font-weight: 900;">카테고리</label></td>
					<td style="padding: 0 0 15px 15px;">
					<select name="category" class="selectField">
							<option value="" selected="selected">:::선택:::</option>
							<option value="chicken">치킨</option>
							<option value="china">중국집</option>
							<option value="pizza">피자</option>
							<option value="bunsik">분식</option>
							<option value="bossam">족발,보쌈</option>
							<option value="ya">야식</option>
							<option value="zzim">찜,탕</option>
							<option value="don">돈까스</option>
					</select>
					<p class="help-block">카테고리를 설정해 주세요</p>
					</td>
				</tr>
				
			</table>

			<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
				<tr height="45">
					<td align="center">
						<button type="button" name="sendButton" class="btn" onclick="memberOk()">다음단계</button>
						<button type="reset"  class="btn">다시입력</button>
						<button type="button" class="btn"
							onclick="javascript:location.href='<%=cp%>/store/login';">${mode=="created"?"가입취소":"수정취소"}</button>
						
					</td>
				</tr>
				<tr height="30">
					<td align="center" style="color: blue;">${message}</td>
				</tr>
			</table>
		</form>
	</div>

</div>

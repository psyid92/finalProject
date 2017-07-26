<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style type="text/css">
.form-signin {
  max-width: 440px;
  padding: 15px;
  margin: 0 auto;
}

@media (min-width: 768px) {
  .form-signin {
    padding-top: 70px;
  }             
} 

.form-signin-heading {
  text-align: center;
  font-weight:bold;
  font-family: NanumGothic, 나눔고딕, "Malgun Gothic", "맑은 고딕", sans-serif;
  margin-bottom: 30px;
}

.lbl {
   position:absolute; 
   margin-left:15px; margin-top: 13px;
   color: #999999;
   font-family: NanumGothic, 나눔고딕, "Malgun Gothic", "맑은 고딕", 돋움, sans-serif;
}

.loginTF {
  max-width: 370px; height:45px;
  padding: 5px;
  padding-left: 15px;
  margin-top:5px; margin-bottom:15px;
}

.boxLayout {
    max-width:420px;
    padding:20px;
    border: 1px solid #DAD9FF;
}
</style>

<script type="text/javascript">
function bgLabel(ob, id) {
	    if(!ob.value) {
		    document.getElementById(id).style.display="";
	    } else {
		    document.getElementById(id).style.display="none";
	    }
}

function sendOk() {
        var f = document.confirmForm;

    	var str = f.g1_Id.value;
        if(!str) {
            f.g1_Id.focus();
            return false;
        }

        str = f.g1_Pwd.value;
        if(!str) {
            f.g1_Pwd.focus();
            return false;
        }

        f.action = "<%=cp%>/store/update";
        f.submit();
}
</script>
<div class="storeBodyFrame2">

    <form class="form-signin" id="confirmForm" name="confirmForm" method="post">
        <h2 class="form-signin-heading">패스워드 재확인</h2>
        <div class="boxLayout">
            <div style="text-align: left; padding-bottom: 10px; ">정보보호를 위해 패스워드를 다시 한 번 입력해주세요.</div>
            <input type="text" id="g1_Id" name="g1_Id" class="form-control loginTF"
	              value="${sessionScope.store.g1_Id}"
                  readonly="readonly"
	              >
            <label for="g1_Pwd" id="lblg1_Pwd" class="lbl">패스워드</label>
            <input type="password" id="g1_Pwd" name="g1_Pwd" class="form-control loginTF" autofocus="autofocus"
                  onfocus="document.getElementById('lblg1_Pwd').style.display='none';"
	              onblur="bgLabel(this, 'lblg1_Pwd');">
            <button class="btn btn-lg btn-primary btn-block" type="button" onclick="sendOk();">확인 <span class="glyphicon glyphicon-ok"></span></button>
            <input type="hidden" name="mode" value="update">
        </div>
        <div style="margin-top:10px; text-align: center;">${message}</div>
        
    </form>

</div>
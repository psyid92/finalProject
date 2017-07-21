<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<script type="text/javascript">
	//엔터 처리
	$(function() {
		$("input").not($(":button")).keypress(
				function(evt) {
					if (evt.keyCode == 13) {
						var fields = $(this).parents('form:eq(0),body').find(
								'button,input,textarea,select');
						var index = fields.index(this);
						if (index > -1 && (index + 1) < fields.length) {
							fields.eq(index + 1).focus(); 
						}
						return false;
					}
				});
	});

	$(function() {
		var idx = "${mainMenu}";
		if (!idx)
			idx = 0;
		var subMenu = $(".list-menu")[idx];
		$(subMenu).addClass("active");
	});
	
	$('#myModal').on('shown.bs.modal', function () {
		  $('#myInput').focus()
		})
</script>
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
    	var g1_Id = $("#g1_Id2").val();
        if(!g1_Id) {
        	$("#g1_Id2").focus();
            return false;
        }

        var g1_pwd = $("#g1_pwd").val();
        if(!g1_pwd) {
        	$("#g1_pwd").focus();
            return false;
        }
        var sg1_Num = ${sessionScope.store.g1_Num};
        if(confirm("탈퇴하시겠습니까??")){
        $.ajax({
        	type:"post"
        	,url:"<%=cp%>/store/storeout"
        	,data:{g1_Id:g1_Id, g1_Num:sg1_Num , g1_pwd:g1_pwd}
        	,dataType:"json"
        	,success:function(data){
        		var state = data.state;
        		var message = data.message;
        		var title = data.title;
        		var mainMenu = data.mainMenu;
        		var s = "";
        		if(state=="false"){
        			s += "패스워드가 일치하지 않습니다.";
        			$("#pwdWrong").html(s);
        		}else{
        			location.href="<%=cp%>/store/storeoutComplete";
        		}
        	}
        	,error:function(e){
        		console.log(e.responseText);
        	}
        });
	}
} 
</script>
<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="<%=cp%>/store/mystore">배달행 사장님</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<c:if test="${not empty sessionScope.store}">
			<ul class="nav navbar-nav"> 
				<li class="list-menu"><a href="<%=cp%>/store/mystore">업체관리</a></li>
				<li class="list-menu"><a href="<%=cp%>/store/jumunAdvertise">광고관리</a></li>
				<li class="list-menu"><a href="<%=cp%>/store/event1">이벤트</a></li> 
				<li class="list-menu"><a href="<%=cp%>/giupNotice/list">고객센터</a></li>
			</ul>
			<div  id="navbar" class="navbar-collapse collapse"  style="float: right; margin-top: 7px; margin-left: 30px;">
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
    				  <span class="glyphicon glyphicon-user"></span>
    				</button>
					<ul class="dropdown-menu" role="menu">
						<li><a href="<%=cp%>/store/logout">로그아웃</a></li>
						<c:if test="${sessionScope.store.g1_Id!='admin'}">
							<li><a href="<%=cp%>/store/mypage">정보수정</a></li>
							<li><a type="button" data-toggle="modal" data-target="#myModal">
  								회원탈퇴 </a></li>
						</c:if>
					</ul>
				</div>
			</div>
			<p class="navbar-text navbar-right">
				<span>${sessionScope.store.g1_Name}&nbsp;</span>
			</p>
			</c:if>
		</div>
	</div>
</nav>
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog" style="width: 500px;">
	    <div class="modal-content" >
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel" style="text-align: center;">회원 탈퇴</h4>
	      </div>
	      <div class="modal-body">
	      	<span class="glyphicon glyphicon-info-sign"></span><span> 탈퇴 후에는 아이디 <span style="color: blue;">${sessionScope.store.g1_Id}</span>로 다시 가입할 수 없습니다<br></span>
	      	<span class="glyphicon glyphicon-info-sign" style="color: red;"></span>
	      	<span  style="color: red">이후 삭제된 데이터는 복구되지 않습니다.</span>
	        <input type="text" id="g1_Id2" name="g1_Id2" class="form-control loginTF"
	              value="${sessionScope.store.g1_Id}"
                  readonly="readonly"
                  style="margin-top: 15px;"
	              >
            <label for="userPwd" id="lblUserPwd" class="lbl">패스워드</label>
            <input type="password" id="g1_pwd" name="g1_pwd" class="form-control loginTF" autofocus="autofocus"
                  onfocus="document.getElementById('lblUserPwd').style.display='none';"
	              onblur="bgLabel(this, 'lblUserPwd');">
	      <div id="pwdWrong" style="margin-top:10px; text-align: center;"></div>
            <input type="hidden" name="mode" value="update">
            <input type="hidden" name="g1_Num" value="${sessionScope.store.g1_Num}">
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" onclick="sendOk();">회원탈퇴</button>
	        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>	
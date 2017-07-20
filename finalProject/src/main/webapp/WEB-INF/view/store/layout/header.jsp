<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<script type="text/javascript">
	//¿£ÅÍ Ã³¸®
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
  font-family: NanumGothic, ³ª´®°íµñ, "Malgun Gothic", "¸¼Àº °íµñ", sans-serif;
  margin-bottom: 30px;
}

.lbl {
   position:absolute; 
   margin-left:15px; margin-top: 13px;
   color: #999999;
   font-family: NanumGothic, ³ª´®°íµñ, "Malgun Gothic", "¸¼Àº °íµñ", µ¸¿ò, sans-serif;
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

        f.action = "<%=cp%>/store/storeout";
        f.submit();
}
</script>
<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="<%=cp%>/store/mystore">¹è´ÞÇà »çÀå´Ô</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<c:if test="${not empty sessionScope.store}">
			<ul class="nav navbar-nav"> 
				<li class="list-menu"><a href="<%=cp%>/store/mystore">¾÷Ã¼°ü¸®</a></li>
				<li class="list-menu"><a href="<%=cp%>/store/jumunAdvertise">±¤°í°ü¸®</a></li>
				<li class="list-menu"><a href="<%=cp%>/store/event1">ÀÌº¥Æ®</a></li> 
				<li class="list-menu"><a href="<%=cp%>/giupNotice/list">°í°´¼¾ÅÍ</a></li>
			</ul>
			<div  id="navbar" class="navbar-collapse collapse"  style="float: right; margin-top: 7px; margin-left: 30px;">
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
    				  <span class="glyphicon glyphicon-user"></span>
    				</button>
					<ul class="dropdown-menu" role="menu">
						<li><a href="<%=cp%>/store/logout">·Î±×¾Æ¿ô</a></li>
						<c:if test="${sessionScope.store.g1_Id!='admin'}">
							<li><a href="<%=cp%>/store/mypage">Á¤º¸¼öÁ¤</a></li>
							<li><a type="button" data-toggle="modal" data-target="#myModal">
  								È¸¿øÅ»Åð </a></li>
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
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">È¸¿ø Å»Åð</h4>
	      </div>
	        <form class="form-signin" name="confirmForm" method="post">
	      <div class="modal-body">
	        <input type="text" id="g1_Id" name="g1_Id" class="form-control loginTF"
	              value="${sessionScope.store.g1_Id}"
                  readonly="readonly"
	              >
            <label for="userPwd" id="lblUserPwd" class="lbl">ÆÐ½º¿öµå</label>
            <input type="password" id="g1_Pwd" name="g1_Pwd" class="form-control loginTF" autofocus="autofocus"
                  onfocus="document.getElementById('lblUserPwd').style.display='none';"
	              onblur="bgLabel(this, 'lblUserPwd');">
            <input type="hidden" name="mode" value="update">
            <input type="hidden" name="g1_Num" value="${sessionScope.store.g1_Num}">
	      </div>
	      </form>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" onclick="sendOk();">È¸¿øÅ»Åð</button>
	        <button type="button" class="btn btn-default" data-dismiss="modal">´Ý±â</button>
	      </div>
	    </div>
	  </div>
	</div>	
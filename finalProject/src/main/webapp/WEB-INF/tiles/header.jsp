<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();
%>
<script>
	$(function() {
		$(".dropdown-toggle").click(function() {
			if ($(".dropdown-menu").is(":visible") == false) { 
				$(".dropdown-menu").show();
			} else {
				$(".dropdown-menu").hide();
			};
		});
		$(".dropdown-toggle").change(function() {
			$(".dropdown-menu").hide();
		});
	});
</script>

<style type="text/css">
body {
	background-color: #eaf1f1;
}
#headerMenutr {
	background-color: #f7f2e2;
}
#header th {
	width: 195.8px;
}

#header a {
	color: gray;
	font-size: 12px;
}

</style>
<div style="padding-bottom: 30px;" id="header">
	<div align="right" id="headerMember">
	<c:if test="${empty sessionScope.member}"><a href="<%=cp%>/member/login">로그인</a> | <a href="<%=cp%>/member/member">회원가입</a> | <a href="<%=cp%>/notice/list">고객센터</a></c:if>
	<c:if test="${not empty sessionScope.member}"><a href="<%=cp%>/member/logout">로그아웃</a> | <a href="<%=cp%>/member/mypage">마이페이지</a> | <a href="<%=cp%>/notice/list">고객센터</a></c:if>
	</div>
	<div align="center">
		<div style="width: 444px; height: 91px; line-height: 91px; font-size: 40px; background-image:url('<%=cp%>/resource/img/title_back.png');">배 달 행</div>
	</div>
</div>
 	
<div class="form-group" style="width: 300px; margin: 0 auto 50px;">
  <div class="input-group">
    <span class="input-group-addon">검색</span>
    <input type="text" class="form-control" placeholder="검색 할 위치를 입력해주세요">
    <span class="input-group-btn">
      <button class="btn btn-default" type="button" style="width: 34px; height: 38px; background: url('<%=cp%>/resource/img/search.png') no-repeat; background-size: contain;  background-color: white;"></button>
    </span>
  </div>
</div>
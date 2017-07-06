<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();
%>
<script>
	$(function() {
		$("#category").children().click(function(){
			var category = $(this).attr("id");
			location.href = '<%=cp%>/jumun/jumunList?category=' + category;
		});
		$("#category").children().mouseenter(function(){
			
		});
	});
	$(function(){
		$("#${category}").attr("class", "cate on");
		$(".cate").mouseenter(function(){
			var category = $(this).attr("id");
			if ($(this).attr("class") != "cate on")
				$(this).css("background-image","url('<%=cp%>/resource/img/category/"+category+"CategoryHover.png')");
		});
		$(".cate").mouseleave(function(){
			var category = $(this).attr("id");
			if ($(this).attr("class") != "cate on")
				$(this).css("background-image","url('<%=cp%>/resource/img/category/"+category+"Category.png')");
		});
		$(".cate.on").css("background-image","url('<%=cp%>/resource/img/category/${category}CategoryHover.png')");
		$(".cate.on").css("background-color","#eaf1f1");
	});
	
		
</script>

<style type="text/css">
body {
	background-color: #eaf1f1;
}

#header a {
	color: gray;
	font-size: 12px;
}

#mainMenu ul {
	padding: 0px;
}

#mainMenu ul li {
	float: left;
	width: 125px;
	height: 100%;
}

#mainMenu ul li:HOVER {
	background-color: #eaf1f1;
	cursor: pointer;
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
 	
<div class="form-group" style="width: 300px; margin: 0 auto 50px; <c:if test="${mode ne 'mainPage'}">margin-bottom: 200px;</c:if>">
  <div class="input-group">
    <span class="input-group-addon">검색</span>
    <input type="text" class="form-control" placeholder="검색 할 위치를 입력해주세요">
    <span class="input-group-btn">
      <button class="btn btn-default" type="button" style="width: 34px; height: 38px; background: url('<%=cp%>/resource/img/search.png') no-repeat; background-size: contain;  background-color: white;"></button>
    </span>
  </div>
</div>
<c:if test="${mode ne 'mainPage'}">
	<div style="position: absolute; top: 200px; left: 0; width: 100%; height: 100px; background-color: #817c74;  ">
		<div style="margin: 0 auto; text-align: center; width: 1000px; height: 100%;" id="mainMenu">
			<ul style="list-style: none; display: inline-block; height: 100%;" id="category">
				<li id="chicken" class="cate" style="background-image: url('<%=cp%>/resource/img/category/chickenCategory.png')"></li>
				<li id="china" class="cate" style="background-image: url('<%=cp%>/resource/img/category/chinaCategory.png')"></li>
				<li id="pizza" class="cate" style="background-image: url('<%=cp%>/resource/img/category/pizzaCategory.png')"></li>
				<li id="bunsik" class="cate" style="background-image: url('<%=cp%>/resource/img/category/bunsikCategory.png')"></li>
				<li id="bossam" class="cate" style="background-image: url('<%=cp%>/resource/img/category/bossamCategory.png')"></li>
				<li id="ya" class="cate" style="background-image: url('<%=cp%>/resource/img/category/yaCategory.png')"></li>
				<li id="zzim" class="cate" style="background-image: url('<%=cp%>/resource/img/category/zzimCategory.png')"></li>
				<li id="don" class="cate" style="background-image: url('<%=cp%>/resource/img/category/donCategory.png')"></li>
			</ul>
		</div>
	</div>
</c:if>
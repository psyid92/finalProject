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
		$("#title").click(function(){
			location.href = '<%=cp%>/main';
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
		/* $(".cate.on").css("border-top", "2px solid black");
		$(".cate.on").css("border-bottom", "2px solid black"); */
		$(".cate.on").css("background-image","url('<%=cp%>/resource/img/category/${category}CategoryHover.png')");
	});
	
		
</script>

<style type="text/css">
#title {
	cursor: pointer;
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
    /* transition: all 1s, transform 2s; */
}
#mainMenu ul li:after,
#mainMenu ul li:before {
	border: 1px solid rgba(255, 255, 255, 0);
    bottom: 0;
    content: " ";
    display: block;
    margin: 0 auto;
    position: relative;
    -webkit-transition: all .28s ease-in-out;
    transition: all .28s ease-in-out;
    width: 0;
}
#mainMenu ul li:HOVER:after,
#mainMenu ul li:HOVER:before {
	border-color: black;
    -webkit-transition: width 350ms ease-in-out;
    transition: width 350ms ease-in-out;
    width: 100%;
}
#mainMenu ul li:hover:before {
    bottom: 0;
    top: 0;
}

#mainMenu ul li:HOVER {
	-webkit-transition: all .28s ease-in-out;
    transition: all .28s ease-in-out;
	cursor: pointer;
    /* transition: all 0.5s, transform 2s; */
}

.cate {
	background-repeat: no-repeat;
	background-size: contain;
	background-position: center center;
}

.btn.btn-default {
	width: 34px;
	height: 38px; 
	background-repeat: no-repeat;
	background-size: 100% 100%;
}

</style>
<div id="header" style="margin-bottom: 20px; background-repeat: round; ;">
	<div align="right" id="headerMember">
	<c:if test="${empty sessionScope.member}"><a href="<%=cp%>/member/login">로그인</a> | <a href="<%=cp%>/member/member">회원가입</a> | <a href="<%=cp%>/notice/list">고객센터</a></c:if>
	<c:if test="${not empty sessionScope.member}"><a href="<%=cp%>/member/logout">로그아웃</a> | <a href="<%=cp%>/member/mypage">마이페이지</a> | <a href="<%=cp%>/notice/list">고객센터</a></c:if>
	</div>
	<div align="center">
		<div id="title" style="width: 600px; height: 200px; background: url('<%=cp%>/resource/img/titleBase.png') no-repeat; background-size: contain; background-position: center center;"></div>
	</div>
</div>
 	
<div class="form-group" style="width: 500px; height:38px; margin: 0 auto 50px; <c:if test="${mode ne 'mainPage'}">margin-bottom: 200px;</c:if>">
  <div class="input-group">
    <input type="text" class="form-control" placeholder="현재위치" readonly="readonly">
    <span class="input-group-btn" style="padding-right: 10px;">
      <button class="btn btn-default" type="button" style="background-image: url('<%=cp%>/resource/img/where.png');"></button>
    </span>
    <input type="text" class="form-control" placeholder="업소명을 입력 해 주세요.">
    <span class="input-group-btn">
      <button class="btn btn-default" type="button" style="background-image: url('<%=cp%>/resource/img/search.png');"></button>
    </span>
  </div>
</div>
<c:if test="${mode ne 'mainPage'}">
	<div style="position: absolute; top: 300px; left: 0; width: 100%; height: 100px; background-color: #dadada; <%-- background: url('<%=cp%>/resource/img/banner1.jpg') repeat; --%>" > <!--  background-color: #7c9dd2; --> 
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
<style>
.progress {
	width: 62.5px;
	height: 2px;
	box-shadow: none;
	background-color: white;
	border-radius: 0;
}
.progress-bar {
	width: 0%;
	box-shadow: none;
	background-color: black;
}
</style>

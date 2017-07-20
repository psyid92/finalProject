<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();
%>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=WlJc9L4f0E6oaul2CL2b&submodules=geocoder"></script>

<script>
	$(function() {
		$("input[id=serVa]").focus();
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
				$(this).children().css("background-image","url('<%=cp%>/resource/img/category/"+category+"CategoryHover.png')");
		});
		$(".cate").mouseleave(function(){
			var category = $(this).attr("id");
			if ($(this).attr("class") != "cate on")
				$(this).children().css("background-image","url('<%=cp%>/resource/img/category/"+category+"Category.png')");
		});
		/* $(".cate.on").css("border-top", "2px solid black");
		$(".cate.on").css("border-bottom", "2px solid black"); */
		$(".cate.on").children().css("background-image","url('<%=cp%>/resource/img/category/${category}CategoryHover.png')");
	});
	
	$(function(){
		if(getcookie()==null){
			geoFindMe();
		}
	});
	
	//구글맵으로 현재 위도 경도 받아오기
	function geoFindMe() {
		var output = document.getElementById("out");

		if (!navigator.geolocation) {
			output.innerHTML = "<p>Geolocation is not supported by your browser</p>";
			return;
		}

		function success(position) {
			var latitude = position.coords.latitude;
			var longitude = position.coords.longitude;

			searchCoordinateToAddress(longitude, latitude);

		}

		function error() {
			output.innerHTML = "Unable to retrieve your location";
		}

		navigator.geolocation.getCurrentPosition(success, error);
	}

	//네이버맵 위도 경도로 주소검색
	function searchCoordinateToAddress(lat, lng) {
		var latlng = new naver.maps.Point(lat, lng);

		naver.maps.Service.reverseGeocode({
			location : latlng
		}, function(status, response) {
			if (status === naver.maps.Service.Status.ERROR) {
				return alert('Something Wrong!');
			}

			var item = response.result.items[0];

			//주소 뒤에 번지수 빼기(주소가 동까지만 나오게)
			var cur_Num = item.address.lastIndexOf(" ");
			var cur_Loc = item.address.substring(0, cur_Num);

			//주소 및 위도 경도 넘기기
			var query = "location=" + encodeURI(cur_Loc) + "&lat="
					+ item.point.x + "&lng=" + item.point.y;

			
			// 쿠키 설정하기
			var url = "<%=cp%>/resource/cookie/setcookie.jsp";

			$.ajax({
				type : "post",
				url : url,
				data : query,
				success : function(data) {
					getcookie(); 
				},
				error : function(e) {
					console.log(e);
				}
			});
		});
	}

	//쿠키 가져오면서 textbox에 주소 넣기
	function getcookie() {
		var url = "<%=cp%>/getcookie";

		$.ajax({
			type : "post",
			url : url,
			dataType:"json",
			success : function(data) {
				$("#cur_Loc").val(data.cur_Loc);
				$("#where").html(data.cur_Loc);
				$("#lat").val(data.lat);
				$("#lng").val(data.lng);
			},
			error : function(e) {
				console.log(e);
			}
		}); 
	}

	// 쿠키 삭제하기
	function removecookie() {
		var url = "<%=cp%>/resource/cookie/removecookie.jsp";

		$.ajax({
			type : "post",
			url : url,
			success : function(data) {
			},
			error : function(e) {
				console.log(e);
			}
		});
	}
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
	<div align="right" id="headerMember" style="font-family: arial;">
	<c:if test="${empty sessionScope.member}"><a href="<%=cp%>/member/login">로그인</a> <a href="#">|</a> <a href="<%=cp%>/member/member">회원가입</a> <a href="#">|</a> <a href="<%=cp%>/notice/list">고객센터</a></c:if>
	<c:if test="${not empty sessionScope.member}"><a href="<%=cp%>/member/logout">로그아웃</a> <a href="#">|</a> <a href="<%=cp%>/member/mypage">마이페이지</a> <a href="#">|</a> <a href="<%=cp%>/notice/list">고객센터</a></c:if>
	</div>
	<div align="center">
		<div id="title" style="width: 600px; height: 200px; background: url('<%=cp%>/resource/img/titleBase.png') no-repeat; background-size: contain; background-position: center center;"></div>
	</div>
</div>
<form action="<%=cp%>/jumun/jumunList" method="post">
<div class="form-group" style="width: 500px; height:38px; margin: 0 auto 50px; <c:if test="${mode ne 'mainPage'}">margin-bottom: 114px;</c:if>">
  <div class="input-group">
    <input type="text" id="cur_Loc" name="cur_Loc" class="form-control" placeholder="현재위치" readonly="readonly">
    <input type="hidden" id="lat" name="lat">
    <input type="hidden" id="lng" name="lng">
    <span class="input-group-btn" style="padding-right: 10px;">
      <button class="btn btn-default" type="button" style="background-image: url('<%=cp%>/resource/img/where.png');" onclick="geoFindMe(); "></button>
    </span>
    
    <input type="text" class="form-control" id="serVa" name="searchValue" placeholder="업소명을 입력 해 주세요.">
    <span class="input-group-btn">
      <input class="btn btn-default" type="submit" style="background-image: url('<%=cp%>/resource/img/search.png');" value="">	
    </span>
  </div>
</div>
</form>
<c:if test="${mode ne 'mainPage'}">
	<div style="position: absolute; top: 300px; left: 0; width: 100%; height: 100px; background-color: #dadada; <%-- background: url('<%=cp%>/resource/img/banner1.jpg') repeat; --%>" > <!--  background-color: #7c9dd2; --> 
		<div style="margin: 0 auto; text-align: center; width: 1000px; height: 100%;" id="mainMenu">
			<ul id="category" style="list-style: none; display: inline-block; height: 100%; margin-bottom: 0;">
				<li id="chicken" class="cate"><div style="width: 100%; height: 96%; background-image: url('<%=cp%>/resource/img/category/chickenCategory.png');"></div></li>
				<li id="china" class="cate"><div style="width: 100%; height: 96%; background-image: url('<%=cp%>/resource/img/category/chinaCategory.png');"></div></li>
				<li id="pizza" class="cate"><div style="width: 100%; height: 96%; background-image: url('<%=cp%>/resource/img/category/pizzaCategory.png');"></div></li>
				<li id="bunsik" class="cate"><div style="width: 100%; height: 96%; background-image: url('<%=cp%>/resource/img/category/bunsikCategory.png');"></div></li>
				<li id="bossam" class="cate"><div style="width: 100%; height: 96%; background-image: url('<%=cp%>/resource/img/category/bossamCategory.png');"></div></li>
				<li id="ya" class="cate"><div style="width: 100%; height: 96%; background-image: url('<%=cp%>/resource/img/category/yaCategory.png');"></div></li>
				<li id="zzim" class="cate"><div style="width: 100%; height: 96%; background-image: url('<%=cp%>/resource/img/category/zzimCategory.png');"></div></li>
				<li id="don" class="cate"><div style="width: 100%; height: 96%; background-image: url('<%=cp%>/resource/img/category/donCategory.png');"></div></li>
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

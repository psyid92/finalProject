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
				<li class="list-menu"><a href="<%=cp%>/store/coupon1">쿠폰관리</a></li>
				<li class="list-menu"><a href="<%=cp%>/store/event1">이벤트</a></li> 
				<li class="list-menu"><a href="<%=cp%>/store/giupNotice">고객센터</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="<%=cp%>/store/logout">로그아웃</a></li>
			</ul>
			<p class="navbar-text navbar-right">
				<span>${sessionScope.store.g1_Name}</span>&nbsp;사장님
			</p>
			</c:if>
			
		</div>
	</div>
</nav>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<script type="text/javascript">
	$(function() {
		var idx = "${subMenu}";
		if (!idx)
			idx = 1;
		var subMenu = $(".list-group-item")[idx];
		$(subMenu).addClass("active");
	});
</script>

<div class="list-group panel-group" id="accordion" role="tablist"
	aria-multiselectable="true">
	<div class="list-group-item lefthead">
		<i></i> 쿠폰관리
	</div>
	<div class="panel panel-default">
		<div class="panel-heading" role="tab" id="headingThree">
			<h4 class="panel-title">
				<a class="FirstMenu" aria-expanded="true" aria-controls="collapseThree" > 쿠폰관리 </a>
			</h4>
		</div>
		<div id="collapseThree" class="panel-collapse collapse in"
			role="tabpanel" aria-labelledby="headingThree">
					<a href="<%=cp%>/store/coupon1" class="list-group-item">쿠폰관리게시판1</a>
					<a href="<%=cp%>/store/coupon2" class="list-group-item">쿠폰관리게시판2</a>
					<a href="<%=cp%>/store/coupon3" class="list-group-item">쿠폰관리게시판3</a>
			</div>
		</div>
	</div>
<link rel="stylesheet" type="text/css" href="<%=cp%>/resource/bootstrap/css/none-bootstrap.css">
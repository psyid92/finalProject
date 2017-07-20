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
		<i></i> 업체관리
	</div>
	<div class="panel panel-default">
		<div id="collapseThree" class="panel-collapse collapse in"
			role="tabpanel" aria-labelledby="headingThree">
					<a href="<%=cp%>/store/mystore" class="list-group-item">매출현황</a>
					<a href="<%=cp%>/store/review/reviewYet" class="list-group-item">리뷰관리</a>
					<a href="<%=cp%>/store/menu" class="list-group-item">메뉴관리</a>
			</div>
		</div>
	</div>
<link rel="stylesheet" type="text/css" href="<%=cp%>/resource/bootstrap/css/none-bootstrap.css">
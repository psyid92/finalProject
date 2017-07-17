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
		<i></i> 광고관리
	</div>
	<div class="panel panel-default">
		<div class="panel-heading" role="tab" id="headingThree">
			<h4 class="panel-title">
				<a class="FirstMenu" aria-expanded="true" aria-controls="collapseThree" > 광고관리 </a>
			</h4>
		</div>
		<div id="collapseThree" class="panel-collapse collapse in"
			role="tabpanel" aria-labelledby="headingThree">
					<c:if test="${sessionScope.store.g1_Id == 'admin'}">
						<a href="<%=cp%>/store/insertAdvertise" class="list-group-item">광고 추가</a>
					</c:if>
					<c:if test="${sessionScope.store.g1_Id != 'admin'}">
						<a href="<%=cp%>/store/jumunAdvertise" class="list-group-item">광고 구매</a>
						<a href="<%=cp%>/store/listAdvertise" class="list-group-item">광고 구매 내역</a>
					</c:if>
			</div>
		</div>
	</div>
<link rel="stylesheet" type="text/css" href="<%=cp%>/resource/bootstrap/css/none-bootstrap.css">
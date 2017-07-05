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
		<i></i> 이벤트
	</div>
	<div class="panel panel-default">
		<div class="panel-heading" role="tab" id="headingThree">
			<h4 class="panel-title">
				<a class="FirstMenu" aria-expanded="true" aria-controls="collapseThree" > 이벤트 </a>
			</h4>
		</div>
		<div id="collapseThree" class="panel-collapse collapse in"
			role="tabpanel" aria-labelledby="headingThree">
					<a href="<%=cp%>/store/event1" class="list-group-item">이벤트게시판1</a>
					<a href="<%=cp%>/store/event2" class="list-group-item">이벤트게시판2</a>
					<a href="<%=cp%>/store/event3" class="list-group-item">이벤트게시판3</a>
			</div>
		</div>
	</div>
<link rel="stylesheet" type="text/css" href="<%=cp%>/resource/bootstrap/css/none-bootstrap.css">
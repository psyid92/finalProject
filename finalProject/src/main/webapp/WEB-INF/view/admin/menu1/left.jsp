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
		<i></i> 마이페이지
	</div>
	<div class="panel panel-default">
		<div class="panel-heading" role="tab" id="headingThree">
			<h4 class="panel-title">
				<a class="collapsed" data-toggle="collapse" data-parent="#accordion"
					href="#collapseThree" aria-expanded="false"
					aria-controls="collapseThree"> 내 업소 관리 </a>
			</h4>
		</div>
		<div id="collapseThree" class="panel-collapse collapse"
			role="tabpanel" aria-labelledby="headingThree">
					<a href="#" class="list-group-item">업체정보관리</a>
					<a href="#" class="list-group-item">리뷰관리</a>
					<a href="#" class="list-group-item">고객센터관리</a>
					<a href="#" class="list-group-item">메뉴관리</a>
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading" role="tab" id="headingTwo">
				<h4 class="panel-title">
					<a class="collapsed" data-toggle="collapse"data-parent="#accordion" href="#collapseTwo"
					 aria-expanded="false" aria-controls="collapseTwo">
					 우리가게 쿠폰 </a>
				</h4>
			</div>
			<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
				<a href="#" class="list-group-item">쿠폰 구매</a>
				<a href="#" class="list-group-item">쿠폰 뿌리기</a> 
				<a href="#" class="list-group-item">쿠폰 관리</a>
			</div>
		</div>
	</div>

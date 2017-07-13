<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<style type="text/css">
li {
	width: 20%;
	text-align: center;
	font-weight: 100;
}

.panel-info>.panel-head {
	background-color: rgba;
	padding: 1px;
}

.panel-heading {
	padding: 1px;
}
</style>

<script type="text/javascript">
	//탭 스트립트
	$('#myTab a').click(function(e) {
		e.preventDefault()
		$(this).tab('show')
	})

	$('#myTab a[href="#profile"]').tab('show') // Select tab by name
	$('#myTab a:first').tab('show') // Select first tab
	$('#myTab a:last').tab('show') // Select last tab
	$('#myTab li:eq(2) a').tab('show') // Select third tab (0-indexed)

	$(".collapse").collapse()

	$('#myCollapsible').collapse({
		toggle : 'show'
	})
</script>


<div role="tabpanel">

	<!-- Nav tabs -->
	<ul class="nav nav-tabs" role="tablist">
		<li role="presentation"><a href="<%=cp%>/notice/list"
			aria-controls="notice" role="tab" data-toggle="tab">공지사항</a></li>
		<li role="presentation"><a href="<%=cp%>/userEvent/list"
			aria-controls="userEvent" role="tab" data-toggle="tab">이벤트</a></li>
		<li role="presentation" class="active"><a
			href="<%=cp%>/userFaq/main" aria-controls="userFaq" role="tab"
			data-toggle="tab">자주찾는 질문</a></li>
		<li role="presentation"><a href="<%=cp%>/userQna/created"
			aria-controls="userQna" role="tab" data-toggle="tab">그것이 알고싶다</a></li>
		<li role="presentation"><a href="<%=cp%>/userBbs/list"
			aria-controls="userBbs" role="tab" data-toggle="tab">우리끼리소담소담</a></li>

	</ul>
</div>

<!-- 마크업 -->
<div class="tab-content">
	<div role="tabpanel" class="tab-pane active" id="userFaq">
		<div class="bodyFrame2">
			<div class="body-title">
				<h3>
					<span class="glyphicon glyphicon-exclamation-sign"></span> 자주찾는 질문
				</h3>
				<div>
					<ul class="nav nav-tabs">
						<li id="tab-list" data-tab="list">전체</li>
						<li id="tab-list" data-tab="list">타입1</li>
						<li id="tab-list" data-tab="list">타입2</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>


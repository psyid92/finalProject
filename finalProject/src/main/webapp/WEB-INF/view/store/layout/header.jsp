<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<script type="text/javascript">
	//���� ó��
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
			<a class="navbar-brand" href="<%=cp%>/store/mystore">����� �����</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<c:if test="${not empty sessionScope.store}">
			<ul class="nav navbar-nav"> 
				<li class="list-menu"><a href="<%=cp%>/store/mystore">��ü����</a></li>
				<li class="list-menu"><a href="<%=cp%>/store/coupon1">��������</a></li>
				<li class="list-menu"><a href="<%=cp%>/store/event1">�̺�Ʈ</a></li> 
				<li class="list-menu"><a href="<%=cp%>/store/giupNotice">������</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="<%=cp%>/store/logout">�α׾ƿ�</a></li>
			</ul>
			<p class="navbar-text navbar-right">
				<span>${sessionScope.store.g1_Name}</span>&nbsp;�����
			</p>
			</c:if>
			
		</div>
	</div>
</nav>

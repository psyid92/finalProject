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

<div class="list-group">
       <div class="list-group-item lefthead"><i></i> 회원관리</div>
       <a href="#" class="list-group-item">회원정보관리</a>
       <a href="#" class="list-group-item">리뷰관리</a>
       <a href="#" class="list-group-item">고객센터관리</a>
</div>

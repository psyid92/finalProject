<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script type="text/javascript">
$(function(){
	var idx="${subMenu}";
	if(!idx) idx=1;
	var subMenu=$(".list-group-item")[idx];
	$(subMenu).addClass("active");
});
</script>

<div class="list-group">
       <div class="list-group-item lefthead"><i></i> 이벤트 관리</div>
       <a href="#" class="list-group-item">사장님 꿀팁</a>
       <a href="#" class="list-group-item">배달행 아카데미</a>
       <a href="#" class="list-group-item">배달행 활용백서</a>
</div>

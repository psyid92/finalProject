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
       <a href="<%=cp%>/memberevent/list" class="list-group-item">회원이벤트</a>
       <a href="<%=cp%>/admin/giupevent" class="list-group-item">판매자이벤트</a>
       <a href="<%=cp%>/adsurvey/list" class="list-group-item">설문조사</a>
</div>

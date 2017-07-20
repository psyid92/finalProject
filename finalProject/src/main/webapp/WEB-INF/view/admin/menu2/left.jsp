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
       <div class="list-group-item lefthead"><i></i> 업체관리</div>
       <a href="<%=cp%>/admin/giupcontroll/list" class="list-group-item">업체정보관리</a>
       <a href="<%=cp%>/admin/giupreviewcontroll/list" class="list-group-item">업체리뷰관리</a>
       <a href="<%=cp%>/admin/giupcscentercontroll" class="list-group-item">기업1:1문의관리</a>
       <a href="<%=cp%>/admin/giupmenucontroll" class="list-group-item">메뉴관리</a>
</div>

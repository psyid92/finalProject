<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style type="text/css">


</style>

<script type="text/javascript">

</script>

<div class="storeBodyFrame2">
    <div class="body-title">
          <h3><span class="glyphicon glyphicon-tower"></span> 사장님 공지사항 </h3>
    </div>
    
    <div class="alert alert-info">
         <i class="glyphicon glyphicon-info-sign"></i>
         	중요한 공지 및 알림 등을 알려드립니다.
    </div>
    
    <div>
    	<div style="clear: both; height: 30px; line-height: 30px" >    	
    		<div style="float:left;">${dataCount}개 (${page }/$(total_page) 페이지)</div>
    		<div style="float:right;">&nbsp;</div>
    	</div>
    
    
    </div>
</div>
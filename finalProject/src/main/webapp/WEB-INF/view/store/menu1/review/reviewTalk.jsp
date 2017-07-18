<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<script>

</script>
<div class="storeBodyFrame2">
    <div class="body-title">
          <h3><span class="glyphicon glyphicon-tower"></span> 리뷰관리하기 </h3>
    </div>
    
    <div>
        <ul class="nav nav-tabs nav-justified">
  			<li role="presentation" ><a href="<%=cp%>/store/review/reviewYet">미답변 리뷰</a></li>
  			<li role="presentation"><a href="<%=cp%>/store/review">전체 리뷰 보기</a></li>
 			<li role="presentation" class="active"><a>사장님 한마디</a></li>
		</ul>
    </div>
</div>
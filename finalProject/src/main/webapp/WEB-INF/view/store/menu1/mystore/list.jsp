<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<div class="storeBodyFrame2">
    <div class="body-title">
          <h3><span class="glyphicon glyphicon-tower"></span> 마이페이지 </h3>
    </div>
    
    <div>
         업소 통계등의 마이페이지
         <c:forEach var="dto" items="${list }" >
         	<span>${dto.pay_pay}</span>
         </c:forEach>
    </div>
</div>
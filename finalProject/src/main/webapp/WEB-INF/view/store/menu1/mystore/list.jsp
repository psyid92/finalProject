<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<script type="text/javascript">
function salesOfDay(){
	var f=document.salesFormOfDay;
	f.action="<%=cp%>/store/storeSales";
	f.submit();
}

</script>

<div class="storeBodyFrame2">
    <div class="body-title">
          <h3><span class="glyphicon glyphicon-tower"></span> 매출현황 </h3>
    </div>
    
    <div>
         매출현황<br>
         <c:forEach var="dto" items="${list }" >
         	<span>${dto.g1_num }</span><br>
         	<span>${dto.g1_name }</span><br>
         	<span>${dto.pay_created }</span><br>
         	<span>${dto.pay_pay}</span><br><br>
         </c:forEach>
    </div>
    
    <form name="salesFormOfDay">
    	<input type="button" value="보내기" class="btn" onclick="salesOfDay();">
    </form>
</div>
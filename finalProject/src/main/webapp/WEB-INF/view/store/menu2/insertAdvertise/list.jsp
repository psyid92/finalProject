<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<script>
	function check() {
		var f = document.insertAdForm;
		var ad_Title = f.advertise.value;
		if (!ad_Title) {
			$("#advertise").focus();
			return false;
		}
	}
</script>
<div class="storeBodyFrame2">
    <div class="body-title">
          <h3><span class="glyphicon glyphicon-tower"></span> 광고 추가 </h3>
    </div>
    <div>
    	<form name="insertAdForm" onsubmit="return check();" method="post">
	    	<input type="text" class="form-control" name="advertise" id="advertise" placeholder="추가 할 광고명을 적어주세요." style="width: 300px; float: left; margin-right: 10px;">
	    	<input type="submit" class="btn" value="추가">
    	</form>
    </div>
    <div id="listAdvertise">
    	<c:if test="${listAdvertise.size() != 0}">
    		<div><h2>광고 리스트</h2></div>
    	</c:if>
    	<c:forEach var="dto" items="${listAdvertise}">
    		<ul>
    			<li>${dto.ad_Title }</li>
    		</ul>
    	</c:forEach>
    </div>
</div>
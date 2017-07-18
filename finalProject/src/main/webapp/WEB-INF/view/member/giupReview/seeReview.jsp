<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<br>
<div align="center" style="margin: auto;">
<h3>내가 남긴 리뷰</h3>
</div>
<br><br>

<div align="center" style="margin: auto; border: 1px solid; border-radius: 5px;">
<br><br>

<c:if test="${giupdto ne null }">
	주문일 : ${giupdto.rep_created }<br>
	별점 : <p style="color: orange; display: inline;">${giupdto.myStar }</p><br>
	<br>
	<c:if test="${giupdto.rphoto_SaveFilename ne null }">
		<img src='<%=cp%>/uploads/giupReview/${giupdto.rphoto_SaveFilename }'>
	</c:if>
	<c:if test="${giupdto.rphoto_SaveFilename eq null }">
		<img src='<%=cp%>/resource/img/no_img.gif'>
	</c:if>
	<br>
	${giupdto.rep_content }
</c:if>

<div style="min-height: 50px;"></div>
</div>

<div style="min-height: 40px;"></div>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp=request.getContextPath();
%>

<c:if test="${not empty listUserReplyAnswer}">
    <c:forEach var="dto" items="${listUserReplyAnswer}">
        <div style="clear: both; border-top: #d5d5d5 solid 1px; margin-top: 7px; padding-top: 5px;">
            <div style="float: left;">${dto.m1_Email} | ${dto.rep_Created }</div>
            <div style="float: right; text-align: rigth;">
<c:if test="${sessionScope.member.userId==dto.m1_Email}">   
		     <a onclick='deleteUserReply("${dto.rep_Num}", "${dto.rep_Answer}");'>삭제</a>
</c:if>
<c:if test="${sessionScope.member.userId!=dto.m1_Email}">   
		   | <a href='#'>신고</a>
</c:if>
            </div>
        </div>
        <div style="clear: both; padding: 5px 0 5px 0px;  min-height: 70px;">
            ${dto.rep_Content}
        </div>
    </c:forEach>
</c:if>
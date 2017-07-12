<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp=request.getContextPath();
%>

<div style="clear: both; padding-top: 20px;">
    <div style="float: left;"><span style="color: #3EA9CD; font-weight: bold;">댓글 ${replyCount}개</span> <span>[댓글 목록, ${pageNo}/${total_page} 페이지]</span></div>
    <div style="float: right; text-align: right;"></div>
</div>

<div style="clear: both; padding-top: 5px;">

<c:forEach var="dto" items="${listUserReply}">
    <!-- 리플 내용 리스트 시작 -->
    <div style="clear:both; margin-top:5px; padding: 10px; border: #d5d5d5 solid 1px; min-height: 130px;">
        <div style="clear: both;">
            <div style="float: left;">이름:${dto.m1_Email} | ${dto.rep_Created}</div>
            <div style="float: right;  text-align: rigth;">
<c:if test="${sessionScope.member.userId!=dto.m1_Email}">		   
                <a href='#'>신고</a>
</c:if>		   
            </div>
        </div>
        <div style="clear: both; padding: 5px 0 5px 0px;  min-height: 70px;">
            ${dto.rep_Content}
        </div>
        <div style="clear: both; min-height: 30px;">
            <div style="float: left;">
                <button type="button" class="btn btn-primary btn-sm" onclick="replyAnswerLayout('${dto.rep_Num}');">답글<span id="answerCount${dto.rep_Num}">(${dto.answerCount})</span> <span id="answerGlyphicon${dto.rep_Num}" class="glyphicon glyphicon-triangle-bottom"></span></button>
            </div>
            <div style="float: right; text-align: rigth;">
            <c:if test="${sessionScope.member.userId==dto.m1_Email}">	
                <button type="button" class="btn btn-warning btn-sm" onclick='deleteReply("${dto.rep_Num}", "${pageNo}");'><span class="glyphicon glyphicon-hand-down"></span>삭제 </button>
            </c:if>	
            </div>                        
        </div>

        <!-- 답글 시작 -->
        <div id="replyAnswerLayout${dto.rep_Num}" style="display: none;">
            <div style="clear: both; margin-top:10px; padding: 5px; border-top: #d5d5d5 solid 1px;">
                <textarea id="rep_Content${dto.rep_Num}" class="form-control" rows="3" required="required"></textarea>
            </div>
            <div style="text-align: right; padding-top: 7px;">
                <button type="button" class="btn btn-primary btn-sm" onclick="sendReplyAnswer('${dto.bbs_Num}', '${dto.rep_Num}')"> 답글등록 </button>
            </div>

            <!-- 답글 리스트 -->       
            <div id="listUserReplyAnswer${dto.rep_Num}" style="padding-top: 5px;"></div>
        </div> <!-- 답글 끝 -->
                        
    </div>  <!-- 리플 내용 리스트 끝 -->
</c:forEach>
</div>
              
<div style="clear: both; padding-top: 10px; text-align: center;">
    ${paging}
</div>

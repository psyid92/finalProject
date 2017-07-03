<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<div class="adminBodyFrame2">
    <div class="body-title">
          <h3><span class="glyphicon glyphicon-tower"></span> 업체리스트 </h3>
    </div>

    
    <div style="clear: both; height: 30px; line-height: 30px;">
		<div style="float: left;">dataCount개 page/total_page 페이지</div>
    </div>
    
    <div class="table-responsive" style="clear: both;">
    	<table class="table table-hover">
    		<thead>
    			<tr>
    				<th class="text-center" style="width: 70px;">기업번호</th>
    				<th class="text-center" style="width: 70px;">기업상태</th>
    				<th class="text-center" style="width: 70px;">기업카테고리</th>
    				<th class="text-center" style="width: 70px;">기업아이디</th>
    				<th class="text-center" style="width: 70px;">기업명</th>
    				<th class="text-center" style="width: 70px;">광고기간</th>
    			</tr>
    		</thead>
    		<tbody>
   <%--  <c:forEach var="dto" items="${list}"> --%>
                    <tr>
                        <td class="text-center">1111</td>
                        <td class="text-center">state</td>
                        <td class="text-center">jumun</td>
                        <td class="text-center">asdf</td>
                        <td class="text-center">asdf</td>
                        <td class="text-center">11</td>
                    </tr>
                    
                    <tr>
                        <td class="text-center">2222</td>
                        <td class="text-center">state2</td>
                        <td class="text-center">jumun2</td>
                        <td class="text-center">asdf2</td>
                        <td class="text-center">asdf2</td>
                        <td class="text-center">22</td>
                    </tr>
     <%-- </c:forEach>   --%>                  
                </tbody>
    	</table>
    </div>
    
    <div class="paging" style="text-align: center; min-height: 50px; line-height: 50px;">
            <%-- <c:if test="${dataCount==0 }">
                  등록된 게시물이 없습니다.
            </c:if>
            <c:if test="${dataCount!=0 }">
                ${paging}
            </c:if> --%>
            
            이전 | 1 2 3 | 다음
     </div>        
        
</div>
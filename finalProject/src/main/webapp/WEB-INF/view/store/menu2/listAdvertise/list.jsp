<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style type="text/css">
.table th, .table td {
    font-weight: normal;
    border-top: none;
}
.table thead tr th{
     border-bottom: none;
} 
.table thead tr{
    border: #d5d5d5 solid 1px;
     background: #eeeeee; color: #787878;
} 
.table td {
    border-bottom: #d5d5d5 solid 1px;
}

</style>

<script type="text/javascript">
function searchList() {
	var f=document.searchForm;
	f.action="<%=cp%>/giupNotice/list";
	f.submit();
}
</script>
<div class="storeBodyFrame2">
    <div class="body-title">
          <h3><span class="glyphicon glyphicon-tower"></span> 광고 구매 내역 리스트 </h3>
    </div>
    
</div>

    <%-- <c:if test="${dataCount != 0 }"> --%>
    	<div style="clear: both; height: 30px; line-height: 30px" >    	
    		<div style="float:left;">${dataCount}개 (${page }/${total_page} 페이지)</div>
    		<div style="float:right;">&nbsp;</div>
    	</div>
    	
    	<div class="table-responsive" style="clear: both"> <!-- 테이블 반응형 -->
    		<table class="table table-hover">
    			<thead>
    				<tr> 
    					<th class="text-center" style="width: 100px;">번호</th>
    					<th>상품명</th>
    					<th class="text-center" style="width: 100px;">결제금액</th>
    					<th class="text-center" style="width: 100px;">구매일</th>
    					<th class="text-center" style="width: 100px;">종료일</th>
    					<th class="text-center" style="width: 100px;">상태</th>
    				</tr>    			
    			</thead>
    			<tbody>
    			<c:forEach var="dto" items="${list}">
    				<tr>
    					<td class="text-center">${dto.giupAd_Num}</td>
    					<td>${dto.ad_Title}</td>
    					
    					<c:choose>
					       <c:when test="${dto.giupAd_Term == 1}">
					           <td class="text-center">1000원</td>
					       </c:when>
					       <c:when test="${dto.giupAd_Term == 7}">
					           <td class="text-center">5000원</td>
					       </c:when>
					       <c:when test="${dto.giupAd_Term == 30}">
					           <td class="text-center">20000원</td>
					       </c:when>
					       <c:otherwise>
					           <td class="text-center">200000원</td>
					       </c:otherwise>
					   </c:choose>
    					<td class="text-center">${dto.giupAd_PayDate}</td>
    					<td class="text-center">${dto.endAd}</td>
    					<td class="text-center">${dto.stated}</td>
    				</tr>
    			</c:forEach>
    			</tbody>
    		</table>
    	
    	</div>
    <%-- </c:if>	 --%>
    	
    	<%-- <div class="paging" style="text-align: center; min-height: 50px; line-height: 50px; ">
    		<c:if test="${dataCount ==0}">
    			등록된 게시물이 없습니다. 
    		</c:if>
    		<c:if test="${dataCount !=0 }">
    			${paging}
    		</c:if>
    		
    	</div>
    	
    	<div style="clear: both">
    		<div style="float: left; width: 20px; min-width: 85px; ">
    			<button type="button" class="btn btn-default btn-sm wbtn" onclick="javascript:location.href='<%=cp%>/giupNotice/list'; ">새로고침</button>
    		</div>
    		<div style="float: left; width: 60%; text-align: center;">
    			<form name="searchForm" class="form-inline" method="post">
    				<select name="searchKey" class="form-control input-sm">
    					<option value="noti_Title">제목 </option>
    					<option value="admin_Id">작성자</option>
    					<option value="noti_Content">내용 </option>
    					<option value="noti_Created">등록일 </option>
    				</select>
    				<input type="text" class="form-control input-sm input-search" name="searchValue">
    				<button type="button" class="btn btn-info btn-sm btn-search" onclick="searchList()"><span class="glyphicon glyphicon-search">검색</span> </button>
    			
    			</form>
    		</div>
    	
    		<div style="float: left; width: 20%; min-width: 85px; text-align: right; ">
    	<c:if test="${sessionScope.store.g1_Id=='admin' }">
    			<button type="button" class="btn btn-primary btn-sm bbtn" onclick="javascript:location.href='<%=cp%>/giupNotice/created'; "><span class="glyphicon glyphicon glyphicon-pencil">글쓰기</span> </button>
    	</c:if>
    		</div>
    	</div> --%>

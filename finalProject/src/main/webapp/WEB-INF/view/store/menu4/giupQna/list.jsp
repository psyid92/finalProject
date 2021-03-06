<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style type="text/css">
.table th, .table td{
	font-weight: normal; 
	border-top: nonr;
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

.table td a{
	color: #000
}

</style>

<script type="text/javascript">
function searchList() {
	var f = document.searchForm;
	f.action="<%=cp%>/giupQna/list";
	f.submit();
}
</script>

<div class="bodyFrame2">
    <div class="body-title">
          <h3><span class="glyphicon glyphicon-tower"></span> Q&amp;A </h3>
    </div>
    
    <div class="alert alert-info">
        <i class="glyphicon glyphicon-info-sign"> Something to know about us, please leave your question here! </i>
    </div>

<c:if test="${dataCount !=0 }">
    <div style="clear: both; height: 30px; line-height: 30px;">
    	<div style="clear: left;"> ${dataCount}개(${page}/${total_page}페이지)</div>
    	<div style="clear: right;">&nbsp;</div>
    </div>
    
    <div class="table-responsive" style="clear:both;"> <!-- 테이블 반응형 -->
    	<table class="table table-hover">
    		<thead>
    			<tr>
    				<th class="text-center" style="width: 70px; ">번호</th>
    				<th class="text-center">제목</th>
    				<th class="text-center" style="width: 100px;">글쓴이</th>
    				<th class="text-center" style="width: 100px; ">날짜</th>
    				<th class="text-center" style="width: 70px;">조회수</th>
    			</tr>    		
    		</thead>
    		<tbody>
    		<c:forEach var="dto" items="${list}">
    			<tr>
    				<td class="text-center">${dto.listNum}</td>
    				<td>
    					<c:forEach var="n" begin="1" end="${dto.q_Depth}">
    						&nbsp;&nbsp;
    					</c:forEach>
    					<c:if test="${dto.q_Depth !=0}">
    						<img src="<%=cp%>/resource/img/re.gif" >
    					</c:if>
    					<a href="${articleUrl}&q_Num=${dto.q_Num}">${dto.q_Title}</a>
    				</td>
    				<td class="text-center">${dto.g1_Name}</td>
    				<td class="text-center">${dto.q_Created}</td>
    				<td class="text-center">${dto.q_HitCount}</td>    				
    			</tr>
    		</c:forEach>	
    		</tbody>
    	
    	</table>
    </div>
</c:if>       
    <div class="paging"	 style="text-align: center; min-height: 50px; line-height: 50px;">
    	<c:if test="${dataCount==0 }"> 등록된 게시물이 없습니다.</c:if>
    	<c:if test="${dataCount!=0 }">${paging }</c:if>
    </div>
    
    <div style="clear: both">
    	<div style="float: left; width: 20%; min-width: 85px;">
    		<button type="button" class="btn btn-default btn-sm wbtn" onclick="javascript:location.href='<%=cp%>/giupQna/list';">새로고침</button>
    	</div>
    	<div style="float: left; width: 60%; text-align: center; ">
    		<form name="searchForm" method="post" class="form-inline">
    			<select name="searchKey" class="form-control input-sm">
    				<option value="q_Title">제목</option>
    				<option value="g1_Name">작성자</option>
    				<option value="q_Content">내용</option>
    				<option value="q_Created">등록일</option>
    			</select>
    			<input type="text" name="searchValue" class="form-control input-sm input-search">
    			<button type="button" class="btn btn-info btn-sm btn-search" onclick="searchList();"><span class="glyphicon glyphicon-search">검색</span></button>
    		</form>
    	</div>
    	<div style="float:left; width: 20%; min-width: 85px; text-align: right; ">
    		<button type="button" class="btn btn-primary btn-sm bbtn" onclick="javascript:location.href='<%=cp%>/giupQna/created';"><span class="glyphicon glyphicon glyphicon-pencil"></span>글쓰기</button>
    	</div>
    </div>
</div>


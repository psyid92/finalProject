<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
.table td a{
    color: #000;
}

.article {
	cursor: pointer;
}
</style>

<script type="text/javascript">

$(function(){
	$("select[name='refund_State']").val("${refund_State}").prop("selected",true);
	$("select[name='refund_State']").change(function(){
		var refund_State = $(this).val();
		location.href="<%=cp%>/admin/refund?refund_State="+refund_State;
	});
	$(".article").click(function(){
		var jumun_Num = $(this).attr("id");
		location.href="<%=cp%>/admin/refundArticle?jumun_Num=" + jumun_Num;
	});
});
function searchList() {
	var f=document.searchForm;
	f.action="<%=cp%>/admin/refund";
	f.submit();
}
</script>

<div class="bodyFrame2">
    <div class="body-title">
          <h3><span class="glyphicon glyphicon-tower"></span> 환불 </h3>
    </div>
    
    <div>
    
    	<div style="clear: both; height: 30px; line-height: 30px; float: left;" >    	
    		<div style="float:left;">${dataCount}개 (${page }/${total_page} 페이지)</div>
    		<div style="float:right;">&nbsp;</div>
    	</div>
    	<div style="float: right; padding-bottom: 10px;">
    		<div style="float: left; text-align: center;">
    			<form class="form-inline" method="post">
    				<div style="float: left;">
    					<select name="refund_State" class="form-control input-sm">
    						<option value="">전체</option>
	    					<option value="0">처리 대기</option>
	    					<option value="1">처리 완료</option>
	    				</select>
    				</div>
    			</form>
    		</div>
    	</div>
    <div class="table-responsive" style="clear: both"> <!-- 테이블 반응형 -->
    		<table class="table table-hover">
    			<thead>
    				<tr> 
    					<th class="text-center" style="width: 70px;">번호</th>
    					<th class="text-center" style="width: *;">제목</th>
    					<th class="text-center" style="width: 100px;">회원아이디</th>
    					<th class="text-center" style="width: 100px;">신청일</th>
    					<th class="text-center" style="width: 100px;">결제일</th>
    					<th class="text-center" style="width: 100px;">주문금액</th>
    					<th class="text-center" style="width: 100px;">결제금액</th>
    					<th class="text-center" style="width: 100px;">환불상태</th>
    				</tr>    			
    			</thead>
    			<tbody>
    			<c:forEach var="dto" items="${list}">
    				<tr class="article" id="${dto.jumun_Num}">
    					<td class="text-center">${dto.listNum}</td>
    					<td class="text-center">환불 신청</td>
    					<td class="text-center">${dto.m1_Email}</td>
    					<td class="text-center">${fn:substring(dto.refund_Created,0,10)}</td>
    					<td class="text-center">${dto.pay_Created}</td>
    					<td class="text-center">${dto.jumun_Pay}원</td>
    					<td class="text-center">${dto.pay_Pay}원</td>
    					<c:if test="${dto.refund_State == 0}">
    						<td class="text-center">처리 대기</td>
    					</c:if>
    					<c:if test="${dto.refund_State == 1}">
    						<td class="text-center">처리 완료</td>
    					</c:if>
    				</tr>
    			</c:forEach>
    			</tbody>
    		
    		</table>
		</div>
    	
    	<div class="paging" style="text-align: center; min-height: 50px; line-height: 50px;">
    		<c:if test="${dataCount == 0}">
    			등록된 신청이 없습니다. 
    		</c:if>
    		<c:if test="${dataCount != 0}">
    			${paging}
    		</c:if>
    		
    	</div>
    	<div style="clear: both;">
    		<div style="float: left; width: 35%; min-width: 85px;">
    			<button type="button" class="btn btn-default btn-sm wbtn" onclick="javascript:location.href='<%=cp%>/admin/refund';">새로고침</button>
    		</div>
    	</div>
    	<div style="margin: 0 auto; width: 65%;">
    		<form name="searchForm" class="form-inline" method="post">
	    		<div style="float: left;">
			    	<select name="searchKey" class="form-control input-sm">
			    		<option value="m1_Email">회원아이디 </option>
			    		<option value="refund_Created">날짜 </option>
			    	</select>
		    	</div>
		    	<div style="float: left; padding-left: 2px;"><input type="text" class="form-control input-sm input-search" name="searchValue"></div>
		    	<div style="float: left; padding-left: 2px;"><button type="button" class="btn btn-info btn-sm btn-search" onclick="searchList()"><span class="glyphicon glyphicon-search">검색</span> </button></div>
	    	</form>
    	</div>
     
    </div>
</div>
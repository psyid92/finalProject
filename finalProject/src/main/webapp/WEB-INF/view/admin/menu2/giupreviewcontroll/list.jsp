<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<script>
function searchList() {
	var f=document.searchForm;
	f.action="<%=cp%>/admin/giupreviewcontroll/list";
	f.submit();
}
$(function(){
	$("#giup_list tr").click(function(){
		var rep_Num = $(this).next().val();
		var rrep_Num = $(this).next().next().val();
	});
});
</script>
<style>
#giup_list tr {
	cursor: pointer;
}
</style>
<div class="adminBodyFrame2">
	<div class="body-title">
		<h3>
			<span class="glyphicon glyphicon-tower"></span> 업체리뷰관리
		</h3>
	</div>

	<div style="clear: both; height: 30px; line-height: 30px;">
		<div style="float: left;">${dataCount }개(${page }/${total_page }
			페이지)</div>
	</div>



	<div class="table-responsive" style="clear: both;">
		<table class="table table-hover">
			<thead>
				<tr>
					<th class="text-center" style="width: 23%;">기업명</th>
					<th class="text-center" style="width: 15%;">회원 아이디</th>
					<th class="text-center" style="width: 25%">회원 댓글내용</th>
					<th class="text-center" style="width: 12%;">기업 아이디</th>
					<th class="text-center" style="width: 25%;">기업 댓글내용</th>
				</tr>
			<tbody id="giup_list">
			<c:forEach var="review" items="${reviewList }">
    			<tr>
    				<td  style="width: 23%;">${review.g1_name}</td>
    				<td align="center" style="width: 15%;">${review.m1_Email}</td>
    				<td style="width: 25%;">${review.rep_Content}</td>
    				<td style="width: 12%;">${ review.g1_id}</td>
    				<td align="center" width="25%;">${review.rrep_Content}</td>
    			</tr>
    			<input type="hidden" value="${review.rep_Num}">
    			<input type="hidden" value="${review.rrep_Num}">
			</c:forEach>
			</tbody>
		</table>
	</div>

	<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		<tfoot>
			<tr height="35">
				<td align="center"><c:if test="${dataCount==0 }">
				                등록된 게시물이 없습니다.
				         </c:if> <c:if test="${dataCount!=0 }">
				               ${paging}
				         </c:if></td>
			</tr>
		</tfoot>
	</table>

	<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
		<tfoot>
			<tr height="40">
				<td align="left" width="100">
					<button type="button" class="btn"
						onclick="javascript:location.href='<%=cp%>/admin/giupreviewcontroll/list';">새로고침</button>
				</td>
				<td align="center">
					<form name="searchForm" action="" method="post">
						<select name="searchKey" class="selectField">
							<option value="g1_name">기업명</option>
							<option value="m1_Eamil">회원 아이디</option>
							<option value="g1_id">기업 아이디</option>
						</select> <input type="text" name="searchValue" class="boxTF">
						<button type="button" class="btn" onclick="searchList()">검색</button>
					</form>
				</td>
			</tr>
		<tfoot>
	</table>

</div>


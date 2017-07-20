<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<script>
function searchList() {
	var f=document.searchForm;
	f.action="<%=cp%>/admin/memberreviewcontroll";
	f.submit();
}
</script>

<div class="adminBodyFrame2">
	<div class="body-title">
		<h3>
			<span class="glyphicon glyphicon-tower"></span> 회원리뷰
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
					<th class="text-center" style="width: 25%;">회원 아이디</th>
					<th class="text-center" style="width: 25%;">기업이름</th>
					<th class="text-center" style="width: 15%;">별점</th>
					<th class="text-center" style="width: *">내용</th>
					<th class="text-center" style="width: 10%;">사진</th>
				</tr>
			<tbody id="giup_list">
			<c:forEach var="review" items="${reviewList }">
    			<tr>
    				<td align="center" style="width: 25%;">${review.m1_email}</td>
    				<td  style="width: 25%;">${review.g1_name}</td>
    				<td style="width: 15%;">${review.myStar}</td>
    				<td style="width: *">${ review.rep_content}</td>
    				<td align="center" width="10%;">${review.rphoto_SaveFilename ne null ? '있음' : '-' }</td>
    			</tr>
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
						onclick="javascript:location.href='<%=cp%>/admin/memberreviewcontroll';">새로고침</button>
				</td>
				<td align="center">
					<form name="searchForm" action="" method="post">
						<select name="searchKey" class="selectField">
							<option value="giupName">기업명</option>
							<option value="m1Eamil">회원이메일</option>
						</select> <input type="text" name="searchValue" class="boxTF">
						<button type="button" class="btn" onclick="searchList()">검색</button>
					</form>
				</td>
			</tr>
		<tfoot>
	</table>

</div>


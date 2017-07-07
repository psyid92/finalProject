<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<script type="text/javascript">
	function searchList() {
		var f=document.searchForm;
		f.action="<%=cp%>
	/admin/giupcontroll/list";
		f.submit();
	}
</script>

<div class="adminBodyFrame2">
	<div class="body-title">
		<h3>
			<span class="glyphicon glyphicon-tower"></span> 업체리스트
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
					<th class="text-center" style="width: 70px;">기업번호</th>
					<th class="text-center" style="width: 70px;">기업상태</th>
					<th class="text-center" style="width: 70px;">기업카테고리</th>
					<th class="text-center" style="width: 70px;">기업아이디</th>
					<th class="text-center" style="width: 70px;">기업명</th>
					<th class="text-center" style="width: 70px;">광고기간</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="dto" items="${list}">
					<tr>
						<td class="text-center">${dto.g1_num}</td>
						<td class="text-center">${dto.g1_sleep }</td>
						<td class="text-center">${dto.cat_code }</td>
						<td class="text-center">${dto.g1_id }</td>
						<td class="text-center">${dto.g1_name }</td>
						<td class="text-center">추후EL추가</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		<tr height="35">
			<td align="center"><c:if test="${dataCount==0 }">
			                등록된 게시물이 없습니다.
			         </c:if> <c:if test="${dataCount!=0 }">
			               ${paging}
			         </c:if></td>
		</tr>
	</table>

	<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
		<tr height="40">
			<td align="left" width="100">
				<button type="button" class="btn"
					onclick="javascript:location.href='<%=cp%>/bbs/list';">새로고침</button>
			</td>
			<td align="center">
				<form name="searchForm" action="" method="post">
					<select name="searchKey" class="selectField">
						<option value="subject">제목</option>
						<option value="userName">작성자</option>
						<option value="content">내용</option>
						<option value="created">등록일</option>
					</select> <input type="text" name="searchValue" class="boxTF">
					<button type="button" class="btn" onclick="searchList()">검색</button>
				</form>
			</td>
			<td align="right" width="100">
				<button type="button" class="btn"
					onclick="javascript:location.href='<%=cp%>/bbs/created';">글올리기</button>
			</td>
		</tr>
	</table>
</div>
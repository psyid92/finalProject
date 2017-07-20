<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	String cp = request.getContextPath();
%>

<style>


.img_button {
	width: 50px;
	height: 50px;
}

.giup_arti_left {
	display: inline-block;
	cursor: pointer;
}

.giup_arti_right { 
	display: inline-block;
	cursor: pointer;
	margin-right: 28%;
}

.giup_arti_sp {
	display: inline-block;
	width: 12%; 
	text-align: center;
    margin-top: 10px;
    margin-bottom: 10px;
    margin-left: 10px;
    margin-right: 10px;
    
}

.giup_arti_input {
	width:30%;   
}

.giup_arti_select {
 margin-left: -5px;
}

.giup_arti_sp {
font-weight: bold;
}
</style>

<script type="text/javascript"
	src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>

<script type="text/javascript"
   src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=WlJc9L4f0E6oaul2CL2b&submodules=geocoder"></script>


<script type="text/javascript">
	function searchList() {
		var f=document.searchForm;
		f.action="<%=cp%>/admin/giupreviewcontroll/list";
		f.submit();
	}
	
	$(function(){
		$("#giup_list").children().click(function(){
			var giupNum = $(this).find("td:first").text();
			
		});
	});
</script>

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
					<th class="text-center" style="width: 70px;">기업번호</th>
					<th class="text-center" style="width: 70px;">기업상태</th>
					<th class="text-center" style="width: 70px;">기업카테고리</th>
					<th class="text-center" style="width: 70px;">기업아이디</th>
					<th class="text-center" style="width: 70px;">기업명</th>
					<th class="text-center" style="width: 70px;">광고기간</th>
				</tr>
			<tbody id="giup_list">
				<c:forEach var="dto" items="${list}">
					<tr style="cursor: pointer"> 
						<td id="giup_list${dto.listNum}" class="text-center">${dto.g1_num}</td>
						<td class="text-center">${dto.g1_sleep }</td>
						<td class="text-center">${dto.cat_code }</td> 
						<td class="text-center">${dto.g1_id }</td>
						<td class="text-center">${dto.g1_name }</td>
						<td class="text-center">${dto.giupAd_Term }</td>
					</tr>
					<input type="hidden" id="giup_listNum${dto.listNum}" value="${dto.listNum}">
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
							<option value="giupName">기업명</option>
							<option value="giupId">기업아이디</option>
							<option value="giupCate">기업카테고리</option>
							<option value="giupNum">기업번호</option>
						</select> <input type="text" name="searchValue" class="boxTF">
						<button type="button" class="btn" onclick="searchList()">검색</button>
					</form>
				</td>
			</tr>
		<tfoot>
	</table>
</div>
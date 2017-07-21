<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>


<script type="text/javascript"
	src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>

<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=WlJc9L4f0E6oaul2CL2b&submodules=geocoder"></script>


<script>

function searchList() {
	var f=document.searchForm;
	f.action="<%=cp%>/admin/membercontroll";
		f.submit();
	}
	
	
</script>


<div class="adminBodyFrame2">
	<div class="body-title">
		<h3>
			<span class="glyphicon glyphicon-tower"></span> 회원리스트
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
					<th class="text-center" style="width: 10%;">닉네임</th>
					<th class="text-center" style="width: 30%;">이메일</th>
					<th class="text-center" style="width: 15%;">가입일</th>
					<th class="text-center" style="width: 15%;">마지막 로그인</th>
					<th class="text-center" style="width: 70px;">탈퇴</th>
				</tr>
			<tbody id="member_list">
				<c:forEach items="${memberList }" var="dto">
					<%-- <tr onclick="callModal(${dto.m1_num})"> --%>
					<tr>
						<td>${dto.m1_nickname }</td>
						<td>${dto.m1_email }</td>
						<td>${dto.m1_created }</td>
						<td>${dto.m1_lastLogin }</td>
						<td>${dto.m1_state }</td>
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
						onclick="javascript:location.href='<%=cp%>/admin/membercontroll';">새로고침</button>
				</td>
				<td align="center">
					<form name="searchForm" action="" method="post">
						<select name="searchKey" class="selectField">
							<option value="m1Nickname">닉네임</option>
							<option value="m1State">휴면상태</option>
						</select> <input type="text" name="searchValue" class="boxTF">
						<button type="button" class="btn" onclick="searchList()">검색</button>
					</form>
				</td>
			</tr>
		<tfoot>
	</table>



<!-- <button class="btn btn-default" data-target="#layerpop" data-toggle="modal">모달출력버튼</button><br/> -->
<div class="modal fade" id="layerpop" >
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
        <!-- 닫기(x) 버튼 -->
        <button type="button" class="close" data-dismiss="modal">×</button>
        <!-- header title -->
        <h4 class="modal-title">회원상세</h4>
      </div>
      <!-- body -->
      <div class="modal-body">
            Body
      </div>
      <!-- Footer -->
      <div class="modal-footer">
        Footer
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>




</div>
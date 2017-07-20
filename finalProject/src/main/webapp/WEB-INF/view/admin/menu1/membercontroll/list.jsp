<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script>

function searchList() {
	var f=document.searchForm;
	f.action="<%=cp%>/admin/membercontroll";
	f.submit();
}


</script>

<div class="adminBodyFrame2">
    <div class="body-title">
          <h3><span class="glyphicon glyphicon-tower"></span> 회원리스트 </h3>
    </div>
    
    

	<div style="clear: both; height: 30px; line-height: 30px;">
		<div style="float: left;">${dataCount }개(${page }/${total_page }
			페이지)</div>
	</div>

	<div class="table-responsive" style="clear: both;">
		<table class="table table-hover">
			<thead>
				<tr>
					<th class="text-center" style="width: 70px;">닉네임</th>
					<th class="text-center" style="width: 70px;">이메일</th>
					<th class="text-center" style="width: 70px;">가입일</th>
					<th class="text-center" style="width: 70px;">마지막 로그인</th>
					<th class="text-center" style="width: 70px;">탈퇴</th>
				</tr>
			<tbody id="giup_list">
			<c:forEach items="${memberList }" var="dto">
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
							<option value="m1Email">이메일</option>
							<option value="m1State">휴면상태</option>
						</select> <input type="text" name="searchValue" class="boxTF">
						<button type="button" class="btn" onclick="searchList()">검색</button>
					</form>
				</td>
			</tr>
		<tfoot>
	</table>

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">기업상세</h4>
				</div>
				<div id="article" class="modal-body giup_arti">
					<span class="giup_arti_sp">기업명 </span><input class="giup_arti_input" type="text" id="cur_giupName" value="">
					<span class="giup_arti_sp">아이디 </span><input class="giup_arti_input" type="text" id="cur_giupId" value=""><br>
					<span class="giup_arti_sp">운영상태 </span>
					<select name="cur_giupSleep" id="cur_giupSleep" class="giup_arti_input giup_arti_select">
						<option value="1">운영중</option>
						<option value="0">쉬는중</option>
					</select>
					<span class="giup_arti_sp">휴면상태 </span>
					<select name="cur_giupEnabled" id="cur_giupEnabled" class="giup_arti_input giup_arti_select">
						<option value="1">활동</option>
						<option value="0">휴면</option>
					</select>
					<span class="giup_arti_sp">카테고리 </span>
					<select name="cur_giupCatCode" id="cur_giupCatCode" class="giup_arti_input giup_arti_select">
						<option value="chicken">치킨</option>
						<option value="china">중국집</option>
						<option value="pizza">피자</option>
						<option value="bunsik">분식</option>
						<option value="bossam">족발,보쌈</option>
						<option value="ya">야식</option>
						<option value="zzim">찜,탕</option>
						<option value="don">돈까스</option>
					</select>
					<span class="giup_arti_sp">가입시간 </span><input class="giup_arti_input" type="text" id="cur_giupCreated" value=""><br>
					<span class="giup_arti_sp">주소1 </span><input class="giup_arti_input" type="text" id="cur_giupAddr1" value="">
					<span class="giup_arti_sp">주소2 </span><input class="giup_arti_input" type="text" id="cur_giupAddr2" value=""><br>
					<span class="giup_arti_sp">광고여부 </span> 
					<select name="cur_giupAdNum" id="cur_giupAdNum" class="giup_arti_input giup_arti_select">
						<option value="1000">광고</option>
						<option value="0">일반</option>
					</select>
					<span class="giup_arti_sp">광고일수 </span><input class="giup_arti_input text_write" type="text" id="cur_giupAdTerm" value=""><br>
					<input type="hidden" id="cur_listNum">
				</div> 
				<div class="modal-footer">
					<div id="article_left" class="giup_arti_left img_button"><img src="<%=cp%>/resource/img/button_left.png" class="img_button"/></div>
					<div id="article_right" class="giup_arti_right img_button"><img src="<%=cp%>/resource/img/button_right.png" class="img_button"/></div>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					<button id="article_update" type="button" class="btn btn-primary" value="update">수정하기</button>
				</div>
			</div> 
		</div>
	</div>
    
    
    
</div>
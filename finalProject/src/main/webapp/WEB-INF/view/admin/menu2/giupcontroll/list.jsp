<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<style>
.giup_arti_left {
	cursor: pointer;
	position:relative; 
	left:-100px; 
	bottom:230px;
	height:100px;
	width:100px; 
}
.giup_arti_right { 
	cursor: pointer;
	position:relative; 
	left:900px; 
	bottom:330px;
	height:100px;
	width:100px;
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
</style>


<script type="text/javascript">
	function searchList() {
		var f=document.searchForm;
		f.action="<%=cp%>/admin/giupcontroll/list";
		f.submit();
	}

	function intoarticle() {

	}

	//td 클릭했을때 해당 번호로 들어가기
	$(function() {
		$('tbody tr').click(function() {
			var tdText = $(this).text();
			tdText = tdText.split("\n").join("_");
			tdText = tdText.replace(/(\s*)/g, "");
			var start = tdText.indexOf("_");
			var end = tdText.indexOf("_", 1);
			tdText = tdText.substr(start + 1, end - 1);
			var articleUrl = $('#articleUrl').val() + '&num=' + tdText;
			//alert(articleUrl);
			//location.href = articleUrl;

			var url = articleUrl;

			$.ajax({
				type : "post",
				url : url,
				dataType : "json",
				success : function(data) {
					//console.log(data);
					var dto=data.dto;
					$("#cur_giupName").val(dto.g1_name);
					$("#cur_giupId").val(dto.g1_id);
					$("#cur_giupSleep").val(dto.g1_sleep);
					$("#cur_giupEnabled").val(dto.g1_enabled);
					$("#cur_giupCatCode").val(dto.cat_code);
					$("#cur_giupCreated").val(dto.g1_created);
					$("#cur_giupAddr1").val(dto.g3_addr2);
					$("#cur_giupAddr2").val(dto.g3_addr3);
					$("#cur_giupAdNum").val(dto.ad_num);
					$("#cur_giupAdTerm").val(dto.giupad_term);
					
					$('.giup_arti_input').attr( 'readonly', 'readonly' );
				},
				error : function(e) {
					console.log(e);
				}
			});
		});
	});
	
	$(function() {
		$('#article_right').click(function() {
			alert('right');
			
		});
	});
</script>

<input type="hidden" id="articleUrl" name="articleUrl"
	value="${articleUrl}">
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
			<tbody>
				<c:forEach var="dto" items="${list}">
					<tr style="cursor: pointer" data-toggle="modal" data-target="#myModal"> 
						<td class="text-center">${dto.g1_num}</td>
						<td class="text-center">${dto.g1_sleep }</td>
						<td class="text-center">${dto.cat_code }</td> 
						<td class="text-center">${dto.g1_id }</td>
						<td class="text-center">${dto.g1_name }</td>
						<td class="text-center">${dto.giupad_term }</td>
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
						onclick="javascript:location.href='<%=cp%>/admin/giupcontroll/list';">새로고침</button>
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
					<span class="giup_arti_sp">운영상태 </span><input class="giup_arti_input" type="text" id="cur_giupSleep" value="">
					<span class="giup_arti_sp">휴먼상태 </span><input class="giup_arti_input" type="text" id="cur_giupEnabled" value=""><br>
					<span class="giup_arti_sp">카테고리 </span><input class="giup_arti_input" type="text" id="cur_giupCatCode" value="">
					<span class="giup_arti_sp">가입시간 </span><input class="giup_arti_input" type="text" id="cur_giupCreated" value=""><br>
					<span class="giup_arti_sp">주소1 </span><input class="giup_arti_input" type="text" id="cur_giupAddr1" value="">
					<span class="giup_arti_sp">주소2 </span><input class="giup_arti_input" type="text" id="cur_giupAddr2" value=""><br>
					<span class="giup_arti_sp">광고여부 </span><input class="giup_arti_input" type="text" id="cur_giupAdNum" value=""> 
					<span class="giup_arti_sp">광고일수 </span><input class="giup_arti_input" type="text" id="cur_giupAdTerm" value=""><br>
				</div> 
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary">수정하기</button>
				</div>
			</div> 
				<div id="article_left" class="giup_arti_left"><img src="<%=cp%>/resource/img/button_left.png" width="100px" height="100px"/></div>
				<div id="article_right" class="giup_arti_right"><img src="<%=cp%>/resource/img/button_right.png" width="100px" height="100px"/></div>
		</div>
		
	</div>
</div>
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
		f.action="<%=cp%>/admin/giupcontroll/list";
		f.submit();
	}
	
	function modalAjax(url,listNum,mode) {
		$.ajax({
			type : "post",
			url : url,
			dataType : "json",
			success : function(data) {
				var dto=data.dto;
				
				$("#cur_giupName").val(dto.g1_name);
				$("#cur_giupId").val(dto.g1_id);
				$("#cur_giupCatCode").val(dto.cat_code);
				$("#cur_giupCreated").val(dto.g1_created);
				$("#cur_giupAddr1").val(dto.g3_addr2);
				$("#cur_giupAddr2").val(dto.g3_addr3);
				$("#cur_giupAdTerm").val(dto.giupAd_Term);
				
				
				$("#cur_giupSleep").val(dto.g1_sleep);
				$("#cur_giupEnabled").val(dto.g1_enabled);
				if (dto.giupAd_State == 0)
					$("#cur_giupAdNum").val("일반");
				if (dto.giupAd_State >= 1)
					$("#cur_giupAdNum").val("광고");
				
				//현재 보고있는 글의 listNum
				$("#cur_listNum").val(listNum);
				
				if(mode=="article"){
					$(".giup_arti_input").attr( 'readonly', true ).css('background','#eeeeee');
					$(".giup_arti_select").attr('disabled', true ); 

				} else if (mode=="update") {
					$(".text_write").attr( 'readonly', false ).css('background', '#ffffff');
					$(".giup_arti_select").attr('disabled', false ).css('background', '#ffffff');
				}
			},
			error : function(e) {
				console.log(e);
			}
		});
	}

	//td 클릭했을때 해당 번호로 들어가기
	$(function() {
		$("#giup_list").children().click(function() {
			var giupNum=$(this).find("td:first").text();
			
			//input hidden 리스트 넘버 받아오기
			var listNum=$(this).next().val();

			var url = $('#articleUrl').val() + '&num=' + giupNum;
			
			var mode="article";
			modalAjax(url,listNum,mode);
		});
	});
	
	$(function() {
		$('#article_right').click(function() {
			var nextGiupListNum=Number($("#cur_listNum").val())-1;
			var inputhidden = $("#giup_list input:hidden");
			var url, nextNum;
			var mode="article";
			
			for(var i=0; i<10; i++){
				if(nextGiupListNum==$(inputhidden[i]).val()){
					nextNum = $(inputhidden[i]).prev().children(":first").text();
					url=$('#articleUrl').val() + '&num=' + nextNum;
					
					modalAjax(url,nextGiupListNum,mode);
				}
			}
		});
		
		$('#article_left').click(function() {
			var prevGiupListNum=Number($("#cur_listNum").val())+1;
			var inputhidden = $("#giup_list input:hidden");
			var url, prevNum;
			var mode="article";
			
			for(var i=0; i<10; i++){
				if(prevGiupListNum==$(inputhidden[i]).val()){
					prevNum = $(inputhidden[i]).prev().children(":first").text();
					url=$('#articleUrl').val() + '&num=' + prevNum;
					modalAjax(url,prevGiupListNum,mode);
				}
			}
		});
		
		$('#article_update').click(function() {
			var giupListNum=Number($("#cur_listNum").val());
			var inputhidden = $("#giup_list input:hidden");
			var url, listNum;
			var mode="update";
			
			for(var i=0; i<10; i++){
				if(giupListNum==$(inputhidden[i]).val()){
					listNum = $(inputhidden[i]).prev().children(":first").text();
					url=$('#articleUrl').val() + '&num=' + listNum;
					modalAjax(url,giupListNum,mode);
				}
			}
		});
	});
	
	
</script>

<input type="hidden" id="articleUrl" name="articleUrl" value="${articleUrl}">
<input type="hidden" id="dataCount" name="dataCount" value="${dataCount}">

<div class="adminBodyFrame2">
	<div class="body-title">
		<h3>
			<span class="glyphicon glyphicon-tower"></span> 업체정보관리
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
					<tr  style="cursor: pointer" data-toggle="modal" data-target="#myModal"> 
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
					<span class="giup_arti_sp">광고상태 </span><input class="giup_arti_input" type="text" id="cur_giupAdNum" value="">
					<!-- <select name="cur_giupAdNum" id="cur_giupAdNum" class="giup_arti_input giup_arti_select">
						<option value="1000">광고</option>
						<option value="0">일반</option>
					</select> -->
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
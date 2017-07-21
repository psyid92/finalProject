<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style type="text/css">
.bbs-article .table {
    margin-top: 15px;
}
.bbs-article .table thead tr, .bbs-article .table tbody tr {
    height: 30px;
}
.bbs-article .table thead tr th, .bbs-article .table tbody tr td {
    font-weight: normal;
    border-top: none;
    border-bottom: none;
}
.bbs-article .table thead tr {
    border-top: #d5d5d5 solid 1px;
    border-bottom: #dfdfdf solid 1px;
} 
.bbs-article .table tbody tr {
    border-bottom: #dfdfdf solid 1px;
}
.bbs-article .table i {
    background: #424951;
    display: inline-block;
    margin: 0 7px 0 7px;
    position: relative;
    top: 2px;
    width: 1px;
    height: 13px;    
}

.bbs-reply {
    font-family: NanumGothic, 나눔고딕, "Malgun Gothic", "맑은 고딕", 돋움, sans-serif;
}

.bbs-reply-write {
    border: #d5d5d5 solid 1px;
    padding: 10px;
    min-height: 50px;
}

li{
  width: 20%;  
  text-align: center;
  font-weight: 100;
  
}

</style>

<script type="text/javascript">

function deleteBoard() {
<c:if test="${sessionScope.member.userId==userId}">
  var bbs_Num = "${dto.bbs_Num}";
  var page = "${page}";
  var query = "bbs_Num="+bbs_Num+"&page="+page;
  var url = "<%=cp%>/userBbs/delete?" + query;

  if(confirm("위 자료를 삭제 하시 겠습니까 ? "))
  	location.href=url;
</c:if>  

<c:if test="${sessionScope.member.userId!=userId}">
  alert("게시물을 삭제할 수  없습니다.");
</c:if>
}

function updateBoard() {
<c:if test="${sessionScope.member.userId==userId}">
  var bbs_Num = "${dto.bbs_Num}";
  var page = "${page}";
  var query = "bbs_Num="+bbs_Num+"&page="+page;
  var url = "<%=cp%>/userBbs/update?" + query;

  location.href=url;
</c:if>

<c:if test="${sessionScope.member.userId!=userId}">
 alert("게시물을 수정할 수  없습니다.");
</c:if>
}
</script>

<script type="text/javascript">
//게시물 공감 개수
function countUserBbsLike(bbs_Num) {
	var url="<%=cp%>/userBbs/countUserBbsLike";
	$.post(url, {bbs_Num:bbs_Num}, function(data){
		var count=data.countUserBbsLike;
		
		$("#countUserBbsLike").html(count);
	}, "json");
}

// 게시물 공감 추가
function sendLikeBoard(bbs_Num) {
	var uid="${sessionScope.member.userId}";
	if(! uid) {
		login();
		return;
	}

	msg="게시물에 공감하십니까 ?";
	if(! confirm(msg))
		return;
	
	var query="bbs_Num="+bbs_Num;

	$.ajax({
		type:"post"
		,url:"<%=cp%>/userBbs/insertUserBbsLike"
		,data:query
		,dataType:"json"
		,success:function(data) {
			var state=data.state;
			if(state=="true") {
				countUserBbsLike(bbs_Num);
			} else if(state=="false") {
				alert("좋아요는 한번만 가능합니다. !!!");
			} else if(state=="loginFail") {
				login();
			}
		}
		,error:function(e) {
			console.log(e.responseText);
		}
	});
}

//-------------------------------------
// 댓글
function login() {
	location.href="<%=cp%>/member/login";
}

// 댓글 리스트
$(function(){
	listPage(1);
});

function listPage(page) {
	var url="<%=cp%>/userBbs/listUserReply";
	var bbs_Num="${dto.bbs_Num}";
	$.post(url, {bbs_Num:bbs_Num, pageNo:page}, function(data){
		$("#listUserReply").html(data);
	});
}

// 댓글 추가
function sendReply() {
	var uid="${sessionScope.member.userId}";
	if(! uid) {
		login();
		return false;
	}

	var bbs_Num="${dto.bbs_Num}"; // 해당 게시물 번호
	var rep_Content=$.trim($("#rep_Content").val());
	if(! rep_Content ) {
		alert("내용을 입력하세요 !!! ");
		$("#rep_Content").focus();
		return false;
	}
	
	var query="bbs_Num="+bbs_Num;
	query+="&rep_Content="+encodeURIComponent(rep_Content);
	query+="&rep_Answer=0";
	
	$.ajax({
		type:"post"
		,url:"<%=cp%>/userBbs/createdReply"
		,data:query
		,dataType:"json"
		,success:function(data) {
			$("#rep_Content").val("");
			
			var state=data.state;
			if(state=="true") {
				listPage(1);
			} else if(state=="false") {
				alert("댓글을 등록하지 못했습니다. !!!");
			} else if(state=="loginFail") {
				login();
			}
		}
		,error:function(e) {
			console.log(e.responseText);
		}
	});
}

// 댓글 삭제
function deleteReply(rep_Num, page) {
	var uid="${sessionScope.member.userId}";
	if(! uid) {
		login();
		return false;
	}
	
	if(confirm("게시물을 삭제하시겠습니까 ? ")) {	
		var url="<%=cp%>/userBbs/deleteReply";
		$.post(url, {rep_Num:rep_Num, mode:"reply"}, function(data){
		        var state=data.state;

				if(state=="loginFail") {
					login();
				} else {
					listPage(page);
				}
		}, "json");
	}
}

// 댓글별 답글 리스트
function listUserReplyAnswer(rep_Answer) {
	var listUserReplyAnswer="#listUserReplyAnswer"+rep_Answer;
	var url="<%=cp%>/userBbs/listUserReplyAnswer";
	$.post(url, {rep_Answer:rep_Answer}, function(data){
		$(listUserReplyAnswer).html(data);
	});
}

// 답글 버튼(댓글별 답글 등록폼 및 답글리스트)
function replyAnswerLayout(rep_Num) {
	var id="#replyAnswerLayout"+rep_Num;
	var rep_Content="#rep_Content"+rep_Num;
	var answerGlyphiconId="#answerGlyphicon"+rep_Num;
	
	if($(id).is(':hidden')) {
		$("[id*=replyAnswerLayout]").hide();
		
		$("[id*=answerGlyphicon]").each(function(){
			$(this).removeClass("glyphicon-triangle-top");
			$(this).addClass("glyphicon-triangle-bottom");
		});
		
		listUserReplyAnswer(rep_Num);
		replyCountAnswer(rep_Num);
		
		$(id).show();
		$(answerGlyphiconId).removeClass("glyphicon-triangle-bottom");
		$(answerGlyphiconId).addClass("glyphicon-triangle-top");
	}  else {
		$(id).hide();
		$(answerGlyphiconId).removeClass("glyphicon-triangle-top");
		$(answerGlyphiconId).addClass("glyphicon-triangle-bottom");
	}
}

// 댓글별 답글 등록
function sendReplyAnswer(bbs_num, rep_Num) {
	var uid="${sessionScope.member.userId}";
	if(! uid) {
		login();
		return false;
	}
	
	var rta="#rep_Content"+rep_Num;
	var rep_Content=$.trim($(rta).val());
	if(! rep_Content ) {
		alert("내용을 입력하세요 !!!\n");
		$(rta).focus();
		return false;
	}
	
	var query="bbs_Num="+bbs_Num;
	query+="&rep_Content="+encodeURIComponent(rep_Content);
	query+="&rep_Answer="+rep_Num;
	
	$.ajax({
		type:"post"
		,url:"<%=cp%>/userBbs/createdReply"
		,data:query
		,dataType:"json"
		,success:function(data) {
			$(rta).val("");
			
  			var state=data.state;
			if(state=="true") {
				listUserReplyAnswer(rep_Num);
				replyCountAnswer(rep_Num);
			} else if(state=="false") {
				alert("답글을 등록하지 못했습니다. !!!");
			} else if(state=="loginFail") {
				login();
			}
		}
		,error:function(e) {
			console.log(e.responseText);
		}
	});
}

//댓글별 답글 갯수
function replyCountAnswer(rep_Answer) {
	var url="<%=cp%>/bbs/replyCountAnswer";
	$.post(url, {rep_Answer:rep_Answer}, function(data){
		var count="("+data.count+")";
		var answerCountId="#answerCount"+rep_Answer;
		var answerGlyphiconId="#answerGlyphicon"+rep_Answer;
		
		$(answerCountId).html(count);
		$(answerGlyphiconId).removeClass("glyphicon-triangle-bottom");
		$(answerGlyphiconId).addClass("glyphicon-triangle-top");
	}, "json");
}

// 댓글별 답글 삭제
function deleteReplyAnswer(rep_Num, rep_Answer) {
	var uid="${sessionScope.member.userId==userId}";
	if(! uid) {
		login();
		return false;
	}
	
	if(confirm("게시물을 삭제하시겠습니까 ? ")) {	
		var url="<%=cp%>/userBbs/deleteReply";
		$.post(url, {rep_Num:rep_Num, mode:"rep_Answer"}, function(data){
		        var state=data.state;
				if(state=="loginFail") {
					login();
				} else {
					listUserReplyAnswer(rep_Answer);
					replyCountAnswer(rep_Answer);
				}
		}, "json");
	}
}

//탭 스트립트
$('#myTab a').click(function (e) {
  e.preventDefault()
  $(this).tab('show')
})
	
$('#myTab a[href="#profile"]').tab('show') // Select tab by name
$('#myTab a:first').tab('show') // Select first tab
$('#myTab a:last').tab('show') // Select last tab
$('#myTab li:eq(2) a').tab('show') // Select third tab (0-indexed)



</script>
<div role="tabpanel" >

  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist" style="margin-top: 50px;">
    <li role="presentation"><a href="<%=cp%>/notice/list" aria-controls="notice" role="tab" data-toggle="tab">공지사항</a></li>
    <li role="presentation"><a href="<%=cp%>/userEvent/list" aria-controls="userEvent" role="tab" data-toggle="tab">이벤트</a></li>
    <li role="presentation"><a href="<%=cp%>/userFap/list" aria-controls="userFaq" role="tab" data-toggle="tab">자주찾는 질문</a></li>
    <li role="presentation"><a href="<%=cp%>/userQna/list" aria-controls="userQna" role="tab" data-toggle="tab">그것이 알고싶다</a></li>
    <li role="presentation" class="active"><a href="<%=cp%>/userBbs/list" aria-controls="userBbs" role="tab" data-toggle="tab">우리끼리소담소담</a></li>
  </ul>
</div>

<!-- 마크업 -->
<div class="tab-content">
 <div role="tabpanel" class="tab-pane active" id="userBbs">

  <div class="bodyFrame2">
     <div class="body-title">
          <h3><span class="glyphicon glyphicon-pencil"></span> 우리끼리 소담소담 </h3>
     </div>
    
    <div class="alert alert-info">
        <i class="glyphicon glyphicon-info-sign"></i> 우리끼리 자유롭게 이야기 해요!
    </div>
    
    <div class="table-responsive" style="clear: both; height:1200px; overflow: none;">
        <div class="bbs-article">
            <table class="table">
                 <thead>
                     <tr>
                         <th colspan="2" style="text-align: center;">
                                ${dto.bbs_Subject}
                         </th>
                     </tr>
                <thead>
                 <tbody>
                     <tr>
                         <td style="text-align: left;">
                             이름 : ${dto.m1_nickname}/ 이메일: ${dto.m1_Email}
                         </td>
                         <td style="text-align: right;">
                          ${dto.bbs_Created}<i></i>조회 ${dto.bbs_Count}
                         </td>
                     </tr>
                     <tr style="border-bottom:none;">
                         <td colspan="2" style="height: 170px;">
                              ${dto.bbs_Content}
                         </td>
                     </tr>
                     <tr>
                         <td colspan="2" style="height: 40px; padding-bottom: 15px; text-align: center;">
                              <button type="button" class="btn btn-default btn-sm wbtn" style="background: white; width: 43px;" onclick="sendLikeBoard('${dto.bbs_Num}')"><span class="glyphicon glyphicon-heart-empty"></span> <span id="countUserBbsLike">${countUserBbsLike}</span></button>
                         </td>
                     </tr>
                     <tr>
                         <td colspan="2">
                              <span style="display: inline-block; min-width: 45px;">첨부</span> :
                              <c:if test="${not empty dto.bbs_SaveFilename}">
                                  <a href="<%=cp%>/userBbs/download?bbs_Num=${dto.bbs_Num}"><span class="glyphicon glyphicon-download-alt"></span> ${dto.bbs_OriginalFilename}</a>
                              </c:if>
                         </td>
                     </tr>
                     <tr>
                         <td colspan="2">
                              <span style="display: inline-block; min-width: 45px;">이전글</span> :
                              <c:if test="${not empty preReadDto }">
                                  <a href="<%=cp%>/userBbs/article?${query}&bbs_Num=${preReadDto.bbs_Num}">${preReadDto.bbs_Subject}</a>
                              </c:if>					
                         </td>
                     </tr>
                     <tr>
                         <td colspan="2" style="border-bottom: #d5d5d5 solid 1px;">
                              <span style="display: inline-block; min-width: 45px;">다음글</span> :
                              <c:if test="${not empty nextReadDto }">
                                  <a href="<%=cp%>/userBbs/article?${query}&bbs_Num=${nextReadDto.bbs_Num}">${nextReadDto.bbs_Subject}</a>
                              </c:if>
                         </td>
                     </tr>                                          
                </tbody>
                <tfoot>
                	<tr>
                		<td>
<c:if test="${sessionScope.member.userId==userId}">
                		    <button type="button" class="btn btn-default btn-sm wbtn" onclick="updateBoard();">수정</button>
</c:if>
<c:if test="${sessionScope.member.userId==userId}">	                		    
                		    <button type="button" class="btn btn-default btn-sm wbtn" onclick="deleteBoard();">삭제</button>
</c:if>                		    
                		</td>
                		<td align="right">
                		    <button type="button" class="btn btn-default btn-sm wbtn" style="width: 50px;" onclick="javascript:location.href='<%=cp%>/userBbs/list?${query}';"> 목록으로 </button>
                		</td>
                	</tr>
                </tfoot>
            </table>
       </div>
       
       <div class="bbs-reply">
           <div class="bbs-reply-write">
               <div style="clear: both;">
           	       <div style="float: left;"><span style="font-weight: bold;">댓글쓰기</span><span> - 타인을 비방하거나 개인정보를 유출하는 글의 게시를 삼가 주세요.</span></div>
           	       <div style="float: right; text-align: right;"></div>
               </div>
               <div style="clear: both; padding-top: 10px;">
                   <textarea id="rep_Content" class="form-control" rows="3"></textarea>
               </div>
               <div style="text-align: right; padding-top: 10px;">
                   <button type="button" class="btn btn-primary btn-sm" onclick="sendReply();"> 댓글등록 <span class="glyphicon glyphicon-ok"></span></button>
               </div>           
           </div>
            
            <div id="listUserReply"></div>
           
       </div>
    </div>

  </div>
 </div>
</div>  
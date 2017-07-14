<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<script>
$(function(){
	listReply(1);	
});
<%--  function listPage(page){
	var url="<%=cp%>/store/review/reviewlistAll";
	$.post(url, {pageNo:page,kasdlfjasdja:asdfasl}, function(data){
		printReply(data); 
	},"json");
} --%>
 function listReply(page){
	var url = "<%=cp%>/store/reivew/reviewlistAll";
	$.ajax({
		type:"post"
		,url:url
		,data:{pageNo:page,g1_Num:${sessionScope.store.g1_Num}}
		,dataType:"json"
		,success:function(data){
			printReply(data) 
		}
		,error:function(e){
			console.log(e.responseText);
		}
	});
} 
function sendReply(){
	var gid="${sessionScope.store.g1_Name}";
	
	var content=$.trim($("#content").val());
	
	var query="content="+encodeURIComponent(content); //특수문자도 입력가능하게 인코딩
	
	$.ajax({
		type:"post"
		,url:"<%=cp%>/store/insertReviewReply"
		,data:query
		,dataType:"json"
		,success:function(data){
			printReply(data);
			$("#content").val("");
		}
		,beforeSend:check
		,error:function(e){
			console.log(e.responseText);
		}
	});
}

function check(){
	if(! $.trim($("#content").val()) ) {
		$("#content").focus();
		return false;
	}
	return true;
}


function printReply(data){
	var total_page=data.total_page;
	var dataCount=data.dataCount;
	var pageNo=data.pageNo;
	var paging=data.paging;
	
	var s = "";
	s += " <div style='clear: both; padding-top: 20px;'>";
	s += "	<span style='color: black; font-weight:bold;'>전체 리뷰 "+dataCount+"개</span>";
	s += "	<span>[목록, "+pageNo+"/"+total_page+" 페이지]</span>";
	s += " </div>";
	s += " <div style='float: right; text-align: right;'></div>";
	s += " </div>";
	if(dataCount!=0){
		s += " <div class='table-responsive' style='clear: both; padding-top: 5px;'>";
		s += "  <table class='table'>";
		for( var i=0; i<data.reviewlistAll.length; i++){
			var rep_Star = data.reviewlistAll[i].rep_Star;
			var rep_Content = data.reviewlistAll[i].rep_Content;
			var rep_Created = data.reviewlistAll[i].rep_Created;
			var m1_Nickname = data.reviewlistAll[i].m1_Nickname;
			var rrep_Created = data.reviewlistAll[i].rrep_Created;
			var rrep_Content = data.reviewlistAll[i].rrep_Content;
			var g1_Name = data.reviewlistAll[i].g1_Name;
			
			s += "["+rep_Star+","+rep_Content+","+rep_Created+","+m1_Nickname+",";
			s +=  rrep_Created+","+rrep_Content+","+g1_Name+"]";
			s += "<br>"

			
		}
		s += "  </table>";
		s += " </div>"
	}
	$("#reviewlist").html(s); 
}

</script>
<div class="storeReviewControll">
    <div class="body-title">
          <h3><span class="glyphicon glyphicon-tower"></span> 리뷰관리하기 </h3>
    </div>
    
    <div>
        <ul class="nav nav-tabs nav-justified">
  			<li role="presentation" class="active"><a href="<%=cp%>/store/review">전체 리뷰 보기</a></li>
  			<li role="presentation" ><a href="<%=cp%>/store/review/reviewYet">미답변 리뷰</a></li>
 			<li role="presentation" ><a href="<%=cp%>/store/review/reviewTalk">사장님 한마디</a></li>
		</ul>
		${sessionScope.store.g1_Name} <br>
		${sessionScope.store.g1_Num}
		<textarea id="content" class="form-control" rows="3" required="required"></textarea>
		<button type="button" onclick="sendReply();">등록하기</button>
		<div id="reviewlist"></div>
		<div style="float: left;">
		rkrkrkrkrk<br>
		2000-10-10 09:09:01
		</div> 
		<div style="float: left; margin-left: 50px;">
			<div>
			 	별별별별별&nbsp;&nbsp;닉네임<br>
		 		음식맛은 더럽게 맛있구만!
		 	</div>
		 	<div> 
		 	ㄴ
		 	<div style="float: right;">
		 		사장님&nbsp;&nbsp;2019-09-01 19:02:00<br>
		 		삐리리리리리
	 		</div>
		 	</div>
		</div>
    </div>
</div>
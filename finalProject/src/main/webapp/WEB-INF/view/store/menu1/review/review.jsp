<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<script>
$(function(){
	listPage(1);
});

 function listPage(page){
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
		for( var i=0; i<data.reviewlistAll.length; i++){
			var rep_Num = data.reviewlistAll[i].rep_Num;
			var rep_Star = data.reviewlistAll[i].rep_Star;
			var rep_Content = data.reviewlistAll[i].rep_Content;
			var rep_Created = data.reviewlistAll[i].rep_Created;
			var m1_Nickname = data.reviewlistAll[i].m1_Nickname;
			var g1_Name = data.reviewlistAll[i].g1_Name;
			
			s += " <div class='table-responsive' style='clear: both; padding-top: 5px;'>";
			s += "  <table class='table'>";
			s += " <div style='float: left;'>"+rep_Created+"<br>"+g1_Name+"</div>";
			s += " <div style='float: left; margin-left: 50px; width: 500px;'>";
			s += "	<div>"+rep_Star+"&nbsp;&nbsp;"+m1_Nickname+"<br>"+rep_Content+"</div>";
			s += "  <div>ㄴ" 
			s += " 	<div id='reviewreply"+rep_Num+"'>";
			s += " 	</div>";
			s += "  </div>";
			s += "  <textarea id='content"+rep_Num+"' name= 'content"+rep_Num+"' class='form-control' rows='3' required='required' style='resize: none;'></textarea> ";
			s += "  <button type='button' onclick='sendReply("+rep_Num+","+pageNo+");'>등록하기</button>";
			s += "</div>";
			s += " <br>";
			reviewReplyList(rep_Num);
		} 
		s +="    <tr style='height: 30px;'>";
		s +="      <td colspan='2' style='text-align: center;'>";
		s += 	"<div  id='page'>"+paging+"</div>";
		s +="      </td>";
		s +="    </tr>";
		s += "  </table>"; 
		s += " </div>"
		   
	}
	$("#reviewlist").html(s); 
}
function reviewReplyList(rep_Num){
	var url = "<%=cp%>/store/review/reviewReplyList";
	var g1_Num = ${sessionScope.store.g1_Num};
	$.ajax({ 
		type:"post"
		,url:url
		,data:{rep_Num:rep_Num}
		,dataType:"json"
		,success:function(data){
			var list = data.reviewReplyList;
			var s = "";
			for(var i=0; i<list.length; i++){
				s += "<div id='rreply"+list[i].rrep_Num+"'> ";
				s += " 	<div>";
				s += " 	사장님&nbsp;&nbsp;"+list[i].rrep_Created+"<br>"+list[i].rrep_Content;
				s += "<button type='button' onclick='deleteReply("+list[i].rrep_Num+", 1 ,"+g1_Num+")'>삭제</button>";
				s += "</div>";
				s += "</div>";
			}
			$("#reviewreply"+rep_Num).html(s);
		}
		,error:function(e){
			console.log(e.responseText);
		}
	}); 
}

function sendReply(rep_Num,pageNo){
	var g1_Num = ${sessionScope.store.g1_Num};
	var content = $("#content"+rep_Num).val();
	if(!content){
		$("#content"+rep_Num).focus();
		return;
	}
	var g1_Num="${sessionScope.store.g1_Num}"
	
	content=$.trim($("#content"+rep_Num).val());
	
	//var content=encodeURIComponent(content); 
	 
	$.ajax({
		type:"post"
		,url:"<%=cp%>/store/review/insertReviewReply"
		,data:{rrep_Content:content, g1_Num:g1_Num, rep_Num:rep_Num}
		,dataType:"json"
		,success:function(data){
			var state = data.state;
			var list = data.reviewReplyList;
			
			if(state=="false"){
				alert("추가하지 못했습니다.");
				return;
			}
			$("#content"+rep_Num).val("");
			var s = "";
			for(var i=0; i<list.length; i++){
				s += "<div id='rreply"+list[i].rrep_Num+"'> ";
				s += " 	<div>";
				s += " 	사장님&nbsp;&nbsp;"+list[i].rrep_Created+"<br>"+list[i].rrep_Content;
				s += "<button type='button' onclick='deleteReply("+list[i].rrep_Num+","+pageNo+","+g1_Num+")'>삭제</button>";
				s += "</div>";
				s += "</div>";
			}
			$("#reviewreply"+rep_Num).html(s);
		}
		,error:function(e){ 
			console.log(e.responseText);
		}
	});
} 
function deleteReply(rrep_Num, pageNo, g1_Num){
	if(confirm("게시물을 삭제하시겠습니까?")){
		var url = "<%=cp%>/store/review/deleteReply";
		$.ajax({
			type:"post"
			,url:url
			,data:{rrep_Num:rrep_Num, pageNo:pageNo, g1_Num:g1_Num}
			,dataType:"json"
			,success:function(data){
				printReply(data);
			}
			,error:function(e){
				console.log(e.responseText);
			}
		});
	}
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
		<!-- <textarea id="content" class="form-control" rows="3" required="required" style="resize: none;"></textarea>
		<button type="button" onclick="sendReply();">등록하기</button> -->
		<div id="reviewlist"></div>
		<!-- <div style="float: left;">
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
		</div> -->
    </div>
</div>
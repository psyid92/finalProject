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
	var url = "<%=cp%>/store/review/reviewlistAll";
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
	s += " <div style='clear: both; padding-top: 20px; float:right;'>";
	s += "	<span style='color: black; font-weight:bold;'>전체 리뷰 "+dataCount+"개</span>";
	s += "	<span>[목록, "+pageNo+"/"+total_page+" 페이지]</span>";
	s += " </div>";
	s += " </div>";
	if(dataCount!=0){
		for( var i=0; i<data.reviewlistAll.length; i++){
			var rep_Num = data.reviewlistAll[i].rep_Num;
			var rep_Star = data.reviewlistAll[i].rep_Star;
			var rep_Content = data.reviewlistAll[i].rep_Content;
			var rep_Created = data.reviewlistAll[i].rep_Created;
			var m1_Nickname = data.reviewlistAll[i].m1_Nickname;
			var g1_Name = data.reviewlistAll[i].g1_Name;
			var rphoto_Savefilename = data.reviewlistAll[i].rphoto_Savefilename;
			var star ="";
			
			s += " <div class='table-responsive' style='clear: both;'>";
			s += "  <table class='table'>";
			s += " <hr style='margin-top:5px; margin-bottom:10px;'>"
			for(a=0; a<rep_Star; a++){
				star += "★";
			}
			for(b=rep_Star; b<5; b++){
				star += "☆";
			}
			
			s += " <div class='table-responsive' style='clear: both;'>";
			s += " <div style='float: left;'><span>"+rep_Created+"</span><br><span style='color:gray; font-size:10px;'>"+g1_Name+"</span></div>";
			s += " <div style='float: left; margin-left: 50px; width: 500px;'>";
			s += "	<div style='font-size:20px;'><span style='color:#3DB7CC;'>"+star+"</span>";
			s += "&nbsp;&nbsp;<span style='font-weight:bold;'>"+m1_Nickname+"</span><br><span style='font-weight:100;'>"+rep_Content+"</span>";
			if(rphoto_Savefilename != null){
				s += "<br><img src='<%=cp%>/uploads/photo/"+rphoto_Savefilename+"'></div>";
			}
			else{
				s+= "</div>";
			}
			s += "  <div>" 
			s += " 	<div id='reviewreply"+rep_Num+"'>";
			s += " 	</div>";
			s += "  </div>";
			s += "  <textarea id='content"+rep_Num+"' name= 'content"+rep_Num+"' class='form-control' rows='3' required='required' style='resize: none; margin-top: 15px;'></textarea> ";
			s += "  <button type='button' onclick='sendReply("+rep_Num+","+pageNo+");' class='btn btn-primary' style='float:right; margin-top:10px; margin-bottom:10px;'>답변 남기기 <span class='glyphicon glyphicon-ok'></span></button>";
			s += "</div>";
			s += " <br>";
			
			reviewReplyList(rep_Num, pageNo);
		} 
		s +="      </div>";
		s +="    </div>";
		s += " </div>"
		s +="    <div style='height: 30px;'>";
		s +="      <div colspan='2' style='text-align: center;'>";
		s += 	"<div  id='page'>"+paging+"</div>";
		   
	}
	$("#reviewlist").html(s); 
}
 
function reviewReplyList(rep_Num, pageNo){
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
				s += "<div id='rreply"+list[i].rrep_Num+"' style='margin-top:10px; margin-bottom:5px;'> ";
				s += " 	<div>";
				s += " <span style='font-weight:bold; font-size:15px;'>사장님</span>&nbsp;&nbsp;<span style='font-size:13px;'>"+list[i].rrep_Created+"</span><button type='button' class='btn btn-danger' onclick='deleteReply("+list[i].rrep_Num+","+pageNo+" ,"+g1_Num+")'style='float:right;'><span class='glyphicon glyphicon-remove'></span></button>";
				s += "<br><span>"+list[i].rrep_Content+"</span>";
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
				s += "<div id='rreply"+list[i].rrep_Num+"' style='margin-top:10px; margin-bottom:5px;'> ";
				s += " 	<div>";
				s += " <span style='font-weight:bold; font-size:15px;'>사장님</span>&nbsp;&nbsp;<span style='font-size:13px;'>"+list[i].rrep_Created+"</span><button type='button' class='btn btn-danger' onclick='deleteReply("+list[i].rrep_Num+","+pageNo+" ,"+g1_Num+")'style='float:right;'><span class='glyphicon glyphicon-remove'></span></button>";
				s += "<br><span>"+list[i].rrep_Content+"</span>";
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
	if(confirm("답변을 삭제하시겠습니까?")){
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
          <h3><span class="glyphicon glyphicon-pencil"></span> 전체 리뷰 </h3>
    </div>
    
    <div>
        <ul class="nav nav-tabs nav-justified">
  			<li role="presentation" ><a href="<%=cp%>/store/review/reviewYet">미답변 리뷰</a></li>
  			<li role="presentation" class="active"><a>전체 리뷰 보기</a></li>
		</ul>
		<div id="reviewlist"></div>
    </div>
</div>
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
	var url = "<%=cp%>/store/review/reviewlistYet";
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
	if(dataCount == 0 ){
		s += "<div>";
		s += "<span> 답변을 남기지 않은 리뷰가 없습니다</span>"
		s += "</div>";
	}else{
	s += " <div style='clear: both; padding-top: 20px; float:right;'>";
	s += "	<span style='color: black; font-weight:bold;'>미답변 리뷰 "+dataCount+"개</span>";
	s += "	<span>[목록, "+pageNo+"/"+total_page+" 페이지]</span>";
	s += " </div>";
	s += " </div>";
	if(dataCount!=0){
		for( var i=0; i<data.reviewlistYet.length; i++){
			var rep_Num = data.reviewlistYet[i].rep_Num;
			var rep_Star = data.reviewlistYet[i].rep_Star;
			var rep_Content = data.reviewlistYet[i].rep_Content;
			var rep_Created = data.reviewlistYet[i].rep_Created;
			var m1_Nickname = data.reviewlistYet[i].m1_Nickname;
			var g1_Name = data.reviewlistYet[i].g1_Name;
			var star ="";
			
			for(a=0; a<rep_Star; a++){
				star += "★";
			}
			for(b=rep_Star; b<5; b++){
				star += "☆";
			}
			s += " <div class='table-responsive' style='clear: both;'>";
			s += " <hr style='margin-top:5px; margin-bottom:10px;'>" 
			s += " 		<div style='float: left;'><span>"+rep_Created+"</span><br><span style='color:gray; font-size:10px;'>"+g1_Name+"</span></div>";
			s += " 		<div style='float: left; margin-left: 50px; width: 500px;'>";
			s += "			<div style='font-size:20px;'><span style='color:#3DB7CC;'>"+star+"</span>";
			s += "    		&nbsp;&nbsp;<span style='font-weight:bold;'>"+m1_Nickname+"</span><br><span style='font-weight:100;'>"+rep_Content+"</span></div>";
			s += "  	<div>" 
			s += " 			<div id='reviewreply"+rep_Num+"'>";
			s += " 		</div>";
			s += "  </div>";
			s += "  <textarea id='content"+rep_Num+"' name= 'content"+rep_Num+"' class='form-control' rows='3' required='required' style='resize: none; margin-top: 15px;'></textarea> ";
			s += "  <button type='button' onclick='sendReply("+rep_Num+","+pageNo+");' class='btn btn-primary' style='float:right; margin-top:10px; margin-bottom:10px;'>답변 남기기 <span class='glyphicon glyphicon-ok'></span></button>";
			s += "</div>";
			s += " <br>";
		} 
		s +="      </div>";
		s +="    </div>";
		s += " </div>"
		s +="    <div style='height: 30px;'>";
		s +="      <div colspan='2' style='text-align: center;'>";
		s += 	"<div  id='page'>"+paging+"</div>";
		   
	}
	}
	$("#reviewlist").html(s); 
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
				listPage(pageNo);
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
<div class="storeBodyFrame2">
    <div class="body-title">
          <h3><span class="glyphicon glyphicon-pencil"></span>미답변 리뷰</h3>
    </div>
    
    <div>
        <ul class="nav nav-tabs nav-justified">
  			<li role="presentation" class="active"><a>미답변 리뷰</a></li>
  			<li role="presentation"><a href="<%=cp%>/store/review">전체 리뷰 보기</a></li>
		</ul>
		<div id="reviewlist"></div>  
    </div>
</div>
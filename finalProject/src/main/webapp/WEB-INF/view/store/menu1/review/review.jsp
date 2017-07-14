<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<script>
function insertReply(){
	var gid="${sessionScope.store.g1_Name}"
}


var url = "<%=cp%>/store/reivew/reviewlistAll";
var query = "rrep_Num="+rrep_Num;
$.ajax({
	type:"post"
	,url:url
	,data:query
	,dataType:"json"
	,success:function(data){
		layout()
	}
	,error:function(e){
		console.log(e.responseText);
	}
});
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
		<div style="width: 680px; margin: 0;" > 
		<c:forEach var="reviewDto" items="${reviewlistAll}">
			<div>
			 ${reviewDto.rep_Num}<br>
			  ${reviewDto.rep_Star}<br>
			   ${reviewDto.rep_Content}<br>
			    ${reviewDto.rep_Created}<br>
			     ${reviewDto.m1_Num}<br>
			      ${reviewDto.rep_Num}<br>
			       ${reviewDto.g1_Num}<br>
			        ${reviewDto.jumun_Num}<br>
			         ${reviewDto.rphoto_Savefilename}<br>
			   ${reviewDto.rrep_Num}<br>
			   ${reviewDto.rrep_Content}<br>
			   ${reviewDto.rrep_Created}<br>
			</div>
		</c:forEach>
		</div>
		<textarea id="g2_Memo" name="g2_Memo" rows="5px" cols="20px" style="resize:none; margin-left: 0px; margin-right: 0px; width: 95%;"></textarea>
		<button	></button>
		<div id="reviewlist"></div>
		
		
		
		
    </div>
</div>
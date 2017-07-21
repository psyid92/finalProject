<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
   String cp = request.getContextPath();
%>

<link rel="stylesheet" href="<%=cp%>/resource/bootstrap/css/bootstrap.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/resource/bootstrap/css/bootstrap-theme.min.css" type="text/css"/>
<link rel="stylesheet" type="text/css" href="<%=cp%>/resource/bootswatch/bootstrap.css">

<link rel="stylesheet" href="<%=cp%>/resource/jquery/css/smoothness/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/resource/bootswatch/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="<%=cp%>/resource/css/css.css">
<style type="text/css">
@font-face {
	font-family: 'ice';
	src: url('<%=cp%>/resource/fonts/ice.ttf');
}

body {
	font-family: ice;
	font-size: 20px;
}
</style>
<style type="text/css">

body{
 width: 100%
}



.table th, .table td {
    font-weight: normal;
    border-top: none;
}
.table thead tr th{
     border-bottom: none;
} 
.table thead tr{
    border: #d5d5d5 solid 1px;
     background: #eeeeee; color: #787878;
} 
.table td {
    border-bottom: #d5d5d5 solid 1px;
}
.table td a{
    color: #000;
}

li{
  
  width: 200px;  
  text-align: center;
  font-weight: 100;
  
}

</style>

<script type="text/javascript">





var category="${category}";
var searchValue="${searchValue}";

$(function(){
	var page="${pageNo}";
	if(page=="") page="0";
	
	$('a[data-toggle="tab"]').each(function(){
		var c=$(this).attr("aria-controls");
		
		if(category==c) {	
			$(this).parent().addClass("active");
			$("#tabContent"+c).addClass("active");
		} else {
			$(this).parent().removeClass("active");
		}
	});
	
	listPage(page);
});

// 탭을 선택 한 경우
$(function(){
	$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
		
		category=$(this).attr("aria-controls");
		searchValue="";
		$("#searchValue").val("");
		
		$("[id^=tabContent]").each(function(){
			$(this).html(""); // 전체를 출력하는 부분과 카테고리별 출력하는부분의 id가 같으므로 기존 정보 지움
		});
		
		listPage(1);
	});	
});

function listPage(page) {
	
    var url="<%=cp%>/userFaq/list";

	var query="pageNo="+page+"&category="+category+"&searchValue="+searchValue+"&mode=faqlist";

	$.ajax({
		type:"post"
		,url:url
		,data:query
		,success:function(data) {
			console.log(data);
			var id="#tabContent"+category;
			$(id).html(data);
		}
	    ,error:function(e) {
	    	console.log(e.responseText);
	    }
	});

}

function searchList() {
	searchValue=$("#searchValue").val();
	listPage(1);
}


</script>




<!-- 마크업 -->
<div style="margin: 50px auto 0; width: 1000px;  ">

  <!-- Nav tabs -->
  <ul class="nav nav-tabs" >
    <li ><a href="<%=cp%>/notice/list" >공지사항</a></li>
    <li><a href="<%=cp%>/userEvent/list" >이벤트</a></li>
    <li  class="active"><a href="<%=cp%>/userFaq/faq" >자주찾는 질문</a></li>
    <li ><a href="<%=cp%>/userQna/created" >그것이 알고싶다</a></li>
    <li ><a href="<%=cp%>/userBbs/list" >우리끼리소담소담</a></li>
    
  </ul>
</div>


  <!-- Tab panes -->
<div  style="margin 	: 50px auto 0; width: 1000px; ">
  <div id="userFaq">
    
    <div class="bodyFrame2">
    <div class="body-title">
          <h3><span class="glyphicon glyphicon-tasks"></span> 자주찾는 질문 </h3>
    </div>
           
    <div class="alert alert-info">
        <i class="glyphicon glyphicon-saved"></i> 회원님들께서 많이 궁금해하는 질문을 정리해보았습니다. 자세한 문의는 1대1문의를 해주세요
    </div>
 
        <div>
	    <div role="tabpanel">
			  <ul class="nav nav-tabs" role="tablist">
			      <li role="presentation" class="active"><a href="#tabContent0" aria-controls="0" role="tab" data-toggle="tab">전체</a></li>
		          <c:forEach var="dto" items="${listUserFaqCategory}">
			          <li role="presentation"><a href="#tabContent${dto.ca_Num}" aria-controls="${dto.ca_Num}" role="tab" data-toggle="tab">${dto.ca_class}</a></li>
			      </c:forEach>
			  </ul>
			
			  <div class="tab-content" style="padding: 5px; margin-top: 15px;">
			      <div role="tabpanel" class="tab-pane active" id="tabContent0"></div>
			      <c:forEach var="dto" items="${listUserFaqCategory}">
			          <div role="tabpanel" class="tab-pane" id="tabContent${dto.ca_Num}"></div>
			      </c:forEach>
			  </div>
	    </div>
        
        <div style="clear: both; margin-top: 20px;">
        		<div style="float: left; width: 20%; min-width: 85px;">&nbsp;</div>
        		<div style="float: left; width: 60%; text-align: center;">
        		     <form name="searchForm" method="post" class="form-inline">
        		         <div class="input-group col-xs-6">
        		             <input type="text" name="searchValue" id="searchValue" class="form-control input-sm input-search" placeholder="검색 단어">
        		             <span class="input-group-btn" >
          		                 <button type="button" class="btn btn-info btn-sm btn-search" onclick="searchList();"><i class="glyphicon glyphicon-search"></i> 검색 </button>
        		             </span>
        		         </div>
        		     </form>
        		</div>
        </div>
    </div>
    </div>
  </div>
</div>

<script type="text/javascript" src="<%=cp%>/resource/bootstrap/js/bootstrap.min.js"></script>
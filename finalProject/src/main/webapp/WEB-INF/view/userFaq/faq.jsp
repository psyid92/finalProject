<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style type="text/css">
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
  width: 20%;  
  text-align: center;
  font-weight: 100;
  
}

</style>

<script type="text/javascript">




//탭 스트립트
$('#myTab a').click(function (e) {
  e.preventDefault()
  $(this).tab('show')
})
	
$('#myTab a[href="#profile"]').tab('show') // Select tab by name
$('#myTab a:first').tab('show') // Select first tab
$('#myTab a:last').tab('show') // Select last tab
$('#myTab li:eq(2) a').tab('show') // Select third tab (0-indexed)

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

	var query="pageNo="+page+"&category="+category+"&searchValue="+searchValue;
	$.ajax({
		type:"post"
		,url:url
		,data:query
		,success:function(data) {
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
<div role="tabpanel">

  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist" style="margin-top: 50px;">
    <li role="presentation"><a href="<%=cp%>/notice/list" aria-controls="notice" role="tab" data-toggle="tab">공지사항</a></li>
    <li role="presentation"><a href="<%=cp%>/userEvent/list" aria-controls="userEvent" role="tab" data-toggle="tab">이벤트</a></li>
    <li role="presentation" class="active"><a href="<%=cp%>/userFaq/faq" aria-controls="userFaq" role="tab" data-toggle="tab">자주찾는 질문</a></li>
    <li role="presentation"><a href="<%=cp%>/userQna/created" aria-controls="userQna" role="tab" data-toggle="tab">그것이 알고싶다</a></li>
    <li role="presentation"><a href="<%=cp%>/userBbs/list" aria-controls="userBbs" role="tab" data-toggle="tab">우리끼리소담소담</a></li>
    
  </ul>
</div>


  <!-- Tab panes -->
<div class="tab-content">
  <div role="tabpanel" class="tab-pane active" id="userFaq">
    
    <div class="bodyFrame2" style="margin-top: 50px;">
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
		          <c:forEach var="dto" items="">
			          <li role="presentation"><a href="#tabContent${dto.categoryNum}" aria-controls="${dto.categoryNum}" role="tab" data-toggle="tab">${dto.classify}</a></li>
			      </c:forEach>
			  </ul>
			
			  <div class="tab-content" style="padding: 5px; margin-top: 15px;">
			      <div role="tabpanel" class="tab-pane active" id="tabContent0"></div>
			      <c:forEach var="dto" items="${listFaqCategory}">
			          <div role="tabpanel" class="tab-pane" id="tabContent${dto.categoryNum}"></div>
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
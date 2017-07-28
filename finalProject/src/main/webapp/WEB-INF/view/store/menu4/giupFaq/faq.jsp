<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   request.setCharacterEncoding("utf-8");
   String cp = request.getContextPath();
%>

<style type="text/css">

</style>


<script type="text/javascript">
var fCate_Num="${fCate_Num}";
var searchValue="${searchValue}";

//탭을 선택할 경우>> css인듯.. 
$(function() {  
	var page="${pageNo}";
	if(page=="") page="0";
	
	$('a[data-toggle="tab"]').each(function(){  // a태그 data-toggle property의 값이 tab인 것을 선택~~ 
		var c=$(this).attr("aria-controls");
		
		if(fCate_Num==c) {
			$(this).parent().addClass("active"); // active로 상태값 변경 (on과 같음)
			$("#tabContent"+c).addClass("active");
		} else {
			$(this).parent().removeClass("active");
		}
	});
	
	listPage(page);
});

//탭을 선택한 경우 
$(function(){
	$('a[data-toggle="tab"]').on('shown.bs.tab', function(e){
		fCate_Num=$(this).attr("aria-controls");   // aria-controls속성의 fCate_Num을 가져올 것

		searchValue="";		 //???
		$("#searchValue").val(""); // (다른 탭시...) searchValue가 ""이도록 처리 
		
		$("[id^=tabContent]").each(function(){
			$(this).html(""); // 전체를 출력하는 부분과 카테고리별 출력하는부분의 id가 같으므로 기존 정보 지움
		});
		
		listPage(1);   // listPage를 실행함. 
	});
}); 

function listPage(page) {
	var url="<%=cp%>/giupFaq/list";
	
	var query="pageNo="+page+"&fCate_Num="+fCate_Num+"&searchValue="+searchValue;

	$.ajax({
		type:"post"
		, url:url
		, data:query
		, success: function(data) {
			var id="#tabContent"+fCate_Num;
			$(id).html(data);
		}
		, error: function(e) {
			console.log(e.responseText);
		}
	});	
}

function searchList() {
	searchValue=$("#searchValue").val();
	listPage(1);
	
}


</script>


<div class="bodyFrame2">
	<div class="body-title">
		<h3><span class="glyphicon glyphicon-search"></span> FAQ-자주하는 질문 </h3>
	</div>
	
	<div class="alert alert-info">
		<i class="glyphicon glyphicon-info-sign"></i> 궁금한 사항을 확인하세요
	</div>
	
	<div>
		<div role="tabpanel">
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"> <a href="#tabContent0" aria-controls="0" role="tab" data-toggle ="tab">전체</a> </li>
			<c:forEach var="dto" items="${listedFCate}">
				<li role="presentation"> <a href="#tabContent${dto.fCate_Num}" aria-controls="${dto.fCate_Num}" role="tab" data-toggle ="tab">${dto.fCate_Name}</a></li>
			</c:forEach>
			</ul>
			<div class="tab-content" style="padding: 5px; margin-top: 15px; "> 
				<div role="tabpanel" class="tab-pane active" id="tabContent0"> </div>
			<c:forEach var="dto" items="${listedFCate}">
				<div role="tabpanel" class="tab-pane" id="tabContent${dto.fCate_Num}"></div>
			</c:forEach>		
			</div>
		
		</div>
		
		<div style="clear: both; margin-top: 20px;">
			<div style="float: left; width: 20%; min-width: 85px;">&nbsp;</div>
			<div style="float: left; width: 60%; text-align: center;">
				<form name="searchForm" method="post" class="form-inline">
					<div class="input-group col-xs-6">
						<input type="text" name="searchValue" id="searchValue" class="form-control input-sm input-searc" placeholder="검색단어">
						<span class="input-group-btn">
							<button type="button" class="form-control input-sm input-searc" onclick="searchList()"><i class="glyphicon glyphicon-search"></i>검색</button>
					
						</span>
					</div>				
				</form>			
			</div>
			<div style="float: left; width: 20%; min-width: 85px; text-align: right;">
		<c:if test="${sessionScope.store.g1_Id == 'admin' }">	
				<button type="button" class="btn btn-primary btn-sm bbtn" onclick="javascript:location.href='<%=cp%>/giupFaq/created' "><span class="glyphicon glyphicon glyphicon-pencil"></span>등록하기</button>
		</c:if>	
			</div>
		</div>
	
	</div>

</div>
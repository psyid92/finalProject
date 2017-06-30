<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style type="text/css">


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


</script>


<div role="tabpanel">

  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li role="presentation"><a href="<%=cp%>/notice/list" aria-controls="notice" role="tab" data-toggle="tab">공지사항</a></li>
    <li role="presentation"><a href="<%=cp%>/userEvent/list" aria-controls="userEvent" role="tab" data-toggle="tab">이벤트</a></li>
    <li role="presentation" class="active"><a href="<%=cp%>/userFap/list" aria-controls="userFaq" role="tab" data-toggle="tab">자주찾는 질문</a></li>
    <li role="presentation"><a href="<%=cp%>/userQna/list" aria-controls="userQna" role="tab" data-toggle="tab">1대1 문의</a></li>
    <li role="presentation"><a href="<%=cp%>/userBbs/list" aria-controls="userBbs" role="tab" data-toggle="tab">우리끼리소담소담</a></li>
  
  </ul>
</div>

<!-- 마크업 -->
	<div class="tab-content" >
	   <div role="tabpanel" class="tab-pane active" id="userFaq">
	    <div class="bodyFrame2">
	    <div class="body-title">
	          <h3><span class="glyphicon glyphicon-exclamation-sign"></span> 자주하는 질문 </h3>
	    </div>
	    
	    <div class="alert alert-info">
	        <i class="glyphicon glyphicon-info-sign"></i> 궁금한 문의 사항을 확인 해 보세요.
	    </div>
	
	    <div>
		    <div role="tabpanel">
				  <ul class="nav nav-tabs" role="tablist">
				      <li role="presentation" class="active"><a href="#tabContent0" aria-controls="0" role="tab" data-toggle="tab">전체</a></li>
			          <c:forEach var="dto" items="">
				          <li role="presentation"><a href="#tabContent" aria-controls="" role="tab" data-toggle="tab"></a></li>
				      </c:forEach>
				  </ul>
				
				  <div class="tab-content" style="padding: 5px; margin-top: 15px;">
				      <div role="tabpanel" class="tab-pane active" id="tabContent0"></div>
				      <c:forEach var="dto" items="">
				          <div role="tabpanel" class="tab-pane" id=""></div>
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
	          		                 <button type="button" class="btn btn-info btn-sm btn-search" onclick="#"><i class="glyphicon glyphicon-search"></i> 검색 </button>
	        		             </span>
	        		         </div>
	        		     </form>
	        		</div>
	        	
	        </div>
	    </div>
	    
	</div>
	    </div>
	</div>    
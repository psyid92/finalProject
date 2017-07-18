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


</script>


<div role="tabpanel">

  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist" style="margin-top: 50px;">
    <li role="presentation"><a href="<%=cp%>/notice/list" aria-controls="notice" role="tab" data-toggle="tab">공지사항</a></li>
    <li role="presentation" class="active"><a href="<%=cp%>/userEvent/list" aria-controls="userEvent" role="tab" data-toggle="tab">이벤트</a></li>
    <li role="presentation"><a href="<%=cp%>/userFaq/faq" aria-controls="userFaq" role="tab" data-toggle="tab">자주찾는 질문</a></li>
    <li role="presentation"><a href="<%=cp%>/userQna/created" aria-controls="userQna" role="tab" data-toggle="tab">1대1 문의</a></li>
    <li role="presentation"><a href="<%=cp%>/userBbs/list" aria-controls="userBbs" role="tab" data-toggle="tab">우리끼리소담소담</a></li>
  </ul>
</div>

<!-- 마크업 -->
<div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="userEvent">
      <div class="bodyFrame2">
    <div class="body-title">
          <h3><span class="glyphicon glyphicon-tasks"></span> 이벤트 </h3>
    </div>
    
    <div class="alert alert-info">
        <i class="glyphicon glyphicon-info-sign"></i> 이벤트 날짜를 확인하고 참여하세요!! 대박이 뻥뻥!!!!
    </div>
     
    
    </div>
    </div>
</div>    
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style type="text/css">

</style>

<script type="text/javascript">


//탭 스트립트
$('#myTab a').click(function (e) {
	  e.preventDefault()
	  $(this).tab('show')
	})
	
$('#myTab a[href="#profile"]').tab('show') 
$('#myTab a:first').tab('show') 
$('#myTab a:last').tab('show') 
$('#myTab li:eq(2) a').tab('show') 

</script>

<!-- 마크업 -->
<div role="tabpanel">

  <!-- Nav tabs -->
  <ul class="nav nav-tabs">
    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">공지사항</a></li>
    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">이벤트</a></li>
    <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">자주 찾는 질문</a></li>
    <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">1대1 문의</a></li>
  </ul>
</div>


<script>
  $(function () {
    $('#myTab a:last').tab('show')
  })
</script>

<table class="table table-striped">
  <!-- On rows -->
<tr class="active"></tr>
<tr class="success"></tr>
<tr class="warning"></tr>
<tr class="danger"></tr>
<tr class="info"></tr>

<!-- On cells (`td` or `th`) -->
<tr>
  <td class="active">...</td>
  <td class="success">...</td>
  <td class="warning">...</td>
  <td class="danger">...</td>
  <td class="info">...</td>
</tr>
</table>


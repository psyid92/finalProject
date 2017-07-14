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

function searchList(){
	var f=document.searchForm;
	f.action="<%=cp%>/userQna/list";
	f.submit();
}


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
    <li role="presentation"><a href="<%=cp%>/userEvent/list" aria-controls="userEvent" role="tab" data-toggle="tab">이벤트</a></li>
    <li role="presentation"><a href="<%=cp%>/userFaq/main" aria-controls="userFaq" role="tab" data-toggle="tab">자주찾는 질문</a></li>
    <li role="presentation" class="active"><a href="<%=cp%>/userQna/list" aria-controls="userQna" role="tab" data-toggle="tab">그것이 알고싶다</a></li>
    <li role="presentation"><a href="<%=cp%>/userBbs/list" aria-controls="userBbs" role="tab" data-toggle="tab">우리끼리소담소담</a></li>
  </ul>
</div>

<!-- 마크업 -->
<div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="userQna">
     <div class="bodyFrame2">
    <div class="body-title">
          <h3><span class="glyphicon glyphicon-bullhorn"></span> 그것이 알고싶다 </h3>
    </div>
    
    <div class="alert alert-info">
        <i class="glyphicon glyphicon-info-sign"></i> 그런데 말입니다?? 1대1문의!!!
    </div>
<c:if test="${dataCount !=0}">
     <div style="clear: both; height: 30px; line-height: 30px;">
        <div style="float: left;">${dataCount}개(${page}/${total_page}페이지)</div>
      </div>
    <div class="table-responsive" style="clear: both;"   >
      <table class="table">
         <thead>
           <tr>
             <th class="text-center" style="width: 70px;">번호</th>
             <th >제목</th>
             <th class="text-center" style="width: 100px;">글쓴이</th>
             <th class="text-center" style="width: 100px;">날짜</th>
             <th class="text-center" style="width: 70px;">첨부</th>
           </tr>
         </thead> 
         <tbody>
         <c:forEach var="dto" items="${list}">   
           <tr>
             <td class="text-center">${dto.listNum}</td>
             <td><a href="${articleUrl}&uq_Num=${dto.uq_Num}">${dto.uq_Title}</a></td>
             <td class="text-center" style="width: 130px;">${dto.m1_nickname}</td>
             <td class="text-center" style="width: 140px;">${dto.uq_Created}</td>
             <td class="text-center">
               <c:if test="${not empty dto.uq_SaveFilename}">
                 <a href="<%=cp%>/userQna/download?uq_Num=${dto.uq_Num}"><img src="<%=cp%>/resource/images/disk.gif" border="0" style="margin-top: 1px;"></a>
               </c:if>
             </td>
           </tr>   
         </c:forEach>
         </tbody>
      </table>
    </div>
</c:if>    
    
     <div class="paging" style="text-align: center; min-height: 50px; line-height: 50px;">
         <c:if test="${dataCount==0 }">
           등록된 문의가 없습니다.
       </c:if>
       <c:if test="${dataCount!=0 }">
           ${paging}
       </c:if>
     </div>  
     
     <div style="clear: both;">
        <div style="float: left; width: 20%; min-width: 85px;">
          <button type="button" class="btn btn-default btn-sm wbtn" style="width: 55px;" onclick="javascript:location.href='<%=cp%>/userQna/list';">새로고침</button>
        </div>
        <div style="float: left; width: 60%; text-align: center;">
          <form name="searchForm" method="post" class="form-inline">
			<select class="form-control input-sm" name="searchKey" >
				<option value="uq_Title">제목</option>
				<option value="userId">작성자</option>
				<option value="uq_Content">내용</option>
				<option value="uq_Created">등록일</option>
			</select>
			<input type="text" class="form-control input-sm input-search" name="searchValue">
			<button type="button" class="btn btn-info btn-sm btn-search" onclick="searchList();"><span class="glyphicon glyphicon-search"></span> 검색</button>
          </form>
        </div>
        <div style="float: left; width: 20%; min-width: 85px; text-align: right;">
        		    <button type="button" class="btn btn-primary btn-sm bbtn" onclick="javascript:location.href='<%=cp%>/userQna/created';"><span class="glyphicon glyphicon glyphicon-pencil"></span> 글쓰기</button>
        </div>
     
     </div>
    </div>
    </div>
</div>    
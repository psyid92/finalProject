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
	f.action="<%=cp%>/notice/list";
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

<!-- 마크업 -->
<div role="tabpanel">

  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active"><a href="<%=cp%>/notice/list" aria-controls="notice" role="tab" data-toggle="tab">공지사항</a></li>
    <li role="presentation"><a href="<%=cp%>/userEvent/list" aria-controls="userEvent" role="tab" data-toggle="tab">이벤트</a></li>
    <li role="presentation"><a href="<%=cp%>/userFap/list" aria-controls="userFaq" role="tab" data-toggle="tab">자주찾는 질문</a></li>
    <li role="presentation"><a href="<%=cp%>/userQna/created" aria-controls="userQna" role="tab" data-toggle="tab">1대1 문의</a></li>
    <li role="presentation"><a href="<%=cp%>/userBbs/list" aria-controls="userBbs" role="tab" data-toggle="tab">우리끼리소담소담</a></li>
    
  </ul>
</div>


  <!-- Tab panes -->
<div class="tab-content">
  <div role="tabpanel" class="tab-pane active" id="notice">
    
    <div class="bodyFrame2">
    <div class="body-title">
          <h3><span class="glyphicon glyphicon-tasks"></span> 공지사항 </h3>
    </div>
    
    <div class="alert alert-info">
        <i class="glyphicon glyphicon-info-sign"></i> 중요한 일정 및 알림 등은 공지사항 통해 고객님께 알려 드립니다.
    </div>
<c:if test="${dataCount!=0}">   
      <div style="clear: both; height: 30px; line-height: 30px;">
        <div style="float: left;">${dataCount}개(${page}/${total_page}페이지)</div>
        <div style="float: right;">/&nbsp;</div>
      </div>
    <div class="table-responsive" style="clear: both;">
      <table class="table">
         <thead>
           <tr>
             <th class="text-center" style="width: 70px;">번호</th>
             <th >제목</th>
             <th class="text-center" style="width: 100px;">글쓴이</th>
             <th class="text-center" style="width: 100px;">날짜</th>
             <th class="text-center" style="width: 70px;">조회수</th>
           </tr>
         </thead> 
         <tbody>
         <c:forEach var="dto" items="${noticeList}">
           <tr>
             <td class="text-center"><span style="display: inline-block;width: 28px;height:18px;line-height:18px; background: #ED4C00;color: #FFFFFF">공지</span></td>
             <td><a href="${articleUrl}&noti_Num=${dto.noti_Num}">${dto.noti_Title}</a></td>
             <td class="text-center">관리자</td>
             <td class="text-center">${dto.noti_Created}</td>
             <td class="text-center">${dto.noti_Count}</td>
           </tr>   
         </c:forEach>
         <c:forEach var="dto" items="${list}">
            <tr>
             <td class="text-center">${dto.listNum}</td>
             <td>
                <a href="${articleUrl}&noti_Num=${dto.noti_Num}">${dto.noti_Title}</a>
                <c:if test="${dto.gap < 1}">
                 <img src='<%=cp%>/resource/images/new.gif'>
                </c:if>
             </td>
             <td class="text-center">관리자</td>
             <td class="text-center">${dto.noti_Created}</td>
             <td class="text-center">${dto.noti_Count}</td>
            </tr>
           </c:forEach>
         </tbody>
      </table>
    </div>
</c:if>   
  
     <div class="paging" style="text-align: center; min-height: 50px; line-height: 50px;">
        <c:if test="${dataCount==0 }">
                  등록된 게시물이 없습니다.
        </c:if>
        <c:if test="${dataCount!=0 }">
         ${paging}
        </c:if>
     </div>  
     
     <div style="clear: both;">
        <div style="float: left; width: 20%; min-width: 85px;">
          <button type="button" class="btn btn-default btn-sm wbtn" onclick="javascript:location.href='<%=cp%>/notice/list';">새로고침</button>
        </div>
        <div style="float: left; width: 60%; text-align: center;">
          <form name="searchForm" method="post" class="form-inline">
			<select class="form-control input-sm" name="searchKey" >
				<option value="noti_Title">제목</option>
				<option value="noti_Content">내용</option>
				<option value="noti_Created">등록일</option>
			</select>
			<input type="text" class="form-control input-sm input-search" name="searchValue">
			<button type="button" class="btn btn-info btn-sm btn-search" onclick="searchList();"><span class="glyphicon glyphicon-search"></span> 검색</button>
          </form>
        </div>
       
     
     </div>
    </div>
   
  </div>
</div>
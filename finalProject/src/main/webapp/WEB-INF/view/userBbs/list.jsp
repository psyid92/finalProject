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



function searchList(){
	var f=document.searchForm;
	f.action="<%=cp%>/userBbs/list";
	f.submit();
}


</script>


<div role="tabpanel" >

  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist" style="margin-top: 50px;">
    <li role="presentation"><a href="<%=cp%>/notice/list" aria-controls="notice" role="tab" data-toggle="tab">공지사항</a></li>
    <li role="presentation"><a href="<%=cp%>/userEvent/list" aria-controls="userEvent" role="tab" data-toggle="tab">이벤트</a></li>
    <li role="presentation"><a href="<%=cp%>/userFaq/faq" aria-controls="userFaq" role="tab" data-toggle="tab">자주찾는 질문</a></li>
    <li role="presentation"><a href="<%=cp%>/userQna/list" aria-controls="userQna" role="tab" data-toggle="tab">그것이 알고싶다</a></li>
    <li role="presentation" class="active"><a href="<%=cp%>/userBbs/list" aria-controls="userBbs" role="tab" data-toggle="tab">우리끼리소담소담</a></li>
  </ul>
</div>

<!-- 마크업 -->
<div class="tab-content">
  <div role="tabpanel" class="tab-pane active" id="userBbs">
    
    <div class="bodyFrame2" style="margin-top: 50px;">
    <div class="body-title">
            <h3><span class="glyphicon glyphicon-pencil"></span> 우리끼리 소담소담 </h3>

    </div>
    
    <div class="alert alert-info">
        <i class="glyphicon glyphicon-info-sign"></i> 우리끼리 자유롭게 이야기 해요!
    </div>

    <div>
<c:if test="${dataCount!=0 }">
        <div style="clear: both; height: 30px; line-height: 30px;">
            <div style="float: left;">${dataCount}개(${page}/${total_page} 페이지)</div>
            <div style="float: right;">&nbsp;</div>
        </div>

        <div class="table-responsive" style="clear: both;"> <!-- 테이블 반응형 -->
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th class="text-center" style="width: 70px;">번호</th>
                        <th >제목</th>
                        <th class="text-center" style="width: 100px;">글쓴이</th>
                        <th class="text-center" style="width: 100px;">날짜</th>
                        <th class="text-center" style="width: 70px;">조회수</th>
                        <th class="text-center" style="width: 50px;">첨부</th>
                    </tr>
                </thead>
                <tbody>
    <c:forEach var="dto" items="${list}">
                    <tr>
                        <td class="text-center">${dto.listNum}</td>
                        <td><a href="${articleUrl}&bbs_Num=${dto.bbs_Num}">${dto.bbs_Subject}</a></td>
                        <td class="text-center" style="width: 140px;">${dto.m1_nickname}</td>
                        <td class="text-center" style="width: 140px;">${dto.bbs_Created}</td>
                        <td class="text-center">${dto.bbs_Count}</td>
                        <td class="text-center">
                            <c:if test="${not empty dto.bbs_SaveFilename}">
                                <a href="<%=cp%>/userBbs/download?bbs_Num=${dto.bbs_Num}"><img src="<%=cp%>/resource/img/www.jpg" border="0" style="margin-top: 1px;"></a>
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
                  등록된 게시물이 없습니다.
            </c:if>
            <c:if test="${dataCount!=0 }">
                ${paging}
            </c:if>
        </div>        
        
        <div style="clear: both;">
        		<div style="float: left; width: 20%; min-width: 85px;">
        		    <button type="button" class="btn btn-default btn-sm wbtn" style="width: 55px; height: 30px;"	 onclick="javascript:location.href='<%=cp%>/userBbs/list';">새로고침</button>
        		</div>
        		<div style="float: left; width: 60%; text-align: center;">
        		     <form name="searchForm" method="post" class="form-inline">
						  <select class="form-control input-sm" name="searchKey" >
						      <option value="bbs_Subject">제목</option>
						      <option value="m1_nickname">작성자</option>
						      <option value="bbs_Content">내용</option>
						      <option value="bbs_Created">등록일</option>
						  </select>
						  <input type="text" class="form-control input-sm input-search" name="searchValue">
						  <button type="button" class="btn btn-info btn-sm btn-search" onclick="searchList();"><span class="glyphicon glyphicon-search"></span> 검색</button>
        		     </form>
        		</div>
        		<div style="float: left; width: 20%; min-width: 85px; text-align: right;">
        		    <button type="button" class="btn btn-primary btn-sm bbtn" onclick="javascript:location.href='<%=cp%>/userBbs/created';"><span class="glyphicon glyphicon glyphicon-pencil"></span> 글쓰기</button>
        		</div>
        </div>
        
    </div>
    
</div>
   
  </div>
</div>
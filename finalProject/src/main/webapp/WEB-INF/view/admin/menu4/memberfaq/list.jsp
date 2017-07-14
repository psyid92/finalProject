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


</style>

<script type="text/javascript">

function searchList(){
	var f=document.searchForm;
	f.action="<%=cp%>/notice/list";
	f.submit();
}


</script>

<!-- 마크업 -->
  <!-- Tab panes -->
    
    <div class="bodyFrame2">
    <div class="body-title">
          <h3><span class="glyphicon glyphicon-tasks"></span> 자주찾는 질문 </h3>
    </div>
           
    <div class="alert alert-info">
        <i class="glyphicon glyphicon-saved"></i> 회원님들께서 많이 궁금해하는 질문을 정리해보았습니다. 자세한 문의는 1대1문의를 해주세요
    </div>
 
        <div style="float: left; width: 100%; text-align: center;">
          <form name="searchForm" method="post" class="form-inline">
			<select class="form-control input-sm" style="width: 15%;" name="searchKey" >
				<option value="#">질문유형</option>
				<option value="#">내용</option>
				<option value="#">제목</option>
			</select>
			<input type="text" class="form-control input-sm input-search" style="width: 40%;" name="searchValue">
			<button type="button" class="btn btn-info btn-sm btn-search" onclick="searchList();"><span class="glyphicon glyphicon-search"></span> 검색</button>
          </form>
        </div>
    
      <div style="clear: both; height: 30px; line-height: 30px;">
        <div style="float: left;">총 몇개(/페이지)</div>
      </div>
      
    <div class="table-responsive" style="clear: both;">
      <table class="table">
         <thead>
           <tr>
             <th class="text-center" style="width: 70px;">번호</th>
             <th class="text-center" style="width: 150px;">제목</th>
             <th class="text-center" style="width: 70px;">글쓴이</th>
             <th class="text-center" style="width: 50px;">질문유형</th>
             <th class="text-center" style="width: 50px;">조회수</th>
           </tr>
         </thead> 
         <tbody>
        
           <tr>
             <td class="text-center">번호</td>
             <td class="text-center"><a href="#">제목</a></td>
             <td class="text-center">관리자</td>
             <td class="text-center" style="width: 140px;">질문유형</td>
             <td class="text-center">조회수</td>
           </tr>   
         </tbody>
      </table>
      <div style="float: left; width: 20%; min-width: 85px; text-align: left;">   
        	 <button type="button" class="btn btn-primary btn-sm bbtn" onclick="javascript:location.href='<%=cp%>/auserfaq/created';"><span class="glyphicon glyphicon glyphicon-pencil"></span> 글쓰기</button>
      </div>
    </div>
    </div>

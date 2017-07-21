<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

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
    <div class="table-responsive" style="clear: both; border: 1px;"   >
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
                 <a href="<%=cp%>/userQna/download?uq_Num=${dto.uq_Num}"><img src="<%=cp%>/resource/img/www.jpg" border="0" style="margin-top: 1px;"></a>
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
          <button type="button" class="btn btn-default btn-sm wbtn" style="width: 70px;" onclick="javascript:location.href='<%=cp%>/userQna/list';">새로고침</button>
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
     </div>
    </div>

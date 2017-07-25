<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style type="text/css">
.bbs-article .table {
    margin-top: 15px;
}
.bbs-article .table thead tr, .bbs-article .table tbody tr {
    height: 30px;
}
.bbs-article .table thead tr th, .bbs-article .table tbody tr td {
    font-weight: normal;
    border-top: none;
    border-bottom: none;
}
.bbs-article .table thead tr {
    border-top: #d5d5d5 solid 1px;
    border-bottom: #dfdfdf solid 1px;
} 
.bbs-article .table tbody tr {
    border-bottom: #dfdfdf solid 1px;
}
.bbs-article .table i {
    background: #424951;
    display: inline-block;
    margin: 0 7px 0 7px;
    position: relative;
    top: 2px;
    width: 1px;
    height: 13px;    
}
</style>

<script type="text/javascript">
function deleteUserQna() {

  var uq_Num = "${dto.uq_Num}";
  var page = "${page}";
  var query = "uq_Num="+uq_Num+"&page="+page;
  var url = "<%=cp%>/userQna/delete?" + query;

  if(confirm("위 자료를 삭제 하시 겠습니까 ? "))
  	location.href=url;
}

</script>

<div class="adminBodyFrame2">
    <div class="body-title">
          <h3><span class="glyphicon glyphicon-book"></span> 1대1문의 </h3>
    </div>
    
    <div class="alert alert-info">
        <i class="glyphicon glyphicon-info-sign"></i> 회원의 해당 이메일로 답변을 해주세요
    </div>
    
    <div class="table-responsive" style="clear: both;">
        <div class="bbs-article">
            <table class="table">
                 <thead>
                     <tr>
                         <th colspan="2" style="text-align: center;">
                                ${dto.uq_Title}
                         </th>
                     </tr>
                <thead>
                
                 <tbody>
                     <tr>
                         <td style="text-align: left;">
                             이름 : ${dto.m1_nickname}
                         </td>
                         <td style="text-align: right;">
                          ${dto.uq_Created}<i>
                         </td>
                     </tr>
                     <tr>
                         <td colspan="2" style="height: 230px;">
                              ${dto.uq_Content}
                         </td>
                     </tr>

                     <tr>
                         <td colspan="2">
                              <span style="display: inline-block; min-width: 45px;">첨부</span> :
                              <c:if test="${not empty dto.uq_SaveFilename}">
                                  <a href="<%=cp%>/auserQna/download?uq_Num=${dto.uq_Num}"><span class="glyphicon glyphicon-download-alt"></span> ${dto.uq_OriginalFilename}</a>
                                  (<fmt:formatNumber value="${vo.fileSize/1024}" pattern="0.00"/> KByte)
                              </c:if>  
                         </td>
                     </tr>                   
                     <tr>
                         <td colspan="2">
                              <span style="display: inline-block; min-width: 45px;">이전글</span> :
                              <c:if test="${not empty preReadDto }">
                                  <a href="<%=cp%>/auserQna/article?${query}&uq_Num=${preReadDto.uq_Num}">${preReadDto.uq_Title}</a>
                              </c:if>					
                         </td>
                     </tr>
                     <tr>
                         <td colspan="2" style="border-bottom: #d5d5d5 solid 1px;">
                              <span style="display: inline-block; min-width: 45px;">다음글</span> :
                              <c:if test="${not empty nextReadDto }">
                                  <a href="<%=cp%>/auserQna/article?${query}&uq_Num=${nextReadDto.uq_Num}">${nextReadDto.uq_Title}</a>
                              </c:if>
                         </td>
                     </tr>                                          
                </tbody>
                
                <tfoot>
                	<tr>
                		<td>
                		    
                		    <button type="button" class="btn btn-default btn-sm wbtn" onclick="deleteUserQna();">삭제</button>                		    
                		</td>
                		<td align="right">
                		    <button type="button" class="btn btn-default btn-sm wbtn" onclick="javascript:location.href='<%=cp%>/auserQna/list?${query}';"> 목록으로 </button>
                		</td>
                	</tr>
                </tfoot>
            </table>
       </div>

   </div>

</div>
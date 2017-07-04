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

function deleteNotice(){
	var noti_Num="${dto.noti_Num}";
	var page="${page}";
	var query="noti_Num="+noti_Num+"&page="+page;
	var url="<%=cp%>/anotice/delete?"+query;
	
	if(confirm("삭제하시겠습니까?"))
		location.href=url;
}

function updateNotice(){
	var noti_Num="${dto.noti_Num}";
	var page="${page}";
	var query="noti_Num="+noti_Num+"&page="+page;
	var url="<%=cp%>/admin/membernotice/update?"+query;
	
	if(confirm("수정하시겠습니까?"))
		location.href=url;
}

</script>



  <div class="bodyFrame2">
    <div class="body-title">
          <h3><span class="glyphicon glyphicon-tasks"></span> 공지사항 </h3>
    </div>
    
    <div class="alert alert-info">
        <i class="glyphicon glyphicon-info-sign"></i> 중요한 일정 및 알림 등은 공지사항 통해 고객님께 알려 드립니다.
    </div>
    
    <div class="table-responsive" style="clear: both;">
        <div class="bbs-article">
            <table class="table">
                 <thead>
                     <tr>
                         <th colspan="2" style="text-align: center;">
                                ${dto.noti_Title}
                         </th>
                     </tr>
                <thead>
                
                 <tbody>
                     <tr>
                         <td style="text-align: left;">
                                                                     이름 : 관리자 
                         </td>
                         <td style="text-align: right;">
                          ${dto.noti_Created}<i></i>조회 ${dto.noti_Count}
                         </td>
                     </tr>
                     <tr>
                         <td colspan="2" style="height: 230px;">
                              ${dto.noti_Content}
                         </td>
                     </tr>

                     <tr>
                         <td colspan="2">
                              <span style="display: inline-block; min-width: 45px;">이전글</span> :
                              <c:if test="${not empty preReadDto}">
                                  <a href="<%=cp%>/notice/article?${query}&noti_Num=${preReadDto.noti_Num}">${preReadDto.noti_Title}</a>
                              </c:if>					
                         </td>
                     </tr>
                     <tr>
                         <td colspan="2" style="border-bottom: #d5d5d5 solid 1px;">
                              <span style="display: inline-block; min-width: 45px;">다음글</span> :
                              <c:if test="${not empty nextReadDto}">
                                  <a href="<%=cp%>/notice/article?${query}&noti_Num=${nextReadDto.noti_Num}">${nextReadDto.noti_Title}</a>
                              </c:if>		
                         </td>
                     </tr>    
                     <tr>
                		<td>
                		    <button type="button" class="btn btn-default btn-sm wbtn" onclick="updateNotice();">수정</button>
                		    <button type="button" class="btn btn-default btn-sm wbtn" onclick="deleteNotice();">삭제</button>
                		</td>
                		<td align="right">
                		    <button type="button" class="btn btn-default btn-sm wbtn" onclick="javascript:location.href='<%=cp%>/anotice/list?${query}';"> 목록으로 </button>
                		</td>
                	</tr>
              
                </tbody>
            </table>
       </div>

   </div>

  </div>

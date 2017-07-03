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

<div class="tab-content">
 <div role="tabpanel" class="tab-pane active" id="notice">


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
                                제목
                         </th>
                     </tr>
                <thead>
                
                 <tbody>
                     <tr>
                         <td style="text-align: left;">
                             이름 : 이름
                         </td>
                         <td style="text-align: right;">
                          날짜<i></i>조회 수
                         </td>
                     </tr>
                     <tr>
                         <td colspan="2" style="height: 230px;">
                              내용
                         </td>
                     </tr>
                     

                     <tr>
                         <td colspan="2">
                              <span style="display: inline-block; min-width: 45px;">첨부</span> :
                                  <a href="#"><span class="glyphicon glyphicon-download-alt"></span> 파일원제</a>
                                  (<fmt:formatNumber value="파일사이즈" pattern="0.00"/> KByte)
                         </td>
                     </tr>

                     
                     <tr>
                         <td colspan="2">
                              <span style="display: inline-block; min-width: 45px;">이전글</span> :
                              
                                  <a href="#">이전글</a>
                             					
                         </td>
                     </tr>
                     <tr>
                         <td colspan="2" style="border-bottom: #d5d5d5 solid 1px;">
                              <span style="display: inline-block; min-width: 45px;">다음글</span> :
                              
                                  <a href="#">다음들</a>
                             
                         </td>
                     </tr>                                          
                </tbody>
                
                <tfoot>
                	<tr>
                		<td>

                		    <button type="button" class="btn btn-default btn-sm wbtn" onclick="updateNotice();">수정</button>

               		    
                		    <button type="button" class="btn btn-default btn-sm wbtn" onclick="deleteNotice();">삭제</button>
                		    
                		</td>
                		<td align="right">
                		    <button type="button" class="btn btn-default btn-sm wbtn" onclick="javascript:location.href='<%=cp%>/notice/list?${query}';"> 목록으로 </button>
                		</td>
                	</tr>
                </tfoot>
            </table>
       </div>

   </div>

  </div>
 </div>
</div>
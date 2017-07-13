<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   request.setCharacterEncoding("utf-8");
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
function deleteNotice() {
<c:if test="${sessionScope.store.g1_Id=='admin'}">
	var num="${dto.noti_Num}";
	var page="${page}";
	var query ="noti_Num="+num+"&page="+page;
	var url = "<%=cp%>/giupNotice/delete?"+query;
	
	if(confirm("위 자료를 삭제하시겠습니까?"))
		location.href=url;
</c:if>

<c:if test="${sessionScope.store.g1_Id != 'admin'}">
	alert("삭제할 수 없습니다.");
</c:if>
}

function updateNotice() {
<c:if test="${sessionScope.store.g1_Id =='admin'}">
	var num = "${dto.noti_Num}";
	var page="${page}";
	var query= "noti_Num="+num+"&page="+page;
	var url ="<%=cp%>/giupNotice/update?"+query;
	
	location.href=url; 

</c:if>


<c:if test="${sessionScope.store.g1_Id !='admin'}">
	alert("게시물을 수정할 수 없어요");
</c:if>
}

</script>


<div class="bodyFrame2">
	<div class="body-title">
		<h3><span class="glyphicon glyphicon-book"></span>공지사항 </h3>
	</div>
	
	<div class="alert alert-info">
		<i class="glyphicon glyphicon-info-sign"></i>중요한 공지 및 알림 등을 알려드립니다.	
	</div>
	
	<div class="table-responsive" style="clear: both">
		<div class="bbs-article"> 
			<table class="table">
				<thead>
					<tr>
						<th colspan="2" style="text-align: center;">
							${dto.noti_Title}
						</th>
					</tr>				
				</thead>
			
				<tbody>
					<tr>
						<td style="text-align: left"> 이름 : ${dto.admin_Id} </td>
						<td style="text-align: right"> ${dto.noti_Created} | 조회  ${dto.noti_HItCount}</td>
					</tr>
					<tr>
						<td colspan="2" style="height: 230px"> ${dto.noti_Content}</td>
					</tr>	
<c:forEach var="vo" items="${listFile}">			
					<tr>
						<td colspan="2"> 
							<span style="display: inline-block; min-width: 45px">첨부</span>
							<a href="<%=cp%>/giupNotice/download?noti_FileNum=${vo.noti_FileNum}"> <span class="glyphicon glyphicon-download-alt"></span>${vo.noti_OrigianlFileName} </a>
							 (<fmt:formatNumber value="${vo.noti_FileSize/1024}" pattern="0.00" /> KByte)
						</td>
					</tr>
</c:forEach>							
					<tr>
						<td colspan="1">
							<span style="display: inline-block; min-width: 45px">이전글</span>
							<a href="<%=cp%>/giupNotice/article?${query}&noti_Num=${preReadDto.noti_Num}">${preReadDto.noti_Title}</a>
						</td>
						
						<td colspan="1" style="border-bottom: #d5d5d5 solid 1px; ">
							<span style="display: inline-block; min-width: 45px;">다음글</span>
							<a href="<%=cp%>/giupNotice/article?${query}&noti_Num=${nextReadDto.noti_Num}">${nextReadDto.noti_Title}</a>
						</td>
					
					</tr>		
				</tbody>
				
				<tfoot>
					<tr>
						<td>
<c:if test="${sessionScope.store.g1_Id =='admin' }">
							<button type="button" class="btn btn-default btn-sm wbtn" onclick="updateNotice();">수정</button>
</c:if>
<c:if test="${sessionScope.store.g1_Id =='admin' }">
							<button type="button" class="btn btn-default btn-sm wbtn" onclick="deleteNotice();">삭제</button>
</c:if>


						</td>
						<td align="right">
							<button type="button" class="btn btn-default btn-sm wbtn" onclick="javascript:location.href ='<%=cp%>/giupNotice/list?${query }';">목록으로</button>
						</td>
					
					</tr>
				
				</tfoot>			
			
			</table>	
		
		</div>	
	</div>
</div>  

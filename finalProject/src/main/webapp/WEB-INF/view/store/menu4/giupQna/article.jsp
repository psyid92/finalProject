<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
function deleteBoard() {
<c:if test="${sessionScope.store.g1_Num==dto.g1_Num ||sessionScope.store.g1_Id=='admin'}>
	var q_Num = "${dto.q_Num}";
	var page = "${page}";
	var query = "q_Num="+q_Num+"&page="+page;
	var url = "<%=cp%>/giupQna/delete?"+query;
</c:if>	
	if(confirm("자료를 삭제하시겠습니까?"))
		loacation.href = url; 
<c:if test="${sessionScope.store.g1_Num!=dto.g1_Num && sessionScope.store.g1_Id !='admin'}">
	alert("게시물을 삭제할 수 없습니다.");
</c:if>
}	

function updateBoard() {
<c:if test="${sessionScope.store.g1_Num == dto.g1_Num}">	
	var q_Num = "${dto.q_Num}";
	var page = "${page}";
	var query = "q_Num="+q_Num+"&page="+page;
	var url = "<%=cp%>/giupQna/update?"+query;
	
	location.href = url;
</c:if>

<c:if test ="${sessionScope.stor.g1_Num != dto.g1_Num}">
	alert("게시물을 수정할 수 없습니다.");
</c:if>
}

</script>

<div class="bodyFrame2">
	<div class="body-title">
		<h3><span class="glyphicon glyphicon-question-sign"></span> Q&amp;A</h3>
	</div>
	
	<div class="alert alert-info">
		<i class="glyphicon glyphicon-info-sign">Something to know about us, please leave your question here!</i>
	</div>
	
	<div class="table-responsive" style="clear: both">
		<div class="bbs-article">
			<table class="table">
				<thead>
					<tr>
						<th colspan="2" style="text-align: center">
							<c:if test="${dto.q_Depth !=0 }">
								[Re]
							</c:if>
							${dto.q_Title}
						</th>
					</tr>				
				</thead>
				<tbody>
					<tr>
						<td style="text-align: left"> 이름: ${dto.g1_Name}</td>
						<td style="text-align: right"> ${dto.q_Created} | ${dto.q_HitCount}</td>
					</tr>
					<tr>
						<td colspan="2" style="height: 230px;">
							${dto.q_Content}
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<span style="display: inline-block; min-width: 50px;">첨부</span> :
							<c:if test="${not empty dto.q_SaveFileName}">
								<a href="<%=cp%>/giupQna/download?q_Num=${dto.q_Num}">${dto.q_OriginalFileName}</a>
							</c:if>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<span style="display:inline-block; min-width: 45px;">이전글</span>
							<c:if test="${not empty preReadDto }">
								<a href="<%=cp%>/giupQna/article?${query}&q_Num=${preReadDto.q_Num}"> ${preReadDto.q_Title}</a>
							</c:if>
						</td>
					</tr>

					<tr>
						<td colspan="2" style="border-bottom: #d5d5d5 solid 1px;">
							<span style="display: inline-block; min-width: 45px">다음글</span>
							<c:if test="${not empty nextReadDto}">
								<a href="<%=cp%>/giupQna/article?${query}&q_Num=${nextReadDto.q_Num}"> ${nextReadDto.q_Title }</a>
							</c:if>
						</td>
					</tr>
				</tbody>
				
				<tfoot>
				 	<tr>
				 		<td>
				 			<button type="button" class="btn btn-default btn-sm wbtn" onclick="javascript:location.href='<%=cp%>/giupQna/reply?q_Num=${dto.q_Num}&page=${page}';">답변</button>
				 	<c:if test="${sessionScope.store.g1_Num==dto.g1_Num}">
				 			<button type="button" class="btn btn-default btn-sm wbtn" onclick="updateBoard();">수정</button>
				 	</c:if>
				 	<c:if test="${sessionScope.store.g1_Num==dto.g1_Num || sessionScope.store.g1_Id='admin'}">
				 			<button type="button" class="btn btn-default btn-sm wbtn" onclick="deleteBoard();">삭제</button>
				 	</c:if>
				 		</td>
				 		<td align="right">
				 			<button type="button" class="btn btn-default btn-sm wbt" onclick="javascript:location.href='<%=cp%>/giupQna/list?${query}';">목록으로</button>
				 		</td>
				 	
				 	</tr>
				
				</tfoot>
			
			</table>
		
		</div>
	</div>

</div>
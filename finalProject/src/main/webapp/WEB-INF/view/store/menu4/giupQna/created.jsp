<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   request.setCharacterEncoding("utf-8");
   String cp = request.getContextPath();
%>
<style type="text/css">
.bs-write table {
	width: 100%;
	border: 0;
	border-spacing: 0;
}

.table tbody tr td {
	border-top: none;
	font-weight: normal; 
	font-family: NanumGothic, 나눔고딕, "Malgun Gothic", "맑은 고딕", 돋움, sans-serif;
}

.bs-write table td{
	padding: 3px; 
}

.bs-write .td1 {
	min-width: 100px;
	min-height: 30px; 
	color: #666;
	vertical-align: middle;
}


</style>


<script type="text/javascript" src="<%=cp%>/resource/se/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
function check() {
	
}
</script>

<div class="bodyFrame2">
	<div class="body-title">
		<h3><span class="glyphicon glyphicon-question-sign"></span>Q&amp;A</h3>	
	</div>
	
	<div class="alert alert-info">
		<i class="glyphicon glyphicon-info-sign">Something to know about us, please leave your question here!</i>
	</div>
	
	<div>
		<form name="boardForm" method="post" onsubmit="return submitContents(this)">
			<div class="bs-write">
				<table class="table">
					<tbody>
						<tr>
							<td class="td1">작성자명</td>
							<td class="td2 col-md-5 col-sm-5">
								<p class="form-control-static"> ${sessionScope.store.g1_Name}</p>
							</td>
							<td class="td1" align="center"> </td>
							<td class="td2 col-md-5 col-sm-5">
						</tr>
						<tr>
							<td class="td1">제목</td>
							<td colspan="3" class="td3">
								<input type="text" name="q_Title" class="form-control input-sm" value="${dto.q_Title}" required="required">
							</td>
						</tr>
						
						<tr>
							<td class="td1" colspan="4" style="padding-bottom: 0px;">내용 </td>
						</tr>
						
						<tr>
							<td class="td4" colspan="4"> 
								<textarea id="q_Content" name="q_Content" class="form-control" rows="15" style="max-width: 99%;">${dto.content}</textarea>
							</td>
						</tr>
						<tr>
							<td class="td1">첨부 </td>
							<td colspan="3" class="td3"> 
								<input type="file" name="upload" class="form-control input-sm" style="height:35px; ">
							</td>
						</tr>	
					
					</tbody>
						
					<tfoot>
						<tr>
							<td colspan="4" style="text-align: center; padding-top: 15px;">
								<button type="submit" class="btn btn-primary">확인<span class="glyphicon glyphicon-ok"></span> </button>
								<button type="button" class="btn btn-danger" onclick="javascript:location.href='<%=cp%>/giupQna/list'">취소</button>
							
							<c:if test="">
								<input type="hidden" name="page" value="${page}">
								<input type="hidden" name="q_GroupNum" value="${dto.q_GroupNum}">
								<input type="hidden" name="q_OrderNo" value="${dto.q_OrderNo}">
								<input type="hidden" name="q_Depth" value="${dto.q_Depth}">
								<input type="hidden" name="q_Parent" value="${dto.q_Parent}">
								
							</c:if>
							<c:if test="">
								<input type="hidden" name="page" value="${page}">
								<input type="hidden" name="q_Num" value="${dto.q_Num}">
							</c:if>
							</td>
						</tr>
					</tfoot>				
				</table>			
			</div>		
		</form>
	</div>
</div>
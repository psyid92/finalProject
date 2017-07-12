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

.bs-write table td {
	padding: 3px;
}

.bs-write .td1 {
	min-width: 100px;
	min-height: 30px;
	color: #666;
	vertical-align: middle;
}

.bs-write .td2 {
}


.bs-write .td3 {
}

.bs-write .td4 {
}

</style>

<script type="text/javascript" src="<%=cp%>/resource/se/js/"> </script>



<div class="bodyFrame2">
	<div class="body-title">	
		<h3><span class="glyphicon glyphicon-book">공지사항</span></h3>
	</div>
	<div class="alert alert-info">
		<i class="glyphicon glyphicon-info-sign"></i>중요한 공지 및 알림 등을 알려드립니다.
	</div>
	
	<div>
		<form name="noticeForm" method="post" onsubmit="return submitContents(this);" enctype="multipart/form-data">
			<div class="bs-write">
				<table class="table">
					<tbody id="tb">
						<tr>
							<td class="td1">작성자명</td>
							<td class="td2 col-md-5 col-sm-5"> 
								<p class="form-control-static">${sessionScope.store.g1_Id}</p>
							</td>
							<td class="td1" align="center">공지여부</td>
							<td class="td2 col-md-5 col-sm-5"> 
								<div class="checkbox">
									<label>									
										<input type="checkbox" name="noti_Top" value="1" ${dto.noti_Top==1? "checked='checked' ":""}> 공지
									</label>								
								</div>
							</td>
							<td class="td1" align="center">노출여부</td>
							<td class="d2 col-md-5 col-sm-5">
								<div class="checkbox">
									<label>
										<input type="checkbox" name="noti_hidden" value="1" ${dto.noti_hidden==1? "checked='checked' ":""} >비노출
									</label>
								</div>
							</td>								
						</tr>
						
						<tr>
							<td class="td1">제목 </td>
							<td colspan="5" class="td3"> 
								<input type="text" name="noti_Title" class="form-control input-sm" value="${dto.noti_Title }" required="required">
							</td>
						</tr>
						<tr>
							<td class="td1" colspan="6" style="padding-bottom: 0px;">내용</td>
						</tr>
						<tr>
							<td colspan="6" class="td4">
								<textarea id="noti_Content" name="noti_Content" class="form-control" rows="15" style="max-width: 99%;">${dto.noti_Content }</textarea>
							</td>
						</tr>
						
						<tr>
							<td class="td1">첨부 </td>
							<td colspan="5" class="td3">
								<input type="file" name="upload" class="form-control input-sm" style="height: 35px;">
							</td>
						</tr>
					</tbody>
		<c:if test="${mode=='update'}">
			<c:forEach var="vo" items="${listFile}">			
						<tr id="f${vo.noti_FileNum}">
							<td class="td1">첨부파일 </td>
							<td colspan="5" class="td3">
								${vo.noti_OrigianlFileName }
								<a href="javascript:deleteFile('${vo.noti_FileNum}')">삭제</a>
							</td>
						</tr>
			</c:forEach>
		</c:if>		
					<tfoot>
						<tr>
							<td colspan="6" style="text-align: center; padding-top: 15px;">
								<button type="submit" class="btn btn-primary"> 확인 <span class="glyphicon glyphicon-ok"></span> </button>
								<button type="button" class="btn btn-danger" onclick="javascript:location.href='<%=cp%>/giupNotice/list';">취소</button>
							
						
							<c:if test="${mode=='update' }">
								<input type="hidden" name="page" value="${page}">
								<input type="hidden" name="noti_Num" value="${dto.noti_Num}">					
							</c:if>	
							</td>
						</tr>
					</tfoot>				
				</table>				
			</div>		
		</form>
	</div>
</div>


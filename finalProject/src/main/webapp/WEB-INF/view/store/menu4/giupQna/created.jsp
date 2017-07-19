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
	var f = document.qnaForm; 
	
	var str = f.q_Title.value;
	if(!str) {
		f.q_Title.focus();
		return false;
	}
	
	str = f.q_Content.value;
	if(!str || str=="<p>&nbsp;</p>") {
		f.q_Content.focus;
		return false;
	}
	
	var mode="${mode}";
	if(mode=="created")
		f.action="<%=cp%>/giupQna/created";
	else if(mode =="reply")
		f.action="<%=cp%>/giupQna/reply";
	else if(mode=="update")
		f.action="<%=cp%>/giupQna/update";
	
	return true; 
	
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
		<form name="boardForm" method="post" onsubmit="return submitContents(this)" encType="multipart/form-data">
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
								<textarea id="q_Content" name="q_Content" class="form-control" rows="15" style="max-width: 99%;">${dto.q_Content}</textarea>
							</td>
						</tr>
						<tr>
							<td class="td1">첨부 </td>
							<td colspan="3" class="td3"> 
								<input type="file" name="upload" class="form-control input-sm" style="height:35px; ">
							</td>
						</tr>	
			<c:if test="${mode=='update'}">		
						<tr>
							<td class="td1">등록파일 </td>
							<td colspan="3" class="td3">
								${dto.q_OriginalFileName}
								<c:if test="${not empty dto.q_OriginalFileName}">
									| <a href="<%=cp%>/giupQna/deleteFile?q_Num=${dto.q_Num}&page=${page}">삭제</a>
								</c:if>
							</td>
						</tr>
			</c:if>			
					</tbody>
						
					<tfoot>
						<tr>
							<td colspan="4" style="text-align: center; padding-top: 15px;">
								<button type="submit" class="btn btn-primary">확인<span class="glyphicon glyphicon-ok"></span> </button>
								<button type="button" class="btn btn-danger" onclick="javascript:location.href='<%=cp%>/giupQna/list'">취소</button>
							
							<c:if test="${mode=='reply' }">
								<input type="hidden" name="page" value="${page}">
								<input type="hidden" name="q_GroupNum" value="${dto.q_GroupNum}">
								<input type="hidden" name="q_OrderNo" value="${dto.q_OrderNo}">
								<input type="hidden" name="q_Depth" value="${dto.q_Depth}">
								<input type="hidden" name="q_Parent" value="${dto.q_Parent}">
								<input type="hidden" name="q_OriginalFileName" value="${dto.q_OriginalFileName}">
								<input type="hidden" name="q_SaveFileName" value="${dto.q_SaveFileName}">
								
							</c:if>
							<c:if test="${mode='update'}">
								<input type="hidden" name="page" value="${page}">
								<input type="hidden" name="q_Num" value="${dto.q_Num}">
								<input type="hidden" name="q_OriginalFileName" value="${dto.q_OriginalFileName}">
								<input type="hidden" name="q_SaveFileName" value="${dto.q_SaveFileName}">
							</c:if>
							</td>
						</tr>
					</tfoot>				
				</table>			
			</div>		
		</form>
	</div>
</div>

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "q_Content",
	sSkinURI: "<%=cp%>/resource/se/SmartEditor2Skin.html",	
	htParams : {bUseToolbar : true,
		fOnBeforeUnload : function(){
			// alert("아싸!");
		}
	}, //boolean
	fOnAppLoad : function(){
		//예제 코드
		//oEditors.getById["content"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
	},
	fCreator: "createSEditor2"
});

function pasteHTML() {
	var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
	oEditors.getById["q_Content"].exec("PASTE_HTML", [sHTML]);
}

function showHTML() {
	var sHTML = oEditors.getById["q_Content"].getIR();
	alert(sHTML);
}
	
function submitContents(elClickedObj) {
	oEditors.getById["q_Content"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	
	// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("content").value를 이용해서 처리하면 됩니다.
	
	try {
		// elClickedObj.form.submit();
		return check();
	} catch(e) {}
}

function setDefaultFont() {
	var sDefaultFont = '돋움';
	var nFontSize = 24;
	oEditors.getById["noti_Content"].setDefaultFont(sDefaultFont, nFontSize);
}
</script>    
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

<script type="text/javascript" src="<%=cp%>/resource/se/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
function check() {
	var f = document.noticeForm;   //form name이 noticeform인것 호출
	var str = f.noti_Title.value;  // noti_Title의 값 호출
	 
	if(! str) {  // str에 값을 입력하지 않으며, 
		f.noti_Title.focus();  // onfocus가 noti_Title 영역으로 이동
		return false; // check() function에서 빠져나옴.. 
	}
	
	str = f.noti_Content.value;   // str에 값이 ~~ 된다.. 
	if(! str || str=="<p>&nbsp; </p>") {  // 값이 없거나 공백만 있으며.. 
		f.noti_Content.focus();  // onfocus가 noti_Content 영역으로 이동
		return false; // check() function에서 빠져나옴.. 
	}
	
	var mode="${mode}";
	if(mode=="created")
		f.action="<%=cp%>/giupNotice/created";
	else if(mode=="update")
		f.action="<%=cp%>/giupNotice/update"; 
	
	// <input type='submit' ..>,  <input type='image' ..>, <button>은 submit() 메소드 호출하면 두번전송	
	return true;	
}

//동적으로 추가된 태그도 이벤트 처리 가능
$(function() {
	$("body").on("change", "input[name=upload]", function(){  //body태그에 input[name=upload]가 change가 발생할 때 function
		if(! $(this).val()) { // 현재 선택된 것이 값이 없으면, 태그의 function을 빠져나옴.. 
			return;
		}
		
		var b=false;
		$("input[name=upload]").each(function(){  // input[name=upload]을 반복하는 function
			if(! $(this).val()) {
				b=true;   // 현재 선택된 것에 값이 없으면, true로 변경하고 해당 function을 나옴.
				return;
			}
		});
		// check() function에서 빠져나옴.. (true이면)
		if(b) 
			return;  
		
		var $tr, $td, $input;
		
		$tr=$("<tr>");
		$td=$("<td>", {class:"td1", html:"첨부"});
		$tr.append($td);
		$td=$("<td>", {class:"td3", colspan:"5"});
		$input=$("<input>", {type:"file", name:"upload", class:"form-control input-sm", style:"height:35px;"});
		$td.append($input);
		$tr.append($td);
		
		$("#tb").append($tr);		
	});
});

<c:if test="${mode=='update'}">
	function deleteFile(noti_FileNum) {
		var url = "<%=cp%>/giupNotice/deleteFile";
		$.post(url, {noti_FileNum:noti_FileNum}, function(data){
			$("#f"+noti_FileNum).remove();
		}, "JSON");
	}
</c:if>


</script>


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

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "noti_Content",
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
	oEditors.getById["noti_Content"].exec("PASTE_HTML", [sHTML]);
}

function showHTML() {
	var sHTML = oEditors.getById["noti_Content"].getIR();
	alert(sHTML);
}
	
function submitContents(elClickedObj) {
	oEditors.getById["noti_Content"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	
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

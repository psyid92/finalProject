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
	padding: 3px
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

#categoryList {
	width: 160px;
	height: 190px; 
	border: 0px; 
	text-align: left; 
	padding: 5px; 
	padding-top: 0px; 
	overflow-y:scroll; 
	border: 1px solid #ccc;

}

.modal-dialog{
	background: white;
}

</style>

<script type="text/javascript">

function check() {
	var f = document.faqForm;
	
	str = f.fCate_Num.value;
	if(!str) {
		f.fCate_Num.focus();
		return false;  // 아래를 실행하지 않고.. check()를 벗어남. 
	}
	
	var str = f.f_Title.value;
	if(!str) {
		f.f_Title.focus();
		return false;
	}
	
	str= f.f_Content.value;
	if(!str) {
		f.f_Content.focus();
		return false;
	}
	// alert($("input [name=pageNo]").val());
	var mode="${mode}";
	if(mode=="created")
		f.action="<%=cp%>/giupFaq/created";
	else if(mode=="update")
		f.action="<%=cp%>/giupFaq/update";
		
		// <input type='submit' ..>,  <input type='image' ..>, <button>은 submit() 메소드 호출하면 두번전송
	return true;
}

//--------------------------------------
// 카테고리 리스트
function listFCate() {
	var url="<%=cp%>/giupFaq/listFCate"
	var now = new Date();
	var query="tmp="+now.getTime();
	
	// 수정에서 입력된 카테고리를 선택하기 위해 
	var fCate_Num="${dto.fCate_Num}";
	if(fCate_Num=="")
		fCate_Num="0";
	
	$.ajax({
		type: "post",
		url: url,
		data: query,
		dataType: 'json',
		success: function(data) {
			// 카테고리 모든 데이터 삭제
			$("#selectCategory option").each(function(){
				$("#selectCategory option:eq(0)").remove();
			});
			
			for(var idx=0; idx<data.list.length; idx++) {
				var num = data.list[idx].fCate_Num;
				var fCate_Name=data.list[idx].fCate_Name;
				
				var selected="";
				if(fCate_Num==num)
					selected="selected='selected'";
				
				$("#selectCategory").append("<option value='"+num+"' "+selected+">"+fCate_Name+"</option>");
			}
		},
		error: function(e) {
			console.lgo(e.responseText);
		}		
	});	
}


//카테고리 추가 대화 상자 
function categoryAdd() {
	var url ="<%=cp%>/giupFaq/listFCate"
	var now = new Date();
	var query ="tmp="+now.getTime();
	
	$.ajax({
		type:"POST",
		url: url, 
		data:query,
		dataType:'json',
		success: function(data) {
			var out = parseCategory(data);
			$("#listFCate").html(out);
		},
		error : function(e) {			
		}
	});
	
	$("#fCate_Name").val("");
	$('#categoryModal').modal('show');
}


//카테고리 등록하기
function sendCategory() {
	var fCate_Name=$.trim($("#fCate_Name").val());
	if(!fCate_Name) {
		alert("추가할 카테고리를 입력하세요");
		return;
	}
	
	var url="<%=cp%>/giupFaq/createFCate";
	var query="fCate_Name="+fCate_Name;
	
	$.ajax({
		type:"POST",
		url:url,
		data:query,
		dataType:'json',
		success: function(data) {
			var state = data.state;
			
			if(state=="false"){
				alert("카테고리는 최대 10개까지 추가 가능 합니다.");
			} else {
				$("#fCate_Name").val("");
				listFCate();
				
			}
			
			var out=parseCategory(data);
			$("#listFCate").html(out);			
		},
		error: function(e) {
			console.log(e.responseText);
		}		
	});	
}


//카테고리 리스트에 출력
function parseCategory(data) {
	var values="";
	
	for(var idx=0; idx<data.list.length; idx++) {
		var fCate_Num=data.list[idx].fCate_Num;
		var fCate_Name=data.list[idx].fCate_Name;
		
		var sid = "s"+fCate_Num;
		var str="<span id='"+sid+"'><a href='javascript:deleteCategory("+fCate_Num+");'>";
		str+="<img src='<%=cp%>/resource/img/icon-minus.png' border='0'></a>&nbsp;";
		str+=fCate_Name+"</span><br>";
		
		values+=str;
	}
	
	return values;
}

//카테고리 삭제
function deleteCategory(fCate_Num) {
	var url ="<%=cp%>/giupFaq/deleteFCate";
	var query ="fCate_Num="+fCate_Num;
	
	if(!confirm("삭제하시겠습니까?"))
		return;
	
	$.ajax({
		type:"POST",
		url:url,
		data:query,
		dataType:'json',
		success: function(data) {
			var state=data.state;
			
			if(state=="false") {
				alert("해당 카테고리는 사용중입니다.");
			} else {
				listFCate();
			}
			
			var out = parseCategory(data);
			$("#listFCate").html(out);
			
		},
		error: function(e){
			console.log(e.responseText());	
		}
		
	});
}

</script>

<div class="bodyFrame2">
	<div class="body-title">
		<h3><span class="glyphicon glyphicon-question-sign"></span>FAQ-자주하는 질문</h3>
	
	</div>
	
	<div class="alert alert-info">
		<i class="glyphicon glyphicon-info-sign"></i> 궁금한 사항을 확인하세요
	</div>
	
	<div>
		<form name="faqForm" method="post" onsubmit="return check();">
			<div class="bs-write">
				<table class="table">
					<tbody>
						<tr>
							<td class="td1">작성자명</td>
							<td class="td2 col-md-5 col-sm-5"> 
								<p class="form-control-static">${sessionScope.store.g1_Id}</p>
							</td>
							<td class="td1" align="center"> </td>
							<td class="td2 col-md-5 col-sm-5"> </td>
						</tr>
						
						<tr>
							<td class="td1">카테고리</td>
							<td colspan="3" class="td3">
								<div class="form-inline">
									<select name="fCate_Num" class="form-control" id="selectCategory" style="min-width: 150px;">
									<c:forEach var="vo" items="${listFCate}">
										<option value="${vo.fCate_Num}" ${dto.fCate_Num==vo.fCate_Num ? "selected='selected'":""}>${vo.fCate_Name}</option>
									</c:forEach>	
									</select>
									<button type="button" class="btn btn-default btn-sm" onclick="categoryAdd();">카테고리 추가</button>
								</div>
							</td>
						</tr>
						
						<tr>
							<td class="td1">제목</td>
							<td colspan="3" class="td3">
								<input type="text" name="f_Title" class="form-control input-sm" value="${dto.f_Title}" required="required">
							</td>
						</tr>
						
						<tr>
							<td colspan="4" class="td1" style="padding-bottom: 0px; "> 내용 </td>
						</tr>						
						<tr>
							<td colspan="4" class="td4">
								<textarea name="f_Content" class="form-control" rows="15" required="required">${dto.f_Content}</textarea>
							</td>
						</tr>
					</tbody>
					
					<tfoot>
						<tr>
							<td colspan="4" style="text-align: center; padding-top: 15px; ">
								<button type="submit" class="btn btn-primary"> 확인 <span class="glyphicon glyphicon-ok"></span> </button>
								<button type="button" class="btn btn-danger" onclick="javascript:location.href='<%=cp%>/giupFaq/faq?fCate_Num=${fCate_Num}'; ">취소</button>
							<c:if test="${mode=='update' }">
								<input type="hidden" name="f_Num" value="${dto.f_Num}">
								
								 <input type="hidden" name="pageNo" value="${pageNo}">
								<%-- <input type="hidden" name="fCate_Num" value="${dto.fCate_Num}">		 --%>				
							</c:if>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>		
		</form>	
	</div>
</div>

<div class="modal fade" id="categoryModal" tabindex="-1" role="dialog" aria-lableledby="categoryModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content modal-sm" style="min-width: 400px; ">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span> </button>
				<h4 class="modal-title" id="categoryModalLabel" style="font-family:나눔고딕, 맑은 고딕, sans-serif; font-weight: bold; ">FAQ 카테고리</h4>
			</div>
		</div>
		
		<div class="modal-body">
			<div class="alert alert-danger">
				<i class="glyphicon glyphicon-info-sign"></i>카테고리는 최대 10개 까지 등록가능 합니다.
			</div>
			<div style="clear: both; height: 200px; ">
				<div style="float: left; width: 180px; ">
					<form>
						<div class="form-group">
							<input class="form-control" type="text" id="fCate_Name" placeholder="카테고리">
						</div>
						<div class="form-group">
							<button class="btn btn-sm btn-default btn-block" type="button" onclick="sendCategory();">등록</button>
						</div>
					</form>
				</div>
				<div style="float: right">
					<div id="listFCate"></div>
				</div>
			</div>
		</div>
	</div>
</div>
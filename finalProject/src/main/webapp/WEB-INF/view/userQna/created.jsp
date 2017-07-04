<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
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
	padding: 3px 3px 3px 3px;
}

.bs-write .td1 {
    min-width: 100px;
    min-height: 30px;
    color: #666;
    vertical-align: middle;
}

li{
  width: 20%;  
  text-align: center;
  font-weight: 100;
  
}

</style>

<script type="text/javascript">
  function check() {
        var f = document.noticeForm;

    	var str = f.subject.value;
        if(!str) {
            f.subject.focus();
            return false;
        }

    	str = f.content.value;
        if(!str) {
            f.content.focus();
            return false;
        }

        var mode="${mode}";
    	if(mode=="created")
    		f.action="<%=cp%>/notice/created";
    	else if(mode=="update")
    		f.action="<%=cp%>/notice/update";

    	// <input type='submit' ..>,  <input type='image' ..>, <button>은 submit() 메소드 호출하면 두번전송
        return true;
 }
  
  //동적으로 추가된 태그도 이벤트 처리 가능
  $(function(){
	$("body").on("change", "input[name=upload]", function(){
		if(! $(this).val()) {
			return;	
		}
		
		var b=false;
		$("input[name=upload]").each(function(){
			if(! $(this).val()) {
				b=true;
				return;
			}
		});
		if(b)
			return;

		var $tr, $td, $input;
		
	    $tr=$("<tr>");
	    $td=$("<td>", {class:"td1", html:"첨부"});
	    $tr.append($td);
	    $td=$("<td>", {class:"td3", colspan:"3"});
	    $input=$("<input>", {type:"file", name:"upload", class:"form-control input-sm", style:"height: 35px;"});
	    $td.append($input);
	    $tr.append($td);
	    
	    $("#tb").append($tr);
	});
  });
  
  <c:if test="${mode=='update'}">
  function deleteFile(fileNum) {
		var url="<%=cp%>/notice/deleteFile";
		$.post(url, {fileNum:fileNum}, function(data){
			$("#f"+fileNum).remove();
		}, "JSON");
  }
</c:if>


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

<div role="tabpanel">

  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li role="presentation"><a href="<%=cp%>/notice/list" aria-controls="notice" role="tab" data-toggle="tab">공지사항</a></li>
    <li role="presentation"><a href="<%=cp%>/userEvent/list" aria-controls="userEvent" role="tab" data-toggle="tab">이벤트</a></li>
    <li role="presentation"><a href="<%=cp%>/userFap/list" aria-controls="userFaq" role="tab" data-toggle="tab">자주찾는 질문</a></li>
    <li role="presentation" class="active"><a href="<%=cp%>/userQna/created" aria-controls="userQna" role="tab" data-toggle="tab">1대1 문의</a></li>
    <li role="presentation"><a href="<%=cp%>/userBbs/list" aria-controls="userBbs" role="tab" data-toggle="tab">우리끼리소담소담</a></li>
  </ul>
</div>

<!-- 마크업 -->
<div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="userQna">

<div class="bodyFrame2">
    <div class="body-title">
          <h3><span class="glyphicon glyphicon-bullhorn"></span> 그것이 알고싶다 </h3>
    </div>
    
    <div class="alert alert-info">
        <i class="glyphicon glyphicon-info-sign"></i> 그런데 말입니다? 1대1 문의!!!
    </div>
    
    <div>
        <form name="noticeForm" method="post" onsubmit="return check();" enctype="multipart/form-data">
            <div class="bs-write">
                <table class="table">
                    <tbody id="tb">
                        <tr>
                            <td class="td1">작성자명</td>
                            <td class="td2 col-md-5 col-sm-5">
                                <p class="form-control-static">이름</p>
                            </td>
                            <td class="td1" align="center">비공개 체크</td>
                            <td class="td2 col-md-5 col-sm-5">
                               <div class="checkbox">
                                   <label>
                                        <input type="checkbox" name="uq_Hidden" value="1" ${dto.notice==1 ? "checked='checked' ":"" }> 비공개
                                    </label>
                                </div>
                            </td>
                        </tr>
                        
                        <tr>
                            <td class="td1">제목</td>
                            <td colspan="3" class="td3">
                                <input type="text" name="uq_Title" class="form-control input-sm" value="제목" required="required">
                            </td>
                        </tr>
                        
                        <tr>
                            <td class="td1" colspan="4" style="padding-bottom: 0px;">내용</td>
                        </tr>
                        <tr>
                            <td colspan="4" class="td4">
                            	<textarea name="uq_Content" class="form-control" rows="15">내용</textarea>
                            </td>
                        </tr>
                        
                        <tr>
                            <td class="td1">첨부</td>
                            <td colspan="3" class="td3">
                                <input type="file" name="upload" class="form-control input-sm" style="height: 35px;">
                            </td>
                        </tr>
                    </tbody>
                    
<c:if test="${mode=='update'}">
   <c:forEach var="vo" items="${listFile}">
                        <tr id="f${vo.fileNum}"> 
                            <td class="td1">첨부파일</td>
                            <td colspan="3" class="td3"> 
                                ${vo.originalFilename}
                                | <a href="javascript:deleteFile('${vo.fileNum}');">삭제</a>	        
                            </td>
                        </tr>
   </c:forEach>
</c:if>			
                    
                    <tfoot>
                        <tr>
                            <td colspan="4" style="text-align: center; padding-top: 15px;">
                                  <button type="submit" class="btn btn-primary"> 확인 <span class="glyphicon glyphicon-ok"></span></button>
                                  <button type="button" class="btn btn-danger" onclick="javascript:location.href='<%=cp%>/notice/list';"> 취소 </button>
                                  
                                  <c:if test="${mode=='update'}">
                                      <input type="hidden" name="page" value="${page}">
                                      <input type="hidden" name="num" value="${dto.num}">
                                  </c:if>
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </form>
    </div>
  </div>
</div>
</div>
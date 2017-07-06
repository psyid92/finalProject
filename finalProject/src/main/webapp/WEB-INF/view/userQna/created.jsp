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
    min-width: 75px;
    min-height: 30px;
    color: #666;
    vertical-align: middle;
    font-size: 20px; 	
}

.bs-write .td3 {
   border-color: blue;
   border-bottom-color: blue;
}

.bs-write .td4 {
}



li{
  width: 20%;  
  text-align: center;
  font-weight: 100;
  
}

</style>

<script type="text/javascript">
  function check() {
        var f = document.userQnaForm;

    	var str = f.uq_Title.value;
        if(!str) {
            f.uq_Title.focus();
            return false;
        }

    	str = f.uq_Content.value;
        if(!str) {
            f.uq_Content.focus();
            return false;
        }

        var mode="${mode}";
    	if(mode=="created")
    		f.action="<%=cp%>/userQna/created";
    	else if(mode=="update")
    		f.action="<%=cp%>/userQna/update";

    	// <input type='submit' ..>,  <input type='image' ..>, <button>은 submit() 메소드 호출하면 두번전송
        return true;
 }
  <c:if test="${mode=='update'}">
  function deleteFile(fileNum) {
		var url="<%=cp%>/userQna/deleteFile";
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
        <i class="glyphicon glyphicon-send"></i>1대1문의 입니다. 해당 Email(아이디)로 처리된결과가 전송됩니다.
    </div>
    
    <div>
       <form name="userQnaForm" method="post" onsubmit="return check();" enctype="multipart/form-data">
            <div class="bs-write">
                <table class="table">
                    <tbody>
                        <tr>
                            <td class="td1"><span class="label label-primary">작성자</span></td>
                            <td class="td2 col-md-5 col-sm-5">
                                <p class="form-control-static">${sessionScope.member.userId}</p>
                            </td>
                            <td class="td1" align="center"></td>
                            <td class="td2 col-md-5 col-sm-5">
                            </td>
                        </tr>
                        
                        <tr>
                            <td class="td1"><span class="label label-primary">제목</span></td>
                            <td colspan="3" class="td3">
                                <input type="text" name="uq_Title" class="form-control input-sm" value="${dto.uq_Title}" required="required">
                            </td>
                        </tr>
                        
                        <tr>
                            <td class="td1" colspan="4" style="padding-bottom: 0px;"><span class="label label-primary">내용</span></td>
                        </tr>
                        <tr>
                            <td colspan="4" class="td4">
                            	<textarea name="uq_Content" class="form-control" rows="15">${dto.uq_Content}</textarea>
                            </td>
                        </tr>
                        
                        <tr>
                            <td class="td1"><span class="label label-primary">첨부</span></td>
                            <td colspan="3" class="td3">
                                <input type="file" name="upload" class="form-control input-sm" style="height: 35px;">
                            </td>
                        </tr>
                        
<c:if test="${mode=='update'}">
                        <tr>
                            <td class="td1">등록파일</td>
                            <td colspan="3" class="td3">
                                ${dto.uq_OriginalFilename}
                                <c:if test="${not empty dto.uq_OriginalFilename}">
                                    | <a href="<%=cp%>/userQna/deleteFile?uq_Num=${dto.uq_Num}&page=${page}">삭제</a>
                                </c:if>
                            </td>
                        </tr>
</c:if>                        
                    </tbody>
                    <tfoot>
                    
                        <tr>
                        <td>
                         <button type="button" class="btn btn-primary" onclick="javascript:location.href='<%=cp%>/userQna/list';">내문의로GO<i class="fa fa-hand-pointer-o"></i></button>
                        </td>    
                            <td colspan="4" style="text-align: center; padding-top: 15px;">
                                  <button type="submit" class="btn btn-primary"> 확인 <span class="glyphicon glyphicon-ok"></span></button>
                                  <button type="button" class="btn btn-danger" onclick="javascript:location.href='<%=cp%>/userQna/list';"> 취소 </button>
                                  
                                  <c:if test="${mode=='update'}">
                                      <input type="hidden" name="uq_Num" value="${dto.uq_Num}">
                                      <input type="hidden" name="m1_Num" value="${dto.m1_Num}">
                                      <input type="hidden" name="page" value="${page}">
                                      <input type="hidden" name="uq_SaveFilename" value="${dto.uq_SaveFilename}">
                                      <input type="hidden" name="uq_OriginalFilename" value="${dto.uq_OriginalFilename}">
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
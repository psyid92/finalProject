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

.bs-write .td2 {
}

.bs-write .td3 {
}

.bs-write .td4 {
}

li{
  width: 20%;  
  text-align: center;
  font-weight: 100;
  
}


</style>

<script type="text/javascript" src="<%=cp%>/resource/se/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
  function check() {
        var f = document.userBbsForm;

    	var str = f.bbs_Subject.value;
        if(!str) {
            f.bbs_Subject.focus();
            return false;
        }

    	str = f.bbs_Content.value;
        if(!str || str=="<p>&nbsp;</p>") {
            f.bbs_Content.focus();
            return false;
        }

        var mode="${mode}";
    	if(mode=="created")
    		f.action="<%=cp%>/userBbs/created";
    	else if(mode=="update")
    		f.action="<%=cp%>/userBbs/update";
        return true;
 }
  
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

<div role="tabpanel" >

  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist" style="margin-top: 50px;">
    <li role="presentation"><a href="<%=cp%>/notice/list" aria-controls="notice" role="tab" data-toggle="tab">공지사항</a></li>
    <li role="presentation"><a href="<%=cp%>/userEvent/list" aria-controls="userEvent" role="tab" data-toggle="tab">이벤트</a></li>
    <li role="presentation"><a href="<%=cp%>/userFap/faq" aria-controls="userFaq" role="tab" data-toggle="tab">자주찾는 질문</a></li>
    <li role="presentation"><a href="<%=cp%>/userQna/list" aria-controls="userQna" role="tab" data-toggle="tab">1대1 문의</a></li>
    <li role="presentation" class="active"><a href="<%=cp%>/userBbs/list" aria-controls="userBbs" role="tab" data-toggle="tab">우리끼리소담소담</a></li>
  </ul>
</div>



<div class="tab-content">
  <div role="tabpanel" class="tab-pane active" id="userQna">
    <div class="bodyFrame2"  style="margin-top: 50px;">
    <div class="body-title">
        <h3><span class="glyphicon glyphicon-pencil"></span> 우리끼리 소담소담 </h3>
    </div>
    
    <div class="alert alert-info">
        <i class="glyphicon glyphicon-info-sign"></i> 우리끼리 자유롭게 이야기 해요!
    </div>
    
    <div>
        <form name="boardForm" method="post" onsubmit="return check();" enctype="multipart/form-data">
            <div class="bs-write">
                <table class="table">
                    <tbody>
                        <tr>
                            <td class="td1">작성자명</td>
                            <td class="td2 col-md-5 col-sm-5">
                                <p class="form-control-static">${sessionScope.member.userId}</p>
                            </td>
                            <td class="td1" align="center"></td>
                            <td class="td2 col-md-5 col-sm-5">
                            </td>
                        </tr>
                        
                        <tr>
                            <td class="td1">제목</td>
                            <td colspan="3" class="td3">
                                <input type="text" name="bbs_Subject" class="form-control input-sm" value="${dto.bbs_Subject }" required="required">
                            </td>
                        </tr>
                        
                        <tr>
                            <td class="td1" colspan="4" style="padding-bottom: 0px;">내용</td>
                        </tr>
                        <tr>
                            <td colspan="4" class="td4">
                            	<textarea name="bbs_Content" class="form-control" rows="15">${dto.bbs_Content}</textarea>
                            </td>
                        </tr>
                        
                        <tr>
                            <td class="td1">첨부</td>
                            <td colspan="3" class="td3">
                                <input type="file" name="upload" class="form-control input-sm" style="height: 35px;">
                            </td>
                        </tr>
                  <c:if test="${mode=='update'}">      
                        <tr>
                            <td class="td1">등록파일</td>
                            <td colspan="3" class="td3">
                              ${dto.bbs_OriginalFilename}
                              <c:if test="${not empty dto.bbs_OriginalFilename}">
                                  | <a href="<%=cp%>/userBbs/deleteFile?bbs_Num=${dto.bbs_Num}&page=${page}">삭제</a>
                              </c:if>
                            </td>
                        </tr>                    
                  </c:if>   
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="4" style="text-align: center; padding-top: 15px;">
                                  <button type="submit" class="btn btn-primary"> 확인 <span class="glyphicon glyphicon-ok"></span></button>
                                  <button type="button" class="btn btn-danger" onclick="javascript:location.href='<%=cp%>/userBbs/list';"> 취소 </button>
                                  
                                 <c:if test="${mode=='update'}">
                                      <input type="hidden" name="bbs_Num" value="${dto.bbs_Num}">
                                      <input type="hidden" name="page" value="${page}">
                                      <input type="hidden" name=bbs_SaveFilename value="${dto.bbs_SaveFilename}">
                                      <input type="hidden" name="bbs_OriginalFilename" value="${dto.bbs_OriginalFilename}">
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


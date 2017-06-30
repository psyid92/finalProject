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

<script type="text/javascript">
  function check() {
        var f = document.noticeForm;

    	var str = f.noti_Title.value;
        if(!str) {
            f.noti_Title.focus();
            return false;
        }

    	str = f.noti_Content.value;
        if(!str) {
            f.noti_Content.focus();
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



<div class="tab-content">
 <div role="tabpanel" class="tab-pane active" id="notice">

  <div class="bodyFrame2">
    <div class="body-title">
          <h3><span class="glyphicon glyphicon-tasks"></span> 공지사항 </h3>
    </div>
    
    <div class="alert alert-info">
        <i class="glyphicon glyphicon-info-sign"></i> 중요한 일정 및 알림, 이벤트 등은 공지사항 통해 고객님께 알려 드립니다.
    </div>
    
    <div>
        <form name="noticeForm" method="post" onsubmit="return check();">
            <div class="bs-write">
                <table class="table">
                    <tbody id="tb">
                        <tr>
                            <td class="td1">작성자명</td>
                            <td class="td2 col-md-5 col-sm-5">
                                <p class="form-control-static">관리자</p>
                            </td>
                            <td class="td1" align="center">공지여부</td>
                            <td class="td2 col-md-5 col-sm-5">
                               <div class="checkbox">
                                   <label>
                                        <input type="checkbox" name="noti_Top" value="1" ${dto.noti_Top==1 ? "checked='checked' ":"" }> 공지
                                    </label>
                                </div>
                            </td>
                        </tr>
                        
                        <tr>
                            <td class="td1">제목</td>
                            <td colspan="3" class="td3">
                                <input type="text" name="noti_Tilte" class="form-control input-sm" value="${dto.noti_Tilte}" required="required">
                            </td>
                        </tr>
                        
                        <tr>
                            <td class="td1" colspan="4" style="padding-bottom: 0px;">내용</td>
                        </tr>
                        <tr>
                            <td colspan="4" class="td4">
                            	<textarea name="noti_Content" class="form-control" rows="15">${dto.noti_Content}</textarea>
                            </td>
                        </tr>
                        
                        
                    </tbody>

                    <tfoot>
                        <tr>
                            <td colspan="4" style="text-align: center; padding-top: 15px;">
                                  <button type="submit" class="btn btn-primary"> 확인 <span class="glyphicon glyphicon-ok"></span></button>
                                  <button type="button" class="btn btn-danger" onclick="javascript:location.href='<%=cp%>/notice/list';"> 취소 </button>
                                  
                                  <c:if test="${mode=='update'}">
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
 </div>
</div>
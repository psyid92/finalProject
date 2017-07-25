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

#categoryList{
	width:160px;
	height:190px;	
	border:0px;
	text-align:left;
	padding:5px;
	padding-top:0px;
	overflow-y:scroll;
    border:1px solid #ccc;
}
</style>

<script type="text/javascript">
  function check() {
        var f = document.faqForm;

    	str = f.ca_Num.value;
        if(!str) {
            f.ca_Num.focus();
            return false;
        }
        
    	var str = f.faq_Title.value;
        if(!str) {
            f.faq_Title.focus();
            return false;
        }

    	str = f.faq_Content.value;
        if(!str) {
            f.faq_Content.focus();
            return false;
        }

        var mode="${mode}";
    	if(mode=="created")
    		f.action="<%=cp%>/auserfaq/created";
    	else if(mode=="update")
    		f.action="<%=cp%>/auserfaq/update";

    	// <input type='submit' ..>,  <input type='image' ..>, <button>은 submit() 메소드 호출하면 두번전송
        return true;
 }
  
 //--------------------------------------
 // 카테고리 리스트
 function categoryList() {
	var url="<%=cp%>/auserfaq/categoryList";
	var now = new Date();
	var query="tmp="+now.getTime();
	
	// 수정에서 입력된 카테고리를 선택하기 위해 
	var ca_Num="${dto.ca_Num}";
	if(ca_Num=="")
		ca_Num="0";
	
   $.ajax({
       type: "post",
       url: url,
       data: query,
       dataType: 'json',
       success: function(data){
  		     // 카테고리 모든 데이터 삭제
  		     $("#selectCategory option").each(function() {
  		    	 $("#selectCategory option:eq(0)").remove();
  		     });

  		     for(var idx=0; idx<data.list.length; idx++){
 			     var ca_Num=data.list[idx].ca_Num;
 			     var ca_class=data.list[idx].ca_class;
   			 var selected="";
   			 if(ca_Num==faq_Num)
   				selected="selected='selected'";
   			
   			 $("#selectCategory").append("<option value='"+faq_Num+"' "+selected+">"+ca_class+"</option>");
       	}
       },
       error: function(e){
           console.log(e.responseText);
       }
   });
}

 // 카테고리 추가 대화 상자
 function categoryAdd() {
 	var url="<%=cp%>/auserfaq/categoryList";
	var now = new Date();
	var query="tmp="+now.getTime();
	
    $.ajax({
        type: "POST",
        url: url,
        data: query,
        dataType: 'json',
        success: function(data){
        	var out=parseCategory(data);
        	$("#categoryList").html(out);
        },
        error: function(e){
        }
    });	 
	 
	 $("#ca_class").val("");
	 $('#categoryModal').modal('show');
 }
 
 // 카테고리 등록하기
 function sendCategory() {
		var ca_class=$.trim($("#ca_class").val());
		if(!ca_class) {
			alert("추가할 카테고리를 입력 하세요.");
			return;
		}
		
    	var url="<%=cp%>/auserfaq/categoryCreated";
    	var query="ca_class="+ca_class;
		
        $.ajax({
            type: "post",
            url: url,
            data: query,
            dataType: 'json',
            success: function(data){
            	var state = data.state;
            	
            	if(state=="false") {
        			alert("카테고리는 최대 10개까지 추가 가능 합니다.");
            	} else {
            		$("#ca_class").val("");
            		categoryList();
            	}
            	
            	var out=parseCategory(data);
            	$("#categoryList").html(out);
            },
            error: function(e){
                console.log(e.responseText);
            }
        });
 }
 
 // 카테고리 리스트에 출력
 function parseCategory(data) {
 	var values="";
 	
 	for(var idx=0; idx<data.list.length; idx++){
     	var ca_Num=data.list[idx].ca_Num;
     	var ca_class=data.list[idx].ca_class;
			
     	var sid="s"+ca_Num;
     	var str="<span id='"+sid+"'><a href='javascript:deleteCategory("+ca_Num+");'>";
     	str+="<img src='<%=cp%>/resource/img/asd.png' border='0'></a>&nbsp;";
     	str+=ca_class+"</span><br>";
			
     	values+=str;
	}
		
 	return values;
 } 
 
 function deleteCategory(ca_Num) {
 	var url="<%=cp%>/auserfaq/categoryDelete";
	var query="ca_Num="+ca_Num;
	
	if(!confirm("삭제 하시겠습니까 ? "))
		return;
	
    $.ajax({
        type: "post",
        url: url,
        data: query,
        dataType: 'json',
        success: function(data){
        	var state = data.state;
        	
        	if(state=="false") {
    			alert("해당 카테고리는 사용중입니다.");
        	} else {
        		categoryList();
        	}
        	
        	var out=parseCategory(data);
        	$("#categoryList").html(out);
        },
        error: function(e){
            console.log(e.responseText);
        }
    });
 }
</script>

<div class="adminBodyFrame2">
    <div class="body-title">
          <h3><span class="glyphicon glyphicon-question-sign"></span> 자주하는 질문 </h3>
    </div>
    
    <div class="alert alert-info">
        <i class="glyphicon glyphicon-saved"></i> 회원님들께서 많이 궁금해하는 질문을 정리해보았습니다. 자세한 문의는 1대1문의를 해주세요
    </div>
    
    <div>
        <form name="faqForm" method="post" onsubmit="return check();">
            <div class="bs-write">
                <table class="table">
                    <tbody>
                        <tr>
                            <td class="td1">작성자명</td>
                            <td class="td2 col-md-5 col-sm-5">
                                <p class="form-control-static">관리자</p>
                            </td>
                            <td class="td1" align="center"></td>
                            <td class="td2 col-md-5 col-sm-5">
                            </td>
                        </tr>

                        <tr>
                            <td class="td1">카테고리</td>
                            <td colspan="3" class="td3">
                                <div class="form-inline">
                                    <select name="ca_Num" class="form-control" id="selectCategory" style="min-width: 150px;">
                                        <c:forEach var="vo" items="${listCategory}">
                                            <option value="${vo.ca_Num}" ${dto.ca_Num==vo.ca_Num ? "selected='selected'" : ""}>${vo.ca_class}</option>
                                        </c:forEach>
                                    </select>
                                    <button type="button" class="btn btn-default btn-sm" onclick="categoryAdd();">카테고리추가</button>
                                </div>                                
                            </td>
                        </tr>
                        
                        <tr>
                            <td class="td1">제목</td>
                            <td colspan="3" class="td3">
                                <input type="text" name="faq_Title" class="form-control input-sm" value="${dto.faq_Title}" required="required">
                            </td>
                        </tr>
                        
                        <tr>
                            <td class="td1" colspan="4" style="padding-bottom: 0px;">내용</td>
                        </tr>
                        <tr>
                            <td colspan="4" class="td4">
                            	<textarea name="faq_Content" class="form-control" rows="15" required="required">${dto.faq_Content}</textarea>
                            </td>
                        </tr>
                    </tbody>
                    
                    <tfoot>
                        <tr>
                            <td colspan="4" style="text-align: center; padding-top: 15px;">
                                  <button type="submit" class="btn btn-primary"> 확인 <span class="glyphicon glyphicon-ok"></span></button>
                                  <button type="button" class="btn btn-danger" onclick="javascript:location.href='<%=cp%>/auserfaq/faq?category=${category}';"> 취소 </button>
                                  
                                  <c:if test="${mode=='update'}">
                                      <input type="hidden" name="num" value="${dto.faq_Num}">
                                      <input type="hidden" name="pageNo" value="${pageNo}">
                                      <input type="hidden" name="category" value="${category}">
                                  </c:if>
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </form>
    </div>
</div>


<div class="modal fade" id="categoryModal" tabindex="-1" role="dialog" aria-labelledby="categoryModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content modal-sm"  style="min-width: 400px;">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="categoryModalLabel" style="font-family: 나눔고딕, 맑은 고딕, sans-serif; font-weight: bold;">FAQ 카테고리</h4>
      </div>
      <div class="modal-body">
          <div class="alert alert-danger">
                 <i class="glyphicon glyphicon-info-sign"></i> 카테고리는 최대 10개 까지 등록가능 합니다.
          </div>
          <div style="clear: both; height: 200px;">
                <div style="float: left; width: 180px;">
                     <form>
			             <div class="form-group">
			                 <input class="form-control" id="ca_class" type="text" placeholder="카테고리">
			             </div>
			             <div class="form-group">
			                 <button class="btn btn-sm btn-default btn-block" type="button" onclick="sendCategory();"> 등록 </button>
                          </div>
                    </form>
                </div>
                <div style="float: right;">
                     <div id="categoryList"></div>
                </div>
          </div>
          
      </div>
    </div>
  </div>
</div>


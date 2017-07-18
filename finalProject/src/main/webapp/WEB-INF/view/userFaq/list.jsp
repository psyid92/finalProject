<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<style type="text/css">
li {
	width: 20%;
	text-align: center;
	font-weight: 100;
}

.panel-info>.panel-head {
	background-color: rgba;
	padding: 1px;
}

.panel-heading {
	padding: 1px;
}
</style>

<script type="text/javascript">
	//탭 스트립트
	$('#myTab a').click(function(e) {
		e.preventDefault()
		$(this).tab('show')
	})

	$('#myTab a[href="#profile"]').tab('show') // Select tab by name
	$('#myTab a:first').tab('show') // Select first tab
	$('#myTab a:last').tab('show') // Select last tab
	$('#myTab li:eq(2) a').tab('show') // Select third tab (0-indexed)

	$(".collapse").collapse()

	$('#myCollapsible').collapse({
		toggle : 'show'
	})
</script>


<div role="tabpanel">

	<!-- Nav tabs -->
	<ul class="nav nav-tabs" role="tablist" style="margin-top: 50px;">     
		<li role="presentation"><a href="<%=cp%>/notice/list"
			aria-controls="notice" role="tab" data-toggle="tab">공지사항</a></li>
		<li role="presentation"><a href="<%=cp%>/userEvent/list"
			aria-controls="userEvent" role="tab" data-toggle="tab">이벤트</a></li>
		<li role="presentation" class="active"><a
			href="<%=cp%>/userFaq/faq" aria-controls="userFaq" role="tab"
			data-toggle="tab">자주찾는 질문</a></li>
		<li role="presentation"><a href="<%=cp%>/userQna/created"
			aria-controls="userQna" role="tab" data-toggle="tab">그것이 알고싶다</a></li>
		<li role="presentation"><a href="<%=cp%>/userBbs/list"
			aria-controls="userBbs" role="tab" data-toggle="tab">우리끼리소담소담</a></li>

	</ul>
</div>

<!-- 마크업 -->
<div class="tab-content">
	<div role="tabpanel" class="tab-pane active" id="userFaq">
		<div class="bodyFrame2">
			<div class="body-title">
				<h3>
					<span class="glyphicon glyphicon-exclamation-sign"></span> 자주찾는 질문
				</h3>
				<c:forEach var="dto" items="${list}">
    <div class="panel-group" id="accordion${dto.num}" role="tablist" aria-multiselectable="true" style="margin-bottom:5px;">
        <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="heading${dto.num}">
                <h4 class="panel-title" style="font-size: 14px;">
                    <span style="display: inline-block; width: 80px; ">${dto.classify}</span> | 
                    <a data-toggle="collapse" data-parent="#accordion${dto.num}" href="#collapse${dto.num}" aria-expanded="true" aria-controls="collapse${dto.num}">
                         ${dto.subject}
                    </a>
                </h4>
            </div>
            <div id="collapse${dto.num}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading${dto.num}">
                <div class="panel-body">
                        ${dto.content}
                       
                            <div style="padding-top: 5px;">
                                <hr>
			                    <a href="<%=cp%>/faq/update?num=${dto.num}&pageNo=${pageNo}&category=${category}">수정</a>&nbsp;|
			                    <a href="<%=cp%>/faq/delete?num=${dto.num}&pageNo=${pageNo}&category=${category}">삭제</a>
                            </div>
                       
                </div>
            </div>
        </div>
    </div>
</c:forEach>

<div class="paging" style="text-align: center; min-height: 50px; line-height: 50px;">
            
                  등록된 게시물이 없습니다.
            
            
              
           
</div>        
			</div>
		</div>
	</div>
</div>


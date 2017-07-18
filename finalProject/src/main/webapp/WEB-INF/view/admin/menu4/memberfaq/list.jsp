<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<style type="text/css">
</style>

<script type="text/javascript">
	
</script>



<div class="bodyFrame2">
	<div class="body-title">
		<h3>
			<span class="glyphicon glyphicon-exclamation-sign"></span> 자주찾는 질문
		</h3>
		<c:forEach var="dto" items="${list}">
			<div class="panel-group" id="accordion${dto.faq_Num}" role="tablist"
				aria-multiselectable="true" style="margin-bottom: 5px;">
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="heading${dto.faq_Num}">
						<h4 class="panel-title" style="font-size: 14px;">
							<span style="display: inline-block; width: 80px;">${dto.ca_class}</span>
							| <a data-toggle="collapse" data-parent="#accordion${dto.faq_Num}"
								href="#collapse${dto.faq_Num}" aria-expanded="true"
								aria-controls="collapse${dto.faq_Num}"> ${dto.faq_Title} </a>
						</h4>
					</div>
					<div id="collapse${dto.faq_Num}" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="heading${dto.faq_Num}">
						<div class="panel-body">
							${dto.faq_Content}

							<div style="padding-top: 5px;">
								<hr>
								<a
									href="<%=cp%>/faq/update?faq_Num=${dto.faq_Num}&pageNo=${pageNo}&category=${category}">수정</a>&nbsp;|
								<a
									href="<%=cp%>/faq/delete?faq_Num=${dto.faq_Num}&pageNo=${pageNo}&category=${category}">삭제</a>
							</div>

						</div>
					</div>
				</div>
			</div>
		</c:forEach>

		<div class="paging"
			style="text-align: center; min-height: 50px; line-height: 50px;">
            <c:if test="${dataCount==0 }">
                  등록된 게시물이 없습니다.
            </c:if>
            <c:if test="${dataCount!=0 }">
                ${paging}
            </c:if>
		</div>
	</div>
</div>


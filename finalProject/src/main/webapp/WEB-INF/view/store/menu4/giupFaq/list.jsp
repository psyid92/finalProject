<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   request.setCharacterEncoding("utf-8");
   String cp = request.getContextPath();
%>

<style type="text/css">


</style>

<script type="text/javascript">

</script>

<c:forEach var="dto" items="${list}">
<div class="" id="" role="" aria-multiselectable="true" style="margin-bottom:5px;">
	<div class="panel panel-default">
		<div class="panel-heading" role="tab" id="heading${dto.f_Num}">
			<h4 class="panel-title" style="font-size: 14px;">
				<span style="display: inline-block; width: 80px; ">${dto.fCate_Name}</span> |
				<a data-toggle="collapse" data-parent="#accordion${dto.f_Num}" href="#collapse${dto.f_Num}" aria-expanded="true" aria-controls="collapse${dto.f_Num}">
					${dto.f_Title}
				</a>				
			</h4>		
		</div>
		<div id="collapse${dto.f_Num}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading${dto.f_Num}">
                <div class="panel-body">
                        ${dto.f_Content}
                        <c:if test="${sessionScope.store.g1_Id=='admin'}">
                            <div style="padding-top: 5px;">
                                <hr>
			                    <a href="<%=cp%>/giupFaq/update?f_Num=${dto.f_Num}&pageNo=${pageNo}&fCate_Num=${fCate_Num}">수정</a>&nbsp;|
			                    <a href="<%=cp%>/giupFaq/delete?f_Num=${dto.f_Num}&pageNo=${pageNo}&fCate_Num=${fCate_Num}">삭제</a>
                            </div>
                        </c:if>
                </div>
            </div>
        </div>
    </div>
</c:forEach>

<div class="paging" style="text-align: center; min-height: 50px; line-height: 50px;">
            <c:if test="${dataCount==0 }">
                  등록된 게시물이 없습니다.
            </c:if>
            <c:if test="${dataCount!=0 }">
                ${paging}
            </c:if>
</div>      
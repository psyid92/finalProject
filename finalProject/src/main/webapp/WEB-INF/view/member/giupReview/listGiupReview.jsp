<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script>
	function Image(data){
		var imageSource = "<%=cp%>/uploads/giupReview/"+data;
	}
</script>

<br>
<div align="center" style="margin: auto;">
<h3>�� ����</h3>
</div>
<br><br>

<div align="center" style="margin: auto; border: 1px solid; border-radius: 5px;">
<br><br>

<c:if test="${ReviewList ne null }">
<table style="width: 80%;">
	<c:forEach items="${ReviewList }" var="dto">
		<tr>
			<td width="20%;" style="border-right: 1px solid #cdd0d4; color: red;"
				onclick="javascript:location.href='<%=cp%>/jumun/article?g1_Num=${dto.g1_num }&g1_Name=${dto.g1_name }'">${dto.g1_name }
			</td>
			<%-- <td> <img src='<%=cp%>/uploads/giupReview/${dto.rphoto_SaveFilename }'> </td> --%>
			<c:if test="${ dto.rphoto_SaveFilename eq null}">
			<td>&nbsp;&nbsp;<img src='<%=cp%>/resource/img/no_img.gif' width="200px;"></td>
			</c:if>
			<c:if test="${ dto.rphoto_SaveFilename ne null}">
			<td>&nbsp;&nbsp;<img src='<%=cp%>/uploads/giupReview/${dto.rphoto_SaveFilename }' width="200px;"></td>
			</c:if>
			
			<td>&nbsp;&nbsp;${dto.rep_created } &nbsp;&nbsp;&nbsp;&nbsp; <p style="color: orange; display: inline;">${dto.myStar }</p><br>&nbsp;&nbsp;${dto.rep_content }<br>
			<div style="min-height: 20px;"></div></td>
		</tr>
		<tr>
			<td colspan="3"><div style="min-height: 30px;"></div>
			</td>
		</tr>
	</c:forEach>

</table>

</c:if>
<c:if test="${ReviewList == null }">
	<div style="margin: auto;" align="center">
		<h4>���� ���䰡 �����ϴ�.</h4>
	</div>
</c:if>

</div>
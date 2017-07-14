<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<br>
<div align="center" style="margin: auto;">
<h3>³» ¸®ºä</h3>
</div>

<div align="center" style="margin: auto; border: 1px solid; border-radius: 5px;">
<br><br>
<table style="width: 80%;">
	<c:forEach items="${ReviewList }" var="dto">
		<tr onclick="javascript:location.href='<%=cp%>/jumun/article?g1_Num=${dto.g1_num }&g1_Name=${dto.g1_name }'">
			<td width="20%;" style="border-right: 1px solid #cdd0d4; color: red;">${dto.g1_name }
			</td>
			<td><img src="">${dto.rphoto_SaveFilename } </td>
			<td>&nbsp;&nbsp;${dto.rep_created } &nbsp;&nbsp;&nbsp;&nbsp; ${dto.myStar }<br>&nbsp;&nbsp;${dto.rep_content }<br>
			<div style="min-height: 20px;"></div></td>
		</tr>
		<tr>
			<td colspan="3"><div style="min-height: 10px;"></div>
			</td>
		</tr>
	</c:forEach>

</table>

</div>
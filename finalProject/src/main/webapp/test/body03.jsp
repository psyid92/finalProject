<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
   String cp=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<style>
#weather {
	background-color: black;
	color: white;
}
</style>
<body style="background:#f4efe1; ">
	<div id="header">
		<jsp:include page="header.jsp"/>
	</div>
 <div id="allBody" style="width:979px; max-width: 80%; margin: auto;">
    <div style="background: black; margin: auto; min-height: 100px; vertical-align: middle; display: table-ce" id="myGeo" align="center">
    <!-- ���� ��ġ �˻� ��ư - ajax�� �ݿ� -->
       <button onclick="" type="button">������ġ�˻�</button>
       <input type="text" placeholder="��ġ�� �Է��� �ּ���." style="min-width: 210px;">
    </div>
    <hr>
    
    <table style="width: 100%;">
       <tr style="height: 100px; ">
          <td width="10%;">����</td>
          <td width="20%;">��ü��</td>
          <td width="20%;">ǰ��</td>
          <td width="30%;">��ġ</td>
          <td width="20%;">����</td>
       </tr>
       <tr style="height: 100px; ">
          <td width="10%;">����</td>
          <td width="20%;">��ü��</td>
          <td width="20%;">ǰ��</td>
          <td width="30%;">��ġ</td>
          <td width="20%;">����</td>
       </tr>
       <tr style="height: 100px; ">
          <td width="10%;">����</td>
          <td width="20%;">��ü��</td>
          <td width="20%;">ǰ��</td>
          <td width="30%;">��ġ</td>
          <td width="20%;">����</td>
       </tr>
    </table>
    
 </div>
	<div id="footer">
		<jsp:include page="footer.jsp"/>
	</div>
</body>
</html>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>



<style>
<!--

#packing_giup {
	max-width: 500px;
	margin: auto;
}

#pack {
	display: inline-block;
	width: 200px;
	border : 1px solid black;
	height: 100px;
	text-align: center;
	line-height: 100px;
	margin: 20px;
}


#count {
	float: right;
	text-align: right;
}
-->
</style>


<div id="packing_giup" align="center">
<br><br>
<div id="count">�� : 2 ��
</div>

<br>
	<div id="pack" onclick="">ù ��°</div>
	<div id="pack" onclick="">ù ��°</div>
	<div id="pack" onclick="">ù ��°</div>
	<div id="pack" onclick="">ù ��°</div>
	<div id="pack" onclick="">ù ��°</div>
	<div id="pack" onclick="">ù ��°</div>

</div>
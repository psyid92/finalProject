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
	max-width: 900px;
	min-width : 300px;
	margin: auto;
}

#pack {
	display: inline-block;
	background : white;
	width: 270px;
	border : 1px solid black;
	margin: 20px;
	padding: 30px;
	padding-bottom: 10px;
/* 
	height: 200px;
	text-align: center;
	line-height: 200px;
	 */
}

#likeButton {
position : relative;
	width: 30px;
	height: 30px;
	float: right;
}

#count {
	position : relative;
	float: right;
	left : -90px;
	text-align: right;
}
-->
</style>


<script type="text/javascript">
	function sendcancle(data){
		var msg = "찜한 것을 삭제하시겠습니까?";
		if(! confirm(msg)){
			return;
		}
		
		var mydata = "mydata="+data;
		var url = "<%=cp%>/member/canclelike";
		
		$.ajax ({
			type:"post"
			, url : url
			, data : mydata
			, dataType : "json"
			, success : function(data){
				location.reload();
			}
		, error :function(e){
			console.log(e.responseText);
		}
		});
		
	}
</script>

<div id="packing_giup" align="center">
<br><br>
<div id="count">총 : ${count } 개
</div>

<br>
<c:forEach items="${list }" var="dto">
	<div id="pack" onclick="">
		<p style="float: left; color: red;font-size: 18px;">&nbsp;&nbsp;&nbsp;${dto.cat_name }&nbsp;&nbsp;&nbsp;</p><br><br>
		<p style="font-size: 22px; font-weight: bold;">${dto.g1_name } <p><br>
		<img id="likeButton" src="<%=cp%>/resource/img/likeButton.png" onclick="sendcancle(${dto.g1_num});">
	</div>	
</c:forEach>




</div>
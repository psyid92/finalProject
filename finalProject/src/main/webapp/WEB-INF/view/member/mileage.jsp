<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script>
	function deleteThisList(data){
		//위치 옮겨야 함
		if( !confirm("내역을 삭제하시겠습니까? 복구되지 않습니다.")) return;
		
		var url = "<%=cp%>/member/deleteMileage";
		var mydata = "mydata="+data;
		
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

<style>
<!--

#one_pack{
	max-width:800px;
	min-width: 600px; 
	
}

#myTop{
	width: 200px;
}

th {
	font-size: 18px;
}

-->
</style>


<br>
<div align="center">
<h3>내 마일리지 : ${mileage } 점</h3>
<c:if test="${not empty msg }">
<p style="color: blue;">${msg }</p>
</c:if>
</div>
<br>
<br>


<div style="border-radius: 5px; border: 1px double black; min-height: 600px;" align="center">
<br><br>



		<table style="border: none; border-collapse: collapse; width: 600px;">
		<tr style="height: 40px;">
			<th width="50%">일자</th>
			<th width="18%">내용</th>
			<th width="18%" align="right">포인트</th>
			<th width="*"></th>
		</tr>
		<tr>
			<td colspan="4"><hr></td>
		</tr>
		<c:forEach var="dto" items="${list }">
			<tr style="height: 40px;">
				<td width="50%">${dto.mil_created }</td>
				<td width="18%">${dto.mil_state }</td>
				<td align="right" width="18%">
						<c:if test="${dto.mil_state eq '적립' }"><p style="color: pink;">+ ${dto.mil_point }</p></c:if>
						<c:if test="${dto.mil_state eq '사용' }"><p style="color: pink;">- ${dto.mil_point }</p></c:if>
						<c:if test="${dto.mil_state eq '적립 취소' || dto.mil_state eq '사용 취소'}"><p style="color: red;">${dto.mil_point }</p></c:if>
				 </td>
				 <td width="*" align="right"> <a onclick="deleteThisList(${dto.mil_num});" class="btn btn-sm btn-danger"><span class="glyphicon glyphicon-remove"></span> 삭제</a></td>
			</tr>
		</c:forEach>
	</table>

</div>
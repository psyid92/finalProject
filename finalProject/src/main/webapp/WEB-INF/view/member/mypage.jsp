<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<style>
<!--
body {
	width: 1000px;
	margin: 0 auto;
}

#body-body {
	width: 1000px;
}

#showList {
	width: 40%;
	display: inline-block;
	height: 300px;
	margin: 0px;
}

h4 {
	color: black;
}

#showHR {
	width: 100%;
	color: black;
	border: solid 1px black;
}

td {
	font-weight: bold;
	height: 20px;
}

tr {
	min-height: 40px;
}
-->
</style>


<div style="" align="center">
	<br>
	<div>
		<c:if test="${not empty msg }">
			<p style="color: #727ebf;">${msg }</p>
		</c:if>
	</div>
	<br> <br>


	<div style="border: 1px solid; background: black; color: white;">
		<table style="border-collapse: collapse; width: 80%;">
			<tr align="center">
				<td width="25%;"
					onclick="javascript:location.href='<%=cp%>/member/ilike'">����
					����</td>
				<td onclick="javascript:location.href='<%=cp%>/member/mileage'">���ϸ���
					:
					<p style="color: white; display: inline;">${mileage }</p>
				</td>
				<td onclick="javascript:location.href='<%=cp%>/member/payList'">����
					����</td>
				<td
					onclick="javascript:location.href='<%=cp%>/member/listGiupReview'">��
					����</td>
			</tr>
		</table>
		<div style="min-height: 8px;"></div>
		<table style="border-collapse: collapse; width: 80%;">
			<tr align="center">
				<td width="33.3%;" align="center"
					onclick="javascript:location.href='<%=cp%>/member/update'">����
					����</td>
				<td width="33.3%;" align="center"
					onclick="javascript:location.href='<%=cp%>/userQna/list'">1��1
					����</td>
				<td width="33.3%;" align="center"
					onclick="javascript:location.href='<%=cp%>/member/memberAccount'">��й�ȣ
					���� / Ż��</td>
			</tr>
		</table>
	</div>
	<br> <br>

	<div id="body-body">
		<div id="showList">
			<h4>�ֱ� �ֹ�����</h4>
			<hr id="showHR">
			<c:if test="${jumunList eq null }">
				<table>
					<tr>
						<td>������ �����ϴ�.</td>
					</tr>
				</table>
			</c:if>
			<c:forEach items="${jumunList}" var="pay">
				<table>
					<tr style="color: #727ebf;">
						<th width="*">���Ը�</th>
						<th width="20%;">�ݾ�</th>
						<th width="40%;">�ֹ� ��¥</th>
					</tr>
					<tr>
						<td width="*">${pay.g1_name }</td>
						<td width="20%;">${pay.jumun_pay }</td>
						<td width="40%;">${pay.jumun_created }</td>
					</tr>
				</table>

			</c:forEach>

		</div>

		&nbsp;&nbsp;&nbsp;

		<div id="showList">
			<h4>�ֱ� ����</h4>
			<hr id="showHR">

			<c:if test="${reviewList eq null }">
				<table>
					<tr>
						<td>������ �����ϴ�.</td>
					</tr>
				</table>
			</c:if>
			<c:forEach items="${reviewList}" var="review">
				<table>
					<tr style="color: #727ebf;">
						<th width="*">���Ը�</th>
						<th width="10%">����</th>
						<th width="40%;">���� ��¥</th>
					</tr>
					<tr>
						<td width="*">${review.g1_name }</td>
						<td width="10%">${review.myStar }</td>
						<td width="40%;">${review.rep_content }</td>
					</tr>
				</table>
			</c:forEach>


		</div>


		<div id="showList">
			<h4>�ֱ� ���ϸ��� ����</h4>
			<hr id="showHR">

			<c:if test="${qnaList eq null }">
				<table>
					<tr>
						<td>������ �����ϴ�.</td>
					</tr>
				</table>
			</c:if>
			<c:forEach items="${qnaList}" var="qna">
				<table>
					<tr style="color: #727ebf;">
						<th width="*">����</th>
						<th width="40%;">���� ��¥</th>
					</tr>
					<tr>
						<td width="*">${qna.uq_Title }</td>
						<td width="40%;">${qna.uq_Created }</td>
					</tr>
				</table>
			</c:forEach>


		</div>

		&nbsp;&nbsp;&nbsp;

		<div id="showList">
			<h4>�ֱ� 1��1 ����</h4>
			<hr id="showHR">
			<c:if test="${qnaList eq null }">
				<table>
					<tr>
						<td>������ �����ϴ�.</td>
					</tr>
				</table>
			</c:if>
			<c:forEach items="${qnaList}" var="qna">
				<table>
					<tr style="color: #727ebf;">
						<th width="*">����</th>
						<th width="40%;">���� ��¥</th>
					</tr>
					<tr>
						<td width="*">${qna.uq_Title }</td>
						<td width="40%;">${qna.uq_Created }</td>
					</tr>
				</table>
			</c:forEach>
		</div>

	</div>

</div>
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
					onclick="javascript:location.href='<%=cp%>/member/ilike'">찜한
					가게</td>
				<td onclick="javascript:location.href='<%=cp%>/member/mileage'">마일리지
					:
					<p style="color: white; display: inline;">${mileage }</p>
				</td>
				<td onclick="javascript:location.href='<%=cp%>/member/payList'">결제
					내역</td>
				<td
					onclick="javascript:location.href='<%=cp%>/member/listGiupReview'">내
					리뷰</td>
			</tr>
		</table>
		<div style="min-height: 8px;"></div>
		<table style="border-collapse: collapse; width: 80%;">
			<tr align="center">
				<td width="33.3%;" align="center"
					onclick="javascript:location.href='<%=cp%>/member/update'">정보
					수정</td>
				<td width="33.3%;" align="center"
					onclick="javascript:location.href='<%=cp%>/userQna/list'">1대1
					문의</td>
				<td width="33.3%;" align="center"
					onclick="javascript:location.href='<%=cp%>/member/memberAccount'">비밀번호
					변경 / 탈퇴</td>
			</tr>
		</table>
	</div>
	<br> <br>

	<div id="body-body">
		<div id="showList">
			<h4>최근 주문내역</h4>
			<hr id="showHR">
			<c:if test="${jumunList eq null }">
				<table>
					<tr>
						<td>내역이 없습니다.</td>
					</tr>
				</table>
			</c:if>
			<c:forEach items="${jumunList}" var="pay">
				<table>
					<tr style="color: #727ebf;">
						<th width="*">가게명</th>
						<th width="20%;">금액</th>
						<th width="40%;">주문 날짜</th>
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
			<h4>최근 리뷰</h4>
			<hr id="showHR">

			<c:if test="${reviewList eq null }">
				<table>
					<tr>
						<td>내역이 없습니다.</td>
					</tr>
				</table>
			</c:if>
			<c:forEach items="${reviewList}" var="review">
				<table>
					<tr style="color: #727ebf;">
						<th width="*">가게명</th>
						<th width="10%">별점</th>
						<th width="40%;">문의 날짜</th>
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
			<h4>최근 마일리지 내역</h4>
			<hr id="showHR">

			<c:if test="${qnaList eq null }">
				<table>
					<tr>
						<td>내역이 없습니다.</td>
					</tr>
				</table>
			</c:if>
			<c:forEach items="${qnaList}" var="qna">
				<table>
					<tr style="color: #727ebf;">
						<th width="*">제목</th>
						<th width="40%;">문의 날짜</th>
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
			<h4>최근 1대1 문의</h4>
			<hr id="showHR">
			<c:if test="${qnaList eq null }">
				<table>
					<tr>
						<td>내역이 없습니다.</td>
					</tr>
				</table>
			</c:if>
			<c:forEach items="${qnaList}" var="qna">
				<table>
					<tr style="color: #727ebf;">
						<th width="*">제목</th>
						<th width="40%;">문의 날짜</th>
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
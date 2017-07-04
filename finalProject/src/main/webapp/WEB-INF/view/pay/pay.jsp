<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<div class="form-group">
  <label class="control-label" for="inputDefault">주소</label>
  <input type="text" class="form-control" id="inputDefault" style="width: 400px;" placeholder="주소를 입력 해 주세요.">
</div>

<form name='jumunForm' method='post' onsubmit='return totalJumun();'>
	<div style='width: 280px; float: right;'>
		<div>장바구니</div>
		<div id='jumunAppend'></div>
		<div style='border-top: 1px solid black;'>
			<div style='float: left;'>Total</div>
			<div id='total_Pay' style='float: right;'>0원</div>
		</div>
		<br>
		<button type='submit' class='btn' style='width: 280px; float: right;'>주문하기</button>
	</div>
</form>


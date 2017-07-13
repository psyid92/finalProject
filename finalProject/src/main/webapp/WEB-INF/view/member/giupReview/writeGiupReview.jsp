<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
 
<style>

textarea {
    resize: none;
}

</style> 


<div align="center" style="margin: auto;">


<c:if test="${mode eq 'nowCreate' }">


<form class="form-horizontal" name="writeForm" method="post" action="<%=cp %>/member/writeReview" enctype="multipart/form-data">
	<fieldset>

		<!-- Text input-->
		<div class="form-group">
			<label class="col-md-4 control-label" for="m1_nickname">�ۼ���</label>
			<div class="col-md-4">
				<input id="m1_email" name="m1_email" type="text" readonly="readonly" value="${m1_email }"
				style="border: none;"
					class="form-control input-md">
				<input type="hidden" name="jumun_num" value="${jumun_num }">
			</div>
		</div>

		<!-- Textarea -->
		<div class="form-group">
			<label class="col-md-4 control-label" for="rep_content">����</label>
			<div class="col-md-4">
				<textarea id="rep_content" class="form-control" name="rep_content" cols="20" rows="10" wrap="soft" required="required"></textarea>



			</div>
		</div>

		<!-- File Button -->
		<div class="form-group">
			<label class="col-md-4 control-label" for="rphoto_OriginalFilename">����</label>
			<div class="col-md-3">
				<input id="upload" name="upload"
					class="input-file" type="file">
			</div>
		</div>

		<!-- Multiple Radios (inline) -->
		<div class="form-group">
			<label class="col-md-4 control-label" for="rep_star">����</label>
			<div class="col-md-3">
				<label class="radio-inline" for="rep_star-0"> <input
					type="radio" name="rep_star" id="rep_star-0" value="1"
					checked="checked"> 1
				</label> <label class="radio-inline" for="rep_star-1"> <input
					type="radio" name="rep_star" id="rep_star-1" value="2"> 2
				</label> <label class="radio-inline" for="rep_star-2"> <input
					type="radio" name="rep_star" id="rep_star-2" value="3"> 3
				</label> <label class="radio-inline" for="rep_star-3"> <input
					type="radio" name="rep_star" id="rep_star-3" value="4"> 4
				</label> <label class="radio-inline" for="rep_star-4"> <input
					type="radio" name="rep_star" id="rep_star-4" value="5"> 5
				</label>
			</div>
		</div>

	</fieldset>

	<div align="center">
		<button type="button" onclick='javascript:location.href="<%=cp %>/member/mypage"' class="btn btn-lg btn-default">���� ���</button>
		<button type="submit" class="btn btn-lg btn-success">���� ���</button>
	</div>
</form>
</c:if>

<c:if test="${mode eq 'clear' }">

<h4>���並 ����̽��ϴ�.</h4>
<br>
<button type="button" onclick="javascript:location.href='<%=cp %>/member/payList'" >���� �������� ���ư���</button>
</c:if>

</div>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style type="text/css">

.alert-error {
    color:#b94a48;
    background-color:#f2dede;
    border-color:#eed3d7;
}

.boxLayout {
    max-width:500px;
    
    padding:20px;
    margin: 0 auto;
}

@media (min-width: 768px) {
  .boxLayout {
    margin-top: 70px;
  }
}
.buttonBack{
    border-radius: 5px;
    border: 1px solid #bbb;
    background-color: white;
    width: 150px;
    height: 50px;
    cursor: pointer;
}
</style>

<div class="bodyFrame">
	<div class="boxLayout" style="padding-top:240px;">  
    	<div class="alert alert-error" style="text-align: center; border-radius: 5px;">
            <h4><strong>잘못된 접근입니다.</strong></h4>
           		잘못된 접근방법입니다.
           		<br>
           		이전페이지로 이동하여 다시 시도해주세요.
    	</div>
    <p style="text-align: center;">
          <button type="button" class="buttonBack" onclick="history.back()">이전페이지로  &raquo;</button>
    </p>
</div>    
</div>

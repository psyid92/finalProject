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
    padding-top:150px;
    margin: 0 auto;
}

@media (min-width: 768px) {
  .boxLayout {
    margin-top: 70px;
  }
}

</style>
<link rel="stylesheet" href="<%=cp%>/resource/css/style.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/layout.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/jquery/css/smoothness/jquery-ui.min.css" type="text/css">
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>

<div class="bodyFrame">
	<div class="boxLayout">  
    	<div class="alert alert-error" style="text-align: center;">
            <h4><strong>잘못된 접근입니다.</strong></h4>
           		  다시 시도해주시기 바랍니다.
    	</div>
    <p style="text-align: center;">
          <button type="button" class="btn btn-default" onclick="history.back()" style="width: 200px;"> 이전페이지로 이동 &raquo; </button>
    </p>
</div>    
    
</div>
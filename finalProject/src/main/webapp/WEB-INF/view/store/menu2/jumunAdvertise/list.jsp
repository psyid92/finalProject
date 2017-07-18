<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script>
	$(function(){
		$("#giupAd_Term").change(function(){
			if ($("#giupAd_Term option:selected").val() == 1)
				$("#pay").html("1000원");
			if ($("#giupAd_Term option:selected").val() == 7)
				$("#pay").html("5000원");
			else if ($("#giupAd_Term option:selected").val() == 30)
				$("#pay").html("20000원");
			else if ($("#giupAd_Term option:selected").val() == 365)
				$("#pay").html("200000원");
		});
		
	});
</script>

<div class="storeBodyFrame2">
    <div class="body-title">
          <h3><span class="glyphicon glyphicon-tower"></span> 광고 구매 </h3>
    </div>
    <div>
    	<div>결제정보</div><br>
    	<div>기업이름 : ${sessionScope.store.g1_Name}</div><br>
    	<div>
    		<div style="float: left;">상품 : &nbsp;</div>
	    	<select id="ad_Title" style="width: 100px;">
		    	<c:forEach var="dto" items="${listAdvertise}">
		    		<option id="${dto.ad_Num}" value="${dto.ad_Title}">${dto.ad_Title}</option>
		    	</c:forEach>
	    	</select>
	    </div><br>
	    <div>
		    <div style="float: left;">기간 : &nbsp;</div>
		    <div style="float: left;">
		    	<select id="giupAd_Term" style="width: 100px;">
		    		<option value="1">1일</option>
			    	<option value="7">7일</option>
			    	<option value="30">30일</option>
			    	<option value="365">365일</option>
		    	</select>
	    	</div>
	    	<div> 
	    		<div style="float: left;">&nbsp;가격 :&nbsp;</div>
	    		<div id="pay">1000원</div>
	    	</div>
	    </div><br>
    </div>
</div>
<div>
	<select id="select" class="form-control" style="width: 300px;">
		<option id="way" class="way">결제 방법을 선택 해 주세요.</option>
		<c:forEach var="dto" items="${wayList}">
			<option id="${dto.payMethod_Num}" class="${dto.payMethod_Way}">${dto.payMethod_Content}</option>
		</c:forEach>
	</select>
</div><br>
<div id="jumun">
	<button type="button" class="btn" disabled="disabled" style="width: 300px;">구매</button>
</div>
<input id="imp_init" type="hidden" value="${IMP_init}">
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<script>

$(function(){
	$("#select").change(function(){
		if ($("#select option:selected").attr("id") != "way") {
			$("#jumun button").prop("disabled",false);
		} else {
			$("#jumun button").prop("disabled",true);
		}
	});
	
	$("#jumun button").click(function(){
		var imp_init = $("#imp_init").val();
		var pay_Method = $("#select option:selected").attr("class");
		var name = $("#ad_Title option:selected").val();
		var amount = $("#pay").html();
		amount = amount.substring(0,amount.length-1);
		var giupAd_Term = $("#giupAd_Term option:selected").val();
		var ad_Num = $("#ad_Title option:selected").attr("id");
		var g1_Num = ${sessionScope.store.g1_Num}
		
	    
		var IMP = window.IMP; // 생략가능
		IMP.init(imp_init); // 부여받은 "가맹점 식별코드"를 사용
		
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : pay_Method,
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : name,
		    amount : amount,
		    buyer_email : "",
		    buyer_name : ""
		}, function(rsp) {
		    if ( rsp.success ) {
		        var url = "<%=cp%>/store/jumunAdvertise";
		        var query = "giupAd_Term=" + giupAd_Term + "&ad_Num=" + ad_Num + "&g1_Num=" + g1_Num;
		        $.ajax({
					type:"post"
					,url:url
					,data:query
					,success:function(data) {
						alert("결제성공!");
					}
					,error:function(e) {
						console.log(e.responseText);
					}
				});
		    } else {
		        var msg = '결제에 실패하였습니다.\n';
		        msg += '에러내용 : ' + rsp.error_msg;
			    alert(msg);
		    }
		});
	});
});
</script>
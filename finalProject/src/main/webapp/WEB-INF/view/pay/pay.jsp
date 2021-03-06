<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<style type="text/css">
.body-container {
	width: 500px;
	margin: 0;
	float: left;
}
label {
	margin-bottom: 0;
	height: 38px;
}
</style>
<div id="containar">
<div class="body-container" style="width: 700px;">
		<h3><span class="label label-info">I</span> 배달 정보</h3>
	<div>
		<table style="width: 100%; margin-top: 20px; border-spacing: 0px;">
			<tr>
				<td width="60" valign="top"style="text-align: right; padding-top: 5px;">
					<label style="font-weight: 900;">우편번호</label>
				</td>
				
				<td style="padding-left: 15px;">
					<div class="form-group">
						<input type="text" id="addr1" class="form-control" readonly="readonly" placeholder="우편번호" style="width: 25%; float: left; margin-right: 10px;">
						<button type="button" class="btn btn-default" onclick="sample6_execDaumPostcode()" style="width: 115px;">우편번호 찾기</button>
					</div>
				</td>
			</tr>
			<tr>	
				<td width="70" valign="top" style="text-align: right; padding-top: 5px;">
					<label style="font-weight: 900;">주소</label>
				</td>
				<td style="padding-left: 15px;">
					<div class="form-group">
						<input type="text" id="addr2" maxlength="50" class="form-control" style="width: 95%;" readonly="readonly" placeholder="주소">
					</div>
					<div class="form-group">
						<input type="text" id="addr3" maxlength="50" class="form-control" style="width: 95%;" placeholder="상세주소를 입력 해 주세요.">
					</div>
				</td>
			</tr>
			<tr>
				<td width="70" valign="top" style="text-align: right; padding-top: 5px;">
					<label style="font-weight: 900;">이름</label>
				</td>
				<td style="padding-left: 15px;">
					<div class="form-group">
						<input type="text" id="name" style="width: 95%;" maxlength="15" class="form-control" placeholder="받는사람의 이름을 입력 해 주세요.">
			        </div>
				</td>
			</tr>
			<tr>
				<td width="70" valign="top" style="text-align: right; padding-top: 5px;">
					<label style="font-weight: 900;">전화번호</label>
				</td>
				<td style="padding-left: 15px;">
					<div class="form-group">
						<input type="text" id="tel" style="width: 95%;" maxlength="11" class="form-control" placeholder="- 를 제외하고 입력 해 주세요. 예) 00011119999">
			        </div>
				</td>
			</tr>
			<tr>
				<td width="70" valign="top" style="text-align: right; padding-top: 5px;">
					<label style="font-weight: 900;">요청사항</label>
				</td>
				<td style="padding-left: 15px;">
					<div class="form-group">
						<input type="text" id="memo" style="width: 95%;" maxlength="50" class="form-control" placeholder="요청사항을 입력 해 주세요. (50자 이내)">
			    	</div>
			    </td>
			</tr>
			<tr>
				<td width="70" valign="top" style="text-align: right; padding-top: 5px;">
					<label style="font-weight: 900;">마일리지</label>
				</td>
				<td style="padding-left: 15px;">
					<div class="form-group">
						<input type="text" id="mileage" style="width: 25%; float:left; margin-right: 10px;" maxlength="50" class="form-control" placeholder="보유 마일리지 : ${mileage}p">
						<button type="button" class="btn btn-default" style="width: 115px;">적용하기</button>
						<div style='font-size: 14px;'>마일리지는 1000p이상부터 사용 가능하며 100p단위로 사용 하실 수 있습니다.</div>
			    	</div>
			    </td>
			</tr>
		</table>
	</div>
</div>
<div style="width: 280px; float: right;">
	<h3><span class="label label-info">II</span> 결제 정보</h3>
	<div style="border-bottom: 1px solid black;">장바구니</div>
	<div style="border-top: 1px solid black;">
		<c:forEach var="dto" items="${mainList}" varStatus="idx">
			<div style="border-bottom: 1px solid black;">
				<div style="float: left;">${dto.mainmenu_Title}</div><div style="float: right;">${dto.mainmenu_Pay}원</div><br>
				<c:if test="${not empty subList[idx.index]}">
					<div style="float: left;">${subList[idx.index].submenu_Title}</div><div style="float: right;">+${subList[idx.index].submenu_Pay}원</div><br>
				</c:if>
				<div style="float: left;">가격&nbsp;:&nbsp;</div><div class="pay" style="float: right; font-weight: 900;">${dto.mainmenu_Pay+subList[idx.index].submenu_Pay}원</div><br>
			</div>
			<input type="hidden" name="main_Num" value="${dto.mainmenu_Num}">
			<input type="hidden" name="sub_Num" value="${subList[idx.index].submenu_Num}">
		</c:forEach>
		<div id="jumunMileage" style="border-bottom: 1px solid black; display: none;">
			<div style="float: left;">마일리지 사용</div><div style="float: right;"></div><br>
		</div>
	</div>
	<div style='border-top: 1px solid black;'>
		<div style='float: left;'>Total</div>
		<div id='total_Pay' style='float: right; font-weight: 900;'></div>
		<input type='hidden' id='jumun_Pay'>
	</div><br>
	<div style="margin: 15px 0;">
		<select id="select" class="form-control">
			<option id="way" class="way">결제 방법을 선택 해 주세요.</option>
			<c:forEach var="dto" items="${wayList}">
				<option id="${dto.payMethod_Num}" class="${dto.payMethod_Way}">${dto.payMethod_Content}</option>
			</c:forEach>
		</select>
	</div>
	<button type="button" class='btn btn-success disabled' id="payBtn" disabled="disabled" style='width: 100%; float: right;'>결제하기</button>
</div>
</div>

<div id="success" style="width: 100%; height: 500px; display: none; margin: 250px auto;" align="center">
<div>결제가 완료되었습니다.</div><br>
<div><h1><a href="<%=cp%>/main">메인페이지로 돌아가기</a></h1></div>
</div>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<script type="text/javascript">
	$(function(){
		if (${mileage} < 1000) {
			$("#mileage").prop("readonly", true);
			$("#mileage").next().prop("disabled", true);
		}
		$("#mileage").next().click(function(){
			if ($("#mileage").val() == "") {
				$("#mileage").next().next().html("마일리지를 입력 해 주세요.");
				warning()
				return;
			}
			if (Number($("#mileage").val()) > ${mileage}) {
				$("#mileage").next().next().html("보유 마일리지 보다 많습니다.");
				warning()
				return;
			}
			if (isNaN($("#mileage").val())) {
				$("#mileage").next().next().html("숫자를 입력 해 주세요.");
				warning()
				return;
			}
			if ($("#mileage").val().indexOf("-") != -1) {
				$("#mileage").next().next().html("-는 입력할 수 없습니다.");
				warning()
				return;
			}
			if (Number($("#mileage").val()) % 100 != 0) {
				$("#mileage").next().next().html("100p 단위를 입력 해 주세요.");
				warning()
				return;
			}
			if (Number($("#mileage").val()) >= Number($("#jumun_Pay").val())) {
				$("#mileage").next().next().html("사용하려는 마일리지가 총 금액과 같거나 높습니다.");
				warning()
				return;
			}
			
			var tp = $("#total_Pay").html();
			tp = tp.substring(0,tp.length-1);
			var oriMil = $("#jumunMileage div:nth-child(2)").html()
			oriMil = oriMil.substring(1,oriMil.length-1);
			tp = Number(tp) + Number(oriMil);
			tp = tp - $("#mileage").val();
			
			$("#jumunMileage div:nth-child(2)").html("-"+$("#mileage").val()+"원");
			$("#total_Pay").html(tp+"원");
			
			$("#mileage").next().next().html("마일리지 사용이 적용되었습니다.");
			$("#mileage").css("border","1px solid #cccccc");
			$("#mileage").next().next().css("color","blue");
			if($("#mileage").val() == 0) {
				$("#jumunMileage").hide();
			} else {
				$("#jumunMileage").show();
			}
		});
	});
	function warning(){
		$("#mileage").css("border","1px solid #ff0000");
		$("#mileage").next().next().css("color","orange");
	}
	$(function(){
		var s = 0;
		var n = "";
		$(".pay").each(function(){
			n = $(this).html();
			n = n.substring(0,n.length-1);
			s += Number(n);
		});
		
		$("#total_Pay").html(s+"원");
		$("#jumun_Pay").val(s);
		
		$("#select").change(function(){
			if($("#select option:selected").attr("class") == 'way') {
				$("#payBtn").attr("class","btn btn-success disabled");
				$("#payBtn").prop("disabled", true);
			} else {
				$("#payBtn").attr("class","btn btn-success");
				$("#payBtn").prop("disabled", false);
			}
		})
	});
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('addr1').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('addr2').value = fullAddr;
            
        }
    }).open();
}
	

	$("#payBtn").click(function(){
		if($("#addr1").val().length == 0 || $("#addr2").val().length == 0 || $("#addr3").val().length == 0) {
			$("#addr3").css("border","1px solid #ff0000");
			$("#addr3").focus();
			return;
		}
		if ($("#name").val().length == 0) {
			$("#addr3").css("border","1px solid #cccccc");
			$("#name").css("border","1px solid #ff0000");
			$("#name").focus();
			return;
		}
		if ($("#tel").val().length == 0) {
			$("#addr3").css("border","1px solid #cccccc");
			$("#name").css("border","1px solid #cccccc");
			$("#tel").css("border","1px solid #ff0000");
			$("#tel").focus();
			return;
		}
		if (isNaN($("#tel").val())) {
			$("#addr3").css("border","1px solid #cccccc");
			$("#name").css("border","1px solid #cccccc");
			$("#tel").css("border","1px solid #ff0000");
			$("#tel").val("");
			$("#tel").focus();
			return;
		}
		if ($("#memo").val().length == 0) {
			$("#addr3").css("border","1px solid #cccccc");
			$("#name").css("border","1px solid #cccccc");
			$("#tel").css("border","1px solid #cccccc");
			$("#memo").css("border","1px solid #ff0000");
			$("#memo").focus();
			return;
		}
		$("#addr3").css("border","1px solid #cccccc");
		$("#name").css("border","1px solid #cccccc");
		$("#tel").css("border","1px solid #cccccc");
		$("#memo").css("border","1px solid #cccccc");
		payModal();
	});
	
	function payModal() {
		var name = "주문 기업 : ${g1_Name}";
		var jumun_Pay = $("#jumun_Pay").val();
		var pay_Pay = $("#total_Pay").html();
		var amount = pay_Pay.substring(0,pay_Pay.length-1);
		var email = '${sessionScope.member.userId}';
		var buyer_name = $("#name").val();
		var tel = $("#tel").val();
		var addr = $("#addr2").val()+" "+$("#addr3").val();
		var postcode = $("#addr1").val();
		var memo = $("#memo").val();
		var m1_Num = ${sessionScope.member.m1_Num};
		var mileage = $("#jumunMileage div:nth-child(2)").html();
		mileage = mileage.substring(1,mileage.length-1);
		var mainList = document.getElementsByName('main_Num');
		var subList = document.getElementsByName('sub_Num');
		var main_Nums = "";
		var sub_Nums = "";
		var pay_Method = $("#select option:selected").attr("class");
		for (var i = 0; i < mainList.length; i++) {
			main_Nums += mainList[i].value+",";
		}
		if (subList != null && subList.length > 0){
			for (var i = 0; i < subList.length; i++) {
				sub_Nums += subList[i].value+",";
			}
		}
		
		var IMP = window.IMP; // 생략가능
		IMP.init('${IMP_init}'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : pay_Method,
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : name,
		    amount : amount,
		    buyer_email : email,
		    buyer_name : buyer_name,
		    buyer_tel : tel,
		    buyer_addr : addr,
		    buyer_postcode : postcode
		}, function(rsp) {
		    if ( rsp.success ) {
		        var url = "<%=cp%>/pay/pay";
		        var query = "jumun_Pay="+jumun_Pay+"&pay_Pay="+amount+"&jumun_Tel="+tel+"&jumun_Memo="+memo;
		        query += "&jumun_Addr="+addr+"&m1_Num="+m1_Num;
		        query += "&main_Nums="+main_Nums+"&sub_Nums="+sub_Nums+"&mileage="+mileage;
		        $.ajax({
					type:"post"
					,url:url
					,data:query
					,success:function(data) {
						var ss = "<div style='width: 100%; height: 500px; border: 1px solid black; border-radius: 5px; margin:50px 0;'>";
						ss += "<div align='center'>";
						ss += "<div><br><br><br><br><br><br><br><br>결제가 완료되었습니다.<br><a href='<%=cp%>/main' style='font-size: 30px;'>메인페이지로 돌아가기</a></div>";
						ss += "</div></div>"
						$("#containar").html(ss);
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
	}
	
</script>
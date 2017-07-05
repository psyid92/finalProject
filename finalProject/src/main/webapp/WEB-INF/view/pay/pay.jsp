<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>



<script type="text/javascript">
	function memberOk() {
		var f = document.giupForm2;
		var str;

		str = f.g3_Addr2.value;
		str = str.trim();
		if (!str) {
			alert("주소를 입력하세요. ");
			f.g3_Addr2.focus();
			return;
		}
	}
</script>

<style type="text/css">
.body-container {
	width: 500px;
	margin: 0;
	float: left;
}
</style>

<div class="body-container" style="width: 700px;">
	<div class="body-giup2">
		<h3><span style="font-family: Webdings">4</span> 배달 정보</h3>
	</div>
	<div>
		<div id="map"></div>
		<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
			<tr>
				<td width="100" valign="top"style="text-align: right; padding-top: 5px;">
					<label style="font-weight: 900;">우편번호</label>
				</td>
				
				<td style="padding: 0 0 15px 15px;">
					<div class="form-group">
						<input type="text" id="g3_Addr1" name="g3_Addr1" value="${dto.g3_Addr1}" class="form-control" readonly="readonly" placeholder="우편번호" style="width: 200px; float: left; margin-right: 10px;">
						<button type="button" class="btn btn-default" onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
					</div>
				</td>
			</tr>
			<tr>	
				<td width="100" valign="top" style="text-align: right; padding-top: 5px;">
					<label style="font-weight: 900;">주소</label>
				</td>
				<td style="padding: 0 0 15px 15px;">
					<div class="form-group">
						<input type="text" id="g3_Addr2" name="g3_Addr2" value="${dto.g3_Addr2}" maxlength="50" class="form-control" style="width: 95%;" readonly="readonly" placeholder="주소">
					</div>
					<div class="form-group">
						<input type="text" id="g3_Addr3" name="g3_Addr3" value="${dto.g3_Addr3}" maxlength="50" class="form-control" style="width: 95%;" placeholder="상세주소를 입력해주세요">
					</div>
					<span id="guide" style="color: #999999"></span>
				</td>
			</tr>
			<tr>
				<td width="100" valign="top" style="text-align: right; padding-top: 5px;">
					<label style="font-weight: 900;">전화번호</label>
				</td>
				<td style="padding: 0 0 15px 15px;">
					<div class="form-group">
						<input type="text" name="m2_tel" id="userId" value="${dto.m2_tel}" style="width: 95%;" maxlength="15" class="form-control" placeholder="전화번호를 입력 해 주세요">
			        </div>
					<input type="hidden" name="m1_num" value="${dto.m1_num }">
			        <p class="help-block"> - 를 빼고 입력해 주세요. 예) 00011119999</p>
				</td>
			</tr>
			<tr>
		    		<td width="100" valign="top" style="text-align: right; padding-top: 5px;">
		           		<label style="font-weight: 900;">전화번호</label>
		     		</td>
		     		<td style="padding: 0 0 15px 15px;">
		     			<div class="form-group" style="width: 95%;">
							<input type="text" name="tel1" class="form-control" maxlength="3" style="float: left; width: 30%;">
		           				<div style="float: left; width: 5%; height: 38px; line-height: 38px;" align="center">─</div>
							<input type="text" name="tel2" class="form-control" maxlength="4" style="float: left; width: 30%;">
		          				<div style="float: left; width: 5%; height: 38px; line-height: 38px;" align="center">─</div>
							<input type="text" name="tel3" class="form-control" maxlength="4" style="float: left; width: 30%;">
						</div>
		     	  </td>
		 		</tr>
		</table>
	</div>
</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
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
            document.getElementById('g3_Addr1').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('g3_Addr2').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('g3_Addr3').focus();
            
            // 주소를 받아서 위도 경도를 구한다.
            searchAddressToCoordinate($('#g3_Addr2').val());
            //alert($('#g3_Addr2').val());
        }
    }).open();
}
</script>
<form name='jumunForm' method='post' onsubmit='return totalJumun();'>
	<div style='width: 280px; float: right;'>
		<div>장바구니</div>
		<div id='jumunAppend'></div>
		<div style='border-top: 1px solid black;'>
			<div style='float: left;'>Total</div>
			<div id='total_Pay' style='float: right;'>0원</div>
		</div>
		<br>
		<button type='submit' class='btn btn-success' style='width: 280px; float: right;'>결제하기</button>
	</div>
</form>


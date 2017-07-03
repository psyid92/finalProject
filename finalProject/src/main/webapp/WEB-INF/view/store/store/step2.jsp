<%@ page contentType="text/html; charset=EUC-KR"%>
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

	str = f.sample6_postcode.value;
	str = str.trim();
	if(!str) {
		alert("주소를 입력하세요. ");
		f.sample6_postcode.focus();
		return;
	}
	
	str = f.sample6_address2.value;
	str = str.trim();
	if(!str) {
		alert("상세주소를 입력하세요. ");
		f.sample6_address2.focus();
		return;
	}
	
    str = f.g2_Baedal.value;
	str = str.trim();
    if(!str) {
        alert("배달지역을 입력하세요. ");
        f.g2_Baedal.focus();
        return;
    }
    
    str = f.g2_Baedal.value;
	str = str.trim();
    if(!str) {
        alert("배달지역을 입력하세요. ");
        f.g2_Baedal.focus();
        return;
    }
    str = f.g2_Opentime.value;
	str = str.trim();
    if(!str) {
        alert("영업시간을 입력하세요. ");
        f.g2_Opentime.focus();
        return;
    }
    
    str = f.g2_orgin.value;
	str = str.trim();
    if(!str) {
        alert("원산지를 입력하세요. ");
        f.g2_orgin.focus();
        return;
    }
    
    str = f.g2_minpay.value;
	str = str.trim();
    if(!str) {
        alert("원산지를 입력하세요. ");
        f.g2_minpay.focus();
        return;
    }
    
    var mode="${mode}";
    if(mode=="created") {
    	f.action = "<%=cp%>/store/complete";
    } else if(mode=="update") {
    	f.action = "<%=cp%>/";
		}

		f.submit();
	}

</script>

<style type="text/css">

.body-container {
	width: 500px;
	margin: auto;
}

</style>
<div class="body-container" style="width: 700px;">
	<div class="body-giup2">
		<h3>
			<span style="font-family: Webdings">4</span> ${mode=="created"?"회원 가입 2단계":"회원 정보 수정"}
		</h3>
	</div>
	<div>
		<form name="giupForm2" method="post" action="<%=cp%>/store/step2">
			<table
				style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
				
		 		<tr>
			      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">우편번호</label>
			      </td>
			      <td style="padding: 0 0 15px 15px;">
			        <p style="margin-top: 1px; margin-bottom: 5px;">
			            <input type="text" id="sample6_postcode" name="sample6_postcode" value="${dto.g3_Addr}"
			                       class="boxTF" readonly="readonly" placeholder="우편번호">
			            <button type="button" class="btn" onclick="sample6_execDaumPostcode()">우편번호 찾기</button>          
			        </p>
			      </td>
			  </tr>
			  
			  <tr>
			      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">주소</label>
			      </td>
			      <td style="padding: 0 0 15px 15px;">
			        <p style="margin-top: 1px; margin-bottom: 5px;">
			            <input type="text" id="sample6_address" name="sample6_address" value="${dto.g3_Addr1}" maxlength="50" 
			                       class="boxTF" style="width: 95%;" readonly="readonly" placeholder="주소">
			        </p>
			        <p style="margin-bottom: 5px;">
			            <input type="text" id="sample6_address2" name="sample6_address2" value="${dto.g3_Addr2}" maxlength="50" 
			                       class="boxTF" style="width: 95%;" placeholder="상세주소를 입력해주세요">
			        </p>
			        <span id="guide" style="color:#999"></span>
			      </td>
			  </tr>
				
				<tr>
					<td width="100" valign="top" style="text-align: right; padding-top: 5px;">
						<label style="font-weight: 900;">배달 지역</label>
					</td>
					<td style="padding: 0 0 15px 15px;">
						<p style="margin-top: 1px; margin-bottom: 5px;">
							<input type="text" name="g2_Baedal" id="g2_Baedal" value="${dto.g2_Baedal}" style="width: 95%;"
							 maxlength="15" class="boxTF" placeholder="배달 가능한 지역을 입력해 주세요">
						</p>
					</td>
				</tr>
				
				<tr>
					<td width="100" valign="top" style="text-align: right; padding-top: 5px;">
						<label style="font-weight: 900;">영업 시간</label>
					</td>
					<td style="padding: 0 0 15px 15px;">
						<p style="margin-top: 1px; margin-bottom: 5px;">
							<input type="text" name="g2_Opentime" id="g2_Opentime" value="${dto.g2_Opentime}" style="width: 95%;"
							 maxlength="15" class="boxTF" placeholder="배달 가능한 지역을 입력해 주세요">
						</p>
						<p class="help-block">예) 09:00 ~ 15:30</p>
					</td>
				</tr>
				
				<tr>
					<td width="100" valign="top" style="text-align: right; padding-top: 5px;">
						<label style="font-weight: 900;">원산지</label>
					</td>
					<td style="padding: 0 0 15px 15px;">
						<p style="margin-top: 1px; margin-bottom: 5px;">
							<textarea id="g2_orgin" name="g2_orgin" rows="5px" cols="20px" style="resize:none; margin-left: 0px; margin-right: 0px; width: 95%;">-${dto.g2_origin}</textarea>
						</p>
						<p class="help-block">음식명 옆에 원료인 농수산물과 그 원료를 표시하세요. 예)치킨(닭고기:국산)</p>
					</td>
				</tr>
				
				<tr>
					<td width="100" valign="top" style="text-align: right; padding-top: 5px;">
						<label style="font-weight: 900;">업소 소개</label>
					</td>
					<td style="padding: 0 0 15px 15px;">
						<p style="margin-top: 1px; margin-bottom: 5px;">
							<textarea id="g2_memo" name="g2_memo" rows="5px" cols="20px" style="resize:none; margin-left: 0px; margin-right: 0px; width: 95%;">${dto.g2_Memo }</textarea>
						</p>
						<p class="help-block">업소를 소개하는 말을 작성해 주세요</p>
					</td>
				</tr>
				
				<tr>
					<td width="100" valign="top" style="text-align: right; padding-top: 5px;">
						<label style="font-weight: 900;">최소 주문 금액</label>
					</td>
					<td style="padding: 0 0 15px 15px;">
						<p style="margin-top: 1px; margin-bottom: 5px;">
							<input type="text" name="g2_minpay" id="g2_minpay" value="${dto.g2_Minpay}" 
							style="text-align:right; width: 36%;" maxlength="15" class="boxTF" placeholder="최소 주문 금액을 입력해주세요"> 원
						</p>
					</td>
				</tr>
			</table>

			<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
				<tr height="45">
					<td align="center">
						<button type="button" name="sendButton" class="btn"
							onclick="memberOk();">${mode=="created"?"회원가입":"정보수정"}</button>
						<button type="reset" class="btn">다시입력</button>
						<button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/store/join'">이전단계</button>
						<button type="button" class="btn"
							onclick="javascript:location.href='<%=cp%>/store/login';">${mode=="created"?"가입취소":"수정취소"}</button>
					</td>
				</tr>
				<tr height="30">
					<td align="center" style="color: blue;">${msg}</td>
				</tr>
			</table>
		</form>
	</div>

</div>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>
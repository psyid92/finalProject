<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<script type="text/javascript"
   src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=WlJc9L4f0E6oaul2CL2b&submodules=geocoder"></script>

<script type="text/javascript">


//�ּҷ� ���� �浵 ���ϱ�
function searchAddressToCoordinate(address) {
	naver.maps.Service.geocode({
	address : address
		}, function(status, response) {
		if (status === naver.maps.Service.Status.ERROR) {
			$("#g3_Addr1").val("");
			$("#g3_Addr2").val("");
			$("#g3_Addr3").val("");
		return alert('�ش� �ּҴ� �������� �Է����ּ���.');
		}
		
		var item = response.result.items[0];
		var point = new naver.maps.Point(item.point.x, item.point.y);
		
		$("#g3_Lati").val(item.point.x);
		$("#g3_Longti").val(item.point.y);
		
		Shiny.onInputChange("text",point);
	});
}

/////////////////////////////////////////////////////////////////////

function memberOk() {
	var f = document.giupForm2;
	var str;

	str = f.g3_Addr2.value;
	str = str.trim();
	if(!str) {
		alert("�ּҸ� �Է��ϼ���. ");
		f.g3_Addr2.focus();
		return;
	}
	
	str = f.g3_Addr3.value;
	str = str.trim();
	if(!str) {
		alert("���ּҸ� �Է��ϼ���. ");
		f.g3_Addr3.focus();
		return;
	}
	
    str = f.g2_Baedal.value;
	str = str.trim();
    if(!str) {
        alert("��������� �Է��ϼ���. ");
        f.g2_Baedal.focus();
        return;
    }
    
    str = f.g2_Baedal.value;
	str = str.trim();
    if(!str) {
        alert("��������� �Է��ϼ���. ");
        f.g2_Baedal.focus();
        return;
    }
    str = f.g2_Opentime.value;
	str = str.trim();
    if(!str) {
        alert("�����ð��� �Է��ϼ���. ");
        f.g2_Opentime.focus();
        return;
    }
    
    str = f.g2_Origin.value;
	str = str.trim();
    if(!str) {
        alert("�������� �Է��ϼ���. ");
        f.g2_Origin.focus();
        return;
    }
    
    str = f.g2_Minpay.value;
	str = str.trim();
    if(!str) {
        alert("�ּ� �ֹ��ݾ��� �Է��ϼ���. ");
        f.g2_Minpay.focus();
        return;
    }
        
    var mode="${mode}";
    if(mode=="created") {
    	f.action = "<%=cp%>/store/complete";
    } else if(mode=="update") {
    	alert(mode);
    	f.action = "<%=cp%>/store/updatecomplete";
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
			<span style="font-family: Webdings">4</span> ${mode=="created"?"ȸ�� ���� 2�ܰ�":"ȸ�� ���� ����"}
		</h3>
	</div>
	<div>
		<form name="giupForm2" method="post">
			<table
				style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
				
		 		<tr>
			      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">�����ȣ</label>
			      </td>
			      <td style="padding: 0 0 15px 15px;">
			        <p style="margin-top: 1px; margin-bottom: 5px;">
			            <input type="text" id="g3_Addr1" name="g3_Addr1" value="${storeDto.g3_Addr1}"
			                       class="boxTF" readonly="readonly" placeholder="�����ȣ">
			            <button type="button" class="btn" onclick="sample6_execDaumPostcode()">�����ȣ ã��</button>          
			        </p>
			      </td>
			  </tr>
			  
			  <tr>
			      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">�ּ�</label>
			      </td>
			      <td style="padding: 0 0 15px 15px;">
			        <p style="margin-top: 1px; margin-bottom: 5px;">
			            <input type="text" id="g3_Addr2" name="g3_Addr2" value="${storeDto.g3_Addr2}" maxlength="50" 
			                       class="boxTF" style="width: 95%;" readonly="readonly" placeholder="�ּ�">
			        </p>
			        <p style="margin-bottom: 5px;">
			            <input type="text" id="g3_Addr3" name="g3_Addr3" value="${storeDto.g3_Addr3}" maxlength="50" 
			                       class="boxTF" style="width: 95%;" placeholder="���ּҸ� �Է����ּ���">
			        </p>
			        <span id="guide" style="color:#999"></span>
			      </td>
			  </tr>
				
				<tr>
					<td width="100" valign="top" style="text-align: right; padding-top: 5px;">
						<label style="font-weight: 900;">��� ����</label>
					</td>
					<td style="padding: 0 0 15px 15px;">
						<p style="margin-top: 1px; margin-bottom: 5px;">
							<input type="text" name="g2_Baedal" id="g2_Baedal" value="${storeDto.g2_Baedal}" style="width: 95%;"
							 maxlength="15" class="boxTF" placeholder="��� ������ ������ �Է��� �ּ���">
						</p>
					</td>
				</tr>
				
				<tr>
					<td width="100" valign="top" style="text-align: right; padding-top: 5px;">
						<label style="font-weight: 900;">���� �ð�</label>
					</td>
					<td style="padding: 0 0 15px 15px;">
						<p style="margin-top: 1px; margin-bottom: 5px;">
							<input type="text" name="g2_Opentime" id="g2_Opentime" value="${storeDto.g2_Opentime}" style="width: 95%;"
							 maxlength="15" class="boxTF" placeholder="��� ������ ������ �Է��� �ּ���">
						</p>
						<p class="help-block">��) 09:00 ~ 15:30</p>
					</td>
				</tr>
				
				<tr>
					<td width="100" valign="top" style="text-align: right; padding-top: 5px;">
						<label style="font-weight: 900;">������</label>
					</td>
					<td style="padding: 0 0 15px 15px;">
						<p style="margin-top: 1px; margin-bottom: 5px;">
							<textarea id="g2_Origin" name="g2_Origin" rows="5px" cols="20px" style="resize:none; margin-left: 0px; margin-right: 0px; width: 95%;">-${storeDto.g2_Origin}</textarea>
						</p>
						<p class="help-block">���ĸ� ���� ������ ����깰�� �� ���Ḧ ǥ���ϼ���. ��)ġŲ(�߰��:����)</p>
					</td>
				</tr>
				
				<tr>
					<td width="100" valign="top" style="text-align: right; padding-top: 5px;">
						<label style="font-weight: 900;">���� �Ұ�</label>
					</td>
					<td style="padding: 0 0 15px 15px;">
						<p style="margin-top: 1px; margin-bottom: 5px;">
							<textarea id="g2_Memo" name="g2_Memo" rows="5px" cols="20px" style="resize:none; margin-left: 0px; margin-right: 0px; width: 95%;">${storeDto.g2_Memo }</textarea>
						</p>
						<p class="help-block">���Ҹ� �Ұ��ϴ� ���� �ۼ��� �ּ���</p>
					</td>
				</tr>
				
				<tr>
					<td width="100" valign="top" style="text-align: right; padding-top: 5px;">
						<label style="font-weight: 900;">�ּ� �ֹ� �ݾ�</label>
					</td>
					<td style="padding: 0 0 15px 15px;">
						<p style="margin-top: 1px; margin-bottom: 5px;">
							<input type="text" name="g2_Minpay" id="g2_Minpay" value="${storeDto.g2_Minpay}" 
							style="text-align:right; width: 36%;" maxlength="15" class="boxTF" placeholder="�ּ� �ֹ� �ݾ��� �Է����ּ���"> ��
						</p>
					</td>
				</tr>
			</table>

			<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
				<tr height="45">
					<td align="center">
						<button type="button" id="sendButton" name="sendButton" class="btn"
							onclick="memberOk();">${mode=="created"?"ȸ������":"��������"}</button>
						<button type="reset" class="btn">�ٽ��Է�</button>
						<button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/store/join'">�����ܰ�</button>
						<c:if test="${mode=='created'}">
						<button type="button" class="btn"onclick="javascript:location.href='<%=cp%>/store/logout';">�������</button>
						</c:if>
						<c:if test="${mode=='update'}">
						<button type="button" class="btn"onclick="javascript:location.href='<%=cp%>/store/mypage';">�������</button>
						</c:if>
					</td>
				</tr>
				<tr height="30">
					<td align="center" style="color: blue;">${msg}</td>
				</tr>
			</table>
			<input id="g3_Lati" name="g3_Lati" type="hidden" value="${storeDto.g3_Lati}">
			<input id="g3_Longti" name="g3_Longti" type="hidden" value="${storeDto.g3_Longti}">
		</form>
	</div>

</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

                // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var fullAddr = ''; // ���� �ּ� ����
                var extraAddr = ''; // ������ �ּ� ����

                // ����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
                if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
                    fullAddr = data.roadAddress;

                } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
                    fullAddr = data.jibunAddress;
                }

                // ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����Ѵ�.
                if(data.userSelectedType === 'R'){
                    //���������� ���� ��� �߰��Ѵ�.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // �ǹ����� ���� ��� �߰��Ѵ�.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // �������ּ��� ������ ���� ���ʿ� ��ȣ�� �߰��Ͽ� ���� �ּҸ� �����.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById('g3_Addr1').value = data.zonecode; //5�ڸ� �������ȣ ���
                document.getElementById('g3_Addr2').value = fullAddr;

                // Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
                document.getElementById('g3_Addr3').focus();
                
                // �ּҸ� �޾Ƽ� ���� �浵�� ���Ѵ�.
                searchAddressToCoordinate($('#g3_Addr2').val());
                //alert($('#g3_Addr2').val());
                
            }
        }).open();
    }
    

</script>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<script type="text/javascript">
function memberOk() {
	var f = document.memberForm;
	var str;

	 str = f.m1_email.value;
	str = str.trim();
	if(!str) {
		alert("���̵� �Է��ϼ���. ");
		f.m1_email.focus();
		return;
	}
	if(!/^[a-z][a-z0-9_]{4,9}$/i.test(str)) { 
		alert("���̵�� 5~10���̸� ù���ڴ� �������̾�� �մϴ�.");
		f.m1_email.focus();
		return;
	}
	f.m1_email.value = str;

	
	
	str = f.m1_pwd.value;
	str = str.trim();
	if(!str) {
		alert("�н����带 �Է��ϼ���. ");
		f.m1_pwd.focus();
		return;
	}
	if(!/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{5,10}$/i.test(str)) { 
		alert("�н������ 5~10���̸� �ϳ� �̻��� ���ڳ� Ư�����ڰ� ���ԵǾ�� �մϴ�.");
		f.m1_pwd.focus();
		return;
	}
	f.m1_pwd.value = str;

	if(str!= f.userPwdCheck.value) {
        alert("�н����尡 ��ġ���� �ʽ��ϴ�. ");
        f.userPwdCheck.focus();
        return;
	}
	
    str = f.m1_nickname.value;
	str = str.trim();
    if(!str) {
        alert("�г����� �Է��ϼ���. ");
        f.m1_nickname.focus();
        return;
    }
    f.m1_nickname.value = str;

    /* 
    str = f.m2_birth.value;
	str = str.trim();
    if(!str || !isValidDateFormat(str)) {
        alert("������ϸ� �Է��ϼ���[YYYY-MM-DD]. ");
        f.m2_birth.focus();
        return;
    }
 */
    
    str = f.m2_tel.value;
	str = str.trim();
    if(!str) {
        alert("��ȭ��ȣ�� �Է��ϼ���. ");
        f.m2_tel.focus();
        return;
    }
    if(!/^(\d+)$/.test(str)) {
        alert("���ڸ� �����մϴ�. ");
        f.m2_tel.focus();
        return;
    }
 
    
    
    
    var mode="${mode}";
    if(mode=="created") {
    	f.action = "<%=cp%>/member/member";
    } else if(mode=="update") {
    	f.action = "<%=cp%>/member/update";
		}

		f.submit();
	}

	function changeEmail() {
		var f = document.memberForm;

		var str = f.selectEmail.value;
		if (str != "direct") {
			f.email2.value = str;
			f.email2.readOnly = true;
			f.email1.focus();
		} else {
			f.email2.value = "";
			f.email2.readOnly = false;
			f.email1.focus();
		}
	}
</script>

<style type="text/css">

.body-container {
	width: 500px;
	margin: auto;
}

</style>
<div class="body-container" style="width: 700px;">
	<div class="body-title">
		<h3>
			<span style="font-family: Webdings">4</span> ${mode=="created"?"ȸ�� ����":"ȸ�� ���� ����"}
		</h3>
	</div>
	<div>
		<form name="giupForm" method="post">
			<table
				style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
				<tr>
					<td width="100" valign="top"
						style="text-align: right; padding-top: 5px;"><label
						style="font-weight: 900;">����� ��Ϲ�ȣ</label></td>
					<td style="padding: 0 0 15px 15px;">
						<p style="margin-top: 1px; margin-bottom: 5px;">
							<input type="text" name="g2_giupNum" id="g2_giupNum"
								value="${dto.g2_giupNum}" style="width: 95%;"
								${mode=="update" ? "readonly='readonly' ":""} maxlength="15"
								class="boxTF" placeholder="����� ��Ϲ�ȣ�� �Է����ּ���">
						</p>
						<p class="help-block">���ΰ����� ����� ��Ϲ�ȣ�� �Է����ּ���</p>
					</td>
				</tr>

				<tr>
					<td width="100" valign="top"
						style="text-align: right; padding-top: 5px;"><label
						style="font-weight: 900;">�� ���� �̸�</label></td>
					<td style="padding: 0 0 15px 15px;">
						<p style="margin-top: 1px; margin-bottom: 5px;">
							<input type="text" name="giup1_name" id="giup1_name"
								value="${dto.g1_name}" style="width: 95%;"
								${mode=="update" ? "readonly='readonly' ":""} maxlength="15"
								class="boxTF" placeholder="������ �̸��� �����ּ���">
						</p>
						<p class="help-block">�����̸��� �Է����ּ���</p>
					</td>
				</tr>

				<!-- �г��� -->
				<tr>
					<td width="100" valign="top"
						style="text-align: right; padding-top: 5px;"><label
						style="font-weight: 900;">���̵�</label></td>
					<td style="padding: 0 0 15px 15px;">
						<p style="margin-top: 1px; margin-bottom: 5px;">
							<input type="text" name="g1_Id" id="g1_Id" value="${dto.g1_Id}"
								style="width: 95%;" maxlength="15" class="boxTF"
								placeholder="���̵�� 5~10�ڷ� �Է����ּ���">
						</p>
						<p class="help-block">���̵�� 5~10�ڷ� �Է����ּ���</p>
					</td>
				</tr>



				<tr>
					<td width="100" valign="top"
						style="text-align: right; padding-top: 5px;"><label
						style="font-weight: 900;">��й�ȣ</label></td>
					<td style="padding: 0 0 15px 15px;">
						<p style="margin-top: 1px; margin-bottom: 5px;">
							<input type="password" name="g1_Pwd" maxlength="15" class="boxTF"
								style="width: 95%;" placeholder="��й�ȣ�� 5~10�� �̳��� �Է����ּ���">
						</p>
						<p class="help-block">
							�н������ 5~10�� �̳��� �Է����ּ���<br> �ϳ� �̻��� ���ڳ� Ư�����ڰ� ���ԵǾ�� �մϴ�.
						</p>
					</td>
				</tr>

				<tr>
					<td width="100" valign="top"
						style="text-align: right; padding-top: 5px;"><label
						style="font-weight: 900;">�н����� Ȯ��</label></td>
					<td style="padding: 0 0 15px 15px;">
						<p style="margin-top: 1px; margin-bottom: 5px;">
							<input type="password" name="g1PwdCheck" maxlength="15"
								class="boxTF" style="width: 95%;" placeholder="�ٽ� �� �� �� �Է����ּ���">
						</p>
						<p class="help-block">���� Ȥ�� ��ȭ��ȣ�� ���ų� ���ӵ� ���ڿ��� ����� ��й�ȣ�� ��������
							�ʽ��ϴ�</p>
					</td>
				</tr>

				<tr>
					<td width="100" valign="top"
						style="text-align: right; padding-top: 5px;"><label
						style="font-weight: 900;">ī�װ�</label></td>
					<td style="padding-left: 10px;"><select name="category"
						class="selectField">
							<option value="">:::����:::</option>
							<option value="chicken">ġŲ</option>
							<option value="china">�߱���</option>
							<option value="pizza">����</option>
							<option value="bunsik">�н�</option>
							<option value="bossam">����,����</option>
							<option value="ya">�߽�</option>
							<option value="zzim">��,��</option>
							<option value="don">���</option>

					</select></td>
				</tr>

				<tr>
		     <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
		           <label style="font-weight: 900;">��ȭ��ȣ</label>
		     </td>
		     <td style="padding: 0 0 15px 15px;">
		       <p style="margin-bottom: 5px;">
		           <select class="selectField" id="tel1" name="tel1" >
		               <option value="">�� ��</option>
		               <option value="010" ${dto.tel1=="010" ? "selected='selected'" : ""}>010</option>
		               <option value="011" ${dto.tel1=="011" ? "selected='selected'" : ""}>011</option>
		               <option value="016" ${dto.tel1=="016" ? "selected='selected'" : ""}>016</option>
		               <option value="017" ${dto.tel1=="017" ? "selected='selected'" : ""}>017</option>
		               <option value="018" ${dto.tel1=="018" ? "selected='selected'" : ""}>018</option>
		               <option value="019" ${dto.tel1=="019" ? "selected='selected'" : ""}>019</option>
		           </select>
		           -
		           <input type="text" name="tel2" value="${dto.tel2}" class="boxTF" maxlength="4">
		           -
		           <input type="text" name="tel3" value="${dto.tel3}" class="boxTF" maxlength="4">
		       </p>
		     </td>
		 </tr>





			</table>

			<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
				<tr height="45">
					<td align="center">
						<button type="button" name="sendButton" class="btn"
							onclick="memberOk();">${mode=="created"?"ȸ������":"��������"}</button>
						<button type="reset" class="btn">�ٽ��Է�</button>
						<button type="button" class="btn"
							onclick="javascript:location.href='<%=cp%>/store/login';">${mode=="created"?"�������":"�������"}</button>
					</td>
				</tr>
				<tr height="30">
					<td align="center" style="color: blue;">${msg}</td>
				</tr>
			</table>
		</form>
	</div>

</div>

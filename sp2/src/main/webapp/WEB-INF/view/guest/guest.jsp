<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript">
$(function(){
	listPage(1);
});

function listPage(page) {
	var url = "<%=cp%>/guest/list"
	var query = "pageNo=" + page;
	
	$.ajax({
		type:"post"
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data) {
			if (data.state == "loginFail") {
				location.href="<%=cp%>/member/login";
			} else {
				printGuest(data);
			}
		}
		,error:function(e) {
			console.log(e.responseText);
		}
	});
}

function printGuest(data) {
	var uid="${sessionScope.member.userId}";
	var total_page=data.total_page;
	var dataCount=data.dataCount;
	var pageNo=data.pageNo;
	var paging=data.paging;
	
	var out="<table style='width: 100%; margin: 10px auto 0px; border-spacing: 0px; border-collapse: collapse;'>";
	out+="  <tr height='35'>";
	out+="     <td width='50%'>";
	out+="        <span style='color: #3EA9CD; font-weight: 700;'>방명록 "+dataCount+"개</span>";
	out+="        <span>[목록, "+pageNo+"/"+total_page+" 페이지]</span>";
	out+="      </td>";
	out+="      <td width='50%'>&nbsp;</td>";
	out+="   </tr>";
	if(dataCount!=0) {
		for(var idx=0; idx<data.list.length; idx++) {
			var num=data.list[idx].num;
			var userName=data.list[idx].userName;
			var userId=data.list[idx].userId;
			var content=data.list[idx].content;
			var created=data.list[idx].created;
			
			out+="    <tr height='35' bgcolor='#eeeeee'>";
			out+="      <td width='50%' style='padding-left: 5px; border:1px solid #cccccc; border-right:none;'>"+ userName+"</td>";
			out+="      <td width='50%' align='right' style='padding-right: 5px; border:1px solid #cccccc; border-left:none;'>" + created;
			if(uid==userId || uid=="admin") {
				out+=" | <a onclick='deleteGuest(\""+num+"\", \""+pageNo+"\");'>삭제</a></td>" ;
			} else {
				out+=" | <a href='#'>신고</a></td>" ;
			}
			out+="    </tr>";
			out+="    <tr style='height: 50px;'>";
			out+="      <td colspan='2' style='padding: 5px;' valign='top'>"+content+"</td>";
			out+="    </tr>";
		}
		out+="    <tr style='height: 35px;'>";
		out+="      <td colspan='2' style='text-align: center;'>";
		out+=paging;
		out+="      </td>";
		out+="    </tr>";
	}
	
	$("#listGuest").html(out);
}

function sendGuest() {
	var url = "<%=cp%>/guest/insert";	
	var query = $("form[name=guestForm]").serialize();
	
	$.ajax({
		type:"post"
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data) {
			var state = data.state;
			if (state == "loginFail") {
				location.href="<%=cp%>/member/login";
			} else {
				$("#content").val("");
				listPage(1);
			}
		}
		,beforeSend:check
		,error:function(e) {
			console.log(e.responseText);
		}
	});
}

function check() {
	var content = $("#content").val().trim();
	if (!content) {
		$("#content").focus();
		return false;
	}
	
	return true;
}

function deleteGuest(num, page) {
	
	var uid = "${sessionScope.member.userId}";
	if (!uid) {
		alert("로그인이 필요 합니다.");
		return;
	}
	
	if(confirm("게시물을 삭제 하시겠습니까 ?")){
	var url="<%=cp%>/guest/delete";
	$.post(url,{num:num}, function(data){
		var state = data.state;
		if (state == "loginFail") {
			location.href = "<%=cp%>/member/login";
			return;
		}
		listPage(page);
	},"json");
	
	<%--var query = "num=" + num + "&pageNo=" + page;
	if(confirm("삭제 하시겠습니까 ?")){
	
		$.ajax({
			type:"post"
			,url:url
			,data:query
			,dataType:"json"
			,success:function(data) {
				if (data.state == "loginFail") {
					locateion.href="<%=cp%>/member/login";
					alert("삭제를 실패했습니다.")
				} else {
					listPage(page);
				}
			}
			,error:function(e) {
				console.log(e.responseText);
			}
		});--%>
		
	} 
}
</script>

</head>

<div class="body-container" style="width: 700px;">
    <div class="body-title">
        <h3><span style="font-family: Webdings">2</span> 방명록 </h3>
    </div>
    
    <div>
    	<form name="guestForm" method="post" action="">
    		<div class="guest-write">
    			<div style="clear: both;">
    				<span style="font-weight: bold;">방명록쓰기</span><span> - 타인을 비방하거나 개인정보를 유출하는 글의 게시를 삼가 주세요.</span>
    			</div>
    			<div style="clear: both; padding-top: 10px;">
    				<textarea name="content" id="content" class="boxTF" rows="3" style="display:block; width: 100%; padding: 6px 12px; box-sizing:border-box;" required="required"></textarea>
    			</div>
    			<div style="text-align: right; padding-top: 10px;">
    				<button type="button" class="btn" onclick="sendGuest();" style="padding:8px 25px;"> 등록하기 </button>
    			</div>
    		</div>
    	</form>
    	<div id="listGuest">
    	
    	</div>
           
 	 </div>
    
</div>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();
%>

<script>
	$(function(){
		$(".cateMenu").click(function() {
			var menuct_Num = $(this).attr("id").substring(4);
			var menu_on = "#main"+menuct_Num;
				
			if ($(menu_on).text().length == 0 || $(menu_on).text() == null) {
				var query = "menuct_Num=" + menuct_Num;
				var url = "<%=cp%>/jumun/menu";
				$.ajax({
					type:"post"
					,url:url
					,data:query
					,dataType:"json"
					,success:function(data) {
						layout1(data.menuList, menu_on);
					}
					,error:function(e) {
						console.log(e.responseText);
					}
				});
			} else {
				if ($(menu_on).css("display") == "block")
					$(menu_on).hide(500);
				else $(menu_on).show(500);
			}
		});
		
		function layout1(list, menu_on) {
			var s = "";
			for (var i = 0; i < list.length; i++) {
				s += "<div onclick='submenu("+list[i].mainmenu_Num+")' style='width: 680px; height: 30px;  line-height: 30px; background-color: #dddddd;'><div style='float: left;'>" + list[i].mainmenu_Title + "</div><div style='float: right;'>" + list[i].mainmenu_Pay + "</div></div>";
				s += "<div id='sub"+list[i].mainmenu_Num+"' style='width:680px; background-color: white; display: none;'>"
				s += "<div>"+list[i].mainmenu_Num + "</div><div class='title'>" + list[i].mainmenu_Title + "</div>";
				s += "<div class='content'>"+list[i].mainmenu_Content + "</div><div>" + list[i].mainmenu_Photo + "</div>";
				s += "<div class='pay'>"+list[i].mainmenu_Pay + "</div><div>" + list[i].mainmenu_Enabled + "</div></div>";
			}
			$(menu_on).html(s);
			$(menu_on).hide();
			$(menu_on).show(500);
		}
	});
	
	function submenu(main_Num) {
		$(function(){
			menu_on = "#sub" + main_Num;
			if ($(menu_on).css("display") == "none") {
				$(menu_on).css("display", "inline-block");
				var query = "mainmenu_Num=" + main_Num;
				var url = "<%=cp%>/jumun/submenu";
				$.ajax({
					type:"post"
					,url:url
					,data:query
					,dataType:"json"
					,success:function(data) {
						layout2(data.subList, menu_on, main_Num);
					}
					,error:function(e) {
						console.log(e.responseText);
					}
				});
			} else {
				
				$(menu_on).hide(500);
			}
		});
		function layout2(list, menu_on, main_Num) {
			var s = "<div id='jum"+main_Num+"' class='jumun'>";
			$(menu_on+" div[class=jumun]").html("");
			for (var i = 0; i < list.length; i++) {
				if (i == 0)
					s += "<div style='font-size: 10px;'>1개 까지 선택 가능</div>";
				s += "<input type='checkbox' name='m"+main_Num+"' value='"+list[i].submenu_Pay+"'>"+list[i].submenu_Title + "(" + list[i].submenu_Pay + "원 추가)&nbsp;&nbsp;&nbsp;&nbsp;";
				s += "<input type='hidden' name='m"+main_Num+"' value='"+list[i].submenu_Title+"'>"; 
				s += "<input type='hidden' name='m"+main_Num+"' value='"+list[i].submenu_Num+"'>";
				if (i == list.length-1)
					s += "<br>";
			}
			s += "<div onclick='damgi("+main_Num+")' style='width:680px; height:40px; background-color: #eeeeee;'>장바구니에 담기</div></div>"
			$(menu_on).css("display","none");
			$(menu_on).append(s);
			$(menu_on).show(500);
			
		}
	}
	
	function damgi(main_Num) {
		$(function(){
			var pay = $("#sub"+main_Num+" div[class=pay]").html();
			var content = $("#sub"+main_Num+" div[class=content]").html();
			var s = "";
			var sub_Num = "";
			if ($("#sub"+main_Num+" input:checkbox[name='m"+main_Num+"']:checked").length >= 2) {
				alert("1개까지만 선택 가능합니다!");
				return;
			}
			$("#sub"+main_Num+" input:checkbox[name='m"+main_Num+"']:checked").each(function(pi, po){
				s = po.value;
				content += " -> " + $("#sub"+main_Num+" input:checkbox[name='m"+main_Num+"']:checked").next().val();
				sub_Num += $("#sub"+main_Num+" input:checkbox[name='m"+main_Num+"']:checked").next().next().val();
			});
			pay = Number(pay);
			s = Number(s);
			pay += s;
			if($("#totalJumun").html() == ""){
				jumunTab(main_Num, sub_Num, content, pay);
			} else {
				jumunAppend(main_Num,sub_Num, content, pay);
			}
			
		});	
		
	}
	var jumun_Num = 0;
	function jumunTab(main_Num, sub_Num, content, pay){
		if ('${sessionScope.member.userId}' == "") {
			location.href = "<%=cp%>/member/login";
			return;	
		}
		var tab = "<form name='jumunForm' method='post' onsubmit='return totalJumun();'>";
		tab += "<div style='width: 300px; float: right;'>";
		tab += "<div>장바구니</div>";
		tab += "<div id='jumunAppend'></div>";
		tab += "<div style='border-top: 1px solid black;'><div style='float: left;'>Total</div><div id='total_Pay' style='float: right;'>0원</div></div><br>";
		tab += "<input type='hidden' name='g1_Name' value='${g1_Name}'>";
		tab += "</div>";
		tab += "<button type='submit' class='btn btn-success' style='width: 300px; float: right;'>주문하기</button>";
		tab += "</form>";
		
		$("#totalJumun").css("display","none");
		$("#totalJumun").html(tab);
		jumunAppend(main_Num, sub_Num, content, pay);
		$("#totalJumun").show(500);
	}
	function jumunAppend(main_Num, sub_Num, content, pay) {
		jumun_Num += 1;
		var total = $("#total_Pay").html();
		total = total.substring(0,total.length-1);
		total = Number(total);
		pay = Number(pay);
		total += pay;
		if (total == pay) 
			$("#jumunAppend").html("");
		var tab = "<div><div id='jn"+jumun_Num+"' onclick='deleteJumun("+jumun_Num+", "+pay+")'><a style='cursor:pointer; float: left'>&nbsp;X&nbsp;</a></div><div style='float: left;'>"+content+"</div><div style='float: right;'>"+pay+"원</div><br>";
		tab += "<input type='hidden' name='main_Num' value='"+main_Num+"'>";
		tab += "<input type='hidden' name='sub_Num' value='"+sub_Num+"'></div>";
		$("#jumunAppend").append(tab);
		$("#total_Pay").html(total+"원");
		
		
	}
	function deleteJumun(juNum,pay) {
		$("#jn"+juNum).parent().html("");
		var total = $("#total_Pay").html();
		total = total.substring(0,total.length-1);
		total -= pay;
		$("#total_Pay").html(total+"원");
		if (total == 0)
			$("#jumunAppend").html("메뉴를 선택해주세요.");
	}
	
	
	function totalJumun() {
		var f = document.jumunForm;
		var mainList = document.getElementsByName('main_Num');
		var subList = document.getElementsByName('sub_Num');
		var mainArray = "";
		var subArray = "";
		for (var i = 0; i < mainList.length; i++) {
			mainArray += mainList[i].value+",";
		}
		for (var i = 0; i < subList.length; i++) {
			subArray += subList[i].value+",";
		}
		mainArray = mainArray.substring(0,mainArray.length-1);
		subArray = subArray.substring(0,subArray.length-1);
		mainArray = mainArray.split(",");
		subArray = subArray.split(",");
		var url = "<%=cp%>/jumun/totalJumun";
		f.action=url;
		return true;
	}
		
</script>
	<div id="giupMenu" style="width: 680px; margin: 100px 0; float: left;">
		<c:forEach var="cateDto" items="${cateList}">
		<div style="margin-bottom: 20px;">
			<div id="cate${cateDto.menuct_Num}" class="cateMenu" style="cursor: pointer; width: 680px; height: 50px; background-color: #cccccc">${cateDto.menuct_Title}</div>
			<div id="main${cateDto.menuct_Num}" class="mainMenu" style="cursor: pointer;"></div>
		</div>
		</c:forEach>
	</div>
<div id="totalJumun" style="font-size: 15px; margin: 100px 0;"></div>

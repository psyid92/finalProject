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
				$(menu_on).html("");
			}
		});
		
		function layout1(list, menu_on) {
			var s = "";
			for (var i = 0; i < list.length; i++) {
				s += "<div onclick='submenu("+list[i].mainmenu_Num+")' style='width: 700px; height: 20px; background-color: #dddddd;'><div style='float: left;'>" + list[i].mainmenu_Title + "</div><div style='float: right;'>" + list[i].mainmenu_Pay + "</div></div>";
				s += "<div id='sub"+list[i].mainmenu_Num+"' style='width:700px; background-color: white; display: none;'>"
				s += "<div>"+list[i].mainmenu_Num + "</div><div class='title'>" + list[i].mainmenu_Title + "</div>";
				s += "<div class='content'>"+list[i].mainmenu_Content + "</div><div>" + list[i].mainmenu_Photo + "</div>";
				s += "<div class='pay'>"+list[i].mainmenu_Pay + "</div><div>" + list[i].mainmenu_Enabled + "</div></div>";
			}
			$(menu_on).html(s);
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
				$(menu_on+" div[class=jumun]").html("");
				$(menu_on).css("display", "none");
			}
		});
		function layout2(list, menu_on, main_Num) {
			var s = "<div class='jumun'>";
			for (var i = 0; i < list.length; i++) {
				if (i == 0)
					s += "<div style='font-size: 10px;'>1개 까지 선택 가능</div>";
				s += "<input type='checkbox' name='m"+main_Num+"' value='"+list[i].submenu_Pay+"'>"+list[i].submenu_Title + "(" + list[i].submenu_Pay + "원 추가)&nbsp;&nbsp;&nbsp;&nbsp;";
				s += "<input type='hidden' name='m"+main_Num+"' value='"+list[i].submenu_Title+"'>"; 
				if (i == list.length-1)
					s += "<br>";
			}
			s += "<button type='button' onclick='damgi("+main_Num+");'>담기</button></div>";
			$(menu_on).append(s);
		}
	}
	
	function damgi(main_Num) {
		$(function(){
			var pay = $("#sub"+main_Num+" div[class=pay]").html();
			var content = $("#sub"+main_Num+" div[class=content]").html();
			var s = "";
			if ($("#sub"+main_Num+" input:checkbox[name='m"+main_Num+"']:checked").length >= 2) {
				alert("1개까지만 선택 가능합니다!");
				return;
			}
			$("#sub"+main_Num+" input:checkbox[name='m"+main_Num+"']:checked").each(function(pi, po){
				s = po.value;
				content += " -> " + $("#sub"+main_Num+" input:checkbox[name='m"+main_Num+"']:checked").next().val();
			});
			pay = Number(pay);
			s = Number(s);
			pay += s;
			if($("#totalJumun").html() == ""){
				jumunTab(content, pay);
			} else {
				jumunAppend(content, pay);
			}
			
		});	
		
	}
	var jumun_Num = 1;
	function jumunTab(content, pay){
		var tab = "<div style='width: 280px; float: right;'>";
		tab += "<div>장바구니</div>";
		tab += "<div><div style='float: left;'>"+content+"</div><a id='jn"+jumun_Num+"' onclick='deleteJumun("+jumun_Num+", "+pay+")' style='cursor:pointer; float: right'>&nbsp;x&nbsp;</a><div style='float: right;'>"+pay+"원</div><br></div><div id='jumunAppend'></div>";
		tab += "<div style='border-top: 1px solid black;'><div style='float: left;'>Total</div><div id='total_Pay' style='float: right;'>"+pay+"원</div></div><br>";
		tab += "</div>";
		tab += "<button type='button' onclick='totalJumun();'>주문하기</button>"
		$("#totalJumun").html(tab);
	}
	function jumunAppend(content, pay) {
		jumun_Num += 1;
		var tab = "<div><div style='float: left;'>"+content+"</div><a id='jn"+jumun_Num+"' onclick='deleteJumun("+jumun_Num+", "+pay+")' style='cursor:pointer; float: right'>&nbsp;x&nbsp;</a><div style='float: right;'>"+pay+"원</div><br></div>";
		$("#jumunAppend").append(tab);
		var total = $("#total_Pay").html();
		total = total.substring(0,total.length-1);
		total = Number(total);
		pay = Number(pay);
		total += pay;
		$("#total_Pay").html(total+"원");
	}
	function deleteJumun(juNum,pay) {
		$("#jn"+juNum).parent().html("");
		var total = $("#total_Pay").html();
		total = total.substring(0,total.length-1);
		total -= pay;
		$("#total_Pay").html(total+"원");
		if ($("#totalJumun").html().length == 0)
			$("#totalJumun").html("선택해주세요")
	}
	
	
	function totalJumun() {
		alert("주문했다!");
	}
		
</script>
	<div id="giupMenu" style="width: 700px; margin: 0; float: left;">
		<c:forEach var="cateDto" items="${cateList}">
			<div id="cate${cateDto.menuct_Num}" class="cateMenu" style="cursor: pointer; width: 700px; height: 50px; background-color: #cccccc">${cateDto.menuct_Title}</div>
			<div id="main${cateDto.menuct_Num}" class="mainMenu" style="margin-bottom: 20px; cursor: pointer;"></div>
		</c:forEach>
	</div>
<div id="totalJumun"></div>
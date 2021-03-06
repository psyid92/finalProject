<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();
%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<%=cp%>/resource/alertify/alertify.js"></script>
<script>
	$(function(){
		if (${result} > 0) {
			$("#likeGiup").hide();
			$("#deLikeGiup").show();
		}
		
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
						$("#cate"+menuct_Num).css("border-bottom-left-radius", "0");
						$("#cate"+menuct_Num).css("border-bottom-right-radius", "0");
						$("#main"+menuct_Num+" > div:last").prev().css("border-bottom-left-radius","5px");
						$("#main"+menuct_Num+" > div:last").prev().css("border-bottom-right-radius","5px");
					}
					,error:function(e) {
						console.log(e.responseText);
					}
				});
			} else {
				if ($(menu_on).css("display") == "block") {
					$(menu_on).hide(500, function(){
						$("#cate"+menuct_Num).css("border-bottom-left-radius", "5px");
						$("#cate"+menuct_Num).css("border-bottom-right-radius", "5px");
					});
				}
				else {
					$("#cate"+menuct_Num).css("border-bottom-left-radius", "0");
					$("#cate"+menuct_Num).css("border-bottom-right-radius", "0");
					$(menu_on).show(500);
				}
			}
		});
		
		function layout1(list, menu_on) {
			var s = "";
			for (var i = 0; i < list.length; i++) {
				$(function(){
					var url = "<%=cp%>/uploads/photo/"+list[i].mainmenu_Photo;
					var no_Img = "<%=cp%>/resource/img/no_img.png";
					var img_on = "#img"+list[i].mainmenu_Num;
					$.ajax({
					    url: url,
					    type: 'HEAD',
					    success: function () {
					         $(img_on).append("<img src='"+url+"' style='width:500px; height: 300px;'></img>")
					    },
					    error: function () {
					    	 $(img_on).append("<img src='"+no_Img+"' style='width:250px; height: 250px;'></img>")
					    }
					});
				});
				s += "<div onclick='submenu("+list[i].mainmenu_Num+")' style='width: 680px; height: 30px;  line-height: 30px; background-color: #dddddd;'><div style='float: left;'>" + list[i].mainmenu_Title + "</div><div style='float: right;'>" + list[i].mainmenu_Pay + "</div></div>";
				s += "<div id='sub"+list[i].mainmenu_Num+"' style='width:680px; background-color: white; display: none;'>"
				s += "<div>"+list[i].mainmenu_Num + "</div><div class='title'>" + list[i].mainmenu_Title + "</div>";
				s += "<div class='content'>"+list[i].mainmenu_Content + "</div><div id='img"+list[i].mainmenu_Num+"'></div>";
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
			$(menu_on).prev().css("border-bottom-left-radius", "0");
			$(menu_on).prev().css("border-bottom-right-radius", "0");
			
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
						$(menu_on).parent().children().last().children().last().children().last().css("border-bottom-left-radius", "5px");
						$(menu_on).parent().children().last().children().last().children().last().css("border-bottom-right-radius", "5px");
					}
					,error:function(e) {
						console.log(e.responseText);
					}
				});
			} else {
				$(menu_on).hide(500,function(){
					if ($(menu_on).parent().children().last().css("display") == "none") {
						$(menu_on).parent().children().last().prev().css("border-bottom-left-radius", "5px");
						$(menu_on).parent().children().last().prev().css("border-bottom-right-radius", "5px");
					};
				});
			}
		});
		function layout2(list, menu_on, main_Num) {
			var s = "<div id='jum"+main_Num+"' class='jumun'>";
			$(menu_on+" div[class=jumun]").html("");
			for (var i = 0; i < list.length; i++) {
				if (i == 0)
					s += "<div id='msg' style='font-size: 12px;'>1개 까지 선택 가능</div>";
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
				$("#msg").css("color","red");
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
			$("#msg").css("color","black");
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
		$(".btn").prop("disabled",false);
		
	}
	function deleteJumun(juNum,pay) {
		$("#jn"+juNum).parent().html("");
		var total = $("#total_Pay").html();
		total = total.substring(0,total.length-1);
		total -= pay;
		$("#total_Pay").html(total+"원");
		if (total == 0) {
			$("#jumunAppend").html("메뉴를 선택해주세요.");
			$(".btn").prop("disabled",true);
		}
	}
	
	
	function totalJumun() {
		if ($("#total_Pay").html() == "0원") {
			return false;
		}
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
	$(function(){
		$("#likeGiup").click(function() {
			var m1_Num = "${sessionScope.member.m1_Num}";
			if (m1_Num == null || m1_Num == "") {
				m1_Num = "loginFail";
				location.href = "<%=cp%>/member/login";
				return;
			}
			alertify.confirm("${g1_Name}을 찜 하시겠습니까?", function(e){
				if (e) {
					var url = "<%=cp%>/jumun/likeGiup";
					var query = "g1_Num="+${g1_Num}+"&m1_Num="+m1_Num;
					$.ajax({
						type:"post"
						,url:url
						,data:query
						,dataType:"json"
						,success:function(data) {
							if (data.state > 0) {
								$("#likeGiup").hide();
								$("#deLikeGiup").show();
							}
						}
						,error:function(e) {
							console.log(e.responseText);
						}
					});
				}
			});
		});
		$("#deLikeGiup").click(function() {
			alertify.confirm("${g1_Name}을 찜 풀기 하시겠습니까?", function(e){
			if (e) {
			var url = "<%=cp%>/jumun/deLikeGiup";
			var m1_Num = "${sessionScope.member.m1_Num}";
			if (m1_Num == null || m1_Num == "") {
				m1_Num = "loginFail";
				location.href = "<%=cp%>/member/login";
			}
			var query = "g1_Num="+${g1_Num}+"&m1_Num="+m1_Num;
			$.ajax({
				type:"post"
				,url:url
				,data:query
				,dataType:"json"
				,success:function(data) {
					if (data.state > 0) {
						$("#deLikeGiup").hide();
						$("#likeGiup").show();
					}
				}
				,error:function(e) {
					console.log(e.responseText);
				}
			});
			}
			});
		});
	});
</script>
<style>
#review > div > div {
	padding: 5px 30px;
}
#like {
	cursor: pointer;
}
</style>

<div id="like">
	<div id="likeGiup" style="margin: 50px 0px;">
		<i class="glyphicon glyphicon-heart-empty" style="float: left; color: red;"></i><div style="float: left;">${g1_Name} 찜 하기</div><i class="glyphicon glyphicon-heart-empty" style="color: red;"></i>
	</div>
	<div id="deLikeGiup" style="margin: 50px 0px; display: none;">
		<i class="glyphicon glyphicon-heart" style="float: left; color: red;"></i><div style="float: left;">${g1_Name} 찜 풀기</div><i class="glyphicon glyphicon-heart" style="color: red;"></i>
	</div>
</div>
<div style="width: 680px; float: left;">
	<div id="giupMenu" style="width: 680px; margin-bottom: 50px;">
		<c:forEach var="cateDto" items="${cateList}">
			<div style="margin-bottom: 20px;">
				<div id="cate${cateDto.menuct_Num}" class="cateMenu" style="cursor: pointer; width: 680px; height: 50px; background-color: #cccccc; border-radius: 5px;">${cateDto.menuct_Title}</div>
				<div id="main${cateDto.menuct_Num}" class="mainMenu" style="cursor: pointer;"></div>
			</div>
		</c:forEach>
	</div>
	<div id="review" style="width:680px; margin: 0;">
		<div style="width: 680px; border-top: 1px solid black;border-left: 1px solid black;border-right: 1px solid black; border-radius: 4px;">
			<div style="border-bottom: 1px solid black;">
				<div style="font-size: 40px; font-weight: 900; text-align: center;">리뷰</div>
			</div>
			<c:if test="${empty reviewList}">
				<div style="border-bottom: 1px solid black;">
					<div style="width: 100%; height: 400px; background-image: url('<%=cp%>/resource/img/no_review.png'); background-repeat:no-repeat; background-position:center center;"></div>
				</div>
			</c:if>
			<c:forEach var="dto" items="${reviewList}">
				<div style="height: 38px;">
				<div style="float: left;">
					<div>${dto.m1_Nickname} | ${dto.rep_Created }</div>
				</div>
				<div style="float: right;">
					<div style="color: orange;">
						<c:forEach begin="1" end="${dto.rep_Star}">★</c:forEach>
						<c:forEach begin="1" end="${5 - dto.rep_Star}">☆</c:forEach>
					</div>
				</div></div>
				<div id="border${dto.rep_Num}" style="border-bottom: 1px solid black;">
					<div>${dto.rep_Content}
						<c:if test="${not empty dto.rphoto_SaveFilename }">
						<script type="text/javascript">
						var url = "<%=cp%>/uploads/giupReview/${dto.rphoto_SaveFilename}";
						var no_Img = "<%=cp%>/resource/img/no_img.png";
						var img_on = "#reImg"+${dto.rep_Num};
						$.ajax({
						    url: url,
						    type: 'HEAD',
						    success: function () {
						         $(img_on).append("<img style='width:100%; height:100%;' src="+url+">")
						    },
						    error: function () {
						    	 $(img_on).append("<img src="+no_Img+">")
						    }
						});
						</script>
							<div id="reImg${dto.rep_Num}"></div>
						</c:if>
					</div>
				</div>
				<c:forEach var="ddto" items="${replyListMap[dto.rep_Num]}" varStatus="status">
					<script type="text/javascript">$(function(){$("#border"+${dto.rep_Num}).css("border-bottom","1px solid #cccccc")});</script>
					<div>
						<div>사장님 | ${ddto.rrep_Created}</div>
					</div>
					<c:if test="${replyListMap[dto.rep_Num].size()-1 != status.index}">
						<div style="border-bottom: 1px solid #cccccc;">
							<div>${ddto.rrep_Content}</div>
						</div>
					</c:if>
					<c:if test="${replyListMap[dto.rep_Num].size()-1 == status.index}">
						<div style="border-bottom: 1px solid black;">
							<div>${ddto.rrep_Content}</div>
						</div>
					</c:if>
				</c:forEach>
			</c:forEach>
		</div>
	</div>
</div>
<div id="totalJumun" style="font-size: 15px; float: right; width: 300px;"></div>

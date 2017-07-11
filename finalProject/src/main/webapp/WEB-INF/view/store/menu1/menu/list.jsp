<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<script>

$(function(){
	$("body").on("click", ".cateMenu", function() {
		var menuct_Num = $(this).attr("id").substring(4);
		var menu_on = "#main"+menuct_Num;
		if ($(menu_on).text().length == 0 || $(menu_on).text() == null) {
			var query = "menuct_Num=" + menuct_Num; 
			var url = "<%=cp%>/store/menu/mainMenuList";
			$.ajax({
				type:"post"
				,url:url
				,data:query
				,dataType:"json"
				,success:function(data) {
					layout1(data.mainmenulist, menu_on, menuct_Num);
				}
				,error:function(e) {
					console.log(e.responseText);
				
				}
			});
		} else {
			$(menu_on).html("");
		}
	});
	 
	function layout1(list, menu_on, menuct_Num) {
		var s = ""; 
			s+="<div id='maininput' style='margin: 10px 3px;'>"; 
			s+="<input type='text' id='mainmenu_Title"+menuct_Num+"' class='boxTF' style='width:190px;' placeholder='메인메뉴 이름'>&nbsp;";
			s+="<input type='text' id='mainmenu_Content"+menuct_Num+"' class='boxTF' style='width:190px;' placeholder='메인메뉴 정보'>&nbsp;";
			s+="<input type='text' id='mainmenu_Photo"+menuct_Num+"' class='boxTF' style='width:190px;' placeholder='메인메뉴 사진'>&nbsp;";
			s+="<input type='text' id='mainmenu_Pay"+menuct_Num+"' class='boxTF' style='width:190px;' placeholder='메인메뉴 가격'>&nbsp;";
			s+="<button type='button' onclick=\"insertMainmenu('"+menuct_Num+"');\" class='btn'>메인메뉴추가</button>";
			s+="</div>";
		for (var i = 0; i < list.length; i++) {
			s += "<div onclick='submenu("+list[i].mainmenu_Num+")' style='width: 680px; height: 30px;  line-height: 30px; background-color: #dddddd;'><div style='float: left;'>" + list[i].mainmenu_Title
			s += "</div><div style='float: right;'>" + list[i].mainmenu_Pay + "</div></div>";
			s += "<div id='sub"+list[i].mainmenu_Num+"' style='width:700px; background-color: white; display: none;'>"
			s += "<div>"+list[i].mainmenu_Num + "</div><div class='title'>" + list[i].mainmenu_Title + "</div>";
			s += "<div class='content'>"+list[i].mainmenu_Content + "</div><div>" + list[i].mainmenu_Photo + "</div>";
			s += "<div class='pay'>"+list[i].mainmenu_Pay + "</div><div>" + list[i].mainmenu_Enabled + "</div>"; 
			s += "<span class='btnDelete' onclick=\"deleteMainmenu('"+list[i].mainmenu_Num+"');\">삭제</span></div>";
		}
		$(menu_on).html(s);
	}
});  

function submenu(mainmenu_Num) { 
	$(function(){
		menu_on = "#sub" + mainmenu_Num; 
		if ($(menu_on).css("display") == "none") {
			$(menu_on).css("display", "inline-block");
			var query = "mainmenu_Num=" + mainmenu_Num;
			var url = "<%=cp%>/store/menu/subMenuList";
			$.ajax({
				type:"post"
				,url:url
				,data:query
				,dataType:"json"
				,success:function(data) {
					layout2(data.submenulist, menu_on, mainmenu_Num,data.submenu_Num);
				}
				,error:function(e) {
					console.log(e.responseText);
				}
			});
		} else {
			$(menu_on+" div[class=store]").html("");
			$(menu_on).css("display", "none");
		}
	});
	function layout2(list, menu_on, mainmenu_Num, submenu_Num) { 
		var s = "<div class='store'>";
		s+="<div id='submenu' style='margin: 10px 3px;'>"; 
		s+="<input type='text' id='submenu_Title"+mainmenu_Num+"' class='boxTF' style='width:190px;'>&nbsp;";
		s+="<input type='text' id='submenu_Pay"+mainmenu_Num+"' class='boxTF' style='width:190px;'>&nbsp;";
		s+="<button type='button' onclick=\"insertSubmenu('"+mainmenu_Num+"');\" class='btn'>서브메뉴추가</button>";
		s+="</div>";
		for (var i = 0; i < list.length; i++) { 
			if (i == 0)
			s += "<div style='font-size: 10px;'>서브메뉴</div>";
			s += "<div><input type='hidden' name='m"+mainmenu_Num+"' value='"+list[i].submenu_Pay+"'>"+list[i].submenu_Title + "(" + list[i].submenu_Pay + "원 추가)&nbsp;&nbsp;&nbsp;&nbsp;";
			s += "<input type='hidden' name='m"+mainmenu_Num+"' value='"+list[i].submenu_Title+"'>"; 
			s += "<input type='hidden' name='m"+mainmenu_Num+"' value='"+list[i].submenu_Num+"'>";
			s += "<button class='btnDelete' onclick=\"deleteSubmenu('"+list[i].submenu_Num+"');\">삭제</button></div>"; 
			if (i == list.length-1) 
				s += "<br>";
		}
		$(menu_on).append(s);
	} 
5}

//메뉴 카테고리 추가하기
function insertMenuct() {
	var menuct_Title=$("#menuct_Title").val();
	if(!menuct_Title) {
		$("#menuct_Title").focus();
		return;
	}
	var menuct_Info=$("#menuct_Info").val();
	if(!menuct_Info) {
		$("#menuct_Info").focus();
		return;
	}
	$.post("<%=cp%>/store/menu/insertMenuCT", {menuct_Title:menuct_Title, menuct_Info:menuct_Info, g1_Num:${sessionScope.store.g1_Num}}, function(data){
		var menuct_Num;
		var state=data.state;
		if(state=="false") {
			alert("추가하지 못했습니다.");
			return;
		} 
		menuct_Num=data.menuct_Num;
		$("#menuct_Title").val("");
		$("#menuct_Info").val("");
		
		var s = "";
		s += '<div id="cate'+menuct_Num+'" class="cateMenu" style="cursor: pointer; width: 680px; height: 50px; background-color: #cccccc">';
		s += menuct_Title;  
		s += '<br>'+menuct_Info;
		s += '<button class="btnDelete" onclick="deletemenuct('+menuct_Num+')" style="float: right;">삭제</button></div>';
		s += '<div id="main'+menuct_Num+'" class="mainMenu" style="margin-bottom: 20px; cursor: pointer;"></div>';
		s += "<div style='margin: 10px 3px;'>";
		s += "</div>"; 
		$("#giupMenu").append(s);
	}, "json");
}
//메인 메뉴 추가
function insertMainmenu(menuct_Num) {
	var mainmenu_Title=$("#mainmenu_Title"+menuct_Num).val();
	if(! mainmenu_Title) {
		$("#mainmenu_Title"+menuct_Num).focus();
		return;
	}
	var mainmenu_Content=$("#mainmenu_Content"+menuct_Num).val();
	if(! mainmenu_Content) {
		$("#mainmenu_Content"+menuct_Num).focus();
		return;
	}
	var mainmenu_Photo=$("#mainmenu_Photo"+menuct_Num).val();
	if(! mainmenu_Photo) {
		$("#mainmenu_Photo"+menuct_Num).focus();
		return;
	}
	var mainmenu_Pay=$("#mainmenu_Pay"+menuct_Num).val();
	if(! mainmenu_Pay) {
		$("#mainmenu_Pay"+menuct_Num).focus();
		return;
	}
	
	$.post("<%=cp%>/store/menu/insertMainMenu", {mainmenu_Title:mainmenu_Title, mainmenu_Content:mainmenu_Content, mainmenu_Photo:mainmenu_Photo, mainmenu_Pay:mainmenu_Pay, menuct_Num:menuct_Num}, function(data){
		var mainmenu_Num;
		var state=data.state;
		var list = data.mainmenulist;
		
		if(state=="false") {
			alert("추가하지 못했습니다.");
			return;
		} 
		mainmenu_Num=data.mainmenu_Num;
		$("#mainmenu_Title"+menuct_Num).val("");
		$("#mainmenu_Content"+menuct_Num).val("");
		$("#mainmenu_Photo"+menuct_Num).val("");
		$("#mainmenu_Pay"+menuct_Num).val("");
		
		// 자식 노드 개수
		var cnt= $("#main"+menuct_Num).children().size();
		
		var s=""; 
		if(cnt==0)
			s +="<div id='cate"+list[i].mainmenu_Num+"' style='border: 1px solid #ccc; padding: 5px;'>";
		else{
			alert(list.length);
			for (var i = 0; i < list.length; i++) {
				s += "<div onclick='submenu("+list[i].mainmenu_Num+")' style='width: 680px; height: 30px;  line-height: 30px; background-color: #dddddd;'><div style='float: left;'>" + list[i].mainmenu_Title;
				s += "</div><div style='float: right;'>" + list[i].mainmenu_Pay + "</div></div>";
				s += "<div id='sub"+list[i].mainmenu_Num+"' style='width:700px; background-color: white; display: none;'>";
				s += "<div>"+list[i].mainmenu_Num + "</div><div class='title'>" + list[i].mainmenu_Title + "</div>";
				s += "<div class='content'>"+list[i].mainmenu_Content + "</div><div>" + list[i].mainmenu_Photo + "</div>";
				s += "<div class='pay'>"+list[i].mainmenu_Pay + "</div><div>" + list[i].mainmenu_Enabled + "</div>"; 
				s += "<span class='btnDelete' onclick=\"deleteMainmenu('"+list[i].mainmenu_Num+"');\">삭제</span></div>";
			}
		} 
		$("#maininput").next().html(s);
	}, "json"); 
}
//서브 메뉴 추가
function insertSubmenu(mainmenu_Num) {
	var submenu_Title=$("#submenu_Title"+mainmenu_Num).val();
	if(! submenu_Title) {
		$("#submenu_Title"+mainmenu_Num).focus();
		return;
	}
	var submenu_Pay=$("#submenu_Pay"+mainmenu_Num).val();
	if(! submenu_Pay) {
		$("#submenu_Pay"+mainmenu_Num).focus();
		return;
	}
	
	$.post("<%=cp%>/store/menu/insertSubMenu", {submenu_Title:submenu_Title, submenu_Pay:submenu_Pay, mainmenu_Num:mainmenu_Num}, function(data){
		var submenu_Num;  
		var state=data.state;
		var list = data.submenulist;
		if(state=="false") {
			alert("추가하지 못했습니다.");
			return;
		} 
		
		submenu_Num=data.submenu_Num;
		$("#submenu input").val("");
		
		// 자식 노드 개수
		var cnt= $(".store").children().size();
		
		var s=""; 
		if(cnt==0)
			s +="<div id='submenu_Title"+submenu_Num+"' style='border: 1px solid #ccc; padding: 5px;'>";
		else{
			for (var i = 0; i < list.length; i++) { 
				s += "<div><input type='hidden' name='m"+mainmenu_Num+"' value='"+list[i].submenu_Pay+"'>"+list[i].submenu_Title + "(" + list[i].submenu_Pay + "원 추가)&nbsp;&nbsp;&nbsp;&nbsp;";
				s += "<input type='hidden' name='m"+mainmenu_Num+"' value='"+list[i].submenu_Title+"'>"; 
				s += "<input type='hidden' name='m"+mainmenu_Num+"' value='"+list[i].submenu_Num+"'>";
				s += "<button class='btnDelete' onclick=\"deleteSubmenu('"+list[i].submenu_Num+"');\">삭제</button></div>"; 
			}
		}
		$("#submenu").next().next().html(s); 
		
	}, "json");
}

//메뉴카테 삭제
function deletemenuct(menuct_Num) {
	if(!confirm("삭제하시겠습니까?")) {
		return;
	}
	$.post("<%=cp%>/store/menu/deleteMenuCT", {menuct_Num:menuct_Num}, function(data){
		if(data.state=="false") {
			alert("삭제를 실패했습니다.");
			return;
		}
		
		$("#cate"+menuct_Num).remove();
		$("#main"+menuct_Num).remove();  
	},"json");
}

//메인메뉴 삭제
function deleteMainmenu(mainmenu_Num) {
	if(!confirm("삭제하시겠습니까?")) {
		return;
	}
	
	$.post("<%=cp%>/store/menu/deleteMainMenu", {mainmenu_Num:mainmenu_Num}, function(data){
		if(data.state=="false") {
			alert("삭제를 실패했습니다.");
			return;
		}
		$("#main"+mainmenu_Num).remove();
	},"json");
}

//서브메뉴 삭제
function deleteSubmenu(submenu_Num) {
	if(!confirm("삭제하시겠습니까?")) {
		return;
	}
	$.post("<%=cp%>/store/menu/deleteSubMenu", {submenu_Num:submenu_Num}, function(data){
		if(data.state=="false") {
			alert("삭제를 실패했습니다.");
			return;
		}
		
		$("#submenu"+submenu_Num).remove();
		
	},"json");
}
</script>
<div class="storeBodyFrame2">
    <div class="body-title"> 
          <h3>메뉴 관리 </h3>
    </div>
    <div>
    	내 업소 명 <br>
    	${sessionScope.store.g1_Name} <br>
	<div style="margin-top: 20px;">
          <input type="text" id="menuct_Title" class="boxTF" style="width: 210px;" placeholder="카테고리명">
          <input type="text" id="menuct_Info" class="boxTF" style="width: 210px;" placeholder="카테고리 정보">
         <button type="button" onclick="insertMenuct();" class="btn">추가</button>
    </div> 
         <div id="giupMenu" style="width: 680px; margin: 0; float: left;"> 
			<c:forEach var="mystoreDto" items="${menuctlist}">
				<div id="cate${mystoreDto.menuct_Num}" class="cateMenu" style="cursor: pointer; width: 680px; height: 50px; background-color: #cccccc">
					${mystoreDto.menuct_Title}
				<br>${mystoreDto.menuct_Info}
				<button class='btnDelete' onclick="deletemenuct(${mystoreDto.menuct_Num})" style="float: right;">삭제</button></div>
				<div id="main${mystoreDto.menuct_Num}" class="mainMenu" style="margin-bottom: 20px; cursor: pointer;"></div>
			</c:forEach>
		</div>
   </div>
</div>
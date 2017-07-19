<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.form.js"></script>
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
	 
});  

function layout1(list, menu_on, menuct_Num, path) {
	var s = "";
		s+="<form name='mainmenuForm"+menuct_Num+"' method='post' enctype='multipart/form-data'>";
		s+="<div id='maininput' style='margin: 10px 3px;'>";
		s+="<input type='text' id='mainmenu_Title"+menuct_Num+"' 	name='mainmenu_Title' class='boxTF' style='width:190px;' placeholder='메인메뉴 이름'>&nbsp;";
		s+="<input type='text' id='mainmenu_Content"+menuct_Num+"'  name='mainmenu_Content' class='boxTF' style='width:190px;' placeholder='메인메뉴 정보'>&nbsp;";
		s+="<input type='file' name='upload' class='boxTF'>&nbsp;";
		s+="<input type='text' id='mainmenu_Pay"+menuct_Num+"' 		name='mainmenu_Pay' class='boxTF' style='width:190px;' placeholder='메인메뉴 가격'>&nbsp;";
		s+="<input type='hidden' id='menuct_Num' name='menuct_Num' value="+menuct_Num+">";
		s+="<button type='button' onclick='insertMainmenu("+menuct_Num+");' class='btn'>메인메뉴추가</button>";
		s+="</div></form>";
	for (var i = 0; i < list.length; i++) {
		s += "<div id='mainmenu"+list[i].mainmenu_Num+"'><div onclick='submenu("+list[i].mainmenu_Num+")' style='width: 680px; height: 30px;  line-height: 30px; background-color: #dddddd;'><div style='float: left;'>" + list[i].mainmenu_Title+"</div>";
		s += "<button id=main"+list[i].mainmenu_Num+" onclick='updateMainMenu("+list[i].mainmenu_Num+")' style='float:right; height: 26px; line-height: 20px;'>삭제</button><div style='float: right;'>" + list[i].mainmenu_Pay + "</div></div>";
		s += "<div id='sub"+list[i].mainmenu_Num+"' style='width:700px; background-color: white; display: none;'>"
		s += "<div>"+list[i].mainmenu_Num + "</div><div class='title'>" + list[i].mainmenu_Title + "</div>";
		s += "<div class='content'>"+list[i].mainmenu_Content + "</div>";
		if(list[i].mainmenu_Photo!=null)
		   s += "<img src='<%=cp%>/uploads/photo/"+list[i].mainmenu_Photo+"' style='width:70%; height:70%;'>";
		s += "<div class='pay'>"+list[i].mainmenu_Pay + "</div><div>" + list[i].mainmenu_Enabled + "</div>"; 
		s += "<input type='text' id='submenu_Title"+list[i].mainmenu_Num+"' class='boxTF' style='width:190px;' placeholder='서브메뉴 이름'>&nbsp;"
		s += "<input type='text' id='submenu_Pay"+list[i].mainmenu_Num+"' class='boxTF' style='width:190px;' placeholder='서브메뉴 가격'>&nbsp;"
		s += "<button type='button' onclick='insertSubMenu("+list[i].mainmenu_Num+")' class='btn'>서브메뉴 추가</button><br><div id='addSubMenu"+list[i].mainmenu_Num+"'></div></div></div>";
	}
	$(menu_on).html(s);
}

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
		s += '<button class="btnupdate" onclick="updatemenuct('+menuct_Num+')" style="float: right;">삭제</button></div>';
		s += '<div id="main'+menuct_Num+'" class="mainMenu" style="margin-bottom: 20px; cursor: pointer;"></div>';
		s += "<div style='margin: 10px 3px;'>";
		s += "</div>"; 
		$("#giupMenu").append(s);
	}, "json");
}

// 메인메뉴 추가
function insertMainmenu(menuct_Num) {
	
	var mainmenu_Title=$("#mainmenu_Title"+menuct_Num).val();
	var mainmenu_Content=$("#mainmenu_Content"+menuct_Num).val();
	var mainmenu_Pay=$("#mainmenu_Pay"+menuct_Num).val();
	
	if(!mainmenu_Title) {
		$("#mainmenu_Title"+menuct_Num).focus();
		return;
	} 
	if(!mainmenu_Content) {
		$("#mainmenu_Content"+menuct_Num).focus();
		return;
	}
	if(!mainmenu_Pay) {
		$("#mainmenu_Pay"+menuct_Num).focus();
		return;
	}
	
	var mm="mainmenuForm"+menuct_Num;
	var f=document.forms.namedItem( mm );
	var formData = new FormData(f);
	
	$.ajax({ 
		 type:"post" 
		 ,url:"<%=cp%>/store/menu/insertMainMenu"
		 ,processData: false  // file 전송시 필수
         ,contentType: false  // file 전송시 필수
         ,data: formData
		 ,dataType:"json"
		 ,success:function(data) {
		 	var state=data.state;
			var list = data.mainmenulist;
			if(state=="false"){
				alert("게시물을 추가하지 못했습니다. !!!");
				return;
			} 
			$("#mainmenu_Title"+menuct_Num).val("");
			$("#mainmenu_Content"+menuct_Num).val("");
			$("[name='upload']").val("");
			$("#mainmenu_Pay"+menuct_Num).val("");
			var s = "";
				s+="<form name='mainmenuForm"+menuct_Num+"' method='post' enctype='multipart/form-data'>";
				s+="<div id='maininput' style='margin: 10px 3px;'>"; 
				s+="<input type='text' id='mainmenu_Title"+menuct_Num+"' name='mainmenu_Title' class='boxTF' style='width:190px;' placeholder='메인메뉴 이름'>&nbsp;";
				s+="<input type='text' id='mainmenu_Content"+menuct_Num+"' name='mainmenu_Content' class='boxTF' style='width:190px;' placeholder='메인메뉴 정보'>&nbsp;";
				s+="<input type='file' name='upload' class='boxTF'>&nbsp;";
				s+="<input type='text' id='mainmenu_Pay"+menuct_Num+"' name='mainmenu_Pay' class='boxTF' style='width:190px;' placeholder='메인메뉴 가격'>&nbsp;";
				s+="<button type='button' onclick='insertMainmenu("+menuct_Num+");' class='btn'>메인메뉴추가</button>"
				s+="<input type='hidden' id='menuct_Num'  name='menuct_Num' value="+menuct_Num+">";
				s+="</div></form>";
			for (var i = 0; i < list.length; i++) {   
				s += "<div id='mainmenu"+list[i].mainmenu_Num+"'><div id=main"+list[i].mainmenu_Num+" onclick='submenu("+list[i].mainmenu_Num+")' style='width: 680px; height: 30px;  line-height: 30px; background-color: #dddddd;'><div style='float: left;'>" + list[i].mainmenu_Title+"</div>";
				s += "<button onclick='updateMainMenu("+list[i].mainmenu_Num+")' style='float:right; height: 26px; line-height: 20px;'>삭제</button><div style='float: right;'>" + list[i].mainmenu_Pay + "</div></div>";
				s += "<div id='sub"+list[i].mainmenu_Num+"' style='width:700px; background-color: white; display: none;'>"
				s += "<div>"+list[i].mainmenu_Num + "</div><div class='title'>" + list[i].mainmenu_Title + "</div>";
				s += "<div class='content'>"+list[i].mainmenu_Content + "</div>";  
				if(list[i].mainmenu_Photo!=null)
					s += "<img src='<%=cp%>/uploads/photo/"+list[i].mainmenu_Photo+"' style='width:70%; height:70%;'>";
				s += "<div class='pay'>"+list[i].mainmenu_Pay + "</div><div>" + list[i].mainmenu_Enabled + "</div>";
				s += "<input type='text' id='submenu_Title"+list[i].mainmenu_Num+"' class='boxTF' style='width:190px;' placeholder='서브메뉴 이름'>&nbsp;"
				s += "<input type='text' id='submenu_Pay"+list[i].mainmenu_Num+"' class='boxTF' style='width:190px;' placeholder='서브메뉴 가격'>&nbsp;"
				s += "<button type='button' onclick='insertSubMenu("+list[i].mainmenu_Num+")' class='btn'>서브메뉴 추가</button><br><div id='addSubMenu"+list[i].mainmenu_Num+"'></div></div>";
				
			}
			$("#main"+menuct_Num).html(s); 
		}
		,error:function(e) {
			console.log(e.responseText);
		}
	});
	
}

function submenu(mainmenu_Num) {
	$.post("<%=cp%>/store/menu/subMenuList", {mainmenu_Num:mainmenu_Num }, function(data){
		var list = data.submenulist;
		
		var s = "";
		for (var i = 0; i < list.length; i++) {
			s += "<div id=submen"+list[i].submenu_Num+"><div style='float:left;'>"+list[i].submenu_Title+"</div><div style='float:left;'>("+list[i].submenu_Pay+"원 추가)</div><button type='button' onclick='updateSubMenu("+list[i].submenu_Num+")'>삭제</button></div>";
		}
		$("#addSubMenu"+mainmenu_Num).html(s);
	}, "json");
	$(function(){
		if ($("#sub"+mainmenu_Num).css("display") == "none")
			$("#sub"+mainmenu_Num).show();
		else $("#sub"+mainmenu_Num).hide();
	});
}

// 서브메뉴 추가
function insertSubMenu(mainmenu_Num) {
	var submenu_Title=$("#submenu_Title"+mainmenu_Num).val();
	var submenu_Pay=$("#submenu_Pay"+mainmenu_Num).val();
	
	if(!submenu_Title) {
		$("#submenu_Title"+mainmenu_Num).focus();
		return;
	}
	if(!submenu_Pay) {
		$("#submenu_Pay"+mainmenu_Num).focus();
		return;
	}
	
	$.post("<%=cp%>/store/menu/insertSubMenu", {submenu_Title:submenu_Title, submenu_Pay:submenu_Pay, mainmenu_Num:mainmenu_Num }, function(data){
		var state=data.state;
		var list = data.submenulist;
		if(state=="false") {
			alert("추가하지 못했습니다.");
			return;
		} 
		$("#submenu_Title"+mainmenu_Num).val("");
		$("#submenu_Pay"+mainmenu_Num).val("");
		var s = "";
		for (var i = 0; i < list.length; i++) {
			s += "<div id=submen"+list[i].submenu_Num+"><div style='float:left;'>"+list[i].submenu_Title+"</div><div style='float:left;'>("+list[i].submenu_Pay+"원 추가)</div><button type='button' onclick='updateSubMenu("+list[i].submenu_Num+")'>삭제</button></div>";
		}
		$("#addSubMenu"+mainmenu_Num).html(s);
	}, "json");
}
</script>
<script>
//메뉴카테 삭제
function updatemenuct(menuct_Num) {
	if(!confirm("삭제하시겠습니까?")) {
		return;
	}
	$.post("<%=cp%>/store/menu/updateMenuCT", {menuct_Num:menuct_Num}, function(data){
		if(data.state=="false") {
			alert("삭제를 실패했습니다.");
			return;
		}
		   
		$("#cate"+menuct_Num).remove();
		$("#main"+menuct_Num).remove();  
	},"json");
}
 
// 메인메뉴 삭제
function updateMainMenu(mainmenu_Num) {
	if(!confirm("삭제하시겠습니까?")) {
		return;
	}
	$.post("<%=cp%>/store/menu/updateMainMenu", {mainmenu_Num:mainmenu_Num}, function(data){
		if(data.state=="false") { 
			alert("삭제를 실패했습니다.");
			return;
		}
		$("#mainmenu"+mainmenu_Num).remove();
		$("#main"+mainmenu_Num).remove();
		$("#sub"+mainmenu_Num).remove();
	}, "json");
}

// 서브메뉴 삭제
function updateSubMenu(submenu_Num) { 
	if(!confirm("삭제하시겠습니까?")) {
		return;
	} 
	$.post("<%=cp%>/store/menu/updateSubMenu", {submenu_Num:submenu_Num}, function(data){
		if(data.state=="false") {
			alert("삭제를 실패했습니다.");
			return;
		}
		$("#submen"+submenu_Num).remove();
	}, "json");
}

</script>
<div class="storeBodyFrame2">
    <div class="body-title">
          <h3><span class="glyphicon glyphicon-cutlery"></span> 메뉴관리 </h3>
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
				<button class='btnupdate' onclick="updatemenuct(${mystoreDto.menuct_Num})" style="float: right;">삭제</button></div>
				<div id="main${mystoreDto.menuct_Num}" class="mainMenu" style="margin-bottom: 20px; cursor: pointer;"></div>
			</c:forEach>
		</div>
   </div>
</div>
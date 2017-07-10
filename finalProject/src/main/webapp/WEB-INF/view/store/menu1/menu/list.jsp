<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<div class="storeBodyFrame2">
    <div class="body-title">
          <h3>메뉴 관리 </h3>
    </div>
    <div>
    	내 업소 명 <br>
    	${sessionScope.store.g1_Name} <br>
    	${sessionScope.store.g1_Num}
    	Menucate : 메뉴제목, 메뉴정보<br>
    	Mainmenu : 메뉴상품명(title), 소개(content), 사진(photo), 가격(pay), 상태(enabled) <br>
    	Submenu : 서브메뉴 상품명(title), 메뉴가격(pay), 메뉴 상태(enabled)
	<div style="margin-top: 20px;">
          <input type="text" id="menuct_Title" class="boxTF" style="width: 210px;">
          <input type="text" id="menuct_Info" class="boxTF" style="width: 210px;">
         <button type="button" onclick="insertCate();" class="btn">추가</button>
    </div>
    <div style="margin-top: 20px;">
          <input type="text" id="mainmenu_Title" class="boxTF" style="width: 210px;">
          <input type="text" id="mainmenu_Content" class="boxTF" style="width: 210px;">
          <input type="text" id="mainmenu_Photo" class="boxTF" style="width: 210px;">
          <input type="text" id="mainmenu_Minpay" class="boxTF" style="width: 210px;">
         <%-- <button type="button" onclick="insertMainmenu('${dto.menuct_Num}');" class="btn">추가</button> --%>
    </div>
    <div style="margin-top: 20px;">
          <input type="text" id="submenu_Title" class="boxTF" style="width: 210px;">
          <input type="text" id="submenu_Pay" class="boxTF" style="width: 210px;">
         <%-- <button type="button" onclick="insertSubmenu('${dto.mainmenu_Num}');" class="btn">추가</button> --%>
    </div>

   </div>
</div>
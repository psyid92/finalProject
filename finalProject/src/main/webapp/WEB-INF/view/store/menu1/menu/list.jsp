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
    	Menucate : 메뉴제목, 메뉴정보<br>
    	Mainmenu : 메뉴상품명(title), 소개(content), 사진(photo), 가격(pay), 상태(enabled) <br>
    	Submenu : 서브메뉴 상품명(title), 메뉴가격(pay), 메뉴 상태(enabled)
	<%-- <div style="margin-top: 20px;">
         <input type="text" id="menuct_Title" class="boxTF" style="width: 210px;">
          <input type="text" id="menuct_Info" class="boxTF" style="width: 210px;">
         <button type="button" onclick="insertCate();" class="btn">메뉴 제목 추가</button>
    </div>
    <div id="listSidoLayout" style="margin-top: 20px;">
         <c:forEach var="dto" items="${list}">
              <div id="sido${dto.snum}" class="sidoLayout">
                    <div style="padding: 5px;">
              		    <span class="sido" data-snum="${dto.snum}">${dto.sido}</span>
              		    <span class="btnDelete" onclick="deleteSido('${dto.snum}');">삭제</span>
              		 </div>
              		 <div class="cityLayout">
              		      <div style="margin: 10px 3px;">
                             <input type="text" id="cityName${dto.snum}" class="boxTF" style='width:190px;'>
                             <button type="button" onclick="insertCity('${dto.snum}');" class="btn">도시추가</button>
                         </div>
                         <div id="listCity${dto.snum}"></div>
              		 </div>
              </div>  
         </c:forEach>
    </div> --%>
   </div>
</div>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("utf-8");
   String cp=request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title> 배달의민족 :: 대한민국 1등 배달앱</title>

<script src="<%=cp%>/resource/jquery.min.js"></script>
<script src="<%=cp%>/resource/jquery.masonry.min.js"></script>
<script type="text/javascript">
	function fn_sch_kw (category) {
	$(function(){
		location.href = '<%=cp%>/pay/payList?category=' + category;				
	});
	
	$(function() {
		$("#category").children().click(function(){
			var category = $(this).attr("id");
			location.href = '<%=cp%>/pay/payList?category=' + category;
		});
	});
}
</script>
</head>
      
<body>
	
   <input type="hidden" name="CurClass" id="CurClass" value="">
   <input type="hidden" name="kw" id="kw" value="">
   <div class="container of-h" style="position:relative; margin-bottom: 100px;">
      <div class="cont" style="position: relative; height: 2400px; width: 480px;" id="category">
         <div class="boxm col1 masonry-brick" style="position: absolute; top: 0px; left: 0px;" id="chicken">
            <div class="cutter chicken">
               <div class="default">치킨</div>
               <div class="cover" style="background-position: 0px 0px;"></div>
            </div>
         </div>

         <div class="boxm col1 masonry-brick" style="position: absolute; top: 0px; left: 240px;" id="china">
            <div class="cutter chinese">
               <div class="cover" style="background-position: 0px 0px;"></div>
               <div class="default">중국집</div>
            </div>
         </div>

         <div class="boxm col1 masonry-brick" style="position: absolute; top: 240px; left: 0px;" id="pizza">
            <div class="cutter pizza">
               <div class="cover" style="background-position: 0px 0px;"></div>
               <div class="default">피자</div>
            </div>
         </div>

         <div class="boxm col1 masonry-brick" style="position: absolute; top: 240px; left: 240px;" id="bunsik">
            <div class="cutter korean">
               <div class="cover" style="background-position: 0px 0px;"></div>
               <div class="default">분식</div>
            </div>
         </div>

         <div class="boxm col2 masonry-brick" style="position: absolute; top: 0px; left: 0px;">
            <div class="cutter promo">
               <div class="default">
                  <div class="caroufredsel_wrapper" style="display: block; text-align: center; float: none; position: relative; top: auto; right: auto; bottom: auto; left: auto; z-index: auto; width: 440px; height: 440px; margin: 0px 0px 10px; overflow: hidden;">
                  <ul id="promotion" class="list-inline" style="text-align: left; float: none; position: absolute; top: 0px; right: auto; bottom: auto; left: 0px; margin: 0px; width: 1320px; height: 440px;">
                                <li style="background-image: url('<%=cp%>/resource/img/banner02.gif')"></li>
                  </ul></div>
               </div>
            </div>
         </div>
         <div class="boxm col1 masonry-brick" style="position: absolute; top: 960px; left: 0px;" id="bossam">
            <div class="cutter jokbal">
               <div class="cover" style="background-position: 0px 0px;"></div>
               <div class="default" >족발,보쌈</div>
            </div>
         </div>

         <div class="boxm col1 masonry-brick" style="position: absolute; top: 960px; left: 240px;" id="ya">
            <div class="cutter night">
               <div class="cover" style="background-position: 0px 0px;"></div>
               <div class="default">야식</div>
            </div>
         </div>

         <div class="boxm col1 masonry-brick" style="position: absolute; top: 1200px; left: 0px;" id="zzim">
            <div class="cutter tang">
               <div class="cover" style="background-position: 0px 0px;"></div>
               <div class="default">찜,탕</div>
            </div>
         </div>

         <div class="boxm col1 masonry-brick" style="position: absolute; top: 1200px; left: 240px;" id="don">
            <div class="cutter japanese">
               <div class="cover" style="background-position: 0px 0px;"></div>
               <div class="default">돈까스</div>
            </div>
         </div>
   </div> <!--/.cont -->
</div>

<script type="text/javascript">   

//------------------------------------------------------------------------------
//PURPOSE : 메인하단 스크립트
//MODIFY  :
//------------------------------------------------------------------------------
var $container = $('.cont');
$container.imagesLoaded( function() {
  $container.masonry({
    itemSelector: '.boxm',
    isAnimated: true,
    isFitWidth: true
  });
});

</script>
<script src="http://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
</body>
</html>
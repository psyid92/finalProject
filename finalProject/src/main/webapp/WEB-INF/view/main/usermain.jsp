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
	function fn_sch_kw (menu) {
	$(function(){
		location.href = '<%=cp%>/pay/pay?menu=' + menu;				
	});
}
</script>
</head>
      
<body>

   <input type="hidden" name="CurClass" id="CurClass" value="">
   <input type="hidden" name="kw" id="kw" value="">
   <div class="container of-h" style="margin-bottom: 100px;">
      <div class="cont" style="position: relative; height: 2400px; width: 480px;">
         <div class="boxm col1 masonry-brick" onclick="fn_sch_kw('치킨');" style="position: absolute; top: 0px; left: 0px;">
            <div class="cutter chicken">
               <div class="default">치킨</div>
               <div class="cover" style="background-position: 0px 0px;"></div>
            </div>
         </div>

         <div class="boxm col1 masonry-brick" onclick="fn_sch_kw('중국집');" style="position: absolute; top: 0px; left: 240px;">
            <div class="cutter chinese">
               <div class="cover" style="background-position: 0px 0px;"></div>
               <div class="default">중국집</div>
            </div>
         </div>

         <div class="boxm col1 masonry-brick" onclick="fn_sch_kw('피자');" style="position: absolute; top: 240px; left: 0px;">
            <div class="cutter pizza">
               <div class="cover" style="background-position: 0px 0px;"></div>
               <div class="default">피자</div>
            </div>
         </div>

         <div class="boxm col1 masonry-brick" onclick="fn_sch_kw('분식');" style="position: absolute; top: 240px; left: 240px;">
            <div class="cutter korean">
               <div class="cover" style="background-position: 0px 0px;"></div>
               <div class="default">한식,분식</div>
            </div>
         </div>

         <div class="boxm col2 masonry-brick" style="position: absolute; top: 0px; left: 0px;">
            <div class="cutter promo">
               <div class="default">
                  <div class="caroufredsel_wrapper" style="display: block; text-align: center; float: none; position: relative; top: auto; right: auto; bottom: auto; left: auto; z-index: auto; width: 440px; height: 440px; margin: 0px 0px 10px; overflow: hidden;">
                  <ul id="promotion" class="list-inline" style="text-align: left; float: none; position: absolute; top: 0px; right: auto; bottom: auto; left: 0px; margin: 0px; width: 1320px; height: 440px;">
                                <li style="background-image: url('<%=cp%>/resource/img/banner02.gif')"><a>최대 6천원 할인</a></li>
                  </ul></div>
                  <div class="btn-control">
                     <a href="javascript:;" class="prev prev3 hidden" style="display: none;">&lt;</a>
                     <a href="javascript:;" class="next next3 hidden" style="display: none;">&gt;</a>
                  </div>
                  <div id="pager" class="pager hidden" style="display: none;"><a href="#" class="selected"><span>1</span></a></div>
               </div>
            </div>
         </div>
         <div class="boxm col1 masonry-brick" onclick="fn_sch_kw('족발,보쌈');" style="position: absolute; top: 960px; left: 0px;">
            <div class="cutter jokbal">
               <div class="cover" style="background-position: 0px 0px;"></div>
               <div class="default" >족발,보쌈</div>
            </div>
         </div>

         <div class="boxm col1 masonry-brick" onclick="fn_sch_kw('야식');" style="position: absolute; top: 960px; left: 240px;">
            <div class="cutter night">
               <div class="cover" style="background-position: 0px 0px;"></div>
               <div class="default">야식</div>
            </div>
         </div>

         <div class="boxm col1 masonry-brick" onclick="fn_sch_kw('찜,탕');" style="position: absolute; top: 1200px; left: 0px;">
            <div class="cutter tang">
               <div class="cover" style="background-position: 0px 0px;"></div>
               <div class="default">찜,탕</div>
            </div>
         </div>

         <div class="boxm col1 masonry-brick" onclick="fn_sch_kw('돈까스');" style="position: absolute; top: 1200px; left: 240px;">
            <div class="cutter japanese">
               <div class="cover" style="background-position: 0px 0px;"></div>
               <div class="default">돈까스,회,일식</div>
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
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style type="text/css">
/* event:list */
div.clear
{
    clear: both;
}

div.product-chooser{
    
}

    div.product-chooser.disabled div.product-chooser-item
	{
		zoom: 1;
		filter: alpha(opacity=60);
		opacity: 0.6;
		cursor: default;
	}

	div.product-chooser div.product-chooser-item{
		padding: 11px;
		border-radius: 6px;
		cursor: pointer;
		position: relative;
		border: 1px solid #efefef;
		margin-bottom: 10px;
       
	}
	
	div.product-chooser div.product-chooser-item.selected{
		border: 2px solid #bbb;
		background: white;
		padding: 8px;
		filter: alpha(opacity=100);
		opacity: 1;
	}
	
		div.product-chooser div.product-chooser-item img{
			padding: 0;
		}
		
		div.product-chooser div.product-chooser-item span.title{
			display: block;
			
			font-weight: bold;
			font-size: 12px;
		}
		
		div.product-chooser div.product-chooser-item span.description{
			font-size: 20px;
		}
		
		div.product-chooser div.product-chooser-item input{
			position: absolute;
			left: 0;
			top: 0;
			visibility:hidden;
		}
</style>

<script type="text/javascript">

$(function(){
	$('div.product-chooser').not('.disabled').find('div.product-chooser-item').on('click', function(){
		$(this).parent().parent().find('div.product-chooser-item').removeClass('selected');
		$(this).addClass('selected');
		$(this).find('input[type="radio"]').prop("checked", true);
		
	});
});

</script>
<div style="margin-top: 50px;">

	<!-- Nav tabs -->
	<ul class="nav nav-tabs">
		<li style="width: 200px; text-align: center; font-weight: 100;"><a
			href="<%=cp%>/notice/list">공지사항</a></li>
		<li class="active"
			style="width: 200px; text-align: center; font-weight: 100;"><a
			href="<%=cp%>/userEvent/list">이벤트</a></li>
		<li style="width: 200px; text-align: center; font-weight: 100;"><a
			href="<%=cp%>/userFaq/faq">자주찾는 질문</a></li>
		<li style="width: 200px; text-align: center; font-weight: 100;"><a
			href="<%=cp%>/userQna/created">그것이 알고싶다</a></li>
		<li style="width: 200px; text-align: center; font-weight: 100;"><a
			href="<%=cp%>/userBbs/list">우리끼리소담소담</a></li>

	</ul>
</div>



<div class="bodyFrame2" style="margin-right: 0px; margin-left: 0px; padding: 0px;">
    <div class="body-title" style="margin-top: 50px;">
		<h3><span class="glyphicon glyphicon-thumbs-up"></span> 대박이야! 이벤트 </h3>
	</div>

    <div class="alert alert-info">
        <i class="fa fa-hand-peace-o"></i> 대박 찬스!! 이벤트!!
    </div>

    <div class="row form-group product-chooser" style="margin: 0px;">
    
    	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4" style="width: 48%; padding: 0px; margin-right: 10px;">
    		<div class="product-chooser-item selected">
    			<img src="<%=cp%>/resource/img/hhh.jpg" class="img-rounded col-xs-4 col-sm-4 col-md-12 col-lg-12" alt="Mobile and Desktop" style="height: 170px; padding-top: 15px;">
                <div class="col-xs-8 col-sm-8 col-md-12 col-lg-12">
                    <br>
    				<span class="description" style="font-size: 35px;">배달행 할인파워!<br>지금 받아라!</span><br>
    				<span class="description">**기간**</span><br>
    				<span class="description">2017/07/01 ~ 10/20</span>
    				<input type="radio" name="product" value="mobile_desktop" checked="checked">
    			</div>
    			<div class="clear"></div>
    		</div>
    	</div>
    	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4" style="width: 48%; padding: 0px; float: right;">
    		<div class="product-chooser-item selected" >
    			<img src="<%=cp%>/resource/img/cool.jpg" class="img-rounded col-xs-4 col-sm-4 col-md-12 col-lg-12" alt="Mobile and Desktop" style="height: 170px; padding-top: 15px;">
                <div class="col-xs-8 col-sm-8 col-md-12 col-lg-12">
                    <br>
    				<span class="description" style="font-size: 35px;">여름 쿨~~한 이벤트<br>당첨자는??!!</span><br>
    				<span class="description">**기간**</span><br>
    				<span class="description">2017/07/15 ~ 08/31</span>
    				<input type="radio" name="product" value="mobile_desktop" checked="checked">
    			</div>
    			<div class="clear"></div>
    		</div>
    	</div>
    	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4" style="width: 48%; padding: 0px; ">
    		<div class="product-chooser-item selected">
    			<img src="<%=cp%>/resource/img/bhc1.jpg" class="img-rounded col-xs-4 col-sm-4 col-md-12 col-lg-12" alt="Mobile and Desktop" style="height: 170px; padding-top: 15px;">
                <div class="col-xs-8 col-sm-8 col-md-12 col-lg-12">
                    <br>
    				<span class="description" style="font-size: 35px;">BHC가 쏜다<br> 치킨먹자!!</span><br>
    				<span class="description">**기간**</span><br>
    				<span class="description">2017/07/15 ~ 07/20</span>
    				<input type="radio" name="product" value="mobile_desktop" checked="checked">
    			</div>
    			<div class="clear"></div>
    		</div>
    	</div>
    	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4" style="width: 48%; padding: 0px; float: right;">
    		<div class="product-chooser-item selected">
    			<img src="<%=cp%>/resource/img/qwe.png" class="img-rounded col-xs-4 col-sm-4 col-md-12 col-lg-12" alt="Mobile and Desktop" style="height: 170px; padding-top: 15px;">
                <div class="col-xs-8 col-sm-8 col-md-12 col-lg-12">
                    <br>
    				<span class="description" style="font-size: 35px;">첫 주문시! <br>이천원 할인?!</span><br>
    				<span class="description">**기간**</span><br>
    				<span class="description">2017/01/15 ~ 12/31</span>
    				<input type="radio" name="product" value="mobile_desktop" checked="checked">
    			</div>
    			<div class="clear"></div>
    		</div>
    	</div>
    	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4" style="width: 48%; padding: 0px; margin-right: 10px;">
    		<div class="product-chooser-item selected">
    			<img src="<%=cp%>/resource/img/end.jpg" class="img-rounded col-xs-4 col-sm-4 col-md-12 col-lg-12" alt="Mobile and Desktop" style="height: 170px; padding-top: 15px;">
                <div class="col-xs-8 col-sm-8 col-md-12 col-lg-12">
                    <br>
    				<span class="description" style="font-size: 35px;">6월 국군장병 차렷!!<br> 치킨나눔!</span><br>
    				<span class="description">**기간**</span><br>
    				<span class="description">2017/07/15 ~ 07/20</span>
    				<input type="radio" name="product" value="mobile_desktop" checked="checked">
    			</div>
    			<div class="clear"></div>
    		</div>
    	</div>
    	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4" style="width: 48%; padding: 0px; float: right;">
    		<div class="product-chooser-item selected">
    			<img src="<%=cp%>/resource/img/end.jpg" class="img-rounded col-xs-4 col-sm-4 col-md-12 col-lg-12" alt="Mobile and Desktop" style="height: 170px; padding-top: 15px;">
                <div class="col-xs-8 col-sm-8 col-md-12 col-lg-12">
                    <br>
    				<span class="description" style="font-size: 35px;">5월 어버이날 어머니!! 밥하지마셔요!!!!!!!!</span><br>
    				<span class="description">**기간**</span><br>
    				<span class="description">2017/05/01 ~ 05/10</span>
    				<input type="radio" name="product" value="mobile_desktop" checked="checked">
    			</div>
    			<div class="clear"></div>
    		</div>
    	</div>
    	
    </div>
</div>

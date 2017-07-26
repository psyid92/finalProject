<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style type="text/css">
/* event:list */
.mystoreCTR_list {
	margin: 0 0 30px;
}

.mystoreCTR_list li {
	padding: 25px 0;
	border-bottom: 1px solid #e0e0e0;
}

.mystoreCTR_list li .info {
	position: relative;
}

.mystoreCTR_list li .info dt {
	padding: 10px 0 10px;
	font-size: 16px;
	color: #333;
}

.mystoreCTR_list li .info dd {
	margin: 0 0 3px;
	color: #898989;
	font-size: 14px;
}

.mystoreCTR_list li .info dd span {
	display: inline-block;
}

.mystoreCTR_list li .ic_tag {
	position: absolute;
	right: 0px;
	top: 30px;
	width: 110px;
	height: 40px;
	line-height: 40px;
	font-size: 14px;
	background: #ccc;
	text-align: center;
	color: white;
}

.mystoreCTR_list li .thumb {
	position: absolute;
	left: 0;
	top: 0;
	display: block;
	width: 217px;
	height: 98px;
	border: 1px solid #e0e0e0;
}

.mystoreCTR_list li .thumb img {
	width: 217px;
	height: 98px;
}

dl, ul, ol, menu, li {
	list-style: none;
}

.total-pay {
	color: #555;
	font-size: 16px;
	font-weight:900;
	width: 100%;
	text-align: right;
}

.jumun-addr {
	color: black;
	margin: 10px 0px 0px 0px;
}

</style>

<script type="text/javascript">
$(function(){
	storeCTRlist();
}); 

function storeCTRlist(){
	$(function(){
		//처음 들어왔을때 월 선택 쿼리
		var url = "<%=cp%>/store/jumunControllList";
			$.ajax({
				type : "post",
				url : url,
				dataType : "json",
				success : function(data) {
					console.log(data);
					printList(data);
				},
				error : function(e) {
					console.log(e.responseText);
				}
			});
		});
	}

	function printList(data) {
		var s = "";
		var list = data.list;
		var jumunNum,overlapCount,dataCount = 0;
		var totalPay = 0;
		
		s += "<ul class='mystoreCTR_list'>";
		for (var i = 0; i < list.length; i++) {
			totalPay += list[i].menu_pay;
			
			if (jumunNum != list[i].jumun_num) {
				s += "<li><a style='text-decoration: none;' onclick='updateList("+list[i].jumun_num+");'>";
				s += "<dl class='info'><dt>주문시간 : " + list[i].jumun_created
						+ "<span class='ic_tag end'>" + list[i].orders_state
						+ "</span></dt></dl>";
				s += "<dd><span>" + list[i].menuct_title + "</span> : <span>"
						+ list[i].menu_title + "</span> => <span>"
						+ list[i].menu_count.toLocaleString() + "개 </span><span>"
						+ list[i].menu_pay.toLocaleString() + "원</span></dd>";
			}
			
			if (jumunNum == list[i].jumun_num) {
				s += "<dd><span>" + list[i].menuct_title + "</span> : <span>"
						+ list[i].menu_title + "</span> => <span>"
						+ list[i].menu_count.toLocaleString() + "개 </span><span>"
						+ list[i].menu_pay.toLocaleString() + "원</span></dd>";
			}
			
			//console.log(i + '+' + list.length);
			//console.log(list[i].jumun_num + ':' + list[i+1].jumun_num);
			//console.log(jumunNum + ':' +list[i].jumun_num);
			if (i<list.length-1 && jumunNum == list[i].jumun_num
				&& list[i].jumun_num != list[i+1].jumun_num) {
				s += "<dd class='jumun-addr'><span>주소 : "+ list[i].jumun_addr + "</span></dd>";
				s += "<br><span class='total-pay'>총액 : "+ totalPay.toLocaleString() + "원</span></a></li>";
				totalPay=0;
			} else if (i<list.length-1 && list[i].jumun_num != list[i+1].jumun_num) {
				s += "<dd class='jumun-addr'><span>주소 : "+ list[i].jumun_addr + "</span></dd>";
				s += "<br><span class='total-pay'>총액 : "+ totalPay.toLocaleString() + "원</span></a></li>";
				totalPay=0;	
			} else if (i==list.length-1) {
				s += "<dd class='jumun-addr'><span>주소 : "+ list[i].jumun_addr + "</span></dd>";
				s += "<br><span class='total-pay'>총액 : "+ totalPay.toLocaleString() + "원</span></a></li>";
				totalPay=0;	
			}
			
			jumunNum = list[i].jumun_num;
		}
		s += "</ul>";
		$("#jumun3").html(s);
	}
	
	function updateList(listNum){
		$(function(){
			var url = "<%=cp%>/store/jumunStateUpdate";
			var orders_num=4;
			var data = {listNum:listNum, orders_num:orders_num};
				$.ajax({
					type : "post",
					url : url,
					data : data,
					dataType : "json",
					success : function(data) {
						console.log(data);
						printList(data);
					},
					error : function(e) {
						console.log(e.responseText);
					}
				});
			});
	}
	
	function modalAjax(url,listNum,mode) {
		$.ajax({
			type : "post",
			url : url,
			dataType : "json",
			success : function(data) {
				/* var dto=data.dto;
				
				$("#cur_giupName").val(dto.g1_name);
				$("#cur_giupId").val(dto.g1_id);
				$("#cur_giupCatCode").val(dto.cat_code);
				$("#cur_giupCreated").val(dto.g1_created);
				$("#cur_giupAddr1").val(dto.g3_addr2);
				$("#cur_giupAddr2").val(dto.g3_addr3);
				$("#cur_giupAdTerm").val(dto.giupAd_Term);
				
				
				$("#cur_giupSleep").val(dto.g1_sleep);
				$("#cur_giupEnabled").val(dto.g1_enabled);
				if (dto.giupAd_State == 0)
					$("#cur_giupAdNum").val("일반");
				if (dto.giupAd_State >= 1)
					$("#cur_giupAdNum").val("광고");
				
				//현재 보고있는 글의 listNum
				$("#cur_listNum").val(listNum);
				
				if(mode=="article"){
					$(".giup_arti_input").attr( 'readonly', true ).css('background','#eeeeee');
					$(".giup_arti_select").attr('disabled', true ); 

				} else if (mode=="update") {
					$(".text_write").attr( 'readonly', false ).css('background', '#ffffff');
					$(".giup_arti_select").attr('disabled', false ).css('background', '#ffffff');
				} */
			},
			error : function(e) {
				console.log(e);
			}
		});
	}

	//td 클릭했을때 해당 번호로 들어가기
	$(function() {
		$("#giup_list").children().click(function() {
			var giupNum=$(this).find("td:first").text();
			
			//input hidden 리스트 넘버 받아오기
			var listNum=$(this).next().val();

			var url = $('#articleUrl').val() + '&num=' + giupNum;
			
			var mode="article";
			modalAjax(url,listNum,mode);
		});
	});
</script>

<div class="storeBodyFrame2">

	<div class="body-title">
		<h3>
			<span class="glyphicon glyphicon-tower"></span> 주문현황
		</h3>
	</div>



	<!-- Tab panes -->
	<div role="tabpanel">

		<!-- Nav tabs -->
		<ul class="nav nav-tabs" role="tablist">
			<li role="presentation" class="active"><a href="#jumun3"
				aria-controls="jumun3" role="tab" data-toggle="tab">주문완료</a></li>
			<li role="presentation"><a href="#jumun4" aria-controls="jumun4"
				role="tab" data-toggle="tab">주문승인</a></li>
			<li role="presentation"><a href="#jumun5" aria-controls="jumun5"
				role="tab" data-toggle="tab">취소</a></li>
			<li role="presentation"><a href="#jumunTotal"
				aria-controls="jumunTotal" role="tab" data-toggle="tab">전체</a></li>
		</ul>

		<!-- Tab panes -->
		<div class="tab-content">
			<div role="tabpanel" class="tab-pane active" id="jumun3"></div>
			<div role="tabpanel" class="tab-pane" id="jumun4">주문승인</div>
			<div role="tabpanel" class="tab-pane" id="jumun5">주문취소</div>
			<div role="tabpanel" class="tab-pane" id="jumunTotal">주문전체</div>
		</div>

	</div>
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">기업상세</h4>
				</div>
				<div id="article" class="modal-body giup_arti">
					<span class="giup_arti_sp">기업명 </span><input class="giup_arti_input" type="text" id="cur_giupName" value="">
					<span class="giup_arti_sp">아이디 </span><input class="giup_arti_input" type="text" id="cur_giupId" value=""><br>
					
					<!-- <span class="giup_arti_sp">운영상태 </span>
					<select name="cur_giupSleep" id="cur_giupSleep" class="giup_arti_input giup_arti_select">
						<option value="1">운영중</option>
						<option value="0">쉬는중</option>
					</select>
					<span class="giup_arti_sp">휴면상태 </span>
					<select name="cur_giupEnabled" id="cur_giupEnabled" class="giup_arti_input giup_arti_select">
						<option value="1">활동</option>
						<option value="0">휴면</option>
					</select>
					<span class="giup_arti_sp">카테고리 </span>
					<select name="cur_giupCatCode" id="cur_giupCatCode" class="giup_arti_input giup_arti_select">
						<option value="chicken">치킨</option>
						<option value="china">중국집</option>
						<option value="pizza">피자</option>
						<option value="bunsik">분식</option>
						<option value="bossam">족발,보쌈</option>
						<option value="ya">야식</option>
						<option value="zzim">찜,탕</option>
						<option value="don">돈까스</option>
					</select>
					<span class="giup_arti_sp">가입시간 </span><input class="giup_arti_input" type="text" id="cur_giupCreated" value=""><br>
					<span class="giup_arti_sp">주소1 </span><input class="giup_arti_input" type="text" id="cur_giupAddr1" value="">
					<span class="giup_arti_sp">주소2 </span><input class="giup_arti_input" type="text" id="cur_giupAddr2" value=""><br>
					<span class="giup_arti_sp">광고상태 </span><input class="giup_arti_input" type="text" id="cur_giupAdNum" value="">
					<span class="giup_arti_sp">광고일수 </span><input class="giup_arti_input text_write" type="text" id="cur_giupAdTerm" value=""><br>
					<input type="hidden" id="cur_listNum"> -->
				</div> 
				<div class="modal-footer">
					<div id="article_left" class="giup_arti_left img_button"><img src="<%=cp%>/resource/img/button_left.png" class="img_button"/></div>
					<div id="article_right" class="giup_arti_right img_button"><img src="<%=cp%>/resource/img/button_right.png" class="img_button"/></div>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					<button id="article_update" type="button" class="btn btn-primary" value="update">수정하기</button>
				</div>
			</div> 
		</div>
	</div>
</div>
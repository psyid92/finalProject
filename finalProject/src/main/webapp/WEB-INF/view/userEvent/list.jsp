<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style type="text/css">
/* event:list */
.event_list {
	margin: 0 0 30px;
}

.event_list li {
	padding: 25px 0;
	border-bottom: 1px solid #e0e0e0;
}

.event_list li .info {
	position: relative;
	padding-left: 240px;
	/* height: 100px; */
}

.event_list li .info dt {
	padding: 10px 0 10px;
	font-size: 16px;
	color: #333;
}

.event_list li .info dd {
	margin: 0 0 3px;
	color: #898989;
	font-size: 14px;
}

.event_list li .info dd span {
	display: inline-block;
	width: 65px;
}

.event_list li .ic_tag {
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

.event_list li .thumb {
	position: absolute;
	left: 0;
	top: 0;
	display: block;
	width: 217px;
	height: 98px;
	border: 1px solid #e0e0e0;
}

.event_list li .thumb img {
	width: 217px;
	height: 98px;
}

dl, ul, ol, menu, li {
	list-style: none;
}
</style>

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



<div class="storeBodyFrame2">
	<div class="body-title">
		<h3>
			<span class="glyphicon glyphicon-tower"></span> 진행중 이벤트
		</h3>
	</div>

	<div>
		<div class="content">

			<!-- <div class="pagetitle">
				<p class="h_dsc">사장님만을 위한 특별한 혜택! 지금 이벤트에 참여해보세요</p>
			</div> -->

			<div class="contents">
				<ul class="event_list">
					<li><a style="text-decoration: none;" href="#">
							<dl class="info">
								<dt>
									7월 배달행 이벤트<span class="ic_tag end">상태</span>
								</dt>
								<dd>
									<span>응모기간:</span>2017-07-13 ~ 2017-07-18
								</dd>
								<dd>
									<span>발표일:</span>2017-07-19
								</dd>
								<dd class="thumb">
									<img src="" alt="">
								</dd>
							</dl>
					</a></li>

					<li><a style="text-decoration: none;" href="#">
							<dl class="info">
								<dt>
									7월 배달행 이벤트<span class="ic_tag end">상태</span>
								</dt>
								<dd>
									<span>응모기간:</span>2017-07-13 ~ 2017-07-18
								</dd>
								<dd>
									<span>발표일:</span>2017-07-19
								</dd>
								<dd class="thumb">
									<img src="" alt="">
								</dd>
							</dl>
					</a></li>

					<li><a style="text-decoration: none;" href="#">
							<dl class="info">
								<dt>
									7월 배달행 이벤트<span class="ic_tag end">상태</span>
								</dt>
								<dd>
									<span>응모기간:</span>2017-07-13 ~ 2017-07-18
								</dd>
								<dd>
									<span>발표일:</span>2017-07-19
								</dd>
								<dd class="thumb">
									<img src="" alt="">
								</dd>
							</dl>
					</a></li>
				</ul>
				 <button type="button" class="btn btn-primary btn-sm bbtn" onclick="javascript:location.href='<%=cp%>/userEvent/game';"><span class="glyphicon glyphicon glyphicon-pencil"></span> 게임</button>

				
				<div class="paging"
					style="text-align: center; min-height: 50px; line-height: 50px;">
					<c:if test="${dataCount==0 }">
           등록된 문의가 없습니다.
       </c:if>
					<c:if test="${dataCount!=0 }">
           ${paging}
       </c:if>
				</div>
			</div>
		</div>
	</div>
</div>
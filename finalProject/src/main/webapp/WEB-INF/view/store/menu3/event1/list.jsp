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
					<li><a style="text-decoration: none;"
						href="#">
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
					 
					<li><a style="text-decoration: none;"
						href="#">
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
					
					<li><a style="text-decoration: none;"
						href="#">
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

				<!-- Paging :S -->
				<div class="pager">

					<a class="ic_bbs prev_end" title="맨앞 페이지로 이동">맨앞-</a><a
						class="ic_bbs prev" title="이전페이지로 이동">이전</a><span class="current">1</span><a
						href="./?page=2&amp;bbs=33&amp;prefix=&amp;t=&amp;k=&amp;r1=&amp;r2=&amp;c1=&amp;c2=&amp;sort=1">2</a><a
						href="./?page=3&amp;bbs=33&amp;prefix=&amp;t=&amp;k=&amp;r1=&amp;r2=&amp;c1=&amp;c2=&amp;sort=1">3</a><a
						href="./?page=4&amp;bbs=33&amp;prefix=&amp;t=&amp;k=&amp;r1=&amp;r2=&amp;c1=&amp;c2=&amp;sort=1">4</a><a
						href="./?page=5&amp;bbs=33&amp;prefix=&amp;t=&amp;k=&amp;r1=&amp;r2=&amp;c1=&amp;c2=&amp;sort=1">5</a><a
						href="./?page=6&amp;bbs=33&amp;prefix=&amp;t=&amp;k=&amp;r1=&amp;r2=&amp;c1=&amp;c2=&amp;sort=1">6</a><a
						href="./?page=7&amp;bbs=33&amp;prefix=&amp;t=&amp;k=&amp;r1=&amp;r2=&amp;c1=&amp;c2=&amp;sort=1">7</a><a
						href="./?page=8&amp;bbs=33&amp;prefix=&amp;t=&amp;k=&amp;r1=&amp;r2=&amp;c1=&amp;c2=&amp;sort=1">8</a><a
						href="./?page=9&amp;bbs=33&amp;prefix=&amp;t=&amp;k=&amp;r1=&amp;r2=&amp;c1=&amp;c2=&amp;sort=1">9</a><a
						href="./?page=10&amp;bbs=33&amp;prefix=&amp;t=&amp;k=&amp;r1=&amp;r2=&amp;c1=&amp;c2=&amp;sort=1">10</a><a
						href="./?page=2&amp;bbs=33&amp;prefix=&amp;t=&amp;k=&amp;r1=&amp;r2=&amp;c1=&amp;c2=&amp;sort=1"
						class="ic_bbs next" title="다음페이지로 이동">다음</a><a
						href="./?page=12&amp;bbs=33&amp;prefix=&amp;t=&amp;k=&amp;r1=&amp;r2=&amp;c1=&amp;c2=&amp;sort=1"
						class="ic_bbs next_end" title="맨끝 페이지로 이동">맨끝</a>
				</div>
				<!-- Paging :E -->


			</div>
		</div>
	</div>
</div>
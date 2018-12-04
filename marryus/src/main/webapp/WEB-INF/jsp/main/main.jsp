<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Marry Us</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<c:import url="/common/importCss.jsp"/>
<c:import url="/common/importJs.jsp"/>
<c:import url="/common/webSocket.jsp"/>
</head>
<body>
	<c:import url="/common/importHeader.jsp" />
	
	<div id="wrap" class="main">
		<div class="main_visual">
			<div class="bxslider">
				<div class="item item01"
					style="background-image: url(<c:url value="/resources/img/"/>main_visual01.jpg);"></div>
				<div class="item item02"
					style="background-image: url(<c:url value="/resources/img/"/>main_visual02.jpg);"></div>
				<div class="item item03"
					style="background-image: url(<c:url value="/resources/img/"/>main_visual03.jpg);"></div>
			</div>
			<div id="main_visual_pager">
				<ul>
					<li><a data-slide-index="0" href=""></a></li>
					<li><a data-slide-index="1" href=""></a></li>
					<li><a data-slide-index="2" href=""></a></li>
				</ul>
			</div>
			<div class="textBox">
				<h1>
					What matters in a happy marriage is not how well they fit together.
					<br> How do you get over the difference?
				</h1>
			</div>
			<div class="btnBox">
				<a href="#" data-toggle="modal" data-target="#planingModal"
					id="weddingPlanBtn" class="mainBtn"> 나만의 웨딩 플래닝 </a>
			</div>
			<div class="deadLine">
				<ul>
					<li><a href="#">${auction}오O진님의 입찰건이 3일 남았습니다</a></li>
					<li><a href="#">오O진님의 입찰건이 3일 남았습니다</a></li>
					<li><a href="#">오O진님의 입찰건이 3일 남았습니다</a></li>
					<li><a href="#">오O진님의 입찰건이 3일 남았습니다</a></li>
					<li><a href="#">오O진님의 입찰건이 3일 남았습니다</a></li>
					<li><a href="#">오O진님의 입찰건이 3일 남았습니다</a></li>
					<li><a href="#">오O진님의 입찰건이 3일 남았습니다</a></li>
					<li><a href="#">오O진님의 입찰건이 3일 남았습니다</a></li>
				</ul>
			</div>
		</div>
		<!--메인비쥬얼-->
		<div class="marriageInfo">
			<div class="container">
				<div class="col-md-3 infoLeft">
					<div class="prifile cf">
						<div class="imgWrap">
							<img src="<c:url value="/resources/"/>img/seungjae.jpg" alt=""
								class="img-responsive center-block">
						</div>
						<dl>
							<dt>이승재</dt>
							<dd>1990.04.30</dd>
						</dl>
					</div>
					<div class="time cf">
						<dl class="day">
							<dt>Days</dt>
							<dd>203</dd>
						</dl>
						<dl class="hours">
							<dt>Hours</dt>
							<dd>22</dd>
						</dl>
						<dl class="min">
							<dt>Min</dt>
							<dd>30</dd>
						</dl>
						<dl class="sec">
							<dt>Sec</dt>
							<dd>99</dd>
						</dl>
					</div>
				</div>
				<div class="col-md-9 infoRight">
					<div class="titleBox">
						<h3>Planning Progress</h3>
						<a href="#">My Wedding > </a>
					</div>
					<ul>
						<li><a href="#">
								<dl>
									<dt>
										<i class="far fa-list-alt"></i>
									</dt>
									<dd>
										<b>0</b> <br> <span>out of 20</span>
									</dd>
								</dl>
								<p>Vendors hired</p>
						</a></li>
						<li><a href="#">
								<dl>
									<dt>
										<i class="fas fa-list-ol"></i>
									</dt>
									<dd>
										<b>7</b> <br> <span>out of 70</span>
									</dd>
								</dl>
								<p>Tasks Completed</p>
						</a></li>
						<li><a href="#">
								<dl>
									<dt>
										<i class="fas fa-male"></i><i class="fas fa-female"></i>
									</dt>
									<dd>
										<b>0</b> <br> <span>out of 20</span>
									</dd>
								</dl>
								<p>Guests confirmed</p>
						</a></li>
						<li><a href="#">
								<dl>
									<dt>
										<i class="fas fa-calculator"></i>
									</dt>
									<dd>
										<b>0</b> <br> <span>out of 20</span>
									</dd>
								</dl>
								<p>Budget spent</p>
						</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- 역경매 현황 -->
		<section class="contents contents01">
		<div class="container">
			<ul class="statusList">
				<li>
					<h2>웨딩홀 경매 현황</h2>
					<div class="row">
						<div class="col-md-6" id="venueAuctionIng">
							<h5 class="v-roll-title">
								<a href="#">입찰중 역경매</a>
							</h5>
							<ul class="v-roll">
							
								<li><span class="w18"><span>입찰중</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w18">D-21일</span> <span class="w18">접수중</span></li>
								<li><span class="w18"><span>입찰중</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w18">D-21일</span> <span class="w18">접수중</span></li>
								<li><span class="w18"><span>입찰중</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w18">D-21일</span> <span class="w18">접수중</span></li>
								<li><span class="w18"><span>입찰중</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w18">D-21일</span> <span class="w18">접수중</span></li>
								<li><span class="w18"><span>입찰중</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w18">D-21일</span> <span class="w18">접수중</span></li>
								<li><span class="w18"><span>입찰중</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w18">D-21일</span> <span class="w18">접수중</span></li>
								<li><span class="w18"><span>입찰중</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w18">D-21일</span> <span class="w18">접수중</span></li>
							
							</ul> 
						</div>
						<div class="col-md-6" id="venueAuctionDone">
							<h5 class="v-roll-title">
								<a href="#">입찰중 역경매</a>
							</h5>
							<ul class="v-roll">
								<li><span class="w18"><span>낙찰</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w36">총 1,1501,5400원</span></li>
								<li><span class="w18"><span>낙찰</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w36">총 1,1501,5400원</span></li>
								<li><span class="w18"><span>낙찰</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w36">총 1,1501,5400원</span></li>
								<li><span class="w18"><span>낙찰</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w36">총 1,1501,5400원</span></li>
								<li><span class="w18"><span>낙찰</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w36">총 1,1501,5400원</span></li>
								<li><span class="w18"><span>낙찰</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w36">총 1,1501,5400원</span></li>
								<li><span class="w18"><span>낙찰</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w36">총 1,1501,5400원</span></li>
							</ul>
						</div>
					</div>
					<h2>웨딩홀 추천</h2>
					<ul class="recommList">
						<li>
							<div class="imgWrap">
								<img src="<c:url value="/resources/"/>img/wedding-hall01.jpg"
									alt="열웨딩홀" title="열웨딩올" class="img-responsive center-block">
							</div>
							<div class="textBox">
								<dl>
									<dt>열 웨딩홀</dt>
									<dd>서울시 강남구</dd>
								</dl>
							</div>
						</li>
						<li>
							<div class="imgWrap">
								<img src="<c:url value="/resources/"/>img/wedding-hall02.jpg"
									alt="w 웨딩홀 벡스코점" title="w 웨딩홀 벡스코점"
									class="img-responsive center-block">
							</div>
							<div class="textBox">
								<dl>
									<dt>W 웨딩홀 벡스코점</dt>
									<dd>서울시 강남구</dd>
								</dl>
							</div>
						</li>
						<li>
							<div class="imgWrap">
								<img src="<c:url value="/resources/"/>img/wedding-hall03.jpg"
									alt="메모리스웨딩홀" title="메모리스웨딩홀"
									class="img-responsive center-block">
							</div>
							<div class="textBox">
								<dl>
									<dt>메모리스웨딩홀</dt>
									<dd>서울시 강남구</dd>
								</dl>
							</div>
						</li>
						<li>
							<div class="imgWrap">
								<img src="<c:url value="/resources/"/>img/wedding-hall04.jpg"
									alt="아르테스" title="아르테스" class="img-responsive center-block">
							</div>
							<div class="textBox">
								<dl>
									<dt>아르테스</dt>
									<dd>서울시 강남구</dd>
								</dl>
							</div>
						</li>
						<li>
							<div class="imgWrap">
								<img src="<c:url value="/resources/"/>img/wedding-hall05.jpg"
									alt="누리엔웨딩홀" title="누리엔웨딩홀" class="img-responsive center-block">
							</div>
							<div class="textBox">
								<dl>
									<dt>누리엔웨딩홀</dt>
									<dd>서울시 강남구</dd>
								</dl>
							</div>
						</li>
					</ul>
				</li>
				<li>
					<h2>스&middot;드&middot;메 경매 현황</h2>
					<div class="row">
						<div class="col-md-6" id="sdmAuctionIng">
							<h5 class="v-roll-title">
								<a href="#">입찰중 역경매</a>
							</h5>
						<div>
							<ul class="v-roll">
								<li><span class="w18"><span>입찰중</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w18">D-21일</span> <span class="w18">접수중</span></li>
								<li><span class="w18"><span>입찰중</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w18">D-21일</span> <span class="w18">접수중</span></li>
								<li><span class="w18"><span>입찰중</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w18">D-21일</span> <span class="w18">접수중</span></li>
								<li><span class="w18"><span>입찰중</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w18">D-21일</span> <span class="w18">접수중</span></li>
								<li><span class="w18"><span>입찰중</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w18">D-21일</span> <span class="w18">접수중</span></li>
								<li><span class="w18"><span>입찰중</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w18">D-21일</span> <span class="w18">접수중</span></li>
								<li><span class="w18"><span>입찰중</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w18">D-21일</span> <span class="w18">접수중</span></li>
							</ul>
						</div>
						
					</div>
						<div class="col-md-6" id="sdmAuctionDone">
							<h5 class="v-roll-title">
								<a href="#">입찰중 역경매</a>
							</h5>
							<ul class="v-roll">
								<li><span class="w18"><span>낙찰</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w36">총 1,1501,5400원</span></li>
								<li><span class="w18"><span>낙찰</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w36">총 1,1501,5400원</span></li>
								<li><span class="w18"><span>낙찰</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w36">총 1,1501,5400원</span></li>
								<li><span class="w18"><span>낙찰</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w36">총 1,1501,5400원</span></li>
								<li><span class="w18"><span>낙찰</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w36">총 1,1501,5400원</span></li>
								<li><span class="w18"><span>낙찰</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w36">총 1,1501,5400원</span></li>
								<li><span class="w18"><span>낙찰</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w36">총 1,1501,5400원</span></li>
							</ul>
						</div>
					</div>
					<h2>스&middot;드&middot;메 추천</h2>
					<ul class="recommList">
						<li>
							<div class="imgWrap">
								<img src="<c:url value="/resources/"/>img/studio01.jpg"
									alt="미학스튜디오" title="미학스튜디오" class="img-responsive center-block">
							</div>
							<div class="textBox">
								<dl>
									<dt>미학스튜디오</dt>
									<dd>서울시 강남구</dd>
								</dl>
							</div>
						</li>
						<li>
							<div class="imgWrap">
								<img src="<c:url value="/resources/"/>img/studio03.jpg"
									alt="TimeTow Studio" title="TimeTow Studio"
									class="img-responsive center-block">
							</div>
							<div class="textBox">
								<dl>
									<dt>TimeTow Studio</dt>
									<dd>서울시 강남구</dd>
								</dl>
							</div>
						</li>
						<li>
							<div class="imgWrap">
								<img src="<c:url value="/resources/"/>img/studio04.jpg"
									alt="IDO wedding" title="IDO wedding"
									class="img-responsive center-block">
							</div>
							<div class="textBox">
								<dl>
									<dt>IDO wedding</dt>
									<dd>서울시 강남구</dd>
								</dl>
							</div>
						</li>
						<li>
							<div class="imgWrap">
								<img src="<c:url value="/resources/"/>img/dress01.jpg" alt="포스냅"
									title="포스냅" class="img-responsive center-block">
							</div>
							<div class="textBox">
								<dl>
									<dt>포스냅</dt>
									<dd>서울시 강남구</dd>
								</dl>
							</div>
						</li>
						<li>
							<div class="imgWrap">
								<img src="<c:url value="/resources/"/>img/dress03.jpg"
									alt="마샬브라이드" title="마샬브라이드" class="img-responsive center-block">
							</div>
							<div class="textBox">
								<dl>
									<dt>마샬브라이드</dt>
									<dd>서울시 강남구</dd>
								</dl>
							</div>
						</li>
					</ul>
				</li>
				<li>
					<h2>허니문 경매 현황</h2>
					<div class="row">
						<div class="col-md-6" id="honeyAuctionIng">
							<h5 class="v-roll-title">
								<a href="#">입찰중 역경매</a>
							</h5>
							<ul class="v-roll">
								<li><span class="w18"><span>입찰중</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w18">D-21일</span> <span class="w18">접수중</span></li>
								<li><span class="w18"><span>입찰중</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w18">D-21일</span> <span class="w18">접수중</span></li>
								<li><span class="w18"><span>입찰중</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w18">D-21일</span> <span class="w18">접수중</span></li>
								<li><span class="w18"><span>입찰중</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w18">D-21일</span> <span class="w18">접수중</span></li>
								<li><span class="w18"><span>입찰중</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w18">D-21일</span> <span class="w18">접수중</span></li>
								<li><span class="w18"><span>입찰중</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w18">D-21일</span> <span class="w18">접수중</span></li>
								<li><span class="w18"><span>입찰중</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w18">D-21일</span> <span class="w18">접수중</span></li>
							</ul>
						</div>
						<div class="col-md-6" id="honeyAuctionDone">
							<h5 class="v-roll-title">
								<a href="#">입찰중 역경매</a>
							</h5>
							<ul class="v-roll">
								<li><span class="w18"><span>낙찰</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w36">총 1,1501,5400원</span></li>
								<li><span class="w18"><span>낙찰</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w36">총 1,1501,5400원</span></li>
								<li><span class="w18"><span>낙찰</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w36">총 1,1501,5400원</span></li>
								<li><span class="w18"><span>낙찰</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w36">총 1,1501,5400원</span></li>
								<li><span class="w18"><span>낙찰</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w36">총 1,1501,5400원</span></li>
								<li><span class="w18"><span>낙찰</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w36">총 1,1501,5400원</span></li>
								<li><span class="w18"><span>낙찰</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w36">총 1,1501,5400원</span></li>
							</ul>
						</div>
					</div>
					<h2>여행사 추천</h2>
					<ul class="recommList">
						<li>
							<div class="imgWrap">
								<img src="<c:url value="/resources/"/>img/wedding-hall01.jpg"
									alt="열웨딩홀" title="열웨딩올" class="img-responsive center-block">
							</div>
							<div class="textBox">
								<dl>
									<dt>열 웨딩홀</dt>
									<dd>서울시 강남구</dd>
								</dl>
							</div>
						</li>
						<li>
							<div class="imgWrap">
								<img src="<c:url value="/resources/"/>img/wedding-hall02.jpg"
									alt="w 웨딩홀 벡스코점" title="w 웨딩홀 벡스코점"
									class="img-responsive center-block">
							</div>
							<div class="textBox">
								<dl>
									<dt>W 웨딩홀 벡스코점</dt>
									<dd>서울시 강남구</dd>
								</dl>
							</div>
						</li>
						<li>
							<div class="imgWrap">
								<img src="<c:url value="/resources/"/>img/wedding-hall03.jpg"
									alt="메모리스웨딩홀" title="메모리스웨딩홀"
									class="img-responsive center-block">
							</div>
							<div class="textBox">
								<dl>
									<dt>메모리스웨딩홀</dt>
									<dd>서울시 강남구</dd>
								</dl>
							</div>
						</li>
						<li>
							<div class="imgWrap">
								<img src="<c:url value="/resources/"/>img/wedding-hall04.jpg"
									alt="아르테스" title="아르테스" class="img-responsive center-block">
							</div>
							<div class="textBox">
								<dl>
									<dt>아르테스</dt>
									<dd>서울시 강남구</dd>
								</dl>
							</div>
						</li>
						<li>
							<div class="imgWrap">
								<img src="<c:url value="/resources/"/>img/wedding-hall05.jpg"
									alt="누리엔웨딩홀" title="누리엔웨딩홀" class="img-responsive center-block">
							</div>
							<div class="textBox">
								<dl>
									<dt>누리엔웨딩홀</dt>
									<dd>서울시 강남구</dd>
								</dl>
							</div>
						</li>
					</ul>
				</li>
				<li>
					<h2>예물 경매 현황</h2>
					<div class="row">
						<div class="col-md-6" id="jewelryAuctionIng">
							<h5 class="v-roll-title">
								<a href="#">입찰중 역경매</a>
							</h5>
							<ul class="v-roll">
								<li><span class="w18"><span>입찰중</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w18">D-21일</span> <span class="w18">접수중</span></li>
								<li><span class="w18"><span>입찰중</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w18">D-21일</span> <span class="w18">접수중</span></li>
								<li><span class="w18"><span>입찰중</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w18">D-21일</span> <span class="w18">접수중</span></li>
								<li><span class="w18"><span>입찰중</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w18">D-21일</span> <span class="w18">접수중</span></li>
								<li><span class="w18"><span>입찰중</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w18">D-21일</span> <span class="w18">접수중</span></li>
								<li><span class="w18"><span>입찰중</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w18">D-21일</span> <span class="w18">접수중</span></li>
								<li><span class="w18"><span>입찰중</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w18">D-21일</span> <span class="w18">접수중</span></li>
							</ul>
						</div>
						<div class="col-md-6" id="jewelryAuctionDone">
							<h5 class="v-roll-title">
								<a href="#">입찰중 역경매</a>
							</h5>
							<ul class="v-roll">
								<li><span class="w18"><span>낙찰</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w36">총 1,1501,5400원</span></li>
								<li><span class="w18"><span>낙찰</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w36">총 1,1501,5400원</span></li>
								<li><span class="w18"><span>낙찰</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w36">총 1,1501,5400원</span></li>
								<li><span class="w18"><span>낙찰</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w36">총 1,1501,5400원</span></li>
								<li><span class="w18"><span>낙찰</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w36">총 1,1501,5400원</span></li>
								<li><span class="w18"><span>낙찰</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w36">총 1,1501,5400원</span></li>
								<li><span class="w18"><span>낙찰</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w36">총 1,1501,5400원</span></li>
							</ul>
						</div>
					</div>
					<h2>예물샵 추천</h2>
					<ul class="recommList">
						<li>
							<div class="imgWrap">
								<img src="<c:url value="/resources/"/>img/studio01.jpg"
									alt="미학스튜디오" title="미학스튜디오" class="img-responsive center-block">
							</div>
							<div class="textBox">
								<dl>
									<dt>미학스튜디오</dt>
									<dd>서울시 강남구</dd>
								</dl>
							</div>
						</li>
						<li>
							<div class="imgWrap">
								<img src="<c:url value="/resources/"/>img/studio03.jpg"
									alt="TimeTow Studio" title="TimeTow Studio"
									class="img-responsive center-block">
							</div>
							<div class="textBox">
								<dl>
									<dt>TimeTow Studio</dt>
									<dd>서울시 강남구</dd>
								</dl>
							</div>
						</li>
						<li>
							<div class="imgWrap">
								<img src="<c:url value="/resources/"/>img/studio04.jpg"
									alt="IDO wedding" title="IDO wedding"
									class="img-responsive center-block">
							</div>
							<div class="textBox">
								<dl>
									<dt>IDO wedding</dt>
									<dd>서울시 강남구</dd>
								</dl>
							</div>
						</li>
						<li>
							<div class="imgWrap">
								<img src="<c:url value="/resources/"/>img/dress01.jpg" alt="포스냅"
									title="포스냅" class="img-responsive center-block">
							</div>
							<div class="textBox">
								<dl>
									<dt>포스냅</dt>
									<dd>서울시 강남구</dd>
								</dl>
							</div>
						</li>
						<li>
							<div class="imgWrap">
								<img src="<c:url value="/resources/"/>img/dress03.jpg"
									alt="마샬브라이드" title="마샬브라이드" class="img-responsive center-block">
							</div>
							<div class="textBox">
								<dl>
									<dt>마샬브라이드</dt>
									<dd>서울시 강남구</dd>
								</dl>
							</div>
						</li>
					</ul>
				</li>
				<li>
					<h2>추가서비스 경매 현황</h2>
					<div class="row">
						<div class="col-md-6" id="eventAuctionIng">
							<h5 class="v-roll-title">
								<a href="#">입찰중 역경매</a>
							</h5>
							<ul class="v-roll">
								<li><span class="w18"><span>입찰중</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w18">D-21일</span> <span class="w18">접수중</span></li>
								<li><span class="w18"><span>입찰중</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w18">D-21일</span> <span class="w18">접수중</span></li>
								<li><span class="w18"><span>입찰중</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w18">D-21일</span> <span class="w18">접수중</span></li>
								<li><span class="w18"><span>입찰중</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w18">D-21일</span> <span class="w18">접수중</span></li>
								<li><span class="w18"><span>입찰중</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w18">D-21일</span> <span class="w18">접수중</span></li>
								<li><span class="w18"><span>입찰중</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w18">D-21일</span> <span class="w18">접수중</span></li>
								<li><span class="w18"><span>입찰중</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w18">D-21일</span> <span class="w18">접수중</span></li>
							</ul>
						</div>
						<div class="col-md-6" id="eventAuctionDone">
							<h5 class="v-roll-title">
								<a href="#">입찰중 역경매</a>
							</h5>
							<ul class="v-roll">
								<li><span class="w18"><span>낙찰</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w36">총 1,1501,5400원</span></li>
								<li><span class="w18"><span>낙찰</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w36">총 1,1501,5400원</span></li>
								<li><span class="w18"><span>낙찰</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w36">총 1,1501,5400원</span></li>
								<li><span class="w18"><span>낙찰</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w36">총 1,1501,5400원</span></li>
								<li><span class="w18"><span>낙찰</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w36">총 1,1501,5400원</span></li>
								<li><span class="w18"><span>낙찰</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w36">총 1,1501,5400원</span></li>
								<li><span class="w18"><span>낙찰</span></span> <span
									class="w18">이O재</span> <span class="w28">서울시 강동구</span> <span
									class="w36">총 1,1501,5400원</span></li>
							</ul>
						</div>
					</div>
					<h2>이벤트업체 추천</h2>
					<ul class="recommList">
						<li>
							<div class="imgWrap">
								<img src="<c:url value="/resources/"/>img/studio01.jpg"
									alt="미학스튜디오" title="미학스튜디오" class="img-responsive center-block">
							</div>
							<div class="textBox">
								<dl>
									<dt>미학스튜디오</dt>
									<dd>서울시 강남구</dd>
								</dl>
							</div>
						</li>
						<li>
							<div class="imgWrap">
								<img src="<c:url value="/resources/"/>img/studio03.jpg"
									alt="TimeTow Studio" title="TimeTow Studio"
									class="img-responsive center-block">
							</div>
							<div class="textBox">
								<dl>
									<dt>TimeTow Studio</dt>
									<dd>서울시 강남구</dd>
								</dl>
							</div>
						</li>
						<li>
							<div class="imgWrap">
								<img src="<c:url value="/resources/"/>img/studio04.jpg"
									alt="IDO wedding" title="IDO wedding"
									class="img-responsive center-block">
							</div>
							<div class="textBox">
								<dl>
									<dt>IDO wedding</dt>
									<dd>서울시 강남구</dd>
								</dl>
							</div>
						</li>
						<li>
							<div class="imgWrap">
								<img src="<c:url value="/resources/"/>img/dress01.jpg" alt="포스냅"
									title="포스냅" class="img-responsive center-block">
							</div>
							<div class="textBox">
								<dl>
									<dt>포스냅</dt>
									<dd>서울시 강남구</dd>
								</dl>
							</div>
						</li>
						<li>
							<div class="imgWrap">
								<img src="<c:url value="/resources/"/>img/dress03.jpg"
									alt="마샬브라이드" title="마샬브라이드" class="img-responsive center-block">
							</div>
							<div class="textBox">
								<dl>
									<dt>마샬브라이드</dt>
									<dd>서울시 강남구</dd>
								</dl>
							</div>
						</li>
					</ul>
				</li>
			</ul>
			<!--현황리스트 끝-->
		
			<div class="statusIndi">
				<ul>
					<li class="on"><a href="#" id="weddingHallList">
							<div class="imgWrap">
								<img src="<c:url value="/resources/"/>img/hall_ico.png" alt=""
									class="img-responsive center-block">
							</div> 웨딩홀
							  <input type="hidden" id="auctionType" name="auctionType" value="v">
					</a></li>
					<li><a href="#" id="sdmList">
							<div class="imgWrap">
								<img src="<c:url value="/resources/"/>img/dress_ico.png" alt=""
									class="img-responsive center-block">
							</div> 스&middot;드&middot;메
							  <input type="hidden" id="auctionType2" name="auctionType" value="s">
							  <input type="hidden" id="auctionType7" name="auctionType" value="d">
							  <input type="hidden" id="auctionType8" name="auctionType" value="m">
					</a></li>
					<li><a href="#" id="honeyMoonList">
							<div class="imgWrap">
								<img src="<c:url value="/resources/"/>img/honeymoon_ico.png"
									alt="" class="img-responsive center-block">
							</div> 허니문
							  <input type="hidden" id="auctionType3" name="auctionType" value="h">
					</a></li>
					<li><a href="#" id="jewelryList">
							<div class="imgWrap">
								<img src="<c:url value="/resources/"/>img/ring_ico.png" alt=""
									class="img-responsive center-block">
							</div> 예물
							  <input type="hidden" id="auctionType4" name="auctionType" value="j">
					</a></li>
					<li><a href="#" id="extraList">
							<div class="imgWrap">
								<img src="<c:url value="/resources/"/>img/service_ico.png"
									alt="" class="img-responsive center-block">
							</div> 추가서비스
							  <input type="hidden" id="auctionType5" name="auctionType" value="e">
					</a></li>
				</ul>
			</div>
			<!--현황리스트페이져-->
		</div>
		</section>
		
		<!-- 후기 -->
		<section class="contents contents02">
		<div class="container">
			<h2>다녀간 고객님들</h2>
			<div id="columns">
				<figure class="wow bounceIn" data-wow-delay="0.5s"> <img
					src="<c:url value="/resources/"/>img/review01.jpg"
					class="img-responsive center-block"> <figcaption>
				<dl>
					<dt>메리어스덕분에 결혼 잘했어요~</dt>
					<dd>
						<span class="name">aawsdaa</span>님 <span class="date">2018.11.16</span>
					</dd>
				</dl>
				</figcaption> </figure>
				<figure class="wow bounceIn" data-wow-delay="0.7s"> <img
					src="<c:url value="/resources/"/>img/review02.jpg"
					class="img-responsive center-block"> <figcaption>
				<dl>
					<dt>메리어스덕분에 결혼 잘했어요~</dt>
					<dd>
						<span class="name">aawsdaa</span>님 <span class="date">2018.11.16</span>
					</dd>
				</dl>
				</figcaption> </figure>
				<figure class="wow bounceIn" data-wow-delay="0.9s"> <img
					src="<c:url value="/resources/"/>img/review03.jpg"
					class="img-responsive center-block"> <figcaption>
				<dl>
					<dt>메리어스덕분에 결혼 잘했어요~</dt>
					<dd>
						<span class="name">aawsdaa</span>님 <span class="date">2018.11.16</span>
					</dd>
				</dl>
				</figcaption> </figure>
				<figure class="wow bounceIn" data-wow-delay="1.1s"> <img
					src="<c:url value="/resources/"/>img/review04.jpg"
					class="img-responsive center-block"> <figcaption>
				<dl>
					<dt>메리어스덕분에 결혼 잘했어요~</dt>
					<dd>
						<span class="name">aawsdaa</span>님 <span class="date">2018.11.16</span>
					</dd>
				</dl>
				</figcaption> </figure>
				<figure class="wow bounceIn" data-wow-delay="1.3s"> <img
					src="<c:url value="/resources/"/>img/review05.jpg"
					class="img-responsive center-block"> <figcaption>
				<dl>
					<dt>메리어스덕분에 결혼 잘했어요~</dt>
					<dd>
						<span class="name">aawsdaa</span>님 <span class="date">2018.11.16</span>
					</dd>
				</dl>
				</figcaption> </figure>
				<figure class="wow bounceIn" data-wow-delay="1.5s"> <img
					src="<c:url value="/resources/"/>img/review06.jpg"
					class="img-responsive center-block"> <figcaption>
				<dl>
					<dt>메리어스덕분에 결혼 잘했어요~</dt>
					<dd>
						<span class="name">aawsdaa</span>님 <span class="date">2018.11.16</span>
					</dd>
				</dl>
				</figcaption> </figure>
				<figure class="wow bounceIn" data-wow-delay="1.7s"> <img
					src="<c:url value="/resources/"/>img/review07.jpg"
					class="img-responsive center-block"> <figcaption>
				<dl>
					<dt>메리어스덕분에 결혼 잘했어요~</dt>
					<dd>
						<span class="name">aawsdaa</span>님 <span class="date">2018.11.16</span>
					</dd>
				</dl>
				</figcaption> </figure>
				<figure class="wow bounceIn" data-wow-delay="1.9s"> <img
					src="<c:url value="/resources/"/>img/review08.jpg"
					class="img-responsive center-block"> <figcaption>
				<dl>
					<dt>메리어스덕분에 결혼 잘했어요~</dt>
					<dd>
						<span class="name">aawsdaa</span>님 <span class="date">2018.11.16</span>
					</dd>
				</dl>
				</figcaption> </figure>
				<figure class="wow bounceIn" data-wow-delay="2.1s"> <img
					src="<c:url value="/resources/"/>img/review09.jpg"
					class="img-responsive center-block"> <figcaption>
				<dl>
					<dt>메리어스덕분에 결혼 잘했어요~</dt>
					<dd>
						<span class="name">aawsdaa</span>님 <span class="date">2018.11.16</span>
					</dd>
				</dl>
				</figcaption> </figure>
			</div>
		</div>
		</section>
		
		<c:import url="/common/importFooter.jsp" />
	</div>
	
	<!--모달-->
	
	<!--플래닝-->
	<div class="modal fade" id="planingModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

				<div class="modal-body">
					<div class="planingContainer">
						<div class="navigation">
							<ol>
								<li><a href="#" data-ref="planPartner">partner</a></li>
								<li><a href="#" data-ref="planPlace">place</a></li>
								<li><a href="#" data-ref="planWedDate">wedDate</a></li>
								<li><a href="#" data-ref="planVenue">venue</a></li>
								<li><a href="#" data-ref="planSdm">sdm</a></li>
								<li><a href="#" data-ref="planHoneyMoon">honeyMoon</a></li>
								<li><a href="#" data-ref="planJewelry">jewelry</a></li>
								<li><a href="#" data-ref="planVisitor">visitor</a></li>
								<li><a href="#" data-ref="planMeal">meal</a></li>
								<li><a href="#" data-ref="planBudget">budget</a></li>
							</ol>
						</div>
						<form action="submitWeddingPlan.do" method="post" id="sign-form" class="sign-form">
							<!-- 로그인했을때 세션에 담기 회원번호 hidden 으로 받기  -->
							<input type="hidden" name="memNo" value="${user.no}"/>
							<ol class="questions">
							<c:if test="${user.general.genGender == 'bri'}">
								<li>
									<span><label for="planPartner">안녕하세요? 예비 신랑님의 이름을 알 수 있을까요?</label></span> 
									<input class="active" id="planPartner" name="planPartner" type="text" placeholder="Enter your partner name" autofocus />
								</li>
							</c:if>
							<c:if test="${user.general.genGender == 'gro'}">
								<li>
									<span><label for="planPartner">안녕하세요? 예비 신부님의 이름을 알 수 있을까요?</label></span> 
									<input class="active" id="planPartner" name="planPartner" type="text" placeholder="Enter your partner name" autofocus />
								</li>
							</c:if>
								<li>
									<span><label for="planPlace">결혼식은 어느 지역에서 하실 예정이신가요~?</label></span> 
									<input id="planPlace" name="planPlace" type="text" placeholder="Enter palce" autofocus />
								</li>
								<li>
									<span><label for="planWedDate">결혼식 예정일을 알수 있을까요~?</label></span>
									<input id="planWedDate" name="planWedDate" type="date" placeholder="Weeding date?" autofocus />
								</li>
								<li>
									<span><label for="planVenue">웨딩홀/장소는 예약하셨나요?</label></span>
									<input id="planVenue" name="planVenue" type="text" placeholder="Are you reserved wedding hall?" autofocus />
								</li>
								<li>
									<span><label for="planSdm">스드메 예약</label></span>
									<input id="planSdm" name="planSdm" type="text" placeholder="booking Studio/Dress/MakeUp??" autofocus />
								</li>
								<li>
									<span><label for="planHoneyMoon">허니문</label></span>
									<input id="planHoneyMoon" name="planHoneyMoon" type="text" placeholder="Have you decided honey moon place?" autofocus />
								</li>
								<li>
									<span><label for="planJewelry">예물</label></span>
									<input id="planJewelry" name="planJewelry" type="text" placeholder="Are you reserved wedding hall?" autofocus />
								</li>
								<li>
									<span><label for="planVisitor">하객수</label></span>
									<input id="planVisitor" name="planVisitor" type="text" placeholder="how many ?" autofocus />
								</li>
								<li>
									<span><label for="planMeal">한명당 예상 식대?!</label></span>
									<input id="planMeal" name="planMeal" type="text" placeholder="how much?" autofocus />
								</li>
								<li>
									<span><label for="planBudget">예산</label></span>
									<input id="planBudget" name="planBudget" type="text" placeholder="how much?" autofocus />
								</li>
								
								<!-- submit 버튼 -->
								<li>
									<p style="margin-top: 45px; font-size: 32pt; float: right">
										<input type="submit" style="color: white; text-decoration: none" id="signup" value="Submit" />
										<!-- <a href="#" style="color: white; text-decoration: none" id="signup">sign up</a> -->
									</p>
								</li>
							</ol>
							<div id="next-page" alt="Kiwi standing on oval"></div>
							<div class="error-message"></div>
			
						</form>
						<h1 id="wf"
							style="opacity: 0; width: 600px; margin-top: 1.1em; display: none; margin-bottom: 1em">Thank
							you</h1>
					</div>
					<!-- <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                  <button type="button" class="btn btn-primary">Save changes</button>
                </div> -->
				</div>
			</div>
		</div>
	</div>
	<!--모달 끝-->
	<!--사이드 바-->
	<c:import url="/common/importSideBar.jsp" />
	<div id="chatBot">
		<h1 class="title">
			<i class="fas fa-question"></i>
		</h1>
		<div class="btnClosed">
			<a href="#"><i class="fas fa-times"></i></a>
		</div>
		<div class="textWrap">
			<div class="textBox">
				<div class="btnBox">
					<a href="#">예</a>
					<a href="#">아니오</a>
				</div>
			</div>
          </div>
          <div class="inputBox inputChatbot">
              <textarea name="chatBotInput" style="resize: none;" id="chatBotInput" cols="30"  class="form-control"></textarea>
              <button class="send">보내기</button>
          </div>
          <div class="inputBox inputWebSocket" style="display: none;">
              <textarea name="webSocketInput" style="resize: none;" id="webSocketInput" cols="30"  class="form-control"></textarea>
              <button class="send" id="webSocketSend">보내기</button>
          </div>
          
      </div>
    
    <script>
		
        $(function(){
            new WOW().init();

            $('.bxslider').bxSlider({
                auto: true,
                speed: 3000,
                pause : 3000,
                mode: 'fade',
                controls : false,
                pagerCustom: '#main_visual_pager'
            });
            $(".statusList").ready(function(){
                var len = $(".statusList > li").length
                var cWidth = $(".statusList > li").innerWidth()
                $(".statusList").css({
                    "width":cWidth*len,
                    "left":"0"
                })
                $(".statusIndi li").click(function(e){
                    e.preventDefault();
                    var index = $(this).index()
                    $(".statusIndi  li").removeClass("on")
                    $(this).addClass("on")
                    $(".statusList").animate({"left":-cWidth*index},300)
                })
            })
            /* 
            $('.v-roll').bxSlider({
                auto: true,
                speed: 3000,
                pause : 3000,
                mode: 'vertical',
                controls : false,
                moveSlides: 1,
                minSlides: 5, 
                maxSlides: 5,
                pager:false
            }); */

			var options = {
				'speed' : 500, //스피드
				'initTop' : 300, //기본top위치
				'alwaysTop' : false, // true
				'default_x' : false
			//레이어가 붙는 아이디 
			}
			$('#sideBar').Floater(options);
            //날짜 카운트
           $.fn.CountDownTimer('11/22/2019 00:00 AM'); 
        });
        
       
/**********************************************************************************
 	역경매 
      	 ver1. 미완
      	
**********************************************************************************/
		
		$(document).ready(function(){
			var auctionType = $("#auctionType").val();
			var auctionStatusIng = $("#auctionStatusIng").val();
			var auctionStatusDone = $("auctionStatusDone").val();
			$.ajax({
				url:"/marryus/main/auctionList.json",
				data:"auctionType="+auctionType,
				type:"post"
			}).done(function(result){
				//ing
				/* $("#venueAuctionIng").html(
				 		"<h5 class='v-roll-title'>"
				 		+"<a href='#'>입찰중 역경매</a></h5>"
				 		+"<div class='bx-wrapper' style='max-width: 100%;'>"
				 		+"<div class='bx-viewport' aria-live='polite' style='width: 100%; overflow: hidden; position: relative; height: 190px;'>"
				 		+"<ul class='v-roll' id='vIngAcution' style='width: auto; position: relative; transition-duration: 3s; transform: translate3d(0px, -228px, 0px);'>"
				 		
				 	);  */
				 	var html ='';
					for(var i = 0 ; i<result.length ; i++){
						if(result[i].auctionStatus == "ing"){
							html +='<li>'
							html +='<span class="w18"><span>'+result[i].memNo+'</span></span>'	 
							html +='<span class="w18">'+result[i].member.name+'</span>'	 
							html +='<span class="w28">서울시 강동구</span>'
							html +='<span class="w18">D-21일</span>'
							html +='<span class="w18">'+result[i].auctionNo+'</span>'	 
							html +='</li>'	
							
							/* $("#vIngAcution").append(
							
							"<li style='float: none; list-style: none; position: relative;' aria-hidden='false' class='bx-clone' aria-hidden='true'>"
							+"<span class='w18'>"+result[i].auctionNo+"</span>"
							+"<span class='w18'>"+result[i].memNo+"</span>"
							+"<span class='w18'>"+result[i].member.name+"</span>"
							+"</li>"
							);  */
							
						}
						
					} 
				 	$("#venueAuctionIng ul").html(html)
					//done
				/* 	$("#venueAuctionDone").html(
					 		"<h5 class='v-roll-title'>"
					 		+"<a href='#'>입찰중 역경매</a></h5>"
					 		+"<div class='bx-wrapper' style='max-width: 100%;'>"
					 		+"<div class='bx-viewport' aria-live='polite' style='width: 100%; overflow: hidden; position: relative; height: 190px;'>"
					 		+"<ul class='v-roll' id='vDoneAcution'>"
					 		
					 ); 
					for(var i = 0 ; i<result.length ; i++){
						if(result[i].auctionStatus == "done"){
							$("#vDoneAcution").append(
							
							"<li style='float: none; list-style: none; position: relative;' aria-hidden='false'>"
							+"<span class='w18'>"+result[i].auctionNo+"</span>"
							+"<span class='w18'>"+result[i].memNo+"</span>"
							+"<span class='w18'>"+result[i].member.name+"</span>"
							+"</li>"
							); 
							
						}
					}  */
				 	$('#venueAuctionIng ul').bxSlider({
		                auto: true,
		                speed: 3000,
		                pause : 3000,
		                mode: 'vertical',
		                controls : false,
		                moveSlides: 1,
		                minSlides: 5, 
		                maxSlides: 5,
		                pager:false
		            });
			});
			
		});
		// 입찰 현황 버튼 클릭시 
		/*
			auctioType만 보내서 auctionStatus는 다 가져와서 
			뿌려줄때 ing 와  done을 걸러 보기 
			
			- issue script.. 잘안먹는데 ..? 이건 어떻게 해결하지??
		*/
        $("#weddingHallList").click(function(){
        	var hall = $("#auctionType").val();
        	var auctionStatus = $("#auctionStatus").val();
        	console.log(hall);
		
        	$.ajax({
				url:"/marryus/main/auctionList.json",
				data:"auctionType="+hall ,
				type:"post"
			}).done(function(result){
				console.log(result)
				//ing
		 	/* 	$("#venueAuctionIng").html(
			 		"<h5 class='v-roll-title'>"
			 		+"<a href='#'>입찰중 역경매</a></h5>"
			 		+"<div class='bx-wrapper' style='max-width: 100%;'>"
			 		+"<div class='bx-viewport' aria-live='polite' style='width: 100%; overflow: hidden; position: relative; height: 190px;'>"
			 		+"<ul class='v-roll' id='vIngAcution'>"
			 		
			 	);  */
			 	var html ='';
				for(var i = 0 ; i<result.length ; i++){
					if(result[i].auctionStatus == "ing"){
						$("#vIngAcution").append(
						
						"<li style='float: none; list-style: none; position: relative;' aria-hidden='false'>"
						+"<span class='w18'>"+result[i].auctionNo+"</span>"
						+"<span class='w18'>"+result[i].memNo+"</span>"
						+"<span class='w18'>"+result[i].member.name+"</span>"
						+"</li>"
						); 
						
					}
				} 
				 
				//done
				$("#venueAuctionDone").html(
				 		"<h5 class='v-roll-title'>"
				 		+"<a href='#'>입찰중 역경매</a></h5>"
				 		+"<div class='bx-wrapper' style='max-width: 100%;'>"
				 		+"<div class='bx-viewport' aria-live='polite' style='width: 100%; overflow: hidden; position: relative; height: 190px;'>"
				 		+"<ul class='v-roll' id='vDoneAcution'>"
				 		
				 ); 
				for(var i = 0 ; i<result.length ; i++){
					if(result[i].auctionStatus == "done"){
				
						$("#vDoneAcution").append(
						
						"<li style='float: none; list-style: none; position: relative;' aria-hidden='false'>"
						+"<span class='w18'>"+result[i].auctionNo+"</span>"
						+"<span class='w18'>"+result[i].memNo+"</span>"
						+"<span class='w18'>"+result[i].member.name+"</span>"
						+"<span class='w18'>"+result[i].auctionStatus+"</span>"
						+"</li>"
						); 
						
					}
				} 

			});
        	
        });
        $("#sdmList").click(function(){
        	var sdm = $("#auctionType2").val();
        	var auctionStatus = $("#auctionStatus").val();
        	console.log(sdm);
        	console.log(auctionStatus);
        	$.ajax({
				url:"/marryus/main/auctionList.json",
				data:"auctionType="+sdm  ,
				type:"post"
			}).done(function(result){
				//ing
				$("#sdmAuctionIng").html(
			 		"<h5 class='v-roll-title'>"
			 		+"<a href='#'>입찰중 역경매</a></h5>"
			 		+"<div class='bx-wrapper' style='max-width: 100%;'>"
			 		+"<div class='bx-viewport' aria-live='polite' style='width: 100%; overflow: hidden; position: relative; height: 190px;'>"
			 		+"<ul class='v-roll' id='sdmIngAcution'>"
			 		
			 	); 
				for(var i = 0 ; i<result.length ; i++){
					$("#sdmIngAcution").append(
						"<li style='float: none; list-style: none; position: relative;' aria-hidden='false'>"
						+"<span class='w18'>입찰중</span>"
						+"<span class='w18'>"+result[i].memNo+"</span>"
						+"<span class='w18'>"+result[i].member.name+"</span>"
						+"</li>"
					); 
				} 
				//done
				$("#sdmAuctionDone").html(
				 		"<h5 class='v-roll-title'>"
				 		+"<a href='#'>입찰중 역경매</a></h5>"
				 		+"<div class='bx-wrapper' style='max-width: 100%;'>"
				 		+"<div class='bx-viewport' aria-live='polite' style='width: 100%; overflow: hidden; position: relative; height: 190px;'>"
				 		+"<ul class='v-roll' id='sdmDoneAcution'>"
				 		
				 ); 
				for(var i = 0 ; i<result.length ; i++){
					if(result[i].auctionStatus == "done"){
						$("#sdmDoneAcution").append(
						
						"<li style='float: none; list-style: none; position: relative;' aria-hidden='false'>"
						+"<span class='w18'>"+result[i].auctionNo+"</span>"
						+"<span class='w18'>"+result[i].memNo+"</span>"
						+"<span class='w18'>"+result[i].member.name+"</span>"
						+"</li>"
						); 
						
					}
				}
				
			});
        	
        });
        $("#honeyMoonList").click(function(){
        	var honeyMoon = $("#auctionType3").val();
        	var auctionStatus = $("#auctionStatus").val();
        	console.log(honeyMoon);
        	console.log(auctionStatus);
        	$.ajax({
				url:"/marryus/main/auctionList.json",
				data:"auctionType="+honeyMoon  ,
				type:"post"
			}).done(function(result){
				//ing
				$("#honeyAuctionIng").html(
			 		"<h5 class='v-roll-title'>"
			 		+"<a href='#'>입찰중 역경매</a></h5>"
			 		+"<div class='bx-wrapper' style='max-width: 100%;'>"
			 		+"<div class='bx-viewport' aria-live='polite' style='width: 100%; overflow: hidden; position: relative; height: 190px;'>"
			 		+"<ul class='v-roll' id='hIngAcution'>"
			 		
			 	); 
				for(var i = 0 ; i<result.length ; i++){
					$("#hIngAcution").append(
		
						"<li style='float: none; list-style: none; position: relative;' aria-hidden='false'>"
						+"<span class='w18'>"+result[i].auctionNo+"</span>"
						+"<span class='w18'>"+result[i].memNo+"</span>"
						+"<span class='w18'>"+result[i].member.name+"</span>"
						+"</li>"
					); 
				} 
				//done
				$("#honeyAuctionDone").html(
				 		"<h5 class='v-roll-title'>"
				 		+"<a href='#'>입찰중 역경매</a></h5>"
				 		+"<div class='bx-wrapper' style='max-width: 100%;'>"
				 		+"<div class='bx-viewport' aria-live='polite' style='width: 100%; overflow: hidden; position: relative; height: 190px;'>"
				 		+"<ul class='v-roll' id='hDoneAcution'>"
				 		
				 ); 
				for(var i = 0 ; i<result.length ; i++){
					if(result[i].auctionStatus == "done"){
						$("#hDoneAcution").append(
						
						"<li style='float: none; list-style: none; position: relative;' aria-hidden='false'>"
						+"<span class='w18'>"+result[i].auctionNo+"</span>"
						+"<span class='w18'>"+result[i].memNo+"</span>"
						+"<span class='w18'>"+result[i].member.name+"</span>"
						+"</li>"
						); 
						
					}
				}
				
			});
        	
        });
        $("#jewelryList").click(function(){
        	var jewelry = $("#auctionType4").val();
        	var auctionStatus = $("#auctionStatus").val();
        	console.log(jewelry);
        	console.log(auctionStatus);
        	$.ajax({
				url:"/marryus/main/auctionList.json",
				data:"auctionType="+jewelry  ,
				type:"post"
			}).done(function(result){
				//ing
				$("#jewelryAuctionIng").html(
			 		"<h5 class='v-roll-title'>"
			 		+"<a href='#'>입찰중 역경매</a></h5>"
			 		+"<div class='bx-wrapper' style='max-width: 100%;'>"
			 		+"<div class='bx-viewport' aria-live='polite' style='width: 100%; overflow: hidden; position: relative; height: 190px;'>"
			 		+"<ul class='v-roll' id='jIngAcution'>"
			 		
			 	); 
				for(var i = 0 ; i<result.length ; i++){
					$("#jIngAcution").append(
		
						"<li style='float: none; list-style: none; position: relative;' aria-hidden='false'>"
						+"<span class='w18'>"+result[i].auctionNo+"</span>"
						+"<span class='w18'>"+result[i].memNo+"</span>"
						+"<span class='w18'>"+result[i].member.name+"</span>"
						+"</li>"
					); 
				} 
				//done
				$("#jewelryAuctionDone").html(
				 		"<h5 class='v-roll-title'>"
				 		+"<a href='#'>입찰중 역경매</a></h5>"
				 		+"<div class='bx-wrapper' style='max-width: 100%;'>"
				 		+"<div class='bx-viewport' aria-live='polite' style='width: 100%; overflow: hidden; position: relative; height: 190px;'>"
				 		+"<ul class='v-roll' id='jDoneAcution'>"
				 		
				 ); 
				for(var i = 0 ; i<result.length ; i++){
					if(result[i].auctionStatus == "done"){
						$("#jDoneAcution").append(
						
						"<li style='float: none; list-style: none; position: relative;' aria-hidden='false'>"
						+"<span class='w18'>"+result[i].auctionNo+"</span>"
						+"<span class='w18'>"+result[i].memNo+"</span>"
						+"<span class='w18'>"+result[i].member.name+"</span>"
						+"</li>"
						); 
						
					}
				}
			});
        	
        });
        $("#extraList").click(function(){
        	var extra = $("#auctionType5").val();
        	var auctionStatus = $("#auctionStatus").val();
        	console.log(extra);
        	console.log(auctionStatus);
        	$.ajax({
				url:"/marryus/main/auctionList.json",
				data:"auctionType="+extra  ,
				type:"post"
			}).done(function(result){
				//ing
				$("#eventAuctionIng").html(
			 		"<h5 class='v-roll-title'>"
			 		+"<a href='#'>입찰중 역경매</a></h5>"
			 		+"<div class='bx-wrapper' style='max-width: 100%;'>"
			 		+"<div class='bx-viewport' aria-live='polite' style='width: 100%; overflow: hidden; position: relative; height: 190px;'>"
			 		+"<ul class='v-roll' id='eIngAcution'>"
			 		
			 	); 
				for(var i = 0 ; i<result.length ; i++){
					$("#eIngAcution").append(
		
						"<li style='float: none; list-style: none; position: relative;' aria-hidden='false'>"
						+"<span class='w18'>"+result[i].auctionNo+"</span>"
						+"<span class='w18'>"+result[i].memNo+"</span>"
						+"<span class='w18'>"+result[i].member.name+"</span>"
						+"</li>"
					); 
				} 
				//done
				$("#eventAuctionDone").html(
				 		"<h5 class='v-roll-title'>"
				 		+"<a href='#'>입찰중 역경매</a></h5>"
				 		+"<div class='bx-wrapper' style='max-width: 100%;'>"
				 		+"<div class='bx-viewport' aria-live='polite' style='width: 100%; overflow: hidden; position: relative; height: 190px;'>"
				 		+"<ul class='v-roll' id='eDoneAcution'>"
				 		
				 ); 
				for(var i = 0 ; i<result.length ; i++){
					if(result[i].auctionStatus == "done"){
						$("#eDoneAcution").append(
						
						"<li style='float: none; list-style: none; position: relative;' aria-hidden='false'>"
						+"<span class='w18'>"+result[i].auctionNo+"</span>"
						+"<span class='w18'>"+result[i].memNo+"</span>"
						+"<span class='w18'>"+result[i].member.name+"</span>"
						+"</li>"
						); 
						
					}
				}
			});
        	
        });
        
        // 
       
/**********************************************************************************
 	비밀번호 찾기 
      	1. 아이디와 이름을 검색해서 회원인지 여부 회원이 아닐시  회원가입 유도 
      	2. 회원이 맞을시아이디 비번 찾도록 유도 
**********************************************************************************/
       $("#checkEmailnName").on('click',function(e){
    	   
    	    var email = $("#passemail").val()
        	var name = $("#passname").val()
       	$.ajax({
       		url:"/marryus/main/checkID.json",
       		data:"email="+email+"&name="+name
       	}).done(function(result){
       		if(result==1){
       			alert("회원입니다. 이메일 인증을 진행해주세요")
       			  e.preventDefault()
       			$("#findPassForm").html($("#nextStep").html());
       		}else{
       			alert("Marry Us 회원이 아닙니다. 회원가입먼저 진행해주세요.")
       			 e.preventDefault()
       			$("#findPassForm").html($("#goToSignUp").html());
       		}
    	   
       	});
       });
        
       
      function gotoSignUp(){
    	  location.href = 'http://localhost:8000/marryus/signup/signupPro.do';
      }
      
      

	</script>
</body>
</html>
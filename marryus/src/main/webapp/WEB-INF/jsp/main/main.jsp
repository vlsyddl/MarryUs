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
<c:import url="/common/importCss.jsp"/>
<c:import url="/common/importJs.jsp"/>
<c:import url="/common/webSocket.jsp"/>
</head>
<body>
	<header>
	<div class="container">
		<div class="row">
			<div class="logo col-md-3">
				<a href="<c:url value="/main/main.do"/>"><img
					src="<c:url value="/resources/img/logo.png"/>" alt=""
					class="img-responsive center-block"></a>
			</div>
			<nav class="gnb col-md-9">
			<div class="gnb_top cf">
				<ul class="cf">
					<li><a href="<c:url value='/signup/signupPro.do' />">회원가입</a></li>
					<!-- 로그인, 로그아웃 -->
					<c:if test="${user.email eq null}">
						<li><a href="#" data-toggle="modal" data-target="#loginModal">로그인</a></li>
					</c:if>
					<c:if test="${user.email ne null}">
						<!-- 일반회원 로그인 했을 때  -->
						<c:if test="${user.type eq 'mg'}">
							<li>${user.general.genName}님이로그인 하셨습니다.</li>
						</c:if>
						<!-- 기업회원 로그인 했을 때  -->
						<c:if test="${user.type eq 'mc'}">
							<li>${user.company.comName}님이로그인 하셨습니다.</li>
						</c:if>
						<li><a href="<c:url value='/main/logout.do' />"> 로그아웃</a></li>
					</c:if>
					<li><a href="<c:url value="/mypage/mywedding.do"/>">마이페이지</a></li>
					<li><a href="#"><i class="far fa-bell"></i></a></li>
				</ul>
			</div>
			<div class="gnb_bot cf">
				<ul class="cf">
					<li><a href="<c:url value="/service/weddingHall.do"/>">웨딩홀</a></li>
					<li><a href="#">스&middot;드&middot;메</a></li>
					<li><a href="#">허니문</a></li>
					<li><a href="#">예물</a></li>
					<li><a href="#">추가서비스</a></li>
				</ul>
			</div>
			</nav>
		</div>
	</div>
	<span class="gnbBar"></span> </header>
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
					class="mainBtn"> 나만의 웨딩 플래닝 </a>
			</div>
			<div class="deadLine">
				<ul>
					<li><a href="#">오O진님의 입찰건이 3일 남았습니다</a></li>
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
		<section class="contents contents01">
		<div class="container">
			<ul class="statusList">
				<li>
					<h2>웨딩홀 경매 현황</h2>
					<div class="row">
						<div class="col-md-6">
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
						<div class="col-md-6">
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
						<div class="col-md-6">
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
						<div class="col-md-6">
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
						<div class="col-md-6">
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
						<div class="col-md-6">
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
						<div class="col-md-6">
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
						<div class="col-md-6">
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
						<div class="col-md-6">
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
						<div class="col-md-6">
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
					<li class="on"><a href="#">
							<div class="imgWrap">
								<img src="<c:url value="/resources/"/>img/hall_ico.png" alt=""
									class="img-responsive center-block">
							</div> 웨딩홀
					</a></li>
					<li><a href="#">
							<div class="imgWrap">
								<img src="<c:url value="/resources/"/>img/dress_ico.png" alt=""
									class="img-responsive center-block">
							</div> 스&middot;드&middot;메
					</a></li>
					<li><a href="#">
							<div class="imgWrap">
								<img src="<c:url value="/resources/"/>img/honeymoon_ico.png"
									alt="" class="img-responsive center-block">
							</div> 허니문
					</a></li>
					<li><a href="#">
							<div class="imgWrap">
								<img src="<c:url value="/resources/"/>img/ring_ico.png" alt=""
									class="img-responsive center-block">
							</div> 예물
					</a></li>
					<li><a href="#">
							<div class="imgWrap">
								<img src="<c:url value="/resources/"/>img/service_ico.png"
									alt="" class="img-responsive center-block">
							</div> 추가서비스
					</a></li>
				</ul>
			</div>
			<!--현황리스트페이져-->
		</div>
		</section>
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
		<footer>
		<div class="container">
			<h3>©2018 MarryUs. All rights reserved.</h3>
		</div>
		</footer>
	</div>
	<!--모달-->
	<!-- 로그인 -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body Page Page--login .Util-not-loaded">
					<nav class="Login-navigation">
					<ul class="Login-navigation__list">
						<li class="Login-navigation__list-item"><a
							class="Login-navigation__link" data-goto="Login-card--login">Login</a>
						</li>
						<li class="Login-navigation__list-item"><a
							class="Login-navigation__link" data-goto="Login-card--register">Register</a>
						</li>
						<li class="Login-navigation__list-item"><a
							class="Login-navigation__link" data-goto="Login-card--connect">Connect
								directly</a></li>
					</ul>
					</nav>

					<main class="Login-main">
					<div class="Login-card-container">
						<section class="Login-card Login-card--login" data-order="1">
						<h2 class="Login-card__title">Login</h2>
						<form method="post" action="/marryus/main/login.do"
							name="loginForm">

							<div class="Form__form-group">

								<div class="Form__input-group">
									<input type="text" name="email" placeholder="E-mail address"
										class="Form__input Login-card__email-input">
								</div>

								<div class="Form__input-group">
									<input type="password" name="pass" placeholder="Password"
										class="Form__input Login-card__password-input">
								</div>

								<div class="Form__input-group">
									<input type="submit" value="Login"
										class="Form__button Login-card__submit-button">
								</div>

							</div>

						</form>
						</section>

						<section
							class="Login-card Login-card--register Login-card--hidden"
							data-order="2">
						<h2 class="Login-card__title">Register</h2>
						<form>

							<div class="Form__form-group">

								<div class="Form__input-group">
									<input type="text" name="email" placeholder="E-mail address"
										class="Form__input Login-card__email-input">
								</div>

								<div class="Form__input-group">
									<input type="password" name="password" placeholder="Password"
										class="Form__input Login-card__password-input">
								</div>

								<div class="Form__input-group">
									<input type="password" name="password_repeat"
										placeholder="Repeat password"
										class="Form__input Login-card__password-input">
								</div>

								<div class="Form__input-group">
									<input type="submit" value="Register"
										class="Form__button Login-card__submit-button">
								</div>

							</div>

						</form>
						</section>

						<section class="Login-card Login-card--connect Login-card--hidden"
							data-order="3">
						<h2 class="Login-card__title">Connect directly</h2>
						<code># TODO</code> </section>
					</div>
					</main>

					<footer class="Login-footer"> Made with <i
						class="fa fa-heart"></i> </footer>
				</div>
			</div>
		</div>
	</div>

	<!--플래닝-->
	<div class="modal fade" id="planingModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

				<div class="modal-body">
					<div class="planingContainer">
						<div class="navigation">
							<ol>
								<li><a href="#" data-ref="name">Name</a></li>
								<li><a href="#" data-ref="uname">Username</a></li>
								<li><a href="#" data-ref="email">Email</a></li>
								<li><a href="#" data-ref="viewpswd">Password</a></li>
								<li><a href="#" data-ref="phone">Phone</a></li>
							</ol>
						</div>
						<form id="sign-form" class="sign-form">
							<ol class="questions">
								<li><span><label for="name">Hi, What is your
											Name?</label></span> <input class="active" id="name" name="name" type="text"
									placeholder="Enter your full name" autofocus /></li>
								<li><span><label for="uname">& what shall we
											call you?</label></span> <input id="uname" name="username" type="text"
									placeholder="Enter a username" autofocus /></li>
								<li><span><label for="email">Enter you email</label></span>
									<input id="email" name="email" type="text" placeholder="Email"
									autofocus /></li>
								<li><span><label for="password">Choose a
											password</label></span> <input id="viewpswd" name="password" type="text"
									placeholder="this your password" /> <input id="password"
									name="password" type="password"
									placeholder="make sure you dont forget" autofocus /> <span
									id="show-pwd" class="view"></span></li>
								<li><span><label for="phone">Enter your
											phone number</label></span> <select name="countryCode" class="country">
										<option data-countryCode="GB" value="91">(+91) INDIA </option>
										<option data-countryCode="GB" value="44">(+44) UK </option>
										<option data-countryCode="US" value="1">(+1) USA </option>
										<optgroup label="Other countries">
											<option data-countryCode="DZ" value="213"> (+213)Algeria</option>
											<option data-countryCode="AD" value="376"> (+376) Andorra</option>
											<option data-countryCode="AO" value="244">(+244) Angola </option>
											<option data-countryCode="AI" value="1264"> (+1264) Anguilla</option>
											<option data-countryCode="AG" value="1268">(+1268) Antigua &amp; Barbuda </option>
											<option data-countryCode="AR" value="54">(+54) Argentina </option>
											<option data-countryCode="AM" value="374"> (+374) Armenia</option>
											<option data-countryCode="AW" value="297">(+297) Aruba </option>
											<option data-countryCode="AU" value="61"> (+61) Australia</option>
											<option data-countryCode="AT" value="43">(+43) Austria </option>
											<option data-countryCode="AZ" value="994"> (+994) Azerbaijan</option>
											<option data-countryCode="BS" value="1242">(+1242)Bahamas </option>
										</optgroup>
								</select> <input id="phone" name="phone" type="text" autofocus /></li>
								<li><p
										style="margin-top: 45px; font-size: 32pt; float: right">
										<a href="#" style="color: white; text-decoration: none"
											id="signup">sign up</a>
									</p></li>


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
	<aside id="sideBar">
	<ul>
		<li><a href="<c:url value="/mypage/mywedding.do"/>"><i
				class="fas fa-user-edit"></i>마이페이지</a></li>
		<li><a href="<c:url value='/board/notice/list.do'/>"><i
				class="fas fa-headset"></i></i>공지 게시판</a></li>
		<li><a href="#"><i class="fas fa-chalkboard-teacher"></i>후기
				게시판</a></li>
		<li><a href="<c:url value='/board/free/list.do'/>"><i
				class="far fa-kiss-wink-heart"></i>신부대기실</a></li>
		<li><a href="#"><i class="far fa-comments"></i>1 : 1 질문</a></li>
		<li><a href="#"><i class="far fa-question-circle"></i>FAQ</a></li>
	</ul>
	</aside>
	<div id="chatBot">
		<h1 class="title">
			<i class="fas fa-question"></i>
		</h1>
		<div class="btnClosed">
			<a href="#"><i class="fas fa-times"></i></a>
		</div>
		<div class="textWrap">
			<div class="textBox">
				<!-- <div class="chatAdmin">
                    <dl>
                        <dt>
                            <img src="img/chat_adm.png" alt="" class="img-responsive center-block">
                        </dt>
                        <dd>
                            테스트
                        </dd>
                    </dl>
                </div>
                <div class="chatCustomer">
                    <dl>
                        <dt>
                            <img src="img/chat_cut.png" alt="" class="img-responsive center-block">
                        </dt>
                        <dd>
                            테스트
                        </dd>
                    </dl>
                </div> -->
			</div>
          </div>
          <div class="inputBox inputChatbot">
              <textarea name="chatBotInput" style="resize: none;" id="chatBotInput" cols="30"  class="form-control"></textarea>
              <button class="send">보내기</button>
          </div>
          <div class="inputBox inputWebSocket" style="display: none;">
              <textarea name="webSocketInput" style="resize: none;" id="webSocketInput" cols="30"  class="form-control"></textarea>
              <button class="send">보내기</button>
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
            });

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
        $(document).ready(function(){
            var textBox = $("#chatBot .textWrap .textBox");
            var inputBox = $("#chatBotInput");
            var adminBox = '<div class="chatAdmin"><dl><dt><img src="/marryus/resources/img/chat_adm.png" alt="" class="img-responsive center-block"></dt><dd></dd></dl></div>';
            $("#chatBot .title").click(function(){
                $("#chatBot").addClass("on")
                setTimeout(function(){
                 sendAdmin("안녕하세요 고객님</br>어떤 점이 궁금하신가요?")
                },1000)
            })
            $(".btnClosed").click(function(e){
                e.preventDefault();
             setTimeout(function(){
                 sendAdmin("실시간 상담 을 종료합니다.")
                },500)
                setTimeout(function(){
                 $("#chatBot").removeClass("on")
                 textBox.html("");
                },1500)
            })
             $("#chatBot").ready(function(){
                $(".inputChatbot .send").click(function(){
                    sendCustomer();
                })
                $("#chatBotInput").keydown(function(e) {
                     if(e.keyCode==13){
                         sendCustomer();
                     }
                 });
            })
            /*보내기*/
            function sendCustomer(){
                var msg = inputBox.val();
                 textBox.append('<div class="chatCustomer"><dl><dt><img src="/marryus/resources/img/chat_cut.png" alt="" class="img-responsive center-block"></dt><dd>'+msg+'</dd></dl></div>')
                 inputBox.val("");
                 textBox.animate({scrollTop: textBox.prop("scrollHeight")}, 500);
                 reciveBot(msg)
            }
            function sendAdmin(){
                var msg = arguments;
                for(i=0;i<arguments.length;i++){
                    (function(x){
                    setTimeout(function(){
                     textBox.append('<div class="chatAdmin"><dl><dt><img src="/marryus/resources/img/chat_adm.png" alt="" class="img-responsive center-block"></dt><dd>'+msg[x]+'</dd></dl></div>')
                     inputBox.val("");
                     textBox.animate({scrollTop: textBox.prop("scrollHeight")}, 500);
                    },500*(x+1))
                    })(i)
                }   
            }

           function reciveBot(msg){
             if ( msg.indexOf('안녕') != -1) {
                 sendAdmin("안녕하세요 고객님</br>어떤 점이 궁금하신가요?")
             }else if(msg.indexOf('웨딩')!=-1 ||msg.indexOf('홀')!=-1 ||msg.indexOf('식장')!=-1 ){
                 sendAdmin("웨딩홀에 관하여 궁금하신가요?</br>담당자를 연결해 드릴게요")
             }else if(msg.indexOf('스튜디오')!=-1||msg.indexOf('드레스')!=-1||msg.indexOf('메이크업')!=-1||msg.indexOf('메이크 업')!=-1||msg.indexOf('스드메')!=-1||msg.indexOf('스 드 메')!=-1||msg.indexOf('스,드,메')!=-1){
                 sendAdmin("스튜디오,메이크업,드레스에 관하여 궁금하신가요? </br> 담당자를 연결해 드릴게요. ")
             }else if(msg.indexOf('허니문')!=-1||msg.indexOf('허니 문')!=-1||msg.indexOf('신혼여행')!=-1||msg.indexOf('신혼 여행')!=-1||msg.indexOf('여행지')!=-1){
                 sendAdmin("허니문,신혼여행에 관하여 궁금하신가요? </br> 담당자를 연결해 드릴께요")
             }else if(msg.indexOf('예물')!=-1||msg.indexOf('예단')!=-1){
                 sendAdmin("예물 예단에 관하여 궁금 하신가요? </br> 담당자를 연결해 드릴게요")
             }else if(msg.indexOf('프로포즈')!=-1||msg.indexOf('케이터링')!=-1||msg.indexOf('이벤트')!=-1){
                 sendAdmin("프로포즈,케이터링,이벤트 등이 궁하신가요? </br> 담당자를 연경해 드릴게요")
             }else if(msg.indexOf('추가서비스')!=-1||msg.indexOf('추가 서비스')!=-1||msg.indexOf('추가')!=-1||msg.indexOf('서비스')!=-1){
                 sendAdmin("추가서비스에 관하여 궁금하신가요?","추가서비스는 프로포즈 케이터링 이벤트 축가등을 소개해드립니다","추가서비스 담당자를 연결해 드릴까요?")
             }else if(msg.indexOf('씨발')!=-1||msg.indexOf('시발')!=-1||msg.indexOf('ㅅㅂ')!=-1||msg.indexOf('ㅅ1발')!=-1||msg.indexOf('미친')!=-1||msg.indexOf('병신')!=-1||msg.indexOf('ㅄ')!=-1||msg.indexOf('개새끼')!=-1||msg.indexOf('개새')!=-1||msg.indexOf('ㄳㄲ')!=-1||msg.indexOf('ㄳㅋ')!=-1){
                 sendAdmin("반사","욕하지마라","나도 욕한다?")
                 $(".inputChatbot").css({"display":"none"})
                 $(".inputWebSocket").css({"display":"block"})
             }else{
                 sendAdmin("무슨말인지 잘모르겠어요 ㅠㅠ","웨딩홀,스드메,예물,허니문,추가 서비스등 ","웨딩에 관련된 질문을 해주시면 ","답변해드릴게요")


								}
							}
						})
	</script>
</body>
</html>
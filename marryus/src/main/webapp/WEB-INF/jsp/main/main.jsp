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
<c:import url="/common/importJs.jsp"/>
<c:import url="/common/importCss.jsp"/>
<c:import url="/common/webSocket.jsp"/>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/locale/ko.js" charset="utf-8"></script>

<style>
.bx-viewport{ height: 200px; }
</style>

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
					<input type="hidden" value="ing" id="auctionStatusValue">
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
		<c:if test="${user.email ne null }">
		<input type="hidden" id="no" name="no" value="${user.no}">
		<div class="marriageInfo">
			<div class="container">
				<div class="col-md-3 infoLeft">
					<div class="prifile cf">
						<div class="imgWrap">
							<img src="<c:url value='/${user.general.genProfilepath}/${user.general.genProfilename}' />" alt=""
								class="img-responsive center-block">
						</div>
						<dl>
							<dt>${user.name}</dt>
							<dd id="genBirth">${user.general.genBirth}</dd>
						</dl>
					</div>
					<div class="time cf">
						<dl class="day">
							<dt>Days</dt>
							<dd>0</dd>
						</dl>
						<dl class="hours">
							<dt>Hours</dt>
							<dd>0</dd>
						</dl>
						<dl class="min">
							<dt>Min</dt>
							<dd>0</dd>
						</dl>
						<dl class="sec">
							<dt>Sec</dt>
							<dd>0</dd>
						</dl>
					</div>
				</div>
				<div class="col-md-9 infoRight">
					<div class="titleBox">
						<h3>Planning Progress</h3>
						<a href="<c:url value='/mypage/mywedding.do' />" >My Wedding > </a>
					</div>
					<ul>
						<li><a href="#">
								<dl>
									<dt>
										<i class="far fa-list-alt"></i>
									</dt>
									<dd  id="profileAuction">
										<b>0</b> <br> <span>out of 0</span>
									</dd>
								</dl>
								<p>Auction List</p>
						</a></li>
						<li><a href="#">
								<dl>
									<dt>
										<i class="fas fa-list-ol"></i>
									</dt>
									<dd id="profileTodo">
										<b>0</b> <br> <span>out of0</span>
									</dd>
								</dl>
								<p>Tasks Completed</p>
						</a></li>
						<li><a href="#">
								<dl>
									<dt>
										<i class="fas fa-male"></i><i class="fas fa-female"></i>
									</dt>
									<dd id="profileLikeCompany">
										<b>0</b> <br> <span>out of 0</span>
									</dd>
								</dl>
								<p>Like Companies</p>
						</a></li>
						<li><a href="#">
								<dl>
									<dt>
										<i class="fas fa-calculator"></i>
									</dt>
									<dd id="profileBudget">
										<b>0</b> <br> <span>out of 0</span>
									</dd>
								</dl>
								<p>Budget spent</p>
						</a></li>
					</ul>
				</div>
			</div>
		</div>
		</c:if>
		
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
							<c:forEach var="auction" items="${totalauctionList}">
								<c:if test="${auction.auctionType eq 'v'}">
									<c:if test="${auction.auctionStatus eq 'ing'}">
										
									<li><span class="w18"><span>입찰중</span></span> <span
										class="w18">${auction.member.name}</span> <span class="w28">서울시 강동구</span> <span
										class="w18">D-21일</span> <span class="w18">접수중</span></li>
									</c:if>
								</c:if>
							</c:forEach>
						<!-- 		<li><span class="w18"><span>입찰중</span></span> <span
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
									class="w18">D-21일</span> <span class="w18">접수중</span></li> -->
							
							</ul> 
						</div>
						<div class="col-md-6" id="venueAuctionDone">
							<h5 class="v-roll-title">
								<a href="#">입찰중 역경매</a>
							</h5>
							<ul class="v-roll">
							
							<c:forEach var="auction" items="${totalauctionList}">
								<c:if test="${auction.auctionType eq 'v'}">
									<c:if test="${auction.auctionStatus eq 'done'}">
										
									<li><span class="w18"><span>낙찰</span></span> <span
									class="w18">${auction.member.name }</span> <span class="w28">서울시 강동구</span> <span
									class="w36">총 1,1501,5400원</span></li>
									</c:if>
								</c:if>
							</c:forEach>
								<!-- <li><span class="w18"><span>낙찰</span></span> <span
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
									class="w36">총 1,1501,5400원</span></li> -->
							</ul>
						</div>
					</div>
					<h2>웨딩홀 추천</h2>
					<ul class="recommList">
					<%-- <c:forEach var="recVenue" items="${recVenue}" >
						<li>
							<div class="imgWrap">
								<img src="/marryus/${recVenue.companyFile.comFilePath}/${recVenue.companyFile.comFileName}"
									alt="${recVenue.comInfoName}" title="${recVenue.comInfoName}" class="img-responsive center-block">
							</div>
							<div class="textBox">
								<dl>
									<dt>${recVenue.comInfoName}</dt>
									<dd>${recVenue.comInfoAddr}</dd>
								</dl>
							</div>
						</li>
					
						
					</c:forEach> --%>
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
							
							<c:forEach var="auction" items="${totalauctionList}">
								<c:if test="${auction.auctionType eq 's'|| auction.auctionType eq 'd' || auction.auctionType eq 'm'}">
									<c:if test="${auction.auctionStatus eq 'ing'}">
									<li><span class="w18"><span>입찰중</span></span> <span
										class="w18">${auction.member.name}</span> <span class="w28">서울시 강동구</span> <span
										class="w18">D-21일</span> <span class="w18">접수중</span></li>
									</c:if>
								</c:if>
							</c:forEach>
								<!-- <li><span class="w18"><span>입찰중</span></span> <span
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
									class="w18">D-21일</span> <span class="w18">접수중</span></li> -->
							</ul>
						</div>
						
					</div>
						<div class="col-md-6" id="sdmAuctionDone">
							<h5 class="v-roll-title">
								<a href="#">입찰중 역경매</a>
							</h5>
							<ul class="v-roll">
							<c:forEach var="auction" items="${totalauctionList}">
								<c:if test="${auction.auctionType eq 's'|| auction.auctionType eq 'd' || auction.auctionType eq 'm'}">
									<c:if test="${auction.auctionStatus eq 'done'}">
								    <li><span class="w18"><span>낙찰</span></span> <span
									class="w18">${auction.member.name}</span> <span class="w28">서울시 강동구</span> <span
									class="w36">총 1,1501,5400원</span></li>
									</c:if>
								</c:if>
							</c:forEach>
							<!-- 	<li><span class="w18"><span>낙찰</span></span> <span
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
									class="w36">총 1,1501,5400원</span></li> -->
							</ul>
						</div>
					</div>
					<h2>스&middot;드&middot;메 추천</h2>
					<ul class="recommList">
			<%-- 		<c:forEach var="recCompany" items="${recommend}">
						<c:if test="${recCompany.comInfoType eq 's' || recCompany.comInfoType eq 'd' || recCompany.comInfoType eq 'm' }">
						<li>
							<div class="imgWrap">
								<img src="/marryus/${recCompany.companyFile.comFilePath}/${recCompany.companyFile.comFileName}"
									alt="${recCompany.comInfoName}" title="${recCompany.comInfoName}" class="img-responsive center-block">
							</div>
							<div class="textBox">
								<dl>
									<dt>${recCompany.comInfoName}</dt>
									<dd>${recCompany.comInfoAddr}</dd>
								</dl>
							</div>
						</li>
						</c:if>
					</c:forEach> --%>
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
							<c:forEach var="auction" items="${totalauctionList}">
								<c:if test="${auction.auctionType eq 'h'}">
								 <c:if test="${auction.auctionStatus eq 'ing'}">
									<li><span class="w18"><span>입찰중</span></span> <span
									class="w18">${auction.member.name}</span> <span class="w28">서울시 강동구</span> <span
									class="w18">D-21일</span> <span class="w18">접수중</span></li>
									</c:if>
								</c:if>
							</c:forEach>
							<!-- 	<li><span class="w18"><span>입찰중</span></span> <span
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
									class="w18">D-21일</span> <span class="w18">접수중</span></li> -->
							</ul>
						</div>
						<div class="col-md-6" id="honeyAuctionDone">
							<h5 class="v-roll-title">
								<a href="#">입찰중 역경매</a>
							</h5>
							<ul class="v-roll">
							<c:forEach var="auction" items="${totalauctionList}">
								<c:if test="${auction.auctionType eq 'h'}">
								 <c:if test="${auction.auctionStatus eq 'done'}">
									<li><span class="w18"><span>낙찰</span></span> <span
									class="w18">${auction.member.name}</span> <span class="w28">서울시 강동구</span> <span
									class="w36">총 1,1501,5400원</span></li>
									</c:if>
								</c:if>
							</c:forEach>
							<!-- 	<li><span class="w18"><span>낙찰</span></span> <span
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
									class="w36">총 1,1501,5400원</span></li> -->
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
							<c:forEach var="auction" items="${totalauctionList}">
								<c:if test="${auction.auctionType eq 'j'}">
								 <c:if test="${auction.auctionStatus eq 'ing'}">
									
									<li><span class="w18"><span>입찰중</span></span> <span
									class="w18">${auction.member.name}</span> <span class="w28">서울시 강동구</span> <span
									class="w18">D-21일</span> <span class="w18">접수중</span></li>
									</c:if>
								</c:if>
							</c:forEach>
							<!-- 	<li><span class="w18"><span>입찰중</span></span> <span
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
									class="w18">D-21일</span> <span class="w18">접수중</span></li> -->
							</ul>
						</div>
						<div class="col-md-6" id="jewelryAuctionDone">
							<h5 class="v-roll-title">
								<a href="#">입찰중 역경매</a>
							</h5>
							<ul class="v-roll">
							<c:forEach var="auction" items="${totalauctionList}">
								<c:if test="${auction.auctionType eq 'j'}">
								 <c:if test="${auction.auctionStatus eq 'done'}">
									<li><span class="w18"><span>낙찰</span></span> <span
									class="w18">${auction.member.name}</span> <span class="w28">서울시 강동구</span> <span
									class="w36">총 1,1501,5400원</span></li>
									</c:if>
								</c:if>
							</c:forEach>
							<!-- 	<li><span class="w18"><span>낙찰</span></span> <span
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
									class="w36">총 1,1501,5400원</span></li> -->
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
							<c:forEach var="auction" items="${totalauctionList}">
								<c:if test="${auction.auctionType eq 'e'}">
								 <c:if test="${auction.auctionStatus eq 'ing'}">
									<li><span class="w18"><span>입찰중</span></span> <span
									class="w18">${auction.member.name}</span> <span class="w28">서울시 강동구</span> <span
									class="w18">D-21일</span> <span class="w18">접수중</span></li>
									</c:if>
								</c:if>
							</c:forEach>
								<!-- <li><span class="w18"><span>입찰중</span></span> <span
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
									class="w18">D-21일</span> <span class="w18">접수중</span></li> -->
							</ul>
						</div>
						<div class="col-md-6" id="eventAuctionDone">
							<h5 class="v-roll-title">
								<a href="#">입찰중 역경매</a>
							</h5>
							<ul class="v-roll">
							<c:forEach var="auction" items="${totalauctionList}">
								<c:if test="${auction.auctionType eq 'e'}">
								 <c:if test="${auction.auctionStatus eq 'done'}">
									<li><span class="w18"><span>낙찰</span></span> <span
									class="w18">${auction.member.name}</span> <span class="w28">서울시 강동구</span> <span
									class="w36">총 1,1501,5400원</span></li>
									</c:if>
								</c:if>
							</c:forEach>
								<!-- <li><span class="w18"><span>낙찰</span></span> <span
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
									class="w36">총 1,1501,5400원</span></li> -->
							</ul>
						</div>
					</div>
					<h2>이벤트업체 추천</h2>
					<ul class="recommList">
					<%-- <c:forEach var="recCompany" items="${recommend}">
						<c:if test="${recCompany.comInfoType eq 'e' }">
						<li>
							<div class="imgWrap">
								<img src="/marryus/${recCompany.companyFile.comFilePath}/${recCompany.companyFile.comFileName}"
									alt="${recCompany.comInfoName}" title="${recCompany.comInfoName}" class="img-responsive center-block">
							</div>
							<div class="textBox">
								<dl>
									<dt>${recCompany.comInfoName}</dt>
									<dd>${recCompany.comInfoAddr}</dd>
								</dl>
							</div>
						</li>
						</c:if>
					</c:forEach> --%>
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
							  <input type="hidden" id="ComInfoType" name="ComInfoType" value="v">
					</a></li>
					<li><a href="#" id="sdmList">
							<div class="imgWrap">
								<img src="<c:url value="/resources/"/>img/dress_ico.png" alt=""
									class="img-responsive center-block">
							</div> 스&middot;드&middot;메
							  <input type="hidden" id="auctionType2" name="auctionType" value="s">
							  <input type="hidden" id="ComInfoType2" name="ComInfoType" value="s">
					</a></li>
					<li><a href="#" id="honeyMoonList">
							<div class="imgWrap">
								<img src="<c:url value="/resources/"/>img/honeymoon_ico.png"
									alt="" class="img-responsive center-block">
							</div> 허니문
							  <input type="hidden" id="auctionType3" name="auctionType" value="h">
							  <input type="hidden" id="ComInfoType3" name="ComInfoType" value="h">
					</a></li>
					<li><a href="#" id="jewelryList">
							<div class="imgWrap">
								<img src="<c:url value="/resources/"/>img/ring_ico.png" alt=""
									class="img-responsive center-block">
							</div> 예물
							  <input type="hidden" id="auctionType4" name="auctionType" value="j">
							  <input type="hidden" id="ComInfoType4" name="ComInfoType" value="j">
					</a></li>
					<li><a href="#" id="extraList">
							<div class="imgWrap">
								<img src="<c:url value="/resources/"/>img/service_ico.png"
									alt="" class="img-responsive center-block">
							</div> 추가서비스
							  <input type="hidden" id="auctionType5" name="auctionType" value="e">
							  <input type="hidden" id="ComInfoType5" name="ComInfoType" value="e">
					</a></li>
				</ul>
			</div>
			<!--현황리스트페이져-->
		</div>
		</section>
		
	<!-- 후기 -->
		<section class="contents contents02">
		<input type="hidden" id="categroy" name="category" value="rv">
		<div class="container">
			<h2>다녀간 고객님들</h2>
			<div id="columns">
				<%-- <figure class="wow bounceIn" data-wow-delay="0.5s"> <img
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
				</dl> --%>
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
								<li><a href="#" data-ref="planVisitor">visitor</a></li>
								<li><a href="#" data-ref="planBudget">budget</a></li>
							</ol>
						</div>
						<form action="submitWeddingPlan.do" method="post" id="sign-form" class="sign-form">
							<!-- 로그인했을때 세션에 담기 회원번호 hidden 으로 받기  -->
							<input type="hidden" id="memNo" name="memNo" value="${user.no}"/>
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
									<span><label for="planVisitor">하객수</label></span>
									<input id="planVisitor" name="planVisitor" type="text" placeholder="how many ?" autofocus />
								</li>
								<li>
									<span><label for="planBudget">예산</label></span>
									<input id="planBudget" name="planBudget" type="text" placeholder="how much?" autofocus />
								</li>
								<!-- submit 버튼 -->
								<li>
									<p style="margin-top: 45px; font-size: 32pt; float: right">
										<input type="submit" style="color: white; text-decoration: none" id="myWeddingPlanBtnStart" value="나만의 웨딩플랜시작하기" />
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
       

     /*    $.fn.CountDownTimer('2019-12-20');  */
 			
        });
       
   
       
       
/**********************************************************************************
 	역경매 
      	 ver1. 미완
      	
**********************************************************************************/
		/*
		$(document).ready(function(){
			var comInfoType = $("#ComInfoType").val();
			$.ajax({
				url: "/marryus/main/recommendCompany.json",
				data: "comInfoType="+comInfoType,
				type:"post"
			}).done(function(result){
				console.log(result);
				var html="";
				for(var b of result.recommendList){
				html+='<li>'
				html+='<div class="imgWrap">'
				html+='<img src="/marryus/'+b.comFilePath+'/'+b.comFileName+'" alt="'+b.comInfoName+'" title="'+b.comInfoName+'" class="img-responsive center-block">'
				html+='</div>'
				html+='<div class="textBox">'
				html+='<dl>'
				html+='<dt>'+b.comInfoName+'</dt>'
				html+='<dd>'+b.comInfoAddr+'</dd>'
				html+='</dl>'
				html+='</div>'
				html+='</li>'
				
				$("#recommList").html(html);
				}
			});
			
		});

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
				
					console.log(result.auctionList);
					console.log(result.auctionListSDM);
				
					
				    var html ='';
					for(var i = 0 ; i<result.auctionList.length ; i++){
						if(result.auctionList[i].auctionStatus == "ing"){
							html +='<li>'
							html +='<span class="w18"><span>'+getAuctionStatus(result.auctionList[i].auctionStatus)+'</span></span>'	 
							html +='<span class="w18">'+result.auctionList[i].member.name+'</span>'	 
							html +='<span class="w28">서울시 강동구</span>'
							html +='<span class="w18">D-'+countDay(result.auctionList[i].auctionEdate) +'</span>'
							html +='<span class="w18">접수중</span>'	 
							html +='</li>'	
						}
					} 
				 	$("#venueAuctionIng ul").html(html)
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
				 	
				 
					//done
				 	var html2 ='';
				 	for(var i = 0 ; i<result.auctionList.length ; i++){
						if(result.auctionList[i].auctionStatus == "done"){
							html2 +='<li>'
							html2 +='<span class="w18"><span>'+getAuctionStatus(result.auctionList[i].auctionStatus)+'</span></span>'	 
							html2 +='<span class="w18">'+result.auctionList[i].member.name+'</span>'	 
							html2 +='<span class="w28">서울시 강동구</span>'
							html2 +='<span class="w36">총 1,1501,5400원</span>'
							html2 +='</li>'	
						}
					} 
					$("#venueAuctionDone ul").html(html2);
					$('#venueAuctionDone ul').bxSlider({
		                auto: true,
		                speed: 3000,
		                pause : 3000,
		                mode: 'vertical',
		                controls : false,
		                moveSlides: 1,
		                minSlides: 3, 
		                maxSlides: 3,
		                pager:false,
		                adaptiveHeight:true
		            });
			
			});
			
		}); // 바로 

		
			$("#weddingHallList").click(function(){
        	var hall = $("#auctionType").val();
        	var auctionStatus = $("#auctionStatus").val();
        	console.log(hall);
		
        	$.ajax({
				url:"/marryus/main/auctionList.json",
				data:"auctionType="+hall ,
				type:"post"
			}).done(function(result){
				
				//ing
			 	var html ='';
				for(var i = 0 ; i<result.auctionList.length ; i++){
					if(result.auctionList[i].auctionStatus == "ing"){
						html +='<li>'
						html +='<span class="w18"><span>'+getAuctionStatus(result.auctionList[i].auctionStatus)+'</span></span>'	 
						html +='<span class="w18">'+result.auctionList[i].member.name+'</span>'	 
						html +='<span class="w28">서울시 강동구</span>'
						html +='<span class="w18">D-'+countDay(result.auctionList[i].auctionEdate) +'</span>'
						html +='<span class="w18">접수중</span>'	 
						html +='</li>'	
					}
				} 
			 	$("#venueAuctionIng ul").html(html)
			 	$('#venueAuctionIng ul').bxSlider({
	                auto: true,
	                speed: 3000,
	                pause : 3000,
	                mode: 'vertical',
	                controls : false,
	                moveSlides: 1,
	                minSlides: 5, 
	                maxSlides: 5,
	                pager:false,
	                adaptiveHeight:true
	            });
			 	
				//done
			 	var html2 ='';
			 	for(var i = 0 ; i<result.auctionList.length ; i++){
					if(result.auctionList[i].auctionStatus == "done"){
						html2 +='<li>'
						html2 +='<span class="w18"><span>'+getAuctionStatus(result.auctionList[i].auctionStatus)+'</span></span>'	 
						html2 +='<span class="w18">'+result.auctionList[i].member.name+'</span>'	 
						html2 +='<span class="w28">서울시 강동구</span>'
						html2 +='<span class="w36">총 1,1501,5400원</span>'
						html2 +='</li>'	
					}
				} 
				$("#venueAuctionDone ul").html(html2);
				$('#venueAuctionDone ul').bxSlider({
	                auto: true,
	                speed: 3000,
	                pause : 3000,
	                mode: 'vertical',
	                controls : false,
	                moveSlides: 1,
	                minSlides: 3, 
	                maxSlides: 3,
	                pager:false,
	                adaptiveHeight:true
	            });
			});

		});
		//웨딩 끝 
		
			$("#sdmList").click(function(){
        	var sdm = $("#auctionType2").val();
		
        	$.ajax({
				url:"/marryus/main/auctionList.json",
				data:"auctionType="+sdm ,
				type:"post"
			}).done(function(result){
				console.log(result)
				//ing
			 	var html ='';
				for(var i = 0 ; i<result.auctionListSDM.length ; i++){
					if(result.auctionListSDM[i].auctionStatus == "ing"){
						html +='<li>'
						html +='<span class="w18"><span>'+getAuctionStatus(result.auctionListSDM[i].auctionStatus)+'</span></span>'	 
						html +='<span class="w18">'+result.auctionListSDM[i].member.name+'</span>'	 
						html +='<span class="w28">서울시 강동구</span>'
						html +='<span class="w18">D-'+countDay(result.auctionListSDM[i].auctionEdate) +'</span>'
						html +='<span class="w18">접수중</span>'	 
						html +='</li>'	
					}
				} 
			 	$("#sdmAuctionIng ul").html(html)
			 	$('#sdmAuctionIng ul').bxSlider({
	                auto: true,
	                speed: 3000,
	                pause : 3000,
	                mode: 'vertical',
	                controls : false,
	                moveSlides: 1,
	                minSlides: 5, 
	                maxSlides: 5,
	                pager:false,
	                adaptiveHeight:true
	            });
			 	
				//done
			 	var html2 ='';
			 	for(var i = 0 ; i<result.auctionListSDM.length ; i++){
					if(result.auctionListSDM[i].auctionStatus == "done"){
						html2 +='<li>'
						html2 +='<span class="w18"><span>'+getAuctionStatus(result.auctionListSDM[i].auctionStatus)+'</span></span>'	 
						html2 +='<span class="w18">'+result.auctionListSDM[i].member.name+'</span>'	 
						html2 +='<span class="w28">서울시 강동구</span>'
						html2 +='<span class="w36">총 1,1501,5400원</span>'
						html2 +='</li>'	
					}
				} 
				$("#sdmAuctionDone ul").html(html2);
				$('#sdmAuctionDone ul').bxSlider({
	                auto: true,
	                speed: 3000,
	                pause : 3000,
	                mode: 'vertical',
	                controls : false,
	                moveSlides: 1,
	                minSlides: 3, 
	                maxSlides: 3,
	                pager:false,
	                adaptiveHeight:true
	            });
			});

		}); // sdm 끝
	
		
			$("#honeyMoonList").click(function(){
        	var honeyMoon = $("#auctionType3").val();
		
        	$.ajax({
				url:"/marryus/main/auctionList.json",
				data:"auctionType="+honeyMoon ,
				type:"post"
			}).done(function(result){
				console.log(result)
				//ing
			 	var html ='';
				for(var i = 0 ; i<result.auctionList.length ; i++){
					if(result.auctionList[i].auctionStatus == "ing"){
						html +='<li>'
						html +='<span class="w18"><span>'+getAuctionStatus(result.auctionList[i].auctionStatus)+'</span></span>'	 
						html +='<span class="w18">'+result.auctionList[i].member.name+'</span>'	 
						html +='<span class="w28">서울시 강동구</span>'
						html +='<span class="w18">D-'+countDay(result.auctionList[i].auctionEdate) +'</span>'
						html +='<span class="w18">접수중</span>'	 
						html +='</li>'	
					}
				} 
			 	$("#honeyAuctionIng ul").html(html)
			 	$('#honeyAuctionIng ul').bxSlider({
	                auto: true,
	                speed: 3000,
	                pause : 3000,
	                mode: 'vertical',
	                controls : false,
	                moveSlides: 1,
	                minSlides: 5, 
	                maxSlides: 5,
	                pager:false,
	                adaptiveHeight:true
	            });
			 	
				//done
			 	var html2 ='';
			 	for(var i = 0 ; i<result.auctionList.length ; i++){
					if(result.auctionList[i].auctionStatus == "done"){
						html2 +='<li>'
						html2 +='<span class="w18"><span>'+getAuctionStatus(result.auctionList[i].auctionStatus)+'</span></span>'	 
						html2 +='<span class="w18">'+result.auctionList[i].member.name+'</span>'	 
						html2 +='<span class="w28">서울시 강동구</span>'
						html2 +='<span class="w36">총 1,1501,5400원</span>'
						html2 +='</li>'	
					}
				} 
				$("#honeyAuctionDone ul").html(html2);
				$('#honeyAuctionDone ul').bxSlider({
	                auto: true,
	                speed: 3000,
	                pause : 3000,
	                mode: 'vertical',
	                controls : false,
	                moveSlides: 1,
	                minSlides: 3, 
	                maxSlides: 3,
	                pager:false,
	                adaptiveHeight:true
	            });
			});

		});
		// 허니문 끝
		
			$("#jewelryList").click(function(){
        	var jewelry = $("#auctionType4").val();
		
        	$.ajax({
				url:"/marryus/main/auctionList.json",
				data:"auctionType="+jewelry ,
				type:"post"
			}).done(function(result){
				console.log(result)
				//ing
			 	var html ='';
				for(var i = 0 ; i<result.auctionList.length ; i++){
					if(result.auctionList[i].auctionStatus == "ing"){
						html +='<li>'
						html +='<span class="w18"><span>'+getAuctionStatus(result.auctionList[i].auctionStatus)+'</span></span>'	 
						html +='<span class="w18">'+result.auctionList[i].member.name+'</span>'	 
						html +='<span class="w28">서울시 강동구</span>'
						html +='<span class="w18">D-'+countDay(result.auctionList[i].auctionEdate) +'</span>'
						html +='<span class="w18">접수중</span>'	 
						html +='</li>'	
					}
				} 
			 	$("#jewelryAuctionIng ul").html(html)
			 	$('#jewelryAuctionIng ul').bxSlider({
	                auto: true,
	                speed: 3000,
	                pause : 3000,
	                mode: 'vertical',
	                controls : false,
	                moveSlides: 1,
	                minSlides: 5, 
	                maxSlides: 5,
	                pager:false,
	                adaptiveHeight:true
	            });
			 	
				//done
			 	var html2 ='';
			 	for(var i = 0 ; i<result.auctionList.length ; i++){
					if(result.auctionList[i].auctionStatus == "done"){
						html2 +='<li>'
						html2 +='<span class="w18"><span>'+getAuctionStatus(result.auctionList[i].auctionStatus)+'</span></span>'	 
						html2 +='<span class="w18">'+result.auctionList[i].member.name+'</span>'	 
						html2 +='<span class="w28">서울시 강동구</span>'
						html2 +='<span class="w36">총 1,1501,5400원</span>'
						html2 +='</li>'	
					}
				} 
				$("#jewelryAuctionDone ul").html(html2);
				$('#jewelryAuctionDone ul').bxSlider({
	                auto: true,
	                speed: 3000,
	                pause : 3000,
	                mode: 'vertical',
	                controls : false,
	                moveSlides: 1,
	                minSlides: 3, 
	                maxSlides: 3,
	                pager:false,
	                adaptiveHeight:true
	            });
			});

		});
		// 예물 끝
			$("#extraList").click(function(){
        	var extra = $("#auctionType5").val();
		
        	$.ajax({
				url:"/marryus/main/auctionList.json",
				data:"auctionType="+extra ,
				type:"post"
			}).done(function(result){
				console.log(result)
				//ing
			 	var html ='';
				for(var i = 0 ; i<result.auctionList.length ; i++){
					if(result.auctionList[i].auctionStatus == "ing"){
						html +='<li>'
						html +='<span class="w18"><span>'+getAuctionStatus(result.auctionList[i].auctionStatus)+'</span></span>'	 
						html +='<span class="w18">'+result.auctionList[i].member.name+'</span>'	 
						html +='<span class="w28">서울시 강동구</span>'
						html +='<span class="w18">D-'+countDay(result.auctionList[i].auctionEdate) +'</span>'
						html +='<span class="w18">접수중</span>'	 
						html +='</li>'	
					}
				} 
			 	$("#eventAuctionIng ul").html(html)
			 	$('#eventAuctionIng ul').bxSlider({
	                auto: true,
	                speed: 3000,
	                pause : 3000,
	                mode: 'vertical',
	                controls : false,
	                moveSlides: 1,
	                minSlides: 5, 
	                maxSlides: 5,
	                pager:false,
	                adaptiveHeight:true
	            });
			 	
				//done
			 	var html2 ='';
			 	for(var i = 0 ; i<result.auctionList.length ; i++){
					if(result.auctionList[i].auctionStatus == "done"){
						html2 +='<li>'
						html2 +='<span class="w18"><span>'+getAuctionStatus(result.auctionList[i].auctionStatus)+'</span></span>'	 
						html2 +='<span class="w18">'+result.auctionList[i].member.name+'</span>'	 
						html2 +='<span class="w28">서울시 강동구</span>'
						html2 +='<span class="w36">총 1,1501,5400원</span>'
						html2 +='</li>'	
					}
				} 
				$("#eventAuctionDone ul").html(html2);
				$('#eventAuctionDone ul').bxSlider({
	                auto: true,
	                speed: 3000,
	                pause : 3000,
	                mode: 'vertical',
	                controls : false,
	                moveSlides: 1,
	                minSlides: 3, 
	                maxSlides: 3,
	                pager:false,
	                adaptiveHeight:true
	            });
			});

		});
		*/
		// 이벤트 끝 
        	
    
     
        /*
        	입찰중/낙찰 변환해주는 함수
        */
        function getAuctionStatus(auctionStatus){
        	switch(auctionStatus){
        	case "ing": return "입찰중";
        	case "done": return "낙찰";
        	}
        }
        
      	/*
    		D-? 남았는지 변환해주는 함수 
   		 */
		function countDay(auctionEdate){
			/* console.log(auctionEdate) */
			var endDate = moment(auctionEdate).format('YYYY-MM-DD');
			/* console.log(endDate); */
			var startDate = moment();
			
			return Math.floor(Math.abs(moment.duration(startDate.diff(endDate)).asDays()));

		}
	
        
 /**********************************************************************************
         	마감임박  불러오기 D-7일 
**********************************************************************************/     
 
  $(document).ready(function(){
	  var auctionStatus = $("#auctionStatusValue").val();
	 	$.ajax({
	 		url:"/marryus/main/deadlineList.json",
	 		data:{auctionStatus:auctionStatus},
	 		type:"POST"
	 	})
	 	.done(function(result){
	 		/* console.log(result); */
	 		var html ='';
			for(var i = 0 ; i<result.length ; i++){
					html +='<li>'
					html +='<a href="#">'+result[i].memName+'님의 입찰건이'+countDay(result[i].auctionEdate) +'일 남았습니다.</a>' 
					html +='</li>'	
			} 
			
			$(".deadLine ul").html(html);
	 	});
	  
  });
 /**********************************************************************************
	프로필 
**********************************************************************************/ 
 	$(document).ready(function(){
 		var memNo =  $("#no").val();
 		
 		// 생년월일 'yyyy.MM.dd로 바꿔주기'
 		var birth = $("#genBirth").text();
 		var year=birth.substring(0,4);
 		var month=birth.substring(4,6);
 		var day=birth.substring(6,8);
 		var memBrithday = year+"."+month+"."+day;
 		$("#genBirth").text(memBrithday);
 		
 		
 		//Planning progress  부분 
 		$.ajax({
 			url:"/marryus/main/proFileDetail.json",
 			data:{memNo:memNo },
 			type:"post"
 		})
 		.done(function(result){
 			console.log(result)
 			var html =""
 			html += '<b>'+result.auctionDone+'</b> <br>'
 	 		html += '<span>out of'+result.auctionTotal+'</span>';
 			$("#profileAuction").html(html)
 			
 			var html2="";
 			html2 += '<b>'+result.todoDone+'</b> <br>'
 			html2 += '<span>out of'+result.todoTotal+'</span>';
 			$("#profileTodo").html(html2)
 			
 			var html3="";
 			html3 += '<b>'+result.likeCompany+'</b> <br>'
 			html3 += '<span>I like that!</span>';
 			$("#profileLikeCompany").html(html3)
 			
 			var html4="";
 			html4 += '<b>spend : '+result.spendBudget+'</b> <br>'
 			html4 += '<span>Total : '+result.totalBudget+'</span>';
 			$("#profileBudget").html(html4)
 			
 		});
 		
 	});
 	
 	//profile - 웨딩 데이 날짜 카운트 
 	$(document).ready(function(){
 		 var no =  $("#memNo").val();
  		
  		$.ajax({
  			url:"/marryus/main/proFileWeddingDate.json",
  			data:{memNo:no },
  			type:"post"
  		})
  		.done(function(result){
  			var wd = moment(result.wedDate).format('YYYY-MM-DD');
  		   $.fn.CountDownTimer(wd); 
  		});
 	});
      
 	
 	$(document).ready(function(){
 		var category = $("#categroy").val();
 		var rSec
 		$.ajax({
 			url: "/marryus/main/reviewList.json",
 			type: "post",
 			data:"category="+category
 		})
 		 .done(function(result){
 			console.log(result);
 			var html= "";
 			for(var b of result.rvList){
				
				rSec = Math.floor(Math.random()*10)/10;
				html+='<figure class="wow bounceIn" data-wow-delay="'+rSec+'s" data-href="'+b.boardNo+'">'
  				html+='<div class="figureWrap">'
				html+='<img src="/marryus/'+b.attach.filePath+'/'+b.attach.fileName+'" onError="javascript:this.src=\'<c:url value="/resources/img/sorry.png"/>\'"class="img-responsive center-block">' 
				html+='<figcaption>'
				html+='<dl>'	
				html+='<dt>'+b.title+'</dt>'		
				html+='<dd>'		
				html+='<span class="name">'+b.writer+'</span>님 <span class="date">'+moment(b.regDate).format("YYYY.MM.DD")+'</span>'			
				html+='</dd>'		
				html+='<dd>'		
				html+='<ul>'
				html+='<li class="views"><i class="far fa-kiss-wink-heart"></i>'+b.viewCnt+'</li>'
				html+='<li class="comment"><i class="far fa-comment-dots"></i> 123</li>'
				html+='</ul>'				
				html+='</dd>'			
				html+='</dl>'									
				html+='</figcaption>'	
				html+='</div>'
  				html+='</figure>' 
			}
 			$("#columns").append(html)
 		});
 	});
 	

	</script>
</body>
</html>
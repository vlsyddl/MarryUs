<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/pikaday/pikaday.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/locale/ko.js" charset="utf-8"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/pikaday/css/pikaday.css">
<style>
#widget_name{
    display: block;
    margin-block-start: 0em;
    margin-block-end: 0em;
    margin-inline-start: 50px;
    margin-inline-end: 26px;
}
#com_info_addr{
    margin-block-start: 2em;
    font-size: 15px;
    font-weight: bold;

}
#comNumber{
 margin-block-start: 1em;
}
#com_info_name{
margin-block-start: 2em;
}
#com_img{
    width: 80px;
    height: 80px;
    border-radius: 50%;
    overflow: hidden;
    float: left;
    margin-block-start: 3em;
}
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
					
				</ul>
			</div>
		</div>
		<!--메인비쥬얼-->
	<c:if test="${user.email ne null }">
	 <input type="hidden" id="no" name="no" value="${user.no}">
	  <c:if test="${ user.type eq 'mg'}">
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
								<p>경매 리스트</p>
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
								<p>체크리스트</p>
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
								<p>관심 업체</p>
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
								<p>예산 관리</p>
						</a></li>
					</ul>
				</div>
			</div>
		</div>
		</c:if>
	<c:if test="${user.type eq 'mc'}">
		<div class="marriageInfo">
			<div class="container">
				<div class="col-md-3 infoLeft">
					<div class="prifile cf">
						<div class="imgWrap" id="com_img" >
							<img src="<c:url value='/${user.comFile.comFilePath}/${user.comFile.comFileName}' />" alt=""
								class="img-responsive center-block">
						</div>
						<dl>
							<dt id="com_info_name">${user.comInfo.comInfoName}</dt>
							<dd id="comNumber">${user.comInfo.comInfoPhone}</dd>
						</dl>
					</div>
					<div class="time cf" id="com_info_addr">
						${user.comInfo.comInfoAddr}
					</div>
				</div>
				<div class="col-md-9 infoRight">
					<div class="titleBox">
						<h3>My Business Widget</h3>
						<a href="<c:url value='/mycompany/myCompany.do' />" >My Company > </a>
					</div>
					<ul>
						<li><a href="<c:url value='/mycompany/myCompany.do'/>">
                                <img src="<c:url value="/resources/"/>img/company_ico.png" alt="" class="img-responsive center-block">
                                <p id="widget_name">My Company</p>
                         
						</a></li>
						<li> <a href="<c:url value='/mycompany/service.do'/>">
                                    <img src="<c:url value="/resources/"/>img/card_ico.png" alt="" class="img-responsive center-block">
                               <p id="widget_name"> My Service</p>
                            </a></li>
						<li><a href="<c:url value='/mycompany/auctionList.do'/>">
                                <img src="<c:url value="/resources/"/>img/graph_ico.png" alt="" class="img-responsive center-block">
                                <p id="widget_name">Auction List</p>
                            </a></li>
				 		<li><a href="<c:url value='/mycompany/reservationView.do'/>">
                                <img src="<c:url value="/resources/"/>img/reservation_icon2.png" alt="" class="img-responsive center-block" style="padding: 5px;">
                               <p id="widget_name"> My Reservation</p>
                            </a>
						</li> 
					</ul>
				</div>
			</div>
		</div>
		</c:if>
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
									<li><span class="w18"><span>입찰중</span></span> 
									<span class="w18">${auction.member.name}</span>
										<c:if test="${auction.venue.weddingVenue eq null}">
											<span class="w28">비밀이야 </span>
										</c:if>
										<span class="w28">${auction.venue.weddingVenue}</span> 
									<span class="w18">
									<c:set var="dday" value="${auction.dday}" />
									D-<fmt:formatNumber value="${dday-(dday%1)}" type="number" />
									
									</span>
									<span class="w18">접수중</span></li>
									</c:if>
								</c:if>
							</c:forEach>
						
							
							</ul> 
						</div>
						<div class="col-md-6" id="venueAuctionDone">
							<h5 class="v-roll-title">
								<a href="#">낙찰된 역경매</a>
							</h5>
							<ul class="v-roll">
							
							<c:forEach var="auction" items="${totalauctionList}">
								<c:if test="${auction.auctionType eq 'v'}">
									<c:if test="${auction.tender.tenderStatus eq 'done'}">
									<li><span class="w18"><span>낙찰</span></span>
									 <span class="w18">${auction.member.name }</span>
										<c:if test="${auction.venue.weddingVenue eq null}">
											<span class="w28">비밀이야 </span>
										</c:if>
										<span class="w28">${auction.venue.weddingVenue}</span> 
										<span class="w36">총 ${auction.tender.tenderBudget} 원</span></li>
									</c:if>
								</c:if>
							</c:forEach>
							
							</ul>
						</div>
					</div>
					<h2>웨딩홀 추천</h2>
					<ul class="recommList">
			 	<c:forEach var="recVenue" items="${recVenue}" >
						<li>
							<div class="imgWrap">
								<img src="/marryus/${recVenue.companyFile.comFilePath}/${recVenue.companyFile.comFileName}"
									alt="${recVenue.comInfoName}" title="${recVenue.comInfoName}" class="img-responsive center-block" style="height:120px; width:198px;">
							</div>
							<div class="textBox">
								<dl>
									<dt>${recVenue.comInfoName}</dt>
									<dd>${recVenue.comInfoAddr}</dd>
								</dl>
							</div>
						</li>
					</c:forEach> 
					
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
									<li><span class="w18"><span>입찰중</span></span> 
									<span class="w18">${auction.member.name}</span> 
									<c:if test="${auction.auctionType eq 's'}">
										<span class="w28">스튜디오 </span>
									</c:if> 
									<c:if test="${auction.auctionType eq 'd'}">
										<span class="w28">드레스 </span>
									</c:if> 
									<c:if test="${auction.auctionType eq 'm'}">
										<span class="w28">메이크업 </span>
									</c:if>
										<span class="w18">
									<c:set var="dday" value="${auction.dday}" />
									D-<fmt:formatNumber value="${dday-(dday%1)}" type="number" />
									</span>
										<span class="w18">접수중</span>
										</li>
									</c:if>
								</c:if>
							</c:forEach>
							
							</ul>
						</div>
						
					</div>
						<div class="col-md-6" id="sdmAuctionDone">
							<h5 class="v-roll-title">
								<a href="#">낙찰된 역경매</a>
							</h5>
							<ul class="v-roll">
							<c:forEach var="auction" items="${totalauctionList}">
								<c:if test="${auction.auctionType eq 's'|| auction.auctionType eq 'd' || auction.auctionType eq 'm'}">
									<c:if test="${auction.tender.tenderStatus eq 'done'}">
								    <li><span class="w18"><span>낙찰</span></span> 
								    <span class="w18">${auction.member.name}</span>
								    <c:if test="${auction.auctionType eq 's'}">
										<span class="w28">스튜디오 </span>
									</c:if> 
									<c:if test="${auction.auctionType eq 'd'}">
										<span class="w28">드레스 </span>
									</c:if> 
									<c:if test="${auction.auctionType eq 'm'}">
										<span class="w28">메이크업 </span>
									</c:if>
										
										<span class="w36">총 ${auction.tender.tenderBudget} 원</span></li>
									</c:if>
								</c:if>
							</c:forEach>
							
							</ul>
						</div>
					</div>
					<h2>스&middot;드&middot;메 추천</h2>
					<ul class="recommList">
				<c:forEach var="recSDM" items="${recSDM}" >
						<li>
							<div class="imgWrap">
								<img src="/marryus/${recSDM.companyFile.comFilePath}/${recSDM.companyFile.comFileName}"
									alt="${recSDM.comInfoName}" title="${recSDM.comInfoName}" class="img-responsive center-block" style="height:120px; width:198px;">
							</div>
							<div class="textBox">
								<dl>
									<dt>${recSDM.comInfoName}</dt>
									<dd>${recSDM.comInfoAddr}</dd>
								</dl>
							</div>
						</li>
					</c:forEach> 
						
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
									<li><span class="w18"><span>입찰중</span></span>
									 <span class="w18">${auction.member.name}</span>
									  <c:if test="${auction.honeyMoon.honeyPlace eq null}">
										<span class="w28">비밀이야 </span>
										</c:if> 
										<span class="w28">${auction.honeyMoon.honeyPlace}</span> 
										<span class="w18">
										<c:set var="dday" value="${auction.dday}" />
									D-<fmt:formatNumber value="${dday-(dday%1)}" type="number" /></span> <span class="w18">접수중</span></li>
									</c:if>
								</c:if>
							</c:forEach>
						
							</ul>
						</div>
						<div class="col-md-6" id="honeyAuctionDone">
							<h5 class="v-roll-title">
								<a href="#">낙찰된 역경매</a>
							</h5>
							<ul class="v-roll">
							<c:forEach var="auction" items="${totalauctionList}">
								<c:if test="${auction.auctionType eq 'h'}">
								 <c:if test="${auction.tender.tenderStatus eq 'done'}">
									<li><span class="w18"><span>낙찰</span></span> 
									<span class="w18">${auction.member.name}</span> 
									<c:if test="${auction.honeyMoon.honeyPlace eq null}">
										<span class="w28">비밀이야 </span>
										</c:if>
										<span class="w28">${auction.honeyMoon.honeyPlace}</span> 
										<span class="w36">총 ${auction.tender.tenderBudget} 원</span></li>
									</c:if>
								</c:if>
							</c:forEach>
						
							</ul>
						</div>
					</div>
					<h2>여행사 추천</h2>
					<ul class="recommList">
					<c:forEach var="recHoney" items="${recHoney}" >
						<li>
							<div class="imgWrap">
								<img src="/marryus/${recHoney.companyFile.comFilePath}/${recHoney.companyFile.comFileName}"
									alt="${recHoney.comInfoName}" title="${recHoney.comInfoName}" class="img-responsive center-block" style="height:120px; width:198px;">
							</div>
							<div class="textBox">
								<dl>
									<dt>${recHoney.comInfoName}</dt>
									<dd>${recHoney.comInfoAddr}</dd>
								</dl>
							</div>
						</li>
					</c:forEach> 
					
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
									
									<li><span class="w18"><span>입찰중</span></span>
									 <span class="w18">${auction.member.name}</span>
									 <c:if test="${auction.jewelry.jewelryPlace eq null}">
										<span class="w28">비밀이야 </span>
										</c:if>
										<span class="w28">${auction.jewelry.jewelryPlace}</span> 
										<span class="w18">
										<c:set var="dday" value="${auction.dday}" />
									D-<fmt:formatNumber value="${dday-(dday%1)}" type="number" /></span> <span class="w18">접수중</span></li>
									</c:if>
								</c:if>
							</c:forEach>
						
							</ul>
						</div>
						<div class="col-md-6" id="jewelryAuctionDone">
							<h5 class="v-roll-title">
								<a href="#">입찰중 역경매</a>
							</h5>
							<ul class="v-roll">
							<c:forEach var="auction" items="${totalauctionList}">
								<c:if test="${auction.auctionType eq 'j'}">
								 <c:if test="${auction.tender.tenderStatus eq 'done'}">
									<li><span class="w18"><span>낙찰</span></span> 
									<span class="w18">${auction.member.name}</span> 
									<c:if test="${auction.jewelry.jewelryPlace eq null}">
										<span class="w28">비밀이야 </span>
										</c:if>
										<span class="w28">${auction.jewelry.jewelryPlace}</span> 
										<span class="w36">총 ${auction.tender.tenderBudget} 원</span></li>
									</c:if>
								</c:if>
							</c:forEach>
							
							</ul>
						</div>
					</div>
					<h2>예물샵 추천</h2>
					<ul class="recommList">
					<c:forEach var="recJewelry" items="${recJewelry}" >
						<li>
							<div class="imgWrap">
								<img src="/marryus/${recJewelry.companyFile.comFilePath}/${recJewelry.companyFile.comFileName}"
									alt="${recJewelry.comInfoName}" title="${recJewelry.comInfoName}" class="img-responsive center-block" style="height:120px; width:198px;">
							</div>
							<div class="textBox">
								<dl>
									<dt>${recJewelry.comInfoName}</dt>
									<dd>${recJewelry.comInfoAddr}</dd>
								</dl>
							</div>
						</li>
					</c:forEach> 
					
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
									<li><span class="w18"><span>입찰중</span></span>
									 <span class="w18">${auction.member.name}</span> 
									<c:if test="${auction.serviceAdd.serviceTitle eq null}">
										<span class="w28">비밀이야 </span>
										</c:if>
										<span class="w28">${auction.serviceAdd.serviceTitle}</span> 
									 <span class="w18">
									<c:set var="dday" value="${auction.dday}" />
									D-<fmt:formatNumber value="${dday-(dday%1)}" type="number" /></span> <span class="w18">접수중</span></li>
									</c:if>
								</c:if>
							</c:forEach>
							
							</ul>
						</div>
						<div class="col-md-6" id="eventAuctionDone">
							<h5 class="v-roll-title">
								<a href="#">낙찰된 역경매</a>
							</h5>
							<ul class="v-roll">
							<c:forEach var="auction" items="${totalauctionList}">
								<c:if test="${auction.auctionType eq 'e'}">
								 <c:if test="${auction.tender.tenderStatus eq 'done'}">
									<li><span class="w18"><span>낙찰</span></span>
									 <span class="w18">${auction.member.name}</span> 
									 <c:if test="${auction.weddingPlan.planPlace eq null}">
										<span class="w28">비밀이야 </span>
										</c:if>
										<span class="w28">${auction.weddingPlan.planPlace}</span> 
									 <span class="w36">총 ${auction.tender.tenderBudget} 원</span></li>
									</c:if>
								</c:if>
							</c:forEach>
								
							</ul>
						</div>
					</div>
					<h2>이벤트업체 추천</h2>
					<ul class="recommList">
					<c:forEach var="recEvent" items="${recEvent}" >
						<li>
							<div class="imgWrap">
								<img src="/marryus/${recEvent.companyFile.comFilePath}/${recEvent.companyFile.comFileName}"
									alt="${recEvent.comInfoName}" title="${recEvent.comInfoName}" class="img-responsive center-block" style="height:120px; width:198px;">
							</div>
							<div class="textBox">
								<dl>
									<dt>${recEvent.comInfoName}</dt>
									<dd>${recEvent.comInfoAddr}</dd>
								</dl>
							</div>
						</li>
					</c:forEach> 
						
					</ul>
					
				
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
								<li><a href="#" data-ref="datepicker">wedDate</a></li>
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
									<span><label for="planPlace">결혼식은 어느 지역에서 하실 예정이신가요~? ex)서울시 강남구</label></span> 
									<input id="planPlace" name="planPlace" type="text" placeholder="Enter palce" autofocus />
								</li>
								<li>
									  <span><label for="planWedDate">결혼식 예정일을 알수 있을까요~?</label></span>
										<input id="datepicker"  name="planWedDate" type="text" placeholder="Weeding date?" autofocus />
								</li>
								<li>
									<span><label for="planVisitor">예상 하객수를 입력해주세요 ~ ex) 200명</label></span>
									<input id="planVisitor" name="planVisitor" type="text" placeholder="how many ?" autofocus />
								</li>
								<li>
									<span><label for="planBudget">총 결혼 예산을 입력해주세요~ ex) 2000만원</label></span>
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
				
				</div>
			</div>
		</div>
	</div>
	<!--모달 끝-->
	<!--사이드 바-->
	<c:import url="/common/importSideBar.jsp" />
	
    <script>
		var user = "${user}";
	/* 	console.log(user) */
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
			
			
			
        });
       /* 
        function dDay(auctionEdate){
			
			var endDate = auctionEdate;
			
			var startDate = moment();
			
			return Math.floor(Math.abs((startDate.diff(endDate).asDays()));

		} */
		
	
        
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

		function countDay(auctionEdate){
				
				var endDate = moment(auctionEdate).format('YYYY-MM-DD');
				
				var startDate = moment();
				
				return Math.floor(Math.abs(moment.duration(startDate.diff(endDate)).asDays()));

			}
 /**********************************************************************************
	프로필 
**********************************************************************************/
 	$(document).ready(function(){
 		if(user!=""){
 		var no =  $("#no").val();
 		
 		// 생년월일 'yyyy.MM.dd로 바꿔주기'
 		var birth = $("#genBirth").text();
 		var year=birth.substring(0,4);
 		var month=birth.substring(4,6);
 		var day=birth.substring(6,8);
 		var memBrithday = year+"."+month+"."+day;
 		$("#genBirth").text(memBrithday);
 		
 		var phone = $("#comNumber").text();
 		var first=phone.substring(0,3);
 		var middle=phone.substring(3,7);
 		var end=phone.substring(7,11);
 		var phoneNumber = first+"-"+middle+"-"+end;
 		$("#comNumber").text(phoneNumber);
 		
 		//Planning progress  부분 
 		$.ajax({
 			url:"/marryus/main/proFileDetail.json",
 			data:"memNo="+no ,
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
	 		
 		}
 	});
 	
 	//profile - 웨딩 데이 날짜 카운트 
 	$(document).ready(function(){
 		if(user !=""){ 			
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
 		}
 	});
      
/**********************************************************************************
	리뷰
**********************************************************************************/	
 	
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
 	

	$("#weddingPlanBtn").on('click',function(e){
		 var memNo="${user.no}";
		 console.log(memNo);
		 $.ajax({
			 url:"/marryus/main/checkMyWeddingPlan.json" ,
			 data:"memNo="+memNo,
			 type:'post'
			 
		 })
		 .done(function(result){
			if(result==1){
				alert("이미 정보가 있습니다. 새롭게 업데이트 하려면 진행해주세요.")
				$("#sign-form").attr("action", "updatetWeddingPlan.do");
			}
		 });
	});
	
	
	    var picker = new Pikaday({ field: document.getElementById('datepicker')/* ,
	    	format: 'YYYY/M/D',
	        toString(date, format) {
	        // you should do formatting based on the passed format,
	        // but we will just return 'D/M/YYYY' for simplicity
	        const day = date.getDate();
	        const month = date.getMonth() + 1;
	        const year = date.getFullYear();
	        return `${year}/${month}/${day}`;
	    },
	    parse(dateString, format) {
	        // dateString is the result of `toString` method
	        const parts = dateString.split('/');
	        const day = parseInt(parts[0], 10);
	        const month = parseInt(parts[1], 10) - 1;
	        const year = parseInt(parts[2], 10);
	        return new Date(year, month, day);
	    } */
	    	
	    
	    });
	</script>

</body>
</html>
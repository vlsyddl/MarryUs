<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>

<script
	src="https://unpkg.com/sweetalert2@latest/dist/sweetalert2.all.js"></script>
<c:import url="/common/importCss.jsp" />
<c:import url="/common/importJs.jsp" />
<style>
.label {
	color: black;
	font-size: 16px;
	line-height: 3em;
	font-family: 맑은 고딕;
	font-weight: 800;
}

input, select {
	height: 26px;
	width: 150px;
	font-family: 맑은 고딕;
}

#grid {
	margin: 30px 30px 30px 60px;
}

body {
	margin: 0;
	padding: 0;
	min-height: 100vh;
}

.container_box {
	padding: 90px 50px;
}

.box {
	width: 800px;
	margin: 0 auto;
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px
		rgba(0, 0, 0, 0.10);
	position: relative;
	border-radius: 10px;
	position: relative;
}

.box__header {
	width: 100%;
	height: 80px;
	background-color: rgba(231, 190, 209, 0.445);
	background:
		url(https://images.unsplash.com/photo-1429679310900-bad303d0e63a?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=c9b51348554d75e0d0924eec1908af6f&auto=format&fit=crop&w=1050&q=80);
	background: linear-gradient(135deg, rgba(237, 141, 161, 1) 0%,
		rgba(249, 178, 195, 1) 30%, rgba(250, 186, 240, 1) 60%,
		rgba(249, 178, 195, 1) 100%);
	display: flex;
	align-items: center;
	overflow: hidden;
	border-radius: 10px 10px 0px 0px;
}

p.title {
	text-indent: 30px;
	font-size: 22px;
	font-weight: 800;
	color: white;
	font-family: 맑은 고딕;
}

.btn {
	position: relative;
	left: 600px;
	border: 2.2px solid #575757;
	background: white;
	padding: 5px 12px;
	margin: 30px 10px;
	font-weight: 700;
	font-family: 맑은 고딕;
	color: #575757;
}

.btn:hover {
	background: #575757;
	border: 2.2px solid #575757;
	color: white;
}

.hidden {
	dispaly: hidden;
}

.tender_content {
	line-height: 3em;
	width: 700px;
}
</style>
</head>
<body>
	<c:import url="/common/importHeader.jsp" />
	<div id="wrap" class="mypage">
		<nav class="myCompanyNav">
		<div class="container">
			<ul>
				<li class="on"><a
					href="<c:url value='/mycompany/myCompany.do'/>"> <img
						src="<c:url value="/resources/"/>img/company_ico.png" alt=""
						class="img-responsive center-block"> 업체 정보
				</a></li>
				<li><a href="<c:url value='/mycompany/service.do'/>"> <img
						src="<c:url value="/resources/"/>img/card_ico.png" alt=""
						class="img-responsive center-block"> 업체 등록
				</a></li>
				<li><a href="<c:url value='/mycompany/auctionList.do'/>"> <img
						src="<c:url value="/resources/"/>img/graph_ico.png" alt=""
						class="img-responsive center-block"> 입찰 현황
				</a></li>
				<li><a href="<c:url value='/mycompany/reservationView.do'/>">
						<img src="<c:url value="/resources/"/>img/reservation_icon2.png"
						alt="" class="img-responsive center-block" style="padding: 5px;">
						예약 현황
				</a></li>
			</ul>
		</div>
		</nav>
		<c:if test="${res!='non'}">
			<c:forEach var="reservation" items="${res}">
				<div class="container_box">
					<div class="box">
						<div class="box__header">
							<div class="menu">

								<div class="menu__elements">
									<p class="title">예약</p>
								</div>
							</div>
						</div>

						<div id="grid">

							<div></div>

							<div id="grid__content">
								<div id="card">

									<div class="signup__field">
										<label class="label">방문여부</label>${reservation.resVisit=='Y' ? '가능' : '불가능'}
									</div>
									<div class="signup__field">
										<label class="label">방문 날짜</label>${reservation.resDate}
										${reservation.resTime}시
									</div>
									<div class="signup__field">
										<label class="label">휴대폰</label>${reservation.resPhone}
									</div>
									<div class="signup__field">
										<label class="label">이메일</label>${reservation.resEmail}
									</div>
									<div class="signup__field">
										<label class="label">추가사항</label>${reservation.resMessage}
									</div>
									<hr>

									<div class="signup__field">
										<label class="label">입찰일</label>
										<fmt:formatDate value="${reservation.tenderRegdate}"
											pattern='yyyy-MM-dd' />
									</div>
									<div class="signup__field">
										<label class="label">입찰금액</label>${reservation.tenderBudget}만원
									</div>
									<div class="signup__field">
										<label class="label">입찰 내용</label>
										<div class="tender_content">
											<p>${reservation.tenderTitle}</p>
											${reservation.tenderInfo}
										</div>
									</div>

									<hr>



								</div>
							</div>

							<div></div>

						</div>


					</div>
				</div>
			</c:forEach>
		</c:if>

	</div>
	<script>
    	$(function(){
    		if(${res}==0){
    			alert("예약 현황이 존재하지 않습니다.");
    			  location.href ="myCompany.do"
    		}
    	});
    </script>

</body>
</html>
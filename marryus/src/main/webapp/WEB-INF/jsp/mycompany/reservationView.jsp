<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script> 
 
<script src="https://unpkg.com/sweetalert2@latest/dist/sweetalert2.all.js"></script> 
    <c:import url="/common/importCss.jsp"/>
	 <c:import url="/common/importJs.jsp"/>
	<style>
			.label{
			color: black;
			font-size: 16px;
			line-height: 3em;
			font-family: 맑은 고딕;
			font-weight: 800;
		}
		
		
		input, select{
			height: 26px;
			width: 150px;
			font-family: 맑은 고딕;
		}
		
		#grid{
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
		  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px rgba(0, 0, 0, 0.10);
		  position: relative;
		  border-radius: 10px;
		  position: relative;
		}
		
		
		
		.box__header {
		  width: 100%;
		  height: 80px;
		  background-color: rgba(231, 190, 209, 0.445);
		  background: url(https://images.unsplash.com/photo-1429679310900-bad303d0e63a?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=c9b51348554d75e0d0924eec1908af6f&auto=format&fit=crop&w=1050&q=80) ;
		  background: linear-gradient(135deg, rgba(237,141,161,1) 0%,rgba(249,178,195,1)30%,rgba(250,186,240,1) 60%,rgba(249,178,195,1) 100%);
		  display: flex;
		  align-items: center;
		  overflow: hidden;
		  border-radius: 10px 10px 0px 0px;
		  }
		  p.title{
		  	text-indent: 30px;
		  	font-size: 22px;
		  	font-weight: 800;
		  	color: white;
		  	font-family: 맑은 고딕;
		  
		  }
		  
		  
		  .btn{
		  	position: relative;
		  	left: 600px;
		  	border: 2.2px solid #575757;
		  	background : white;
		  	padding: 5px 12px;
		  	margin: 30px 10px;
		  	font-weight: 700;
		  	font-family: 맑은 고딕;
		  	color:#575757;
		  }
		  
		    .btn:hover{
		  	background: #575757;
		  	border: 2.2px solid #575757;
		  	color: white;
		  }
		  .hidden{dispaly: hidden;}
		  

	</style>
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
					
							<li>${user.name}님이로그인 하셨습니다.</li>
					
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
	<span class="gnbBar"></span> 
</header>
    <div id="wrap" class="mypage">
        <nav class="myCompanyNav">
            <div class="container">
                    <ul>
                        <li class="on">
                            <a href="<c:url value='/mycompany/myCompany.do'/>">
                                <img src="<c:url value="/resources/"/>img/company_ico.png" alt="" class="img-responsive center-block">
                                My Company
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mycompany/service.do'/>">
                                    <img src="<c:url value="/resources/"/>img/card_ico.png" alt="" class="img-responsive center-block">
                                My Service
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mycompany/auctionList.do'/>">
                                <img src="<c:url value="/resources/"/>img/graph_ico.png" alt="" class="img-responsive center-block">
                                Auction List
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mycompany/reservationView.do'/>">
                                <img src="<c:url value="/resources/"/>img/reservation_icon2.png" alt="" class="img-responsive center-block" style="padding: 5px;">
                                My Reservation
                            </a>
                        </li> 
                    </ul>
            </div>
        </nav>
        <c:if test="${res!=0}">
        <c:forEach var="r" items="${res}">
        <div class="container_box">
  <div class="box">
    <div class="box__header">
      <div class="menu">

        <div class="menu__elements">
          	<p class="title">예약 </p>
        </div>
      </div>
    </div>
    
    <div id="grid">

		<div></div>

		<div id="grid__content">
			<div id="card">

					<div class="signup__field">
						<label for="name" class="label">방문여부</label>${r.resVisit}
					</div>
					<div class="signup__field">
						<label for="name" class="label">방문 날짜</label>${r.resDate} ${r.resTime}시
					</div>
					<div class="signup__field">
						<label for="name" class="label">휴대폰</label>${r.resPhone}
					</div>
					<div class="signup__field">
						<label for="name" class="label">이메일</label>${r.resEmail}
					</div>
					<div class="signup__field">
						<label for="name" class="label">추가사항</label>${r.resEmail}
					</div>
					

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
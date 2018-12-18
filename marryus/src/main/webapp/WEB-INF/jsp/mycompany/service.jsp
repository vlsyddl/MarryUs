<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


    <c:import url="/common/importCss.jsp"/>
	 <c:import url="/common/importJs.jsp"/>
<style>
	table{
		width: 800px;
		margin: auto;
		
	}
	table tr, table td{
		border-collapse: collapse;
		vertical-align: middle;
	}
	
	.table_outer>td{
		border: 1px solid black;
	}
	.title{
		font-size: 20px;
		font-weight: 800;
	}
	.subtitle{
		font-size: 15px;
		font-weight: 500;
	}
	.InsertProfile>td{
		font-size: 50px;
		font-weight: 800;
		border: 3px dashed black;
	}
	


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
        
        
        
        
        
        
	<c:forEach var="auction" items="${autionList}">
	<a >
	<table onClick="location.href='<c:url value="/mycompany/myServiceUpdate.do?memNo=${user.no}&comInfoNo=${auction.comInfoNo}"/>'" style="cursor:pointer;" calss="table_outer">
		<tr>
			<td><img src="<c:url value="/${auction.comFilePath}/${auction.comFileName}"/>" width="150px" height="100px"/></td>
			<td><table><tr><td class="title">${auction.comInfoName}</td></tr>
			<tr><td class="subtitle">
			<c:choose>
				<c:when test="${auction.comInfoType=='v'}">웨딩홀</c:when>
				<c:when test="${auction.comInfoType=='s'}">스튜디오</c:when>
				<c:when test="${auction.comInfoType=='d'}">드레스</c:when>
				<c:when test="${auction.comInfoType=='m'}">메이크업</c:when>
				<c:when test="${auction.comInfoType=='h'}">허니문</c:when>
				<c:when test="${auction.comInfoType=='j'}">예물</c:when>
				<c:when test="${auction.comInfoType=='e'}">기타</c:when>
			</c:choose>
			</td></tr>
			</table>
			</td>
		</tr>
	</table>
	</a>
	</c:forEach>
	<a>
	<table onClick="location.href=`<c:url value="/mycompany/myService.do"/>`" style="cursor:pointer;" class="InsertProfile">
		<tr>
			<td style="font-size: 50px; font-weight: 800;">+</td>
			<td style="font-size: 24px; font-weight: 800;">서비스 등록하기</td>
		<tr>
	</table>
	</a>
	
	</div>
</body>
</html>
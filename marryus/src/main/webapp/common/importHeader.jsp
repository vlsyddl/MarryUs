<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<header>
	<div class="container">
		<div class="row">
			<div class="logo col-md-3 col-md-offset-0 col-xs-4 col-xs-offset-4">
				<a href="<c:url value="/main/main.do"/>"><img
					src="<c:url value="/resources/img/logo.png"/>" alt=""
					class="img-responsive center-block"></a>
			</div>
			<nav class="gnb col-md-9 hidden-md hidden-xs">
			<div class="gnb_top cf hidden-md hidden-xs">
				<ul class="cf">
					<!-- 로그인, 로그아웃 -->
					<c:if test="${user.email eq null}">
						<li><a href="<c:url value='/signup/signupPro.do' />">회원가입</a></li>
						<li><a href="#" data-toggle="modal" data-target="#loginModal">로그인</a></li>
					</c:if>
					<c:if test="${user.email ne null}">
					
					<c:if test="${user.type eq 'mg'}">
						<li>${user.name}님이로그인 하셨습니다.</li>
						<li><a href="<c:url value='/main/logout.do' />"> 로그아웃</a></li>
						<li><a href="<c:url value="/mypage/mywedding.do"/>">마이페이지</a></li>
					</c:if>
					<c:if test="${ user.type eq 'mc'}">
						<li>${user.name}님이로그인 하셨습니다.</li>
						<li><a href="<c:url value='/main/logout.do' />"> 로그아웃</a></li>
						<li><a href="<c:url value="/mycompany/myCompany.do"/>">마이페이지</a></li>
					</c:if>
					</c:if>
					<li><a href="#"><i class="far fa-bell"></i></a></li>
				</ul>
			</div>
			<div class="gnb_bot cf hidden-md hidden-xs">
				<ul class="cf">
					<li><a href="<c:url value="/service/wedding/weddingCompanyList.do"/>">웨딩홀</a></li>
					<li><a href="<c:url value='/service/sdme/companyList.do' />">스&middot;드&middot;메</a></li>
					<li><a href="<c:url value="/service/honeymoon/honeymoonCompanyList.do"/>">허니문</a></li>
					<li><a href="<c:url value="/service/jewelry/companyList.do"/>">예물</a></li>
					<li><a href="<c:url value="/service/serviceAdd/addcompanyList.do"/>">추가서비스</a></li>
				</ul>
			</div>
			</nav>'
			<div class="mGnb visible-md visible-xs">
				<div id="menu_btn">
					<a href="#">
						<span></span>
					</a>
				</div>
			</div>
		</div>
	</div>
	<span class="gnbBar"></span> 
	<div class="menu_mobile">
		
	</div>
</header>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
					<!-- 로그인, 로그아웃 -->
					<c:if test="${user.email eq null}">
						<li><a href="<c:url value='/signup/signupPro.do' />">회원가입</a></li>
						<li><a href="#" data-toggle="modal" data-target="#loginModal">로그인</a></li>
					</c:if>
					<c:if test="${user.email ne null}">
						<li>${user.name}님이로그인 하셨습니다.</li>
						<li><a href="<c:url value='/main/logout.do' />"> 로그아웃</a></li>
						<li><a href="<c:url value="/mypage/mywedding.do"/>">마이페이지</a></li>
					</c:if>
					<li><a href="#"><i class="far fa-bell"></i></a></li>
				</ul>
			</div>
			<div class="gnb_bot cf">
				<ul class="cf">
					<li><a href="<c:url value="/service/wedding/weddingHall.do"/>">웨딩홀</a></li>
					<li><a href="<c:url value='/service/sdme/companyList.do' />">스&middot;드&middot;메</a></li>
					<li><a href="<c:url value="/service/honeymoon/honeymoon.do"/>">허니문</a></li>
					<li><a href="#">예물</a></li>
					<li><a href="#">추가서비스</a></li>
				</ul>
			</div>
			</nav>
		</div>
	</div>
	<span class="gnbBar"></span> 
</header>
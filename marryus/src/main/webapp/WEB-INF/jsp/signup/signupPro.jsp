<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/resources/css/signupPro.css"/>">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	

</head>
<body>
	<div class="container">
		<div class="one-half left">
			<h1>Marry Us 일반회원 가입</h1>
			<a href="<c:url value='/signup/signupGeneral.do' />" class="cta">Let's Go</a>
		</div>
		<div class="one-half right">
			<h1>Marry Us 업체회원 가입</h1>
			<a href="<c:url value='/signup/signupCompany.do' />" class="cta">Let's Go</a>
		</div>
	</div>


	<script>
		$l = $('.left')
		$r = $('.right')

		$l.mouseenter(function() {
			$('.container').addClass('left-is-hovered');
		}).mouseleave(function() {
			$('.container').removeClass('left-is-hovered');
		});

		$r.mouseenter(function() {
			$('.container').addClass('right-is-hovered');
		}).mouseleave(function() {
			$('.container').removeClass('right-is-hovered');
		});
		
		
	</script>
</body>
</html>
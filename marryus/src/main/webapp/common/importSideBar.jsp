<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<aside id="sideBar">
<ul>
	<li><a href="<c:url value="/mypage/mywedding.do"/>"><i
			class="fas fa-user-edit"></i>마이페이지</a></li>
	<li><a href="<c:url value='/board/list.do?category=nt'/>"><i
			class="fas fa-headset"></i></i>공지 게시판</a></li>
	<li><a href="<c:url value='/board/review.do'/>"><i
			class="fas fa-chalkboard-teacher"></i>후기게시판</a></li>
	<li><a href="<c:url value='/board/list.do?category=fr'/>"><i
			class="far fa-kiss-wink-heart"></i>신부대기실</a></li>
	<li><a href="<c:url value='/board/list.do?category=nmm'/>">
		<i class="far fa-comments"></i>1 : 1 질문</a></li>
	<li><a href="/board/list.do?category=fq"><i class="far fa-question-circle"></i>FAQ</a></li>
</ul>
</aside>
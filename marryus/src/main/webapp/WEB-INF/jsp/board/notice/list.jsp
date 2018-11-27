<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Marry Us</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <c:import url="/common/importCss.jsp"/>
	 <c:import url="/common/importJs.jsp"/>
    
</head>
<body>
    <header>
        <div class="container">
            <div class="row">
                <div class="logo col-md-3">
                    <a href="<c:url value="/main/main.do"/>"><img src="<c:url value="/resources/img/logo.png"/>" alt="" class="img-responsive center-block"></a>
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
                            <li class="on"><a href="<c:url value="/service/weddingHall.do"/>">웨딩홀</a></li>
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
    <div id="wrap" class="community">
        <div class="sub_visual">
            <div class="titleBox">
                <h2>공지사항</h2>
                
            </div>
        </div>
        <section class="contents contents01">
            <div class="container">
                <div class="communityTab">
                    <ul>
                        <li  class="on"><a href="<c:url value='/board/notice/list.do'/>">공지게시판</a></li>
                        <li ><a href="review.html">후기 게시판</a></li>
                        <li ><a href="<c:url value='/board/free/list.do'/>">신부 대기실    </a></li>
                        <li ><a href="<c:url value='/board/mtom/mtomlist.do'/>">1:1 질문</a></li>
                        <li ><a href="javascript:void(0);">FAQ</a></li>
                    </ul>
                    <div class="communityContents">
                        <table class="table table-hover">
                            <tr>
                                <th>번호</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>작성일</th>
                                <th>조회수</th>
                            </tr>
						<c:forEach var="b" items="${list}">
                            <tr>
                                <td>${b.no}</td>
                                <td><a href='detail.do?no=${b.boardNo}'>${b.title}</a></td>
                                <td>${b.writer}</td>
                                <td><fmt:formatDate value="${b.regDate}" pattern="yyyy-MM-dd" /></td>
                                <td>${b.viewCnt}</td>
                            </tr>
						</c:forEach>
                    </table>
                    </div>
                    <nav>
                    	<div class="text-center">
                    	<ul class="pagination">
						<li><a
						<c:choose>
					      <c:when test="${beginPage!=1}">href="list.do?pageNo=${beginPage-1}"</c:when>
					      <c:otherwise>href="#"</c:otherwise>
					    </c:choose>
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<c:forEach var="i" begin="${beginPage}" end="${endPage}">
							<li><a
							<c:choose>
					   		<c:when test='${requestScope["javax.servlet.forward.request_uri"].substring(20) eq "/category.do"}'>
					    	href="<c:url value='category.do?pageNo=${i-1}&select=${result.select}&text=${result.text}' />"
					    </c:when>
						
					    <c:otherwise>
					     href="list.do?pageNo=${i}"
					     </c:otherwise>
					      </c:choose>>

								${i}</a></li>
					</c:forEach>

					<li><a
						<c:choose>
					      	<c:when test="${endPage != lastPage}"> href="list.do?pageNo=${endPage+1}" </c:when>
					    	<c:otherwise>href="#"</c:otherwise>
				    	</c:choose>
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
					</ul>
				 </nav>
				<a href="writeForm.do"><button class="btn btn-default">글쓰기</button></a>
				 </div>
                </div>
            </div>
        </section>
    </div>
    <aside id="sideBar">
        <ul>
            <li><a href="#"><i class="fas fa-user-edit"></i>마이페이지</a></li>
            <li><a href="<c:url value='/board/notice/list.do'/>"><i class="fas fa-headset"></i></i>공지 게시판</a></li>
            <li><a href="#"><i class="fas fa-chalkboard-teacher"></i>후기 게시판</a></li>
            <li><a href="#"><i class="far fa-kiss-wink-heart"></i>신부대기실</a></li>
            <li><a href="#"><i class="far fa-comments"></i>1 : 1 질문</a></li>
            <li><a href="#"><i class="far fa-question-circle"></i>FAQ</a></li>
        </ul>
    </aside>
    <script>
         var options = {
                'speed' : 500,				 		//스피드
                'initTop' : 300, 					//기본top위치
                'alwaysTop' : false,				// true
                'default_x' : false 				//레이어가 붙는 아이디 
            }
            $('#sideBar').Floater(options);
    </script>
    
   
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" href="<c:url value="/resources/css/wedding.css"/>">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dc6291b36d6e91a7fc6b30e92a9171d3"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <c:import url="/common/importCss.jsp"/>
	 <c:import url="/common/importJs.jsp"/>
<style>
	


</style>
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
                            <li><a href="#">회원가입</a></li>
                            <li><a href="#" data-toggle="modal" data-target="#loginModal">로그인</a></li>
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
    <div id="wrap" class="wedding">
        <div class="sub_visual">
            <div class="titleBox">
                <h2>웨딩홀</h2>
                <p>
                    웨딩홀 &middot; 스몰웨딩 &middot; 셀프웨딩
                </p>
            </div>
        </div>
        <section class="contents contents01">
            <div class="container">
                <div class="contentsTab">
                    <ul>
                        <li data-target="tab1" class="on"><a href="javascript:void(0);">업체리스트</a></li>
                        <li data-target="tab2"><a href="javascript:void(0);">경매리스트</a></li>
                    </ul>
                    <div class="tabContents">
                        <div class="tab1 on">
                        <div class="serch">
                        	<h3 class="serchText">장소 검색하기</h3>
                        </div>
                        <div class="form_group">
                        	 <input id="address" type="text"  placeholder="ex) 강남구, 아니면 원하시는 웨딩홀을 입력해주세요" />
                             <button  class="btn btn-default" aria-label="Left Align">검색하기</button>
                        </div>
                            <div id="map"></div>
                            <div>
                      <ul class="card-list">
                     <c:forEach var="w" items="${weddinigList}">
	                    <li class="card">
	                        <a href="#" class="card-image"><img src="/marryus/img/comProfile/${w.comFileName}" /></a>
	                        <a>${w.comInfoName}</a>
	                        <a class="card-description" >
	                            <h2>${w.comInfoAddr}</h2>
	                            <p>${w.comInfoAddrDetail}</p>
	                        </a>
	                        <ul>
	                            <li>
	                                <i class="glyphicon glyphicon-user">인원 50~100</i>
	                            </li>
	                            <li>
	                                <span >별점</span>
	                                <span class="glyphicon glyphicon-star"></span>
	                                <span class="glyphicon glyphicon-star"></span>
	                                <span class="glyphicon glyphicon-star"></span>
	                                <span class="glyphicon glyphicon-star"></span>
	                            </li>
	                      
	                        </ul>
	                        <div class="btn-group" role="group">
	                            <button type="button" class="btn btn-default">관심업체 등록</button>
	                        </div>
	                    </li>
                  </c:forEach>
                  
                  <nav>
                    	<div class="text-center">
                    	<ul class="pagination">
						<li><a
						<c:choose>
					      <c:when test="${beginPage!=1}">href="weddingHall.do?pageNo=${beginPage-1}"</c:when>
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
					     href="weddingHall.do?pageNo=${i}"
					     </c:otherwise>
					      </c:choose>>

								${i}</a></li>
					</c:forEach>

					<li><a
						<c:choose>
					      	<c:when test="${endPage != lastPage}"> href="weddingHall.do?pageNo=${endPage+1}" </c:when>
					    	<c:otherwise>href="#"</c:otherwise>
				    	</c:choose>
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
					</ul>
				 </nav>
                    
                 
                </ul>
                            </div>
                        </div>
                        <div class="tab2">
                            tab2
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
     <aside id="sideBar">
            <ul>
                <li><a href="<c:url value="/mypage/mywedding.do"/>"><i class="fas fa-user-edit"></i>마이페이지</a></li>
                <li><a href="<c:url value="/community/notice.do"/>"><i class="fas fa-headset"></i></i>공지 게시판</a></li>
                <li><a href="#"><i class="fas fa-chalkboard-teacher"></i>후기 게시판</a></li>
                <li><a href="#"><i class="far fa-kiss-wink-heart"></i>신부대기실</a></li>
                <li><a href="#"><i class="far fa-comments"></i>1 : 1 질문</a></li>
                <li><a href="#"><i class="far fa-question-circle"></i>FAQ</a></li>
            </ul>
        </aside>
         <script>
            $(function(){
                new WOW().init();
    
                var options = {
                    'speed' : 500,				 		//스피드
                    'initTop' : 300, 					//기본top위치
                    'alwaysTop' : false,				// true
                    'default_x' : false 				//레이어가 붙는 아이디 
                }
                $('#sideBar').Floater(options);
                
                //날짜 카운트
                $.fn.CountDownTimer('11/22/2019 00:00 AM');  
            });
        </script>

<script>
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new daum.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};
	
	var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
</script>



</body>
</html>
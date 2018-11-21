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
                            tab1
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
                <li><a href="<c:url valeu="/community/notice.do"/>"><i class="fas fa-headset"></i></i>공지 게시판</a></li>
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
</body>
</html>
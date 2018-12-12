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
	<c:import url="/common/importHeader.jsp" />
    <div id="wrap" class="mypage">
        <nav class="myPageNav">
            <div class="container">
                    <ul>
                        <li>
                            <a href="<c:url value='/mypage/myweddingService.do'/>">
                                    <img src="img/chk_ico.png" alt="" class="img-responsive center-block">
                                my service 
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mypage/service.do'/>">
                                    <img src="img/chk_ico.png" alt="" class="img-responsive center-block">
                                service add
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mypage/auctionList.do'/>">
                                <img src="img/auction_ico.png" alt="" class="img-responsive center-block">
                                my tender
                            </a>
                        </li>
                    </ul>
            </div>
        </nav>
        
        
        
        
        
        
        
        
        
        
        
        <section class="contents contents01">
            <div class="container">
                <div class="infoBox cf">
                    <div class="col-md-4 no-padding info_left">
                        <div class="time cf">
                            <dl class="day">
                                <dt>Days</dt>
                                <dd>203</dd>
                            </dl>
                            <dl class="hours">
                                <dt>Hours</dt>
                                <dd>22</dd>
                            </dl>
                            <dl class="min">
                                <dt>Min</dt>
                                <dd>30</dd>
                            </dl>
                            <dl class="sec">
                                <dt>Sec</dt>
                                <dd>99</dd>
                            </dl>
                        </div>
                    </div>
                    <div class="col-md-8 no-padding info_right">
                        <div class="profile">
                            <div class="photoBox myPhoto">
                                <img src="img/seungjae.jpg" alt="" class="img-responsive center-block">
                            </div>
                            <div class="photoBox partnerPhoto">
                                    <img src="img/photo_default.png" alt="" class="img-responsive center-block" style="max-width: 50px; padding-top: 10px;">
                            </div>
                            <a href="<c:url value='/mypage/companyUpdateForm.do'/>">
                            <div class="name">
                                <h2>Seungjae Lee</h2>
                                <p>1990.04.30</p>
                            </div>
                            </a>
                        </div>
                        <div class="progressBar">
                            STATUS
                            <progress value="22" max="100"></progress>
                        </div>
                        <div class="infoCount">
                            <ul>
                                <li>
                                    <a href="#">
                                        <dl>
                                            <dt><i class="far fa-list-alt"></i></dt>
                                            <dd>
                                                <b>0</b> <br>
                                                <span>out of 20</span>
                                            </dd>
                                        </dl>
                                        <p>Vendors hired</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <dl>
                                            <dt><i class="fas fa-list-ol"></i></dt>
                                            <dd>
                                                <b>7</b> <br>
                                                <span>out of 70</span>
                                            </dd>
                                        </dl>
                                        <p>Tasks Completed</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <dl>
                                            <dt><i class="fas fa-male"></i><i class="fas fa-female"></i></dt>
                                            <dd>
                                                <b>0</b> <br> 
                                                <span>out of 20</span>
                                            </dd>
                                        </dl>
                                        <p>Guests confirmed</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <dl>
                                            <dt><i class="fas fa-calculator"></i></dt>
                                            <dd>
                                                <b>0</b> <br>
                                                <span>out of 20</span>
                                            </dd>
                                        </dl>
                                        <p>Budget spent</p>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="contents contents02">
            <div class="container">
                <ul>
                    <li>
                        <a href="#">
                            <h2>예식장 </h2>
                            <p><span class="sucsess">2</span>건</p>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <h2>스&middot;드&middot;메 </h2>
                            <p><span class="sucsess">2</span>건</p>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <h2>예물 </h2>
                            <p><span class="sucsess">2</span>건</p>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <h2>허니문 </h2>
                            <p><span class="sucsess">2</span>건</p>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <h2>기타 </h2>
                            <p><span class="sucsess">2</span>건</p>
                        </a>
                    </li>
                </ul>
            </div>
        </section>
        <section class="contents contents03">
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <ul class="CheckList">
                            <li>
                                <a href="#">
                                    <span class="confirm"><i class="fas fa-check"></i></span>
                                    <div>
                                        <h5>체크리스트 제목</h5>
                                        <p>체크리스트 부제목? 대분류?</p>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                        <span class="confirm"><i class="fas fa-check"></i></span>
                                        <div>
                                                <h5>체크리스트 제목</h5>
                                                <p>체크리스트 부제목? 대분류?</p>
                                            </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="confirm"><i class="fas fa-check"></i></span>
                                    <div>
                                            <h5>체크리스트 제목</h5>
                                            <p>체크리스트 부제목? 대분류?</p>
                                        </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-4">
                        <div class="budget">
                            <ul>
                                <li class="maxBudget">총예산 : <span>30000000</span></li>
                                <li class="spendBudget">쓴예산 : <span>20000000</span></li>
                                <li class="remainBudget">남은예산 : <span>20000000</span></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    
    
    
    
    <footer>
        <div class="container">
            <h3>©2018 MarryUs. All rights reserved.</h3>
        </div>
    </footer>
    
    
    
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
</body>
</html>
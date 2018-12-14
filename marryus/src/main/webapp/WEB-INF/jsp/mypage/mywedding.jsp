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
    <input type="hidden" id="memNo" value="${user.no}">
    <input type="hidden" id="no" value="${user.no}">
        <nav class="myPageNav">
            <div class="container">
                    <ul>
                        <li class="on">
                            <a href="<c:url value='/mypage/mywedding.do'/>">
                                    <img src="img/hall_ico.png" alt="" class="img-responsive center-block">
                                My Wedding
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mypage/myTodo.do'/>">
                                    <img src="img/chk_ico.png" alt="" class="img-responsive center-block">
                                Check List
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mypage/myAuction.do?choo=tab1&memNo=${user.no}&auctionType=v'/>">
                                <img src="img/auction_ico.png" alt="" class="img-responsive center-block">
                                Auction List
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mypage/myBudget.do'/>">
                                <img src="img/budget_ico.png" alt="" class="img-responsive center-block">
                                Budget Spent
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mypage/likeCompany.do?memNo=${user.no}'/>">
                                <img src="img/bookmark_ico.png" alt="" class="img-responsive center-block">
                                Bookmark
                            </a>
                        </li>
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
                                <dd>0</dd>
                            </dl>
                            <dl class="hours">
                                <dt>Hours</dt>
                                <dd>0</dd>
                            </dl>
                            <dl class="min">
                                <dt>Min</dt>
                                <dd>0</dd>
                            </dl>
                            <dl class="sec">
                                <dt>Sec</dt>
                                <dd>0</dd>
                            </dl>
                        </div>
                    </div>
                    <div class="col-md-8 no-padding info_right">
                        <div class="profile">
                            <div class="photoBox myPhoto">
                                <img src="img/seungjae.jpg" alt="" class="img-responsive center-block">
                            </div>
                            <div class="photoBox partnerPhoto">
                                    <img src="<c:url value='/${user.general.genProfilepath}/${user.general.genProfilename}' />" alt="" class="img-responsive center-block">
                            </div>
                            <a href="<c:url value='/mypage/generalUpdateForm.do'/>">
                            <div class="name">
                                <h2>${user.name}</h2>
                                <p id="genBirth">${user.general.genBirth}</p>
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
                                            <dd id="profileAuction">
                                                <b>0</b> <br>
                                                <span>out of 20</span>
                                            </dd>
                                        </dl>
                                        <p>Auction List</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="<c:url value='/mypage/myTodo.do'/>">
                                        <dl>
                                            <dt><i class="fas fa-list-ol"></i></dt>
                                            <dd id="profileTodo">
                                                <b>7</b> <br>
                                                <span>out of 70</span>
                                            </dd>
                                        </dl>
                                        <p>Tasks Completed</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="<c:url value='/mypage/likeCompany.do?memNo=${user.no}'/>">
                                        <dl>
                                            <dt><i class="fas fa-male"></i><i class="fas fa-female"></i></dt>
                                            <dd id="profileLikeCompany">
                                                <b>0</b> <br> 
                                                <span>I like that!</span>
                                            </dd>
                                        </dl>
                                        <p>Like Companies</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="<c:url value='/mypage/myBudget.do'/>">
                                        <dl>
                                            <dt><i class="fas fa-calculator"></i></dt>
                                            <dd id="profileBudget">
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
    
    
    
    

    
    
    <c:import url="/common/importSideBar.jsp" />
    <c:import url="/common/importFooter.jsp" />
        <script>
            $(function(){
                new WOW().init();
    
                var options = {
                    'speed' : 500,                   //스피드
                    'initTop' : 300,                //기본top위치
                    'alwaysTop' : false,            // true
                    'default_x' : false             //레이어가 붙는 아이디 
                }
                $('#sideBar').Floater(options);
                
                //날짜 카운트
              /*   $.fn.CountDownTimer('11/22/2019 00:00 AM');   */
                
             // 생년월일 'yyyy.MM.dd로 바꿔주기'
               var birth = $("#genBirth").text();
               var year=birth.substring(0,4);
               var month=birth.substring(4,6);
               var day=birth.substring(6,8);
               var memBrithday = year+"."+month+"."+day;
               $("#genBirth").text(memBrithday);
               
                var no =  $("#memNo").val();
                
                $.ajax({
                 url:"/marryus/mypage/MyproFileDetail.json",
                 data:{memNo:no} ,
                 type:"post"
                 
              }) 
                .done(function(result){
                  console.log(result)
                  var html =""
                  html += '<b>'+result.auctionDone+'</b> <br>'
                   html += '<span>out of'+result.auctionTotal+'</span>';
                  $("#profileAuction").html(html)
                  
                  var html2="";
                  html2 += '<b>'+result.todoDone+'</b> <br>'
                  html2 += '<span>out of'+result.todoTotal+'</span>';
                  $("#profileTodo").html(html2)
                  
                  var html3="";
                  html3 += '<b>'+result.likeCompany+'</b> <br>'
                  html3 += '<span>I like that!</span>';
                  $("#profileLikeCompany").html(html3)
                  
                  var html4="";
                  html4 += '<b>spend : '+result.spendBudget+'</b> <br>'
                  html4 += '<span>Total : '+result.totalBudget+'</span>';
                  $("#profileBudget").html(html4)
                  
               });
               
                 
            });
            $(document).ready(function(){
            	var memNo  = $("#no").val() 
            	  $.ajax({
                      url:"/marryus/mypage/MyproFileWeddingDate.json",
                      data:{memNo:memNo },
                      type:"post"
                   })
                   .done(function(result){
                      var wd = moment(result.wedDate).format('YYYY-MM-DD');
                      $.fn.CountDownTimer(wd); 
                   });
                  
            });
        </script>
</body>
</html>
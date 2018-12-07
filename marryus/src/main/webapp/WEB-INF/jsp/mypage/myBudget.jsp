<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
   <c:import url="/common/importCss.jsp"/>
	 <c:import url="/common/importJs.jsp"/>
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
                            <a href="<c:url value='/mypage/myAuction.do?memNo=${user.no}&auctionType=v'/>">
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


                    </ul>
            </div>
        </nav>



	<input type="text" name="todoContent" />
	<input type="text" name="todoContent" />
	<input type="text" name="todoContent" />
	<input type="text" name="todoContent" />

	<input type="submit">작성하기</input>
</body>
</html> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<c:import url="/common/importCss.jsp"/>
<c:import url="/common/importJs.jsp"/>
<c:import url="/common/webSocket.jsp"/>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<style>
@font-face {
  font-family: 'Lato';
  font-style: normal;
  font-weight: 400;
  src: local('Lato Regular'), local('Lato-Regular'), url(https://fonts.gstatic.com/s/lato/v14/S6uyw4BMUTPHjx4wWw.ttf) format('truetype');
}
@font-face {
  font-family: 'Lato';
  font-style: normal;
  font-weight: 700;
  src: local('Lato Bold'), local('Lato-Bold'), url(https://fonts.gstatic.com/s/lato/v14/S6u9w4BMUTPHh6UVSwiPHA.ttf) format('truetype');
}
@font-face {
  font-family: 'Lato';
  font-style: normal;
  font-weight: 900;
  src: local('Lato Black'), local('Lato-Black'), url(https://fonts.gstatic.com/s/lato/v14/S6u9w4BMUTPHh50XSwiPHA.ttf) format('truetype');
}

.form {
  max-width: 520px;
  background: #ffb5b5;
  margin: 1em auto;
  padding-bottom: 1em;
  border-radius: 8px;
  box-shadow: 0 2px 3px rgba(0, 0, 0, 0.07);
}
.form header {
  border-bottom: 3px double #e9e9e9;
  padding: 1em 0;
  padding-bottom: 1em;
}
.form header h1 {
  text-align: center;
  font-size: 1.3em;
  color: #5f7796;
  font-weight: bolder;
}
.form header h2 {
  text-align: center;
  font-size: 1em;
  color: #94a9c3;
  font-weight: normal;
}
.form .button-submit {
  font-weight: regular;
  color: #fff;
  font-size: 1em;
  padding: 0.8em 2em;
  border-radius: 50em;
  border: none;
  background: #5f7796;
  margin: 1em auto 0.3em;
  display: block;
  transition: all 0.2s linear;
}
.form .button-submit:hover {
  background: #374558;
}
.form ul {
  list-style: none;
  margin: 0;
  padding: 0;
}
.form ul h3 {
  font-weight: normal;
  font-size: 1.2em;
}
.form ul .question {
  padding: 0 1em 1.5em;
  border-bottom: 1px solid #e9e9e9;
}
.form ul .question .choice span {
  background: #70b48b;
  color: #fff;
  font-size: 0.8em;
  padding: 0.5em 1.5em 0.5em 2em;
  margin: 0 1.2em 0 0;
  border-radius: 100px;
  position: relative;
  min-width: 50px;
  text-align: center;
  display: inline-block;
  transition: all 0.2s linear;
  box-shadow: 0 0 0 2px rgba(0, 0, 0, 0) inset, 0 0 0 2px rgba(0, 0, 0, 0);
}
.form ul .question .choice :checked{
    background: #e9e9e9;
  color: #fff;
}
.form ul .question .choice span:before {
  content: '';
  background: #fff;
  position: absolute;
  top: 9px;
  left: 7px;
  border-radius: 50%;
  width: 10px;
  height: 10px;
}
.form ul .question .choice span:after {
  content: '';
  position: absolute;
  z-index: 2;
  width: 6px;
  height: 6px;
  top: 11px;
  left: 9px;
  transform: scale(0);
  border-radius: 50%;
  transition: all 0.3s linear;
}
.form ul .question .choice span:hover,
.form ul .question .choice span:focus {
  background: #417d59;
}
.form ul .question .choice input {
  display: none;
}
.form ul .question .choice input:checked + span {
  box-shadow: 0 0 0 2px #5f7796 inset, 0 0 0 2px rgba(0, 0, 0, 0.1);
}
.form ul .question .choice input:checked + span:after {
  background: #5f7796;
  transform: scale(1);
}
.form .button-start{
    font-weight: regular;
  color: #fff;
  font-size: 1em;
  padding: 0.8em 2em;
  border-radius: 50em;
  border: none;
  background: #5f7796;
  margin: 1em auto 0.3em;
  display: block;
  transition: all 0.2s linear;
}
.form .button-start:hover {
  background: #374558;
}
.container-form {
  font-family: Lato, Helvetica, Arial, sans-serif;
  color: #545454;
 
  margin: 300px;
  min-height: 50vh;
}
.headLine{
font-size:35px;
font-weight:bold;
 text-align: center;
     padding: 6%;
}
.subheadLine{
font-size:20px;
font-weight:bold;
 text-align: center;
     padding: 2%;
}
.questionHead{
 text-align: center;
 font-weight:bold;
 font-size:20px;
 padding: 2%;
}
.question{
	display: table; margin-left: auto; margin-right: auto;

}
.btnConainer{
	margin-left: 25%;
    padding: 10px;
}
</style>
</head>
<body>
<c:import url="/common/importHeader.jsp" />
    <div class="container-form">
        <div class="form">
                <p class="headLine">나만의 웨딩 Todo List</p>
                <p class="subheadLine">원하는 카테고리를 선택해주세요.</p>  
                    <input type="button" class="button-start"  onclick="startSelectList()" value="시작하기"/>
                <!-- form start -->
               <form action="sortingPlan.do" method="post" >
                <input type="hidden" name="memNo" value="75"> 
                
                <ul>
                
                  <li class="question" id="question1" style="display: none">
                    <p class="questionHead">웨딩홀</p>
                    	<div class="btnConainer">
	                        <label class="choice">
	                          <input type="checkbox" name="todoCategory" value="w" onclick="next1()"/>
	                            <span>필요없어요!</span>
	                        </label>
	                        <label class="choice">
	                          <input type="checkbox" name="Category"  onclick="next1()" />
	                            <span>완전! 필요해요!</span>
	                        </label>
                        </div>
                  </li>
                
                    <li class="question" id="question2" style="display: none">
                        <p class="questionHead">스튜디오, 드레스, 메이크업</p>
                        <div class="btnConainer">
                        <label class="choice">
                          <input type="checkbox" name="todoCategory" value="wp" onclick="next2()" />
                            <span>필요없어요</span>
                        </label>
                        <label class="choice">
                          <input type="checkbox" name="Category"   onclick="next2()" />
                            <span>완전! 필요해요!</span>
                        </label>
                        </div>
                  </li>
                    <li class="question" id="question3" style="display: none">
                   		<p class="questionHead">예물, 예단</p>
                   		<div class="btnConainer">
                    	<label class="choice" >
                            <input type="checkbox" name="todoCategory" value="p" onclick="next3()" />
                              <span>필요없어요</span>
                          </label>
                          <label class="choice">
                            <input type="checkbox" name="Category" onclick="next3()" />
                              <span>완전! 필요해요!</span>
                          </label>
                          </div>
                  </li>
                    <li class="question" id="question4" style="display: none">
                  		<p class="questionHead">신혼집, 혼수</p>
                  		<div class="btnConainer">
                    	<label class="choice">
                            <input type="checkbox" name="todoCategory" value="h" onclick="next4()" />
                              <span>필요없어요</span>
                          </label>
                          <label class="choice">
                            <input type="checkbox" name="Category" onclick="next4()"  />
                              <span>완전! 필요해요!</span>
                          </label>
                          </div>
                  </li>
                    <li class="question" id="question5" style="display: none">
                   		<p class="questionHead">기타</p>
                   		<div class="btnConainer">
                        <label class="choice">
                            <input type="checkbox" name="todoCategory" value="e" onclick="next5()" />
                              <span>필요없어요</span>
                          </label>
                          <label class="choice">
                            <input type="checkbox" name="Category" onclick="next5()" />
                              <span>완전! 필요해요!</span>
                          </label>
                          </div>
                  </li>
                </ul>
                </form>
                <button class="button-submit" id="sumitBtn" style="display: none" onclick="sortingResult()">나만의 웨딩플랜 신청하기</button>
            
                 </div>
            </div>
        </div>

<script>
/*
 *	다음 질문들 생성 	
 */

function next1(){
    $("#question2").css("display", "block");
}
function next2(){
    $("#question3").css("display", "block");
}
function next3(){
    $("#question4").css("display", "block");
}
function next4(){
    $("#question5").css("display", "block");
}
function next5(){
    $("#sumitBtn").css("display", "block");
}
function startSelectList(){
   $("#question1").css("display", "block");
}


var result =[];
function sortingResult(){
	$('input:checkbox[name="todoCategory"]').each(function() {


	      if(this.checked){

	    	  result.push(this.value); 

	      }

	 });
	
	
  console.log(result);
  location.href ="http://localhost:8000/marryus/main/resultPlanning.do";
		alert("감사합니다!");
	
}




</script>
</body>
</html>


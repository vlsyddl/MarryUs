<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="main.css" />
    <link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css'/>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
    <link href="https://ivaynberg.github.io/select2/select2-3.5.1/select2.css" rel="stylesheet"/>

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
  margin: 200px;
  min-height: 50vh;
}
</style>
</head>
<body>

    <div class="container-form">
        <div class="form">
                <header>
                    <h1>나만의 웨딩 Todo List</h1>
                    <h2>원하는 카테고리를 선택해주세요.</h2>  
                    <input type="button" class="button-start"  onclick="startSelectList()" value="시작하기"/>
                </header>
                <form action="sortingPlan.do" method="post" >
                <input type="hidden" name="memNo" value="75"> 
                
                <ul>
                  <li class="question" id="question1" style="display: none">
                    <h3>Wedding</h3>
                    <h4>웨딩과 관련된 To do List</h4>
                        <label class="choice">
                        
                          <input type="radio" name="todoC  ategory" value="w" onclick="next1()"/>
                            <span>필요없어요!</span>
                        </label>
                        <label class="choice">
                          <input type="radio" name="Category"  onclick="next1()" />
                            <span>완전! 필요해요!</span>
                        </label>
                  </li>
                
                    <li class="question" id="question2" style="display: none">
                        <h3>스튜디오, 드레스 , 메이크업</h3>
                        <h4>원하는 카테고리를 선택해주세요.</h4>
                        <label class="choice">
                          <input type="radio" name="todoCategory" value="wp" onclick="next2()" />
                            <span>필요없어요</span>
                        </label>
                        <label class="choice">
                          <input type="radio" name="Category"   onclick="next2()" />
                            <span>완전! 필요해요!</span>
                        </label>
                  </li>
                    <li class="question" id="question3" style="display: none">
                    <h3>신혼집, 혼수</h3>
                    <label class="choice" >
                            <input type="radio" name="todoCategory" value="h" onclick="next3()" />
                              <span>필요없어요</span>
                          </label>
                          <label class="choice">
                            <input type="radio" name="Category" onclick="next3()" />
                              <span>완전! 필요해요!</span>
                          </label>
                  </li>
                    <li class="question" id="question4" style="display: none">
                    <h3>예물,예단</h3>
                    <label class="choice">
                            <input type="radio" name="todoCategory" value="p" onclick="next4()" />
                              <span>필요없어요</span>
                          </label>
                          <label class="choice">
                            <input type="radio" name="Category" onclick="next4()"  />
                              <span>완전! 필요해요!</span>
                          </label>
                  </li>
                    <li class="question" id="question5" style="display: none">
                    <h3>기타</h3>
                        <label class="choice">
                            <input type="radio" name="todoCategory" value="e" onclick="next5()" />
                              <span>필요없어요</span>
                          </label>
                          <label class="choice">
                            <input type="radio" name="Category" onclick="next5()" />
                              <span>완전! 필요해요!</span>
                          </label>
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



function sortingResult(){
  location.href ="http://localhost:8000/marryus/main/resultPlanning.do";
		alert("감사합니다!");
	
}


</script>
</body>
</html>
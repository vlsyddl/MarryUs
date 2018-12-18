<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Remember to include jQuery :) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<c:import url="/common/importCss.jsp"/>
<c:import url="/common/importJs.jsp"/>
<c:import url="/common/webSocket.jsp"/>
<script src="//min.gitcdn.xyz/repo/wintercounter/Protip/master/protip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<link rel="stylesheet" href="//min.gitcdn.xyz/repo/wintercounter/Protip/master/protip.min.css">
<link rel="stylesheet" href="https://unpkg.com/microtip/microtip.css">
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
  background: #ffb5b5a6;
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
.modal  {
max-width:700px;
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
                
                  <li class="question" id="question1" style="display: none" 
                  aria-label="카테고리 웨딩홀: 웨딩홀에 관련된 TodoList를 작성해 들여요~" data-microtip-position="left" data-microtip-size="medium" role="tooltip">
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
                
                    <li class="question" id="question2" style="display: none" 
                    aria-label="스튜디오, 드레스, 메이크업.. 생각해만도 머리가 아프죠?! 저희가 Todo List 말끔하게 정리해 드려요~" data-microtip-size="medium" data-microtip-position="right" role="tooltip">
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
                    <li class="question" id="question3" style="display: none"
                    aria-label="어디서부터 해야 될지~ 하나도 모르겠다면 완전 필요해요!! 를 선택해주세요~ 특히 예단 예물은 너무나 어렵어렵~" data-microtip-size="medium" data-microtip-position="left" role="tooltip">
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
                    <li class="question" id="question4" style="display: none"
                     aria-label="보통 집 계약은 언제 부터하지...? 도배는!?!? 저희가 가이드라인을 알려드려요~" data-microtip-size="medium" data-microtip-position="right" role="tooltip">
                  		<p class="questionHead">신혼집</p>
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
                    <li class="question" id="question5" style="display: none"
                     aria-label="주요한 것들 외에 또 어떤것들을 해야될지~ 도와드려요!" data-microtip-size="medium" data-microtip-position="left" role="tooltip">
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
                  <li class="question" id="question6" style="display: none"
                   aria-label="요즘은 발리랑 다낭이 뜬다던데..!? 호텔은 어떻게!? A~Z 까지  todo List 작성을 도와드려요~" data-microtip-size="medium" data-microtip-position="right" role="tooltip">
                   		<p class="questionHead">허니문</p>
                   		<div class="btnConainer">
                        <label class="choice">
                            <input type="checkbox" name="todoCategory" value="hm" onclick="next6()" />
                              <span>필요없어요</span>
                          </label>
                          <label class="choice">
                            <input type="checkbox" name="Category" onclick="next6()" />
                              <span>완전! 필요해요!</span>
                          </label>
                          </div>
                  </li>
                  <li class="question" id="question7" style="display: none" 
                  aria-label="Tv, 냉장고 , 세탁기 예약은 언제 해야되지!? 아리송~? " data-microtip-size="medium" data-microtip-position="left" role="tooltip">
                   		<p class="questionHead">혼수</p>
                   		<div class="btnConainer">
                        <label class="choice">
                            <input type="checkbox" name="todoCategory" value="ha" onclick="next7()" />
                              <span>필요없어요</span>
                          </label>
                          <label class="choice">
                            <input type="checkbox" name="Category" onclick="next7()" />
                              <span>완전! 필요해요!</span>
                          </label>
                          </div>
                  </li>
                </ul>
                <input type="hidden" id="memNo" name="memNo" value="${user.no }">
                </form>
                <button class="button-submit" id="sumitBtn" style="display: none" onclick="sortingResult()">나만의 웨딩플랜 신청하기</button>
            
                 </div>
            </div>
        </div>
       <div id="motaltest">
       		<h1 style="font-size:50px; font-weight:bold;">Marry Us♥ Todo List 만들기</h1>
       		<div style="font-size:20px; font-weight:bold;">
       			안녕하세요 :D<br>
       			Marry Us TodoList 작성에 도움을 주는 페이지 입니다 ^^<br>
       			여기서는 <span>'나만의 웨딩 TodoList'</span> 입니다.<br>
       			원하시는 카테고리를 선택하면 저희가 웨딩 TodoList를 만들어 드려요~<br>
       			한번 시작해볼까요!?<br>
       			
       		</div>
       </div>
<c:import url="/common/importFooter.jsp" />
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
    $("#question6").css("display", "block");
}
function next6(){
    $("#question7").css("display", "block");
}
function next7(){
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
var memNo= $("#memNo").val();
  $.ajax({
	  url:"/marryus/main/sortingPlan.json",
	  data: "todoCategoryList="+result+"&memNo="+memNo,
	  type: "post"
  });
  
  location.href ="http://192.168.0.74:8000/marryus/main/resultPlanning.do";
      alert("감사합니다!");
   
}

$(document).ready(function() {

	$('.simple-ajax-popup-align-top').magnificPopup({
		type: 'ajax',
		alignTop: true,
		overflowY: 'scroll' // as we know that popup content is tall we set scroll overflow by default to avoid jump
	});

	$('.simple-ajax-popup').magnificPopup({
		type: 'ajax'
	});
	
});


$("#motaltest").modal({
	  fadeDuration: 100,
	  showClose: false
	});
$("#custom-close").modal({
	  closeClass: 'icon-remove',
	  closeText: 'x'
	  });
</script>
</body>
</html>
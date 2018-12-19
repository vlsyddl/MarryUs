<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="https://fonts.googleapis.com/css?family=Crete+Round:400i|Lato:400,900s" />
<c:import url="/common/importCss.jsp"/>
<c:import url="/common/importJs.jsp"/>
<c:import url="/common/webSocket.jsp"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/printThis/1.14.0/printThis.js"></script>
<style>
html {
  box-sizing: border-box;
  font-size: 10px;
  line-height: 1.42857143;
}
*,
*:before,
*:after {
  box-sizing: inherit;
}
body {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 100%;
  height: 100vh;
  position: relative;
  background: #ebebeb;
  font-family: 'Lato', sans-serif;
  font-weight: 700;
  color: #333333;
  padding: 2rem;
}
.titleHead {
  font-family: 'Crete Round', serif;
  margin: 0;
  font-size: 4rem;
  line-height: 1;
  font-weight: 200;
}
h1 img {
  float: right;
  vertical-align: top;
}
@media (max-width: 630px) {
  h1 img {
    width: 40px;
  }
}
p {
  font-size: 1.4rem;
  font-weight: 400;
}
.sub-head {
  margin: 0.6rem 0;
  color: #999999;
}
.container-main {
  margin: auto;
}
.description {
  width: 74%;
}
@media (max-width: 485px) {
  .description {
    width: 100%;
  }
}
.receipt {
  width: 100%;
  padding: 4rem;
  min-height: 200px;
  background: #FFF;
  border-top: 5px solid #006341;
  position: relative;
}
.receipt:after {
  background: linear-gradient(-45deg, transparent 8px, #FFF 0), linear-gradient(45deg, transparent 8px, #FFF 0);
  background-position: left bottom;
  background-size: 8px 32px;
  content: "";
  width: 100%;
  height: 8px;
  position: absolute;
  bottom: -8px;
  left: 0px;
}
@media (min-width: 700px) {
  .receipt {
    margin: auto;
    top:100px;
    width: 700px;
    padding: 5rem;
  }
}
header {
  margin-bottom: 5rem;
}

address {
  font-weight: 400;
  font-style: normal;
}
table {
  border-spacing: 0;
  border-collapse: collapse;
  width: 100%;
  margin-top: 3rem;
}

table td {
  font-size: 1.4rem;
  font-weight: 400;
  vertical-align: top;
  border-top: 1px solid #dddddd;
  padding: 2.3rem 0;
}
.table__img {
  width: 25%;
  text-align: center;
}
.table__desc {
  width: 65%;
  padding: 2rem 2rem;
  text-align: center;
}

.table__total {
  border-width: 3px;
  border-color: #444;
}
.u-shadow {
  box-shadow: 1px 1px 2px #DDD;
}
.dDay{
 font-size:16px	; font-weight: bolder;
}

.lists{
	display: none;
}
#CheckBtn{

}

#CheckBtn{
  display: block;
  background:#1AAB8A;
  color:#fff;
  border:none;
  position:relative;
  height:60px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
  margin: 20px;
  float: right;
  
}
#CheckBtn:hover{
  background:#fff;
  color:#1AAB8A;
}
#CheckBtn:before,#CheckBtn:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
#CheckBtn:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
#CheckBtn:hover:before,#CheckBtn:hover:after{
  width:100%;
  transition:800ms ease all;
}

.printBtn{
 
  background:#ff9b9b;
  color:#fff;
  border:none;
  position:relative;
  height:60px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
  float: right;
  margin: -10px;
  
}
.printBtn:hover{
  background:#fff;
  color:	#920000;
}
.printBtn:before,.printBtn:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #920000;
  transition:400ms ease all;
}
.printBtn:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
.printBtn:hover:before,.printBtn:hover:after{
  width:100%;
  transition:800ms ease all;
}
.downLoadBtn{
 
  background:#ff9b9b;
  color:#fff;
  border:none;
  position:relative;
  height:60px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
  float: right;
  margin: -10px;
}
.downLoadBtn:hover{
  background:#fff;
  color:	#920000;
}
.downLoadBtn:before,.downLoadBtn:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #920000;
  transition:400ms ease all;
}
.downLoadBtn:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
.downLoadBtn:hover:before,.downLoadBtn:hover:after{
  width:100%;
  transition:800ms ease all;
}
#goToMypage{
    font-size: 15px;
    font-weight: bold;
}
#goToMypage:hover{
color: #ff9b9b;
}
</style>
</head>
<body>
<c:import url="/common/importHeader.jsp" />
        <main class="container-main">
        
                <div class="receipt">
	                        <form action="downExcel.do">
	        				 <input type="hidden" id="memNo" name="memNo" value="${user.no}">
	                       	 <button class="downLoadBtn">download</button>
	                        </form>
	                         <button class="printBtn">Print</button>
                      <div class="header">
                      	
                        <h1 class="titleHead">
                          Your To do List
                        </h1>
                      </div>
                        <input id="CheckBtn" onclick="openList()" type="button" value="todoList 확인하기" >
                   <div class="lists" >
                    <hr>
                    <a id="goToMypage" href="<c:url value='/mypage/myTodo.do'/>">마이페이지 체크리스트로 이동하기 ></a>
                    <hr>
                    <p class="dDay">상세 내역보기</p>
                      <hr>
                      <div class='detail'>
                        <p>결혼 날짜 : </p>
                        <p>결혼 예정일 : </p>
                        <p>결혼 예정 장소 : </p>
                   </div>
                    <hr>
                    <div class="description">
                        <p class="dDay">D-120</p>
                    </div>
                    <table id="todoListTable">
                        <tbody>
                    
                            
                        </tbody>
                    </table>
                    <hr>
                    <div class="description">
                            <p class="dDay">D-90</p>
                    </div>
                    <table id="todoListTable2">
                            <tbody>
                          
                                </tr>
                                
                            </tbody>
                        </table>
                        <hr>
                        <div class="description">
                                <p class="dDay">D-60</p>
                            </div>
                            <table id="todoListTable3">
                                <tbody>
                                 

                                </tbody>
                            </table>
                            <div class="description">
                                <p class="dDay">D-50~D-40</p>
                            </div>
                            <table id="todoListTable4">
                                <tbody>
                               
                                    
                                </tbody>
                            </table>
                            <div class="description">
                                <p class="dDay">D-30~D-10</p>
                            </div>
                             <table id="todoListTable5">
                                <tbody>
                                
                                    
                                </tbody>
                            </table>
                             <div class="description">
                                <p class="dDay">D-일주일전</p>
                            </div>
                             <table id="todoListTable6">
                                <tbody>
                                   
                                    
                                </tbody>
                            </table>
                             <div class="description">
                                <p class="dDay">D-1~D-Day</p>
                            </div>
                             <table id="todoListTable7">
                                <tbody>
                                   
                                    
                                </tbody>
                            </table>
                    </div>
                </div>
                
               
            </main>
         
<!-- 로그인 -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body Page Page--login .Util-not-loaded">
					<nav class="Login-navigation">
					<ul class="Login-navigation__list">
						<li class="Login-navigation__list-item"><a
							class="Login-navigation__link" data-goto="Login-card--login">Login</a>
						</li>
						<li class="Login-navigation__list-item"><a
							class="Login-navigation__link" data-goto="Login-card--register">비밀번호를 잊으셨나요?</a>
						</li>
						<!-- <li class="Login-navigation__list-item"><a
							class="Login-navigation__link" data-goto="Login-card--connect">Connect
								directly</a></li> -->
					</ul>
					</nav>

					<main class="Login-main">
					<div class="Login-card-container">
						<section class="Login-card Login-card--login" data-order="1">
						<h2 class="Login-card__title">Login</h2>
						
						<form id="loginForm"  name="loginForm" method="post" >

							<div class="Form__form-group">

								<div class="Form__input-group">
									<input type="text" id="email" name="email" placeholder="E-mail address"
										 class="Form__input Login-card__email-input">
								</div>

								<div class="Form__input-group">
									<input  type="password" id="pass" name="pass" placeholder="Password"
										class="Form__input Login-card__password-input">
								</div>

								<div class="Form__input-group">
									<input  id="loginBtn" type="submit" value="Login"
										class="Form__button Login-card__submit-button">
								</div>

							</div>

						</form>
						</section>

						<section
							class="Login-card Login-card--register Login-card--hidden"
							data-order="2" id="checkIdCard">
						<h2 class="Login-card__title">비밀번호 찾기</h2>
						<form id="findPassForm" action="findPass.do"  method="post">

							<div class="Form__form-group">

								<div class="Form__input-group">
									<input  type="text" id="passemail" name="email" placeholder="E-mail address"
										class="Form__input Login-card__email-input">
								</div>

								<div class="Form__input-group">
									<input id="passname" type="text" name="name" placeholder="이름"
										class="Form__input Login-card__password-input">
								</div> 
								<div  class="Form__input-group" id="checkEmailnName">
									<input   type="button" value="아이디 체크" 
										class="Form__button Login-card__submit-button">
								</div>
									
							<!-- 아이디가 있으므로 아이디 찾기로 감!-->
								<div class="Form__input-group" id="nextStep" style="display: none">
									<div class="Form__input-group">
										<input  type="text" id="sendemail" name="email" placeholder="E-mail address"
										class="Form__input Login-card__email-input">
									</div>
									<div class="Form__input-group">
									 	<input  type="submit" value="비밀번호 찾기"
											class="Form__button Login-card__submit-button">
									</div>
								</div>
							<!-- 아이디가 없으므로 회원가입으로 진행  -->
								<div class="Form__input-group" id="goToSignUp" style="display: none">
									<div>
										<h1>저희의 회원이 되어주세요 : )</h1>
									</div>
									<div class="Form__input-group">
									 	<input   type="button" value="Marry Us 회원가입하기" onclick="gotoSignUp()"
											class="Form__button Login-card__submit-button">
									</div>
								</div>

							</div>

						</form>
						</section>

					</main>
				<!-- 네이버아이디로로그인 버튼 노출 영역 -->
				<!-- 	
					  <div id="naver_id_login"></div>
					  //네이버아이디로로그인 버튼 노출 영역
					  <script type="text/javascript">
					  	var naver_id_login = new naver_id_login("80pYiQzDzkdBypcTxTyp", "http://localhost:8000/marryus/main/main.do");
					  	var state = naver_id_login.getUniqState();
					  	naver_id_login.setButton("white", 2,40);
					  	naver_id_login.setDomain("YOUR_SERVICE_URL");
					  	naver_id_login.setState(state);
					  	naver_id_login.setPopup();
					  	naver_id_login.init_naver_id_login();
					  </script>
				-->
					<footer class="Login-footer"> Made with <i
						class="fa fa-heart"></i> </footer>
				</div>
			</div>
		</div>
	</div>
<script>

$(document).ready(function(){
		var no = $("#memNo").val()
	$.ajax({
		url:"/resultPlanning.json",
		data:"memNo="+no
	})
	.done(function(reuslt){
		alert(reuslt);
		
	});
		
});

function openList(){
	$(".lists").css("display", "block");
	$("#CheckBtn").css("display", "none");
	
	var no = $("#memNo").val()
	$.ajax({
		url:"/marryus/main/resultPlanning.json",
		data:"memNo="+no
	})
	.done(function(result){
		console.log(result);
/****************************************************************************************
 *     list 뽑기
 ***************************************************************************************/
		var detail = '';
		for(i=0; i<1 ; i++){
		detail += ' <p>결혼 장소 : '+result[i].weddingPlan.planPlace+'</p>'
		detail += ' <p>결혼 예정일 : '+result[i].weddingPlan.planWedDate+'</p>'
		detail += ' <p>결혼 예산 : '+result[i].weddingPlan.planBudget+'</p>'
		}
		
		$(".detail").html(detail);
		
		/*
			todoList 뽑기
		*/
		var html = '';
		for(i=0; i<result.length ; i++){
			if(result[i].todoDday == '120'){
			html += '<tr>'
			html += '<td class="table__img">'+categoryName(result[i].todoCategory)+'</td>'
			html += '<td class="table__desc">'+result[i].todoTitle+'</td>'
			html += '<tr>'
			}
		}
		
		$("#todoListTable").html(html)
		
		var html2='';
		for(i=0; i<result.length ; i++){
			if( result[i].todoDday == '90'){
			html2 += '<tr>'
			html2 += '<td class="table__img">'+categoryName(result[i].todoCategory)+'</td>'
			html2 += '<td class="table__desc">'+result[i].todoTitle+'</td>'
			html2 += '<tr>'
			}
		}
		$("#todoListTable2").html(html2);
		
		
		var html3='';
		for(i=0; i<result.length ; i++){
			if( result[i].todoDday == '60'  ){
				html3 += '<tr>'
				html3 += '<td class="table__img">'+categoryName(result[i].todoCategory)+'</td>'
				html3 += '<td class="table__desc">'+result[i].todoTitle+'</td>'
				html3 += '<tr>'
			}
		}
		$("#todoListTable3").html(html3);
		
		var html4='';
		for(i=0; i<result.length ; i++){
			if( result[i].todoDday <= '50'&& result[i].todoDday >= '40'){
				html4 += '<tr>'
				html4 += '<td class="table__img">'+categoryName(result[i].todoCategory)+'</td>'
				html4 += '<td class="table__desc">'+result[i].todoTitle+'</td>'
				html4 += '<tr>'
			}
		}
		$("#todoListTable4").html(html4);
		
		var html5='';
		for(i=0; i<result.length ; i++){
			if( result[i].todoDday <= '30'  && result[i].todoDday >= '10'){
				html5 += '<tr>'
				html5 += '<td class="table__img">'+categoryName(result[i].todoCategory)+'</td>'
				html5 += '<td class="table__desc">'+result[i].todoTitle+'</td>'
				html5 += '<tr>'
			}
		}
		$("#todoListTable5").html(html5);
		
		var html6='';
		for(i=0; i<result.length ; i++){
			if( result[i].todoDday =='7'){
				html6 += '<tr>'
				html6 += '<td class="table__img">'+ categoryName(result[i].todoCategory)+'</td>'
				html6 += '<td class="table__desc">'+result[i].todoTitle+'</td>'
				html6 += '<tr>'
			}
		}
		$("#todoListTable6").html(html6);
		
		var html7='';
		for(i=0; i<result.length ; i++){
			if( result[i].todoDday =='7'){
				html7 += '<tr>'
				html7 += '<td class="table__img">'+ categoryName(result[i].todoCategory)+'</td>'
				html7 += '<td class="table__desc">'+result[i].todoTitle+'</td>'
				html7 += '<tr>'
			}
		}
		$("#todoListTable7").html(html7);
	});
}
function categoryName(todoCategory) {
	switch(todoCategory){
	case "wp" : return "스튜디오,드레스,메이크업";  
	case "w" : return "웨딩";  
	case "h" : return "신혼집";  
	case "p" : return "예물, 예단";  
	case "e" : return "기타";  
	case "hm" : return "허니문";  
	case "ha" : return "혼수";  
	
	/*
	wp(웨딩 페키지)-5   
	w(웨딩)-6  
	h(신혼집)-4  
	p(예물,예단)-2     
	e(기타)-3
	ha 혼수
	hm 허니문 
	*/
		
	}
}
/****************************************************************************************
 *      printThis plugin 
 ***************************************************************************************/
$(".printBtn").on("click", function(){
	$('.receipt').printThis({
		
	});
});

</script>            
<script>

/****************************************************************************
 * 엔터이벤트  로그인 
 *****************************************************************************/

 
     $("#pass").keydown(function (e) {
    	   if (e.keyCode == 13) {
    			e.preventDefault();
    			var email = $("#email").val();
    			var pass =  $("#pass").val();
    			
    			$.ajax({
    				url:"/marryus/main/login.json",
    				data:{email:email, pass: pass},
    				type: "post"
    			})
    			.done(function(member){
    				console.log(member)
    				if(member == ""){
    					alert("아이디 또는 비밀번호를 잘못 입력했습니다.");
    					
    					return;
    				} else{
    					alert("로그인 되었습니다.");
    					$("#loginModal").modal("hide");
    					var url = "${requestScope['javax.servlet.forward.request_uri']}"
    					if(url == "/marryus/main/main.do"){
    						location.href = "/marryus/main/main.do";
    						return;
    					}
    					location.href = "${requestScope['javax.servlet.forward.request_uri']}";
    				}
    				
    			});
    			
    	   }   
    	});


/****************************************************************************
 * 마우스 클릭  로그인 
 *****************************************************************************/
	$("#loginBtn").on('click',function(e){
		e.preventDefault();
		var email = $("#email").val();
		var pass =  $("#pass").val();
		
		$.ajax({
			url:"/marryus/main/login.json",
			data:{email:email, pass: pass},
			type: "post"
		})
		.done(function(member){
			console.log(member)
			if(member == ""){
				alert("아이디 또는 비밀번호를 잘못 입력했습니다.");
				
				return;
			} else{
				alert("로그인 되었습니다.");
				$("#loginModal").modal("hide");
				var url = "${requestScope['javax.servlet.forward.request_uri']}"
				if(url == "/marryus/main/main.do"){
					location.href = "/marryus/main/main.do";
					return;
				}
				location.href = "${requestScope['javax.servlet.forward.request_uri']}";
			}
			
		});
		
	});

 /**********************************************************************************
  	비밀번호 찾기 
       	1. 아이디와 이름을 검색해서 회원인지 여부 회원이 아닐시  회원가입 유도 
       	2. 회원이 맞을시아이디 비번 찾도록 유도 
 **********************************************************************************/
 
 /*
 	keydown
 */
 
 $("#passname").keydown(function (e) {
	   if (e.keyCode == 13) {
		   var email = $("#passemail").val()
        	var name = $("#passname").val()
       	$.ajax({
       		url:"/marryus/main/checkID.json",
       		data:"email="+email+"&name="+name
       	}).done(function(result){
       		if(result==1){
       			alert("회원입니다. 이메일 인증을 진행해주세요")
       			  e.preventDefault()
       			$("#findPassForm").html($("#nextStep").html());
				
       		}else{
       			alert("Marry Us 회원이 아닙니다. 회원가입먼저 진행해주세요.")
       			 e.preventDefault()
       			$("#findPassForm").html($("#goToSignUp").html());
       		}
    	   
       	});
		   
		   
	   }
 });
 
 /*
	click
*/
 
        $("#checkEmailnName").on('click',function(e){
     	   
     	    var email = $("#passemail").val()
         	var name = $("#passname").val()
        	$.ajax({
        		url:"/marryus/main/checkID.json",
        		data:"email="+email+"&name="+name
        	}).done(function(result){
        		if(result==1){
        			alert("회원입니다. 이메일 인증을 진행해주세요")
        			  e.preventDefault()
        			$("#findPassForm").html($("#nextStep").html());
        		}else{
        			alert("Marry Us 회원이 아닙니다. 회원가입먼저 진행해주세요.")
        			 e.preventDefault()
        			$("#findPassForm").html($("#goToSignUp").html());
        		}
     	   
        	});
        });
         
        
       function gotoSignUp(){
     	  location.href = 'http://localhost:8000/marryus/signup/signupPro.do';
       }
      

</script>            
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<footer>
<div class="container">
	<h3>©2018 MarryUs. All rights reserved.</h3>
</div>
</footer>
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
									<input onkeydown="enterLogin();" type="password" id="pass" name="pass" placeholder="Password"
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
										<input  type="text" id="passemail" name="email" placeholder="E-mail address"
										class="Form__input Login-card__email-input">
									</div>
									<div class="Form__input-group">
									 	<input  onkeyup="enter();" type="submit" value="비밀번호 찾기"
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

						<%-- <section class="Login-card Login-card--connect Login-card--hidden"
							data-order="3">
						<h2 class="Login-card__title">Connect directly</h2>
						<code># TODO</code> </section>
					</div> --%>
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

/****************************************************************************
 * 엔터이벤트  로그인 
 *****************************************************************************/
 
     function enterLogin(){
    	  if(window.event.keyCode==13){
    		  
    		  loginForm.submit();
    	  }
      }
      
/* 	function checkLoginForm(){
		var email = window.document.loginForm.email;
		
		if(email.value ==""){
			alert("아이디를 입력해주세요")
			email.focus();
			return false;
		}
		if(document.loginForm.pass.value=""){

			alert("암호를 입력하시오.");
			document.loginForm.pass.focus();
			return false;

		}

	}
 */
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
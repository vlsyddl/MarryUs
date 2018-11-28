<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" media="screen"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script> 
 
<script src="https://unpkg.com/sweetalert2@latest/dist/sweetalert2.all.js"></script> 
<style>
/**
 * Fonts
 */
@import url(https://fonts.googleapis.com/css?family=Open+Sans:400,600);
/**
 * Every page
 */
html, body, .Page {
	width: 100%;
	height: 100%;
	padding: 0;
	margin: 0;
}

/**
 * FindPass page
 */
.Page--pass {
	background-color: #ffcaca;
	display: flex;
	flex-direction: column;
	align-items: center;
}

/**
 * Navigation
 */
.FindPass-navigation {
	margin: 3em 0 1em 0;
	font-family: 'Open Sans';
	font-weight: 600;
	text-transform: uppercase;
	color: #fff;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

.FindPass-navigation__list {
	margin: 0;
	padding: 0;
	list-style-type: none;
}

.FindPass-navigation__list-item {
	display: inline-block;
	padding: 0 2em;
}

.FindPass-navigation__link {
	cursor: pointer;
}

.FindPass-navigation__link:hover {
	border-bottom: 2px solid white;
}

/**
 * Sections
 */
.FindPass-main {
	flex: 1;
}

.FindPass-card-container {
	display: flex;
	flex-direction: row;
	align-items: stretch;
	position: relative;
	margin-bottom: 2em;
}

.FindPass-card {
	width: 30em;
	margin-left: -15em;
	margin-right: -17em;
	padding: 2em;
	border-radius: 2px;
	background-color: #fff;
	text-align: center;
	z-index: 5;
	font-family: 'Open Sans';
	transition: margin-left 0.5s cubic-bezier(0.5, -20, 0.5, 1.5),
		margin-right 0.5s cubic-bezier(0.5, -20, 0.5, 1.5), margin-top 0.5s,
		padding 0.5s, opacity 0.5s, z-index 0.5s;
}

.Util-not-loaded .FindPass-card {
	transition: none;
}

.FindPass-card--hidden {
	opacity: 0.5;
	z-index: 4;
}

.FindPass-card--hidden>* {
	opacity: 0;
	transition: opacity 0.5s;
}

.FindPass-card--pass {
	order: 1;
	margin-top: 10em;
}

.FindPass-card--register {
	order: 2;
	margin-top: 2em;
}

.FindPass-card--connect {
	order: 3;
	margin-top: 3em;
}

.FindPass-card__title {
	margin: 0.2em 0 1em 0;
}

.Form__input, .Form__button {
	width: 22em;
	padding: 1em;
	border: none;
	font-family: 'Open Sans';
	box-sizing: border-box;
}

.Form__input {
	margin-bottom: 0.5em;
	background-color: #eee;
}

.Form__button {
	background-color: #ff9898;
	color: white;
	cursor: pointer;
}

/**
 * Footer
 */
.FindPass-footer {
	width: 100%;
	line-height: 3em;
	background-color: #37405f;
	font-family: 'Open Sans';
	font-size: 0.8em;
	text-align: center;
	color: rgba(255, 255, 255, 0.5);
}

.FindPass-footer i {
	font-size: 0.9em;
}
</style>
</head>
<body>
	<div class="Page Page--pass .Util-not-loaded">
		<nav class="FindPass-navigation">
		<ul class="FindPass-navigation__list">
			<li class="FindPass-navigation__list-item"><a
				class="FindPass-navigation__link" data-goto="Login-card--pass">Find
					password</a></li>


		</ul>
		</nav>

		<main class="FindPass-main">
		<div class="FindPass-card-container">
			<section id="findpassCard" class="FindPass-card FindPass-card--pass"
				data-order="1">
			<h2 class="FindPass-card__title">인증번호 입력</h2>
			<form>

				<div class="Form__form-group">

					<div class="Form__input-group">
						<input type="text" name="keyCode" id="keyCode"
							placeholder="인증코드를 입력해주세요."
							class="Form__input FindPass-card__email-input">
					</div>



					<div class="Form__input-group">
						<input type="button" value="인증번호 확인" id="checkKey"
							class="Form__button FindPass-card__submit-button">
					</div>

				</div>

			</form>
			</section>
		</main>
		<footer class="FindPass-footer"> Made with <i
			class="fa fa-heart"></i> </footer>

	</div>
	<div id="updatePass" style="display: none">
		<h2 class="FindPass-card__title">새 비빌번호 입력</h2>
		<form action="newPassword.do">
			<input type="hidden" name = "email" value="${email}">
			<div class="Form__form-group">

				<div class="Form__input-group">
					<input type="text" name="pass" id="newpassword"
						placeholder="새로운 비빌번호 "
						class="Form__input FindPass-card__email-input">
				</div>
				<div class="Form__input-group">
					<input type="text" name="password2" id="newpassword2"
						placeholder="새로운 비빌번호  확인"
						class="Form__input FindPass-card__email-input">
				</div>
				<div class="Form__input-group">
					<input type="submit" value="비밀번호 변경" id="updatePass"
						class="Form__button FindPass-card__submit-button">
				</div>

			</div>

		</form>
	</div>
	<script>
		$("#checkKey").click(function() {
			var kv = $("#keyCode").val();
			if(kv == ""){
				swal( '인증번호 입력 실패!',
						  '인증번호 입력해주세요.',
						  'error')
				kv.focus();
						  return false;		  
			}
			var keyCode = $("#keyCode").val();
			matcheKeyCoda(keyCode);
			return true;
		});

		function matcheKeyCoda(keyCode) {

			$.ajax({
				url : "/marryus/main/findpassword.json",
				type : "post",
				data : "inputCode=" + keyCode
			}).done(function(result) {
				swal( '인증번호 입력 성공!',
						  '인증번호 입력에 성공하셨습니다.',
						  'success')
				if (result.result == 0) {
					$("#findpassCard").html($("#updatePass").html());

				}
			});
		};
		
	
	</script>
</body>
</html>
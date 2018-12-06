<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<c:url value="/resources/css/signupCompany.css"/>">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/additional-methods.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/localization/messages_ko.js"></script>	
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://unpkg.com/sweetalert2@latest/dist/sweetalert2.all.js"></script> 
</head>
<body>
	<div id="grid">

		<div></div>

		<div id="grid__content">
			<div id="card">
				<form id="companyForm" name="companyForm" class="form" action="company.do" method="post">

					<h1 id="title">Marry Us 업체회원 가입</h1>

					<div class="signup__field">
						<label for="email" class="label">아이디(이메일)</label> <input
							type="email" name="email" id="e_mail" class="input-field"
							required autofocus>
					<div class="input-field" id="checkMsg"></div>
					</div>
					<div class="signup__field">
						<label for="password" class="label">비밀번호</label> <input
							type="password" name="pass" id="pass" class="input-field"
							required>
					</div>
					<div class="signup__field">
						<label for="password" class="label">비밀번호 확인</label> <input
							type="password" name="pass2" id="pass2" class="input-field"
							required>
					</div>

					<div class="signup__field">
						<label for="com_name" class="label">회사 이름</label> <input
							type="text" name="name" id="name" class="input-field" required>
					</div>

					<div class="signup__field">
						<label for="com_phone" class="label">회사 전화번호</label> <input
							type="text" name="phone" id="phone" class="input-field" maxlength="13"
							 required>
					</div>

					<div class="signup__field">
						<label for="com_phone" class="label">회사 주소</label> <input
							type="text" id="sample4_postcode" placeholder="우편번호" required> <input
							type="text" name="comAddr" id="sample4_roadAddress"
							placeholder="도로명주소" required> <input type="button"
							onclick="address()" value="우편번호 찾기"><br> <span
							id="guide" style="color: #999"></span>
					</div>
					<div class="signup__field">
						<label for="com_addr_detail" class="label">회사 상세주소</label> <input
							type="text" name="comAddrDetail" id="comAddrDetail"
							class="input-field" required>
					</div>

					<fieldset>
						<legend>Favorites</legend>

						<div class="signup__field" style="margin-top: 12px;">
							<label class="label" for="comType">대표업종 선택</label>
							<div class="select-field">
								<select name="comType" id="comType" class="select-field__menu" required>
									<option	value="">업종선택</option>
									<option value="v">웨딩홀</option>
									<option value="s">스튜디오</option>
									<option value="d">드레스</option>
									<option value="m">메이크업</option>
									<option value="h">허니문</option>
									<option value="j">예물</option>
									<option value="e">기타</option>
								</select>
							</div>
						</div>

					</fieldset>
					<input type="hidden" value="mc" name="type" />
					<div class="signup__button">
						<button id="submit" class="button" >Signup</button>
					</div>

				</form>
			</div>
		</div>

		<div></div>

	</div>
	<script>
	 

		// 다음 주소 api
		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		function address() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 도로명 조합형 주소 변수

							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraRoadAddr !== '') {
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}
							// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
							if (fullRoadAddr !== '') {
								fullRoadAddr += extraRoadAddr;
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
							document.getElementById('sample4_roadAddress').value = fullRoadAddr;
							document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

							// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
							if (data.autoRoadAddress) {
								//예상되는 도로명 주소에 조합형 주소를 추가한다.
								var expRoadAddr = data.autoRoadAddress
										+ extraRoadAddr;
								document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
										+ expRoadAddr + ')';

							} else if (data.autoJibunAddress) {
								var expJibunAddr = data.autoJibunAddress;
								document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
										+ expJibunAddr + ')';

							} else {
								document.getElementById('guide').innerHTML = '';
							}
						}
					}).open();
				}
		
	/**********************************************************************************
		validation 플러그인 사용 
	**********************************************************************************/

	$.validator.addMethod("passwordCk",  function( value, element ) {

		return this.optional(element) ||  /^.*(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/.test(value);

		});
	$.validator.addMethod("phone", function(phone_number, element) {
		phone_number = phone_number.replace(/\s+/g, ""); 
		return this.optional(element) || phone_number.length > 9 &&
			phone_number.match(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/);
	}, "Please specify a valid phone number");


	$(document).ready(function(){
		

	$( "#companyForm" ).validate({
		/* focusCleanup: false, //true이면 잘못된 필드에 포커스가 가면 에러를 지움
		focusInvalid:false, //유효성 검사후 포커스를 무효필드에 둠 꺼놓음
		onclick: false, //클릭시 발생됨 꺼놓음
		onfocusout:false, //포커스가 아웃되면 발생됨 꺼놓음 */
		onkeyup:true, //키보드 키가 올라가면 발생됨 꺼놓음
		rules: {
			email: {
		      required: true,
		      minlength: 2,
		      remote : { 
		    	     url : "/marryus/main/checkID.json",
		    	     type : "post",
		    	     data : { email : function() { return $('#e_mail').val()} }  
		    	     }
		    },
		    name:{
		      required : true,
		      minlength: 2 ,
		      
		    },
		    pass:{
	            required : true,
	            passwordCk:true
	        },
	        pass2:{
				required : true,
				passwordCk:true,
				equalTo : pass
			},
			phone:{
				required : true,
				phone:true
			}
		  },
		  messages:{
			  email:{
	              required : "필수로입력하세요",
	              minlength : "최소 {0}글자이상이어야 합니다",
	              email : "메일규칙에 어긋납니다",
	              remote:"아이디가 중복됩니다."
	                       
	        },
	        name:{
	        	required : "필수로입력하세요",
	            minlength : "최소 {0}글자이상이어야 합니다"
	  	      
	  	    },
	  	    pass:{
	        	required : "필수로입력하세요",
	        	passwordCk:"영문, 숫자, 특수문자 포함 8~16자",
	            minlength : "최소 {0}글자이상이어야 합니다"
	  	      
	  	    },
	  	    pass2:{
				required : "필수로입력하세요",
				passwordCk:"영문, 숫자, 특수문자 포함 8~16자",
				equalTo : "비밀번호가 일치하지 않습니다."
			},
			phone:{
				required: "연락처를 입력하세요.",
				phone: "잘못된 문자가 입력되었습니다."


			}
			
		  },
		  onsubmit: true,

		  errorClass : "validation-error",

		 validClass : "validation-valid", 
		  success: function(label) {
			   label.addClass("validation-valid").text("Ok!")
		  } 
		});
	});

	
	</script>
</body>
</html>